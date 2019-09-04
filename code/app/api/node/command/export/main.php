<?php
/**
 * Node command export Api controller
 *
 * 
*/

class ExportController extends C_Controller
{

    /**
     * Wait the response of the specified command.
    */
    public function actionStatus($input)
    {
        $cmd_id   = $input->get('cmd_id', array('/^[0-9]{1,20}$/'));
        $node_uid = $input->get('node_uid', array('/^[a-zA-Z0-9_-]{40}$/'));
        $app_key  = $input->get('app_key', array('/^[a-zA-Z0-9_-]{32,56}$/'));
        if ( $cmd_id == false || $node_uid == false || $app_key == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        assert_app_key($app_key, $user_id);
        $rcMap = helper('MainPDSL')->load('RemoteCommandMap', $user_id, $node_uid);
        $pack  = $rcMap->get($cmd_id, 'json_decode');
        if ( $pack == false ) {
            return json_view(7, 'package not define or has been removed');
        }

        // If the status is marked as finished
        // We need to remove the stored map key
        if ( $pack->status == 2 ) {
            $res = model('NodeCommandSharding')->getById(array('res_data'), $cmd_id);
            if ( $res == false ) {
                $pack->res_data = null;
            } else {
                $pack->res_data = str_replace(
                    array('<', '>'), array('&lt;', '&gt;'), $res['res_data']
                );
            }
            $rcMap->del($cmd_id);
        } else {
            $pack->res_data = null;
        }

        return json_view(STATUS_OK, $pack);
    }

    /**
     * Check and Pull the command for the specified remote node
    */
    public function actionPull($input)
    {
        $app_key  = $input->get('app_key', array('/^[a-zA-Z0-9_-]{32,56}$/'));
        $node_uid = $input->get('node_uid', array('/^[a-zA-Z0-9_-]{40}$/'));
        if ( $app_key == false || $node_uid == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        assert_app_key($app_key, $user_id);
        $list = helper('MainPDSL')->load('RemoteCommandPool', $user_id, $node_uid);
        if ( ($cmd_obj = $list->lpop('json_decode')) == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty Sets');
        }

        // query the command package
        $cmd_id  = $cmd_obj->id;
        $command = model('NodeCommandSharding')->getById(
            array(
                'user_id', 'node_id', 'status', 
                'cmd_argv', 'cmd_text', 'engine', 'sign', 'created_at'
            ), 
            $cmd_id
        );

        if ( $command == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty Sets');
        }

        // if ( $command['user_id'] != $user_id ) {
        //     return json_view(7, "Invalid command, uid={$command['user_id']}");
        // }

        $cmd_status = intval($command['status']);
        if ( $cmd_status != 0 ) {
            return json_view(8, "Invalid command, status={$cmd_status}");
        }

        // mark the pull time in the map
        $c_time = time();
        $rcMap  = helper('MainPDSL')->load('RemoteCommandMap', $user_id, $node_uid);
        if ( ($pack = $rcMap->get($cmd_id, 'json_decode_array')) != false ) {
            $pack['pull_at'] = $c_time;
        } else {
            $pack = array(
                'status'   => 0,
                'progress' => 0.00,
                'send_at'  => intval($command['created_at']),
                'pull_at'  => $c_time,
                'exec_at'  => 0,
                'done_at'  => 0
            );
        }

        $m_sync = 1;
        if ( $rcMap->set($cmd_id, json_encode($pack)) === false ) {
            $m_sync = 0;
            // @TODO: do error log here
        }

        return json_view(STATUS_OK, array(
            'id'         => $cmd_id,
            'id_str'     => "{$cmd_id}",
            'created_at' => intval($command['created_at']),
            // 'user_id' => $command['user_id'],
            // 'node_id' => $command['node_id'],
            'status'     => $cmd_status,
            'cmd_argv'   => $command['cmd_argv'],
            'cmd_text'   => $command['cmd_text'],
            'sign'       => $command['sign'],
            'engine'     => $command['engine'],
            'sync_mask'  => $cmd_obj->sync_mask,
            'm_sync'     => $m_sync
        ));
    }

    /**
     * command status notify api
     * JSON package:
     * {
     *  "version": 1.54,
     *  "data": {
     *      "status": 0|1|2|3|-1,
     *      "progress": 0.10,
     *      "errno": integer,
     *      "attach": integer,
     *      "res_data": "response raw content"
     *  }
     * }
    */
    public function actionNotify($input)
    {
        $cmd_id   = $input->get('cmd_id', array('/^[0-9]{1,20}$/'));
        $node_uid = $input->get('node_uid', array('/^[a-zA-Z0-9_-]{40}$/'));
        $app_key  = $input->get('app_key', array('/^[a-zA-Z0-9_-]{32,56}$/'));
        $sign     = $input->get('sign', array('/^[a-zA-Z0-9_-]{1,32}$/'));
        $json     = get_post_raw_data();

        if ( $cmd_id == false || $node_uid == false 
            || $app_key == false || $sign == false || $json == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        // check the validity of the app_key and the sign
        $jobj = NULL;
        if ( ($jobj = json_decode($json)) == NULL ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid JSON string');
        }

        // signature checking
        assert_app_key($app_key, $user_id);
        if ( strncmp($sign, md5("{$node_uid}{$cmd_id}{$json}{$app_key}"), 32) != 0 ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid signature');
        }


        /* 
         * get the command package from the Map layer
         * If not we have to get the extra information from the database.
        */
        $flush_to_db = false;
        $rcMap = helper('MainPDSL')->load('RemoteCommandMap', $user_id, $node_uid);
        if ( ($pack = $rcMap->get($cmd_id, 'json_decode_array')) == false ) {
            $flush_to_db = true;    // directly flush to the database
            $pack = array(
                'status'   => $jobj->data->status,
                'progress' => $jobj->data->progress,
                'errno'    => isset($jobj->data->errno) ? $jobj->data->errno : 0,
                'attach'   => isset($jobj->data->attach) ? $jobj->data->attach: 0
            );

            $task = model('NodeCommandSharding')
                ->getById(array('t_type', 'task_id', 'node_id'), $cmd_id);
            if ( $task != false && $task['task_id'] > 0 ) {
                $pack['t_type']  = intval($task['t_type']);
                $pack['task_id'] = intval($task['task_id']);
                $pack['node_id'] = intval($task['node_id']);
           }
        } else {
            $pack['status']   = $jobj->data->status;
            $pack['progress'] = $jobj->data->progress;
            $pack['errno']  = isset($jobj->data->errno) ? $jobj->data->errno : 0;
            $pack['attach'] = isset($jobj->data->attach) ? $jobj->data->attach : 0;
        }


        $c_time = time();
        if ( $jobj->data->status == 1 ) {
            $pack['exec_at'] = $c_time;
        } else if ( $jobj->data->status == 2 || $jobj->data->status == -1 ) {
            $flush_to_db = true;
            $pack['done_at'] = $c_time;
        }

        // update the package in the Map
        $m_sync = 1;
        if ( $rcMap->set($cmd_id, json_encode($pack)) === false ) {
            $m_sync = 0;
        }

        // @Note here we always consider the Map PDSL as a performance
        // optimization solution. So, here if we failed to read the package
        // we will directly update the status of the row in database.
        $d_sync = -1;
        if ( $flush_to_db == true ) {
            $data = array(
                'status'   => $pack['status'],
                'progress' => $pack['progress']
            );
            if ( isset($pack['pull_at']) ) $data['pull_at'] = $pack['pull_at'];
            if ( isset($pack['exec_at']) ) $data['exec_at'] = $pack['exec_at'];
            if ( isset($pack['done_at']) ) $data['done_at'] = $pack['done_at'];
            if ( isset($jobj->data->res_data) && strlen($jobj->data->res_data) > 1 ) {
                $data['res_data'] = $jobj->data->res_data;
            }

            if ( isset($jobj->data->res_error) && strlen($jobj->data->res_error) > 1 ) {
                $data['res_error'] = $jobj->data->res_error;
            }

            $d_sync = 1;
            if ( model('NodeCommandSharding')->updateById($data, $cmd_id) == false ) {
                $d_sync = 0;
                // @TODO: do error log here
            }
        }

        /* task callback */
        if ( isset($pack['task_id']) && $pack['task_id'] > 0 ) {
            switch ( $pack['t_type'] ) {
            case 1:
                /* 1, Distribution Computing task */
                /* Check and update the status of the specified dist. */
                $data = array(
                    'status'   => $pack['status'],
                    'progress' => $pack['progress']
                );
                $where = array(
                    'task_id' => "={$pack['task_id']}",
                    'node_id' => "={$pack['node_id']}"
                );
                if ( model('ComputingTaskDistSharding')
                    ->update($data, $where) == false ) {
                    // @TODO: do error log here
                }

                /* update the done_at and the completed_num of the current task */
                if ( $pack['status'] == 2 || $pack['status'] == -1 ) {
                    $data = array(
                        'done_at'       => $c_time,
                        'completed_num' => array(
                            'value' => 'completed_num + 1',
                            'quote' => false
                        )
                    );

                    if ( model('ComputingTaskSharding')
                        ->updateById($data, $pack['task_id']) == false ) {
                        // @TODO: do error log here
                    }

                    # remove the specified command package
                    $rcMap->del($cmd_id);
                }
                break;
            case 2:
                /* 2, Application task */
                if ( $pack['status'] == 1 ) {       # execution ing
                    if ( model('ApplicationNodeSharding')->set(
                        'progress', $pack['progress'], 
                        array('app_id' => "{$pack['app_id']}", 
                            'node_id' => "={$pack['node_id']}")) == false ) {
                        // @TODO: do error log here
                    }
                } else if ( $pack['status'] == 2 
                    || $pack['status'] == -1 ) {    # execution completed or failed
                    if ( ! isset($pack['app_id']) 
                        || ! isset($app['opt_type']) ) {
                        $task = model('ApplicationTaskSharding')->getById(
                            array('app_id', 'opt_type'), $pack['task_id']
                        );

                        if ( $task != false ) {
                            $pack['app_id'] = intval($task['app_id']);
                            $pack['opt_type'] = intval($task['opt_type']);
                        }
                    }

                    if ( isset($pack['app_id']) && isset($pack['opt_type']) ) {
                        $data = array(
                            'progress'    => 1,
                            'finished_at' => $c_time,
                        );

                        if ( $pack['opt_type'] == 1 ) {         # installation
                            if ( $pack['status'] == -1 ) {
                                $data['status'] = NODE_APP_TOBE_INSTALL;
                                $data['opt_status'] = 2;
                            } else if ( $pack['errno'] == 0 ) {
                                $data['status'] = NODE_APP_TOBE_START;
                                $data['opt_status'] = 3;
                            } else {
                                $data['status'] = NODE_APP_TOBE_INSTALL;
                                $data['opt_status'] = 2;
                            }
                        } else if ( $pack['opt_type'] == 2 ) {  # startup
                            if ( $pack['status'] == -1 ) {
                                $data['status'] = NODE_APP_TOBE_START;
                                $data['opt_status'] = 5;
                                $data['pid'] = 0;
                                $data['stat_json'] = '0';
                            } else if ( $pack['errno'] == 0 || $pack['errno'] == 100 ) {
                                $data['status'] = NODE_APP_RUNNING;
                                $data['opt_status'] = 6;
                                $data['pid'] = $pack['attach'];
                            } else {
                                $data['status'] = NODE_APP_TOBE_START;
                                $data['opt_status'] = 5;
                                $data['pid'] = 0;
                                $data['stat_json'] = '0';
                            }
                        } else if ( $pack['opt_type'] == 3 ) {  # stop
                            if ( $pack['status'] == -1 ) {
                                $data['status'] = NODE_APP_RUNNING;
                                $data['opt_status'] = 8;
                            } else if ( $pack['errno'] == 0 ) {
                                $data['status'] = NODE_APP_TOBE_START;
                                $data['opt_status'] = 9;
                                $data['pid'] = 0;
                                $data['stat_json'] = '0';
                            } else {
                                $data['status'] = NODE_APP_RUNNING;
                                $data['opt_status'] = 8;
                            }
                        } else if ( $pack['opt_type'] == 4 ) {  # uninstall
                            if ( $pack['status'] == -1 ) {
                                $data['status'] = NODE_APP_TOBE_START;
                                $data['opt_status'] = 11;
                            } else if ( $pack['errno'] == 0 ) {
                                $data['status'] = NODE_APP_UNINSTALLED;
                                $data['opt_status'] = 12;
                            } else {
                                $data['status'] = NODE_APP_TOBE_START;
                                $data['opt_status'] = 11;
                            }
                        }


                        $do_update = true;
                        if ( $pack['opt_type'] == 4 && $pack['status'] == 2 ) {
                            $do_update = false;
                            if ( model('ApplicationNodeSharding')->delete(
                                array('app_id' => "={$pack['app_id']}", 
                                    'node_id' => "={$pack['node_id']}")) == false ) {
                                $do_update = true;
                                // @TODO: do error log here
                            }
                        }

                        if ( $do_update == true ) {
                            if ( model('ApplicationNodeSharding')->update($data, 
                                array('app_id' => "={$pack['app_id']}", 
                                    'node_id' => "={$pack['node_id']}")) == false ) {
                                // @TODO: do error log here
                            }
                        }


                        /* 
                         * Check and update the done_at and the completed_num 
                         * of the task since the the application monitor process
                         * may keep firing the execution of this with errno >= 100 
                        */
                        if ( $pack['errno'] < 100 ) {
                            $data = array(
                                'done_at'       => $c_time,
                                'completed_num' => array(
                                    'value' => 'completed_num + 1',
                                    'quote' => false
                                )
                            );

                            if ( model('ApplicationTaskSharding')
                                ->updateById($data, $pack['task_id']) == false ) {
                                // @TODO: do error log here
                            }
                        }
                    }

                    # remove the specified command package
                    $rcMap->del($cmd_id);
                }
                break;
            default:
                // Do nothing here
                break;
            }
        }

        return json_view(STATUS_OK, array(
            'id'       => $cmd_id,
            't_type'   => $pack['t_type'],
            'task_id'  => $pack['task_id'],
            'status'   => $pack['status'],
            'progress' => $pack['progress'],
            'm_sync'   => $m_sync,
            'd_sync'   => $d_sync
        ));
    }

}
