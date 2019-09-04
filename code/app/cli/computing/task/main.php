<?php
/**
 * computing task manager cli script
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
        $computingTaskSharding = model('ComputingTaskSharding');
        $taskPool = $mainPDSL->load('ComputingTaskPool');

        while ( true ) {
            $this->dispatchSignal();    /* Dispatch the process signal */

            echo "+-Try to get the next task dispatch ... \n";
            # $taskPool = $mainPDSL->load('ComputingTaskPool');
            if ( ($task_id = $taskPool->lpop()) == null ) {
                echo "|-[Info]: empty pool, wait for the next invocation.\n";
                $taskPool->close(); /* Close the pool for the idle time range */
                sleep($idle_wait);
                continue;
            }
            echo "|--[Info]: get task with id={$task_id}.\n";


            /* 1, Get the task information */
            echo "+-Try to get the task info ... ";
            $taskModel = $computingTaskSharding->getShardingModelFromId($task_id);
            $task = $taskModel->getById(
                array(
                    'user_id', 'status', 'engine', 'logic_code', 
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


            /* 2, Get the node id sets that is going to run the task */
            echo "+-Try to parse the dist nodes ... ";
            $node_sets = null;
            $set_id_sets = false;
            $nodeModel = $nodeSharding->getShardingModelFromValue($task['user_id']);
            $nodeStatM = $nodeStatSharding->getShardingModelFromValue($task['user_id']);
            switch ( $task['dist_type'] ) {
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
                if ( strlen($task['dist_node_id_set']) < 2 ) {
                    $node_sets = array();
                } else {
                    // $id_sets = explode(',', $task['dist_node_id_set']);
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
                $node_sets = array();
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
                $extre = $nodeModel->get(
                    array('min(created_at) as min_crat', 'max(created_at) as max_crat'),
                    array('user_id' => "={$task['user_id']}")
                );
                $node_sets = false;
                if ( $extre != false ) {
                    $created_at = mt_rand($extre['min_crat'], $extre['max_crat']);
                    $_middle  = ($extre['min_crat'] + $extre['max_crat']) / 2;
                    $operator = $created_at >= $_middle ? '<' : '>';
                    $ret = $nodeModel->openFragment()->getList(
                        array('Id', 'node_uid', 'status', 'updated_at'),
                        array(
                            'user_id'    => "={$task['user_id']}", 
                            'created_at' => "{$operator}{$created_at}"
                        ),
                        null,
                        array(0,10)
                    );
                    foreach ( $ret as $val ) {
                        /* Define the node status and ignore the Fault node */
                        node_status_define($val);
                        if ( $val['status'] == NODE_DOWN ) {
                            continue;
                        }

                        $node_sets[] = $val;
                        $set_id_sets = true;
                        break;
                    }

                    unset($extre, $ret, $created_at, $_middle, $operator);
                }
                break;
            case 6:
                /* Get the first register node */
                $ret = $nodeModel->openFragment()->getList(
                    array('Id', 'node_uid', 'status', 'updated_at'),
                    array('user_id' => "={$task['user_id']}"),
                    array('created_at' => 'ASC'),
                    array(0, 10)
                );
                $node_sets = array();
                if ( $ret != false ) {
                    foreach ( $ret as $val ) {
                        /* Define the node status and ignore the Fault node */
                        node_status_define($val);
                        if ( $val['status'] == NODE_DOWN ) {
                            continue;
                        }

                        $node_sets[] = $val;
                        $set_id_sets = true;
                        break;
                    }
                }
                unset($ret);
                break;
            case 7:
                /* Get the lastest register node */
                $ret = $nodeModel->openFragment()->getList(
                    array('Id', 'node_uid', 'status', 'updated_at'),
                    array('user_id' => "={$task['user_id']}"),
                    array('created_at' => 'DESC'),
                    array(0,10)
                );
                if ( $ret != false ) {
                    foreach ( $ret as $val ) {
                        /* Define the node status and ignore the Fault node */
                        node_status_define($val);
                        if ( $val['status'] == NODE_DOWN ) {
                            continue;
                        }

                        $node_sets[] = $val;
                        $set_id_sets = true;
                        break;
                    }
                }
                unset($ret);
                break;
            }

            printf(" --With %d node rows\n", count($node_sets));

            echo "+-Try to update the task fields ... ";
            if ( empty($node_sets) ) {
                /* For empty node, here we will directly mark the task as finished E*/
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
            echo "+-Try to do the task dispatch ... \n";
            $cmdSharding = model('NodeCommandSharding');
            $taskDistSharding = model('ComputingTaskDistSharding');
            foreach ( $node_sets as $index => $node ) {
                echo "+--Try to dispatch task to node with Id={$node['Id']} ... \n";
                $c_timestamp = time();
                $data = array(
                    'user_id'   => $task['user_id'],
                    'node_id'   => $node['Id'],
                    't_type'    => 1,       # computing task
                    'task_id'   => $task_id,
                    'sync_mask' => $sync_mask,
                    'status'    => 0,
                    'progress'  => 0.00,
                    'cmd_argv'  => json_encode(array(
                        'index'    => $index,
                        'node_id'  => intval($node['Id']),
                        'node_sid' => "{$node['Id']}"
                    )),
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

                /* Add the task dist record */
                $dist = array(
                    'task_id'    => $task_id,
                    'node_id'    => $node['Id'],
                    'cmd_id'     => $data['Id'],
                    'created_at' => $c_timestamp
                );
                if ( ($dist['Id'] = $taskDistSharding->add($dist)) == false ) {
                    echo "|--[Error]: Failed to add the dist record.\n";
                    // @TODO: do error log here
                    unset($data, $dist);
                    continue;
                }
                echo "|--[Info]: dist add succeed with Id={$dist['Id']}.\n";

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
                    't_type'   => 1,    # computing task
                    'task_id'  => $task_id,
                    'node_id'  => $node['Id'],
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

            unset($task_dat, $cmdSharding, $taskDistSharding);
            unset($taskModel, $task, $nodeModel, $nodeStatM, $node_sets);
        }   /* End of while */
    }

}
