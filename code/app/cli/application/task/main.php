<?php
/**
 * application task manager cli script
 *
 *
*/

class TaskController extends Cli_Controller
{

    public function actionDist($input)
    {
        $idle_wait = 5;
        $sync_mask = CMD_SYNC_START_EXEC | CMD_SYNC_DONE_EXEC | CMD_SYNC_ERR_EXEC;
        $mainPDSL  = helper('MainPDSL');
        $packList  = null;
        $packMap   = null;

        $c_timestamp  = 0;
        $set_id_sets  = false;
        $nodeSharding = model('NodeSharding');
        $nodeStatSharding = model('NodeStatisticsSharding');
        $appModel = model('Application');
        $appTaskSharding = model('ApplicationTaskSharding');
        $appNodeSharding = model('ApplicationNodeSharding');
        $userAppSharding = model('UserApplicationSharding');
        $taskPool = $mainPDSL->load('ApplicationTaskPool');

        while ( true ) {
            $this->dispatchSignal();    /* Dispatch the process signal */

            echo "+-Try to get the next task dispatch ... \n";
            // $taskPool = $mainPDSL->load('ApplicationTaskPool');
            if ( ($task_id = $taskPool->lpop()) == null ) {
                echo "|-[Info]: empty pool, wait for the next invocation.\n";
                $taskPool->close(); /* Close the pool for the idle time range */
                sleep($idle_wait);
                continue;
            }
            echo "|--[Info]: get task with id={$task_id}.\n";


            /* 1, Get the task information */
            echo "+-Try to get the task info ... ";
            $taskModel = $appTaskSharding->getShardingModelFromId($task_id);
            $task = $taskModel->getById(
                array(
                    'app_id', 'user_id', 'opt_type', 'status', 
                    'dist_type', 'dist_node_id_set'
                ), $task_id
            );
            if ( $task == false ) {
                echo " --[Failed]\n";
                unset($taskModel);
                continue;
            }

            # Ignore the dispatch that status of the task is not 1
            if ( $task['status'] != 1 ) {
                echo " --[Invalid status]\n";
                unset($taskModel, $task);
                continue;
            }
            echo " --[Ok]\n";

            # try to merge the application information
            $opt_type = intval($task['opt_type']);
            $engine = null; $logic_script = null;
            $config_json = null;
            switch ( $opt_type ) {
            case 1:     # installation
                $engine = 'install_engine';
                $logic_script = 'install_script';
                break;
            case 2:     # startup
                $engine = 'startup_engine';
                $logic_script = 'startup_script';
                break;
            case 3:     # stop
                $engine = 'stop_engine';
                $logic_script = 'stop_script';
                break;
            case 4:     # uninstall
                $engine = 'uninstall_engine';
                $logic_script = 'uninstall_script';
                break;
            }

            $app = $appModel->getById(
                array($engine, $logic_script, 'config_json'), $task['app_id']
            );
            if ( $app == false ) {
                echo " --[Failed to get the application info]\n";
                unset($taskModel, $task, $engine, $logic_script);
                continue;
            }

            $task['engine'] = $app[$engine];
            $task['logic_code'] = $app[$logic_script];
            $config_json = $app['config_json'];

            $userAppModel = $userAppSharding->getShardingModelFromValue($task['user_id']);
            $uapp = $userAppModel->get(
                array('config_json'),
                array('user_id' => "={$task['user_id']}", 'app_id' => "={$task['app_id']}")
            );
            if ( $uapp != false && strlen($uapp['config_json']) > 2 ) {
                $config_json = $uapp['config_json'];
            }



            /* 2, Get the node id sets that is going to run the task */
            echo "+-Try to parse the dist nodes ... ";
            $node_sets   = array();
            $set_id_sets = false;
            $nodeModel = $nodeSharding->getShardingModelFromValue($task['user_id']);
            $nodeStatM = $nodeStatSharding->getShardingModelFromValue($task['user_id']);
            $appNodeModel = $appNodeSharding->getShardingModelFromValue($task['app_id']);
            switch ( $task['dist_type'] ) {
            case '8':
                /* All the rest of nodes that on the opposite status with the operation */
                $nodes = $nodeStatM->getList(
                    array('node_id', '_node_uid', 'status', 'updated_at'),
                    array('_user_id' => "={$task['user_id']}")
                );
                $nodeIdx  = Util::makeIndex($nodes, 'node_id', ',', true);
                $appNodes = $appNodeModel->getList(
                    array('node_id', 'status'),
                    array('app_id' => "={$task['app_id']}", 'user_id' => "={$task['user_id']}")
                );
                if ( $appNodes == false ) {
                    $appNodes = array();
                }

                if ( $nodes != false ) {
                    if ( $opt_type == 1 ) {             # installation
                        foreach ( $nodes as $val ) {
                            /* Define the node status and ignore the Fault node */
                            node_status_define($val);
                            if ( $val['status'] == NODE_DOWN ) {
                                continue;
                            }

                            $node_sets[$val['node_id']] = array(
                                'Id'       => $val['node_id'],
                                'node_uid' => $val['_node_uid']
                            );
                        }

                        # remove the record that its has install the application
                        foreach ( $appNodes as $val ) {
                            if ( $val['status'] == NODE_APP_TOBE_INSTALL ) {
                                # 0 - to be install
                            } else {
                                unset($node_sets[$val['node_id']]);
                            }
                        }
                    } else if ( $opt_type == 2 ) {      # startup
                        # take all the record that it is not running
                        foreach ( $appNodes as $val ) {
                            $node_id = $val['node_id'];
                            if ( ! isset($nodeIdx[$node_id]) ) {
                                continue;
                            }

                            $node = $nodeIdx[$node_id];
                            node_status_define($node);
                            if ( $node['status'] == NODE_DOWN ) {
                                continue;
                            }

                            if ( $val['status'] == NODE_APP_TOBE_START ) {
                                $node_sets[$val['node_id']] = array(
                                    'Id'       => $val['node_id'],
                                    'node_uid' => $val['_node_uid']
                                );
                            }
                        }
                    } else if ( $opt_type == 3 ) {      # stop
                        # take the record that it is running
                        foreach ( $appNodes as $val ) {
                            $node_id = $val['node_id'];
                            if ( ! isset($nodeIdx[$node_id]) ) {
                                continue;
                            }

                            $node = $nodeIdx[$node_id];
                            node_status_define($node);
                            if ( $node['status'] == NODE_DOWN ) {
                                continue;
                            }

                            if ( $val['status'] == NODE_APP_RUNNING ) {
                                $node_sets[$val['node_id']] = array(
                                    'Id'       => $val['node_id'],
                                    'node_uid' => $val['_node_uid']
                                );
                            }
                        }
                    } else if ( $opt_type == 4 ) {      # uninstall
                        # take the record that has install the application
                        foreach ( $appNodes as $val ) {
                            $node_id = $val['node_id'];
                            if ( ! isset($nodeIdx[$node_id]) ) {
                                continue;
                            }

                            $node = $nodeIdx[$node_id];
                            node_status_define($node);
                            if ( $node['status'] == NODE_DOWN ) {
                                continue;
                            }

                            if ( $val['status'] == NODE_APP_TOBE_START ) {
                                $node_sets[$val['node_id']] = array(
                                    'Id'       => $val['node_id'],
                                    'node_uid' => $val['_node_uid']
                                );
                            }
                        }
                    }


                    if ( ! empty($node_sets) ) {
                        $set_id_sets = true;
                    }
                }
                unset($nodes, $nodeIdx, $appNodes);
                break;
            case '1':
                /* Dispatch the task to all the nodes of the current biz user */
                $node_sets = $nodeModel->getList(
                    array('Id', 'node_uid'),
                    array('user_id' => "={$task['user_id']}")
                );
                if ( $node_sets == false ) {
                    $node_sets = array();
                } else {
                    $set_id_sets = true;
                }
                break;
            case '2':
            case '3':
                /* Dispatch the task according to the defined node id */
                if ( strlen($task['dist_node_id_set']) >= 19 ) {
                    # $id_sets = explode(',', $task['dist_node_id_set']);
                    $node_sets = $nodeModel->getList(
                        array('Id', 'node_uid'),
                        array(
                            'Id' => "in({$task['dist_node_id_set']})", 
                            'user_id' => "={$task['user_id']}"
                        )
                    );
                }
                break;
            case '4':
                /* All the nodes that it status is not DOWN */
                $ret = $nodeStatM->getList(
                    array('node_id', '_node_uid', 'status', 'updated_at'),
                    array('_user_id' => "={$task['user_id']}")
                );
                if ( $ret != false ) {
                    foreach ( $ret as $val ) {
                        /* Define the node status and ignore the Fault node */
                        node_status_define($val);
                        if ( $val['status'] == NODE_DOWN ) {
                            continue;
                        }

                        $node_sets[] = array(
                            'Id'       => $val['node_id'],
                            'node_uid' => $val['_node_uid']
                        );
                    }

                    if ( ! empty($node_sets) ) {
                        $set_id_sets = true;
                    }
                }
                unset($ret);
                break;
            case 5:
                /* random node selection */
                break;
            case 6:
                /* Get the first register node */
                break;
            case 7:
                /* Get the lastest register node */
                break;
            }

            printf(" --With %d node rows\n", count($node_sets));

            echo "+-Try to update the task fields ... ";
            if ( empty($node_sets) ) {
                /* For empty node, here we will directly mark the task as finished */
                $task_dat = array(
                    'status'  => 2,
                    'done_at' => time()
                );
                if ( $taskModel->updateById($task_dat, $task_id) == false ) {
                    // @TODO: do error log here
                }
                echo " --[Empty sets]\n";
            } else {
                $task_dat = array(
                    'distribute_num' => count($node_sets)
                );

                if ( $set_id_sets == true ) {
                    $id_sets = array();
                    foreach ( $node_sets as $node ) {
                        $id_sets[] = $node['Id'];
                    }

                    $task_dat['dist_node_id_set'] = implode(',', $id_sets);
                    unset($id_sets);
                }

                if ( $taskModel->updateById($task_dat, $task_id) == false ) {
                    // @TODO: do error log here
                    echo " --[Failed]\n";
                } else {
                    echo " --[Ok]\n";
                }
            }


            /* 3, Do the task dispatch */
            /* 
             * Load the application node config.
             * For the newly to install nodes we will take the user.config_json 
             *  as the final command arguments
            */
            $appNodeIdx = array();
            if ( ! empty($node_sets) ) {
                $idstr = Util::implode($node_sets, 'Id', ',');
                $appNodes = $appNodeModel->getList(
                    array('node_id', 'config_json'), 
                    array(
                        'app_id'  => "={$task['app_id']}",
                        'node_id' => "in({$idstr})"
                    )
                );
                $appNodeIdx = Util::makeIndex($appNodes, 'node_id', true);
                unset($idstr, $appNodes);
            }

            echo "+-Try to do the task dispatch ... \n";
            $cmdSharding = model('NodeCommandSharding');
            foreach ( $node_sets as $node ) {
                echo "+--Try to dispatch task to node with Id={$node['Id']} ... \n";
                $node_id = $node['Id'];
                $c_timestamp = time();
                $data = array(
                    'user_id'   => $task['user_id'],
                    'node_id'   => $node['Id'],
                    't_type'    => 2,       # application task
                    'task_id'   => $task_id,
                    'sync_mask' => $sync_mask,
                    'status'    => 0,
                    'progress'  => 0.00,
                    'cmd_argv'  => isset($appNodeIdx["{$node_id}"]) 
                        ? $appNodeIdx["{$node_id}"]['config_json'] : $config_json,
                    'cmd_text'  => $task['logic_code'],
                    'res_data'  => '0',
                    'res_error' => '0',
                    'engine'    => $task['engine'],
                    'sign'      => build_remote_command_sign(
                        $node['node_uid'], 
                        $task['logic_code'], 
                        $task['engine'], 
                        $c_timestamp
                    ),
                    'created_at' => $c_timestamp
                );

                $data['Id'] = $cmdSharding->add($data);
                if ( $data['Id'] == false ) {
                    echo "|--[Error]: Failed to add the cmd record.\n";
                    // @TODO: do error log here
                    unset($data);
                    continue;
                }
                echo "|--[Info]: command add succeed with Id={$data['Id']}.\n";

                /* 
                 * Operation on the application nodes 
                 * And this depends on the operation type of the task 
                */
                if ( $opt_type  == 1 ) {        # installation
                    $dist = array(
                        'app_id'      => $task['app_id'],
                        'user_id'     => $task['user_id'],
                        'node_id'     => $node['Id'],
                        'config_json' => $config_json,
                        'status'      => NODE_APP_INSTALL_ING,
                        'opt_status'  => 1,
                        'progress'    => 0,
                        'cmd_id'      => $data['Id'],
                        'stat_json'   => '0',
                        'created_at'  => $c_timestamp,
                        'started_at'  => $c_timestamp
                    );
                    if ( ($dist['Id'] = $appNodeSharding->add($dist)) == false ) {
                        echo "|--[Error]: Failed to add the app node record.\n";
                        // @TODO: do error log here
                        unset($data, $dist);
                        continue;
                    }
                    echo "|--[Info]: app node add succeed with Id={$dist['Id']}.\n";
                } else if ( $opt_type == 2 ) {  # startup
                    $dist = array(
                        'status'     => NODE_APP_START_ING,
                        'cmd_id'     => $data['Id'],
                        'opt_status' => 4,
                        'progress'   => 0,
                        'pid'        => 0,
                        'stat_json'  => '0',
                        'started_at' => $c_timestamp
                    );
                    if ( $appNodeModel->update($dist, array(
                        'app_id' => "={$task['app_id']}", 
                            'node_id' => "={$node['Id']}")) == false ) {
                        echo "|--[Error]: Failed to set the app node status.\n";
                        unset($data, $dist);
                        continue;
                    }
                    echo "|--[Info]: app node mark as startup succeed.\n";
                } else if ( $opt_type == 3 ) {  # stop
                    $dist = array(
                        'status'     => NODE_APP_STOP_ING,
                        'cmd_id'     => $data['Id'],
                        'opt_status' => 7,
                        'progress'   => 0,
                        'started_at' => $c_timestamp
                    );
                    if ( $appNodeModel->update($dist, array(
                        'app_id' => "={$task['app_id']}", 
                            'node_id' => "={$node['Id']}")) == false ) {
                        echo "|--[Error]: Failed to set the app node status.\n";
                        unset($data, $dist);
                        continue;
                    }
                    echo "|--[Info]: app node mark as stop succeed.\n";
                } else if ( $opt_type == 4 ) {  # uninstall
                    $dist = array(
                        'status'     => NODE_APP_UNINSTALL_ING,
                        'cmd_id'     => $data['Id'],
                        'opt_status' => 10,
                        'progress'   => 0,
                        'started_at' => $c_timestamp
                    );
                    if ( $appNodeModel->update($dist, array(
                        'app_id' => "={$task['app_id']}", 
                            'node_id' => "={$node['Id']}")) == false ) {
                        echo "|--[Error]: Failed to set the app node status.\n";
                        unset($data, $dist);
                        continue;
                    }
                    echo "|--[Info]: app node mark as uninstall succeed.\n";
                }


                /* push the command package to the command pool */
                $packList = $mainPDSL->load(
                    'RemoteCommandPool', $task['user_id'], $node['node_uid']
                );
                if ( $packList->rpush(json_encode(array(
                    'id' => $data['Id'],
                    'sync_mask' => $sync_mask
                ))) < 1 ) {
                    echo "|--[Error]: Failed to push cmd package.\n";
                    // @TODO: do error log here
                }
                echo "|--[Info]: command package push succeed.\n";


                /* set the command execution status */
                $packMap = $mainPDSL->load(
                    'RemoteCommandMap', $task['user_id'], $node['node_uid']
                );
                if ( $packMap->set($data['Id'], json_encode(array(
                    't_type'   => 2,    # application task
                    'task_id'  => $task_id,
                    'node_id'  => $node['Id'],
                    'app_id'   => intval($task['app_id']),
                    'opt_type' => intval($task['opt_type']),
                    'status'   => 0,
                    'progress' => 0.00,
                    'send_at'  => $c_timestamp, // send unix time stamp
                    'pull_at'  => 0,            // being pull unix time stamp
                    'exec_at'  => 0,            // start execution unix time stamp
                    'done_at'  => 0             // done execution unix time stamp
                ))) === false ) {
                    // @TODO: do error log here
                    echo "|--[Error]: Failed to push execution status.\n";
                }
                echo "|--[Info]: command execution push succeed.\n";


                $packList->close();
                $packMap->close();
                unset($data, $dist, $packList, $packMap);
                usleep(20000);  // sleep for 20 ms
            }

            unset($task_dat, $appNodeIdx, $cmdSharding);
            unset($taskModel, $task);
            unset($opt_type, $engine, $logic_code, $config_json);
            unset($app, $uapp, $userAppModel);
            unset($nodeModel, $nodeStatM, $appNodeModel, $node_sets, $set_id_sets);
        }   /* End of while */
    }

}
