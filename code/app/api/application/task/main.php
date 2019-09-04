<?php
/**
 * Application task controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class TaskController extends Session_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        return null;
    }

    /*
     * For the basic add operation we only 
     * track the name and the intro information
    */
    public function actionAdd($input)
    {
        assert_std_tias($input, 'app.list', $app_id);

        $name  = $input->post('name', array(OP_STRING, NULL, OP_SANITIZE_TRIM));
        $intro = $input->post('intro', array(OP_STRING, 
            OP_LIMIT(0,255), OP_SANITIZE_HTML | OP_SANITIZE_TRIM));
        $opt_type = $input->postInt('opt_type');
        $dist_type = $input->postInt('dist_type');
        $autostart = $input->postBoolean('autostart', false);
        if ( $opt_type == false || $opt_type < 1 || $opt_type > 4 ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        if ( $dist_type == false || $dist_type < 1 || $dist_type > 8 ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        # check the dist_type and the id_sets
        $node_id_sets = $input->post('node_id_sets');
        if ( $dist_type != 2 ) {
            $node_id_sets = '0';
        } else if ( $node_id_sets == false || strlen($node_id_sets) < 19 ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        } else {
            $id_sets  = array();
            $id_parts = explode(',', $node_id_sets);
            foreach ( $id_parts as $node_id ) {
                if ( ! is_numeric($node_id) || strlen($node_id) < 19 ) {
                    return json_view(STATUS_INVALID_ARGS, "Invalid node id={$node_id}");
                }

                $id_sets[] = intval($node_id);
            }

            $node_id_sets = implode(',', $id_sets);


            /* 
             * do the database query to make sure the nodes are all belongs
             * to the current operation user.
            */
            $nodes = model('NodeSharding')
                ->getShardingModelFromValue($this->user_id)->getList(
                array('Id', 'user_id'), 
                array('Id' => "in({$node_id_sets})")
            );
            if ( $nodes == false ) {
                return json_view(STATUS_INVALID_ARGS, 'Invalid node is sets');
            }

            $id_sets = array();
            foreach ( $nodes as $val ) {
                if ( $val['user_id'] == $this->user_id ) {
                    $id_sets[] = $val['Id'];
                }
            }

            if ( empty($id_sets) ) {
                return json_view(STATUS_INVALID_ARGS, 'Empty id sets');
            }

            $node_id_sets = implode(',', $id_sets);
        }

        /* 
         * Query the latest record make sure for every 10 seconds 
         * there is only one add operation.
        */
        $c_time = time();
        $last = model('ApplicationTaskSharding')->getList(
            array('Id', 'created_at'), 
            array('app_id' => "={$app_id}", 'user_id' => "={$this->user_id}"),
            array('created_at' => 'desc'),
            array(0, 1)
        );
        if ( $last != false && (10 + $last[0]['created_at']) >= $c_time ) {
            return json_view(8, 'Operation too frequent');
        }

        # load the application information 
        $app = model('Application')->getById(array('name'), $app_id);
        if ( $app == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }


        if ( $name == false || strlen($name) < 2 ) {
            # make the application name
            switch ( $opt_type ) {
            case 1:
                $name = "安装{$app['name']}应用";
                break;
            case 2:
                $name = "启动{$app['name']}应用";
                break;
            case 3:
                $name = "停止{$app['name']}应用";
                break;
            case 4:
                $name = "卸载{$app['name']}应用";
                break;
            }
        }

        $data = array(
            'app_id'            => $app_id,
            'user_id'           => $this->user_id,
            'opt_type'          => $opt_type,
            'name'              => $name,
            'intro'             => $intro == false ? '0' : $intro,
            'status'            => 0,
            'dist_type'         => $dist_type,
            'dist_node_id_set'  => $node_id_sets,
            'created_at'        => $c_time
        );

        # check the autostart and do the relative work
        if ( $autostart == true ) {
            $data['status'] = 1;
            $data['started_at'] = $c_time;
        }

        $data['Id'] = model('ApplicationTaskSharding')->add($data);
        if ( $data['Id'] == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        $started = false;
        if ( $autostart == true ) {
            /* 
             * Send a start up signal to the start up task list 
             * So the asynchronize worker could start the dispatch.
            */
            $started = true;
            if ( helper('MainPDSL')
                ->load('ApplicationTaskPool')->rpush($data['Id']) == 0 ) {
                $started = false;
            }
        }

        return json_view(STATUS_OK, array(
            'data' => $data,
            'autostart' => $autostart,
            'started' => $started
        ));
    }

    /**
     * start up the task which will send command to each of the nodes selected to
     * join the application task computing.
     *
     * @Note the dispatch work will be finished asynchronized.
    */
    public function actionStartup($input)
    {
        assert_std_tias($input, 'apptask.list', $task_id);

        /* 
         * Send a start up signal to the start up task list 
         * So the asynchronize worker could start the dispatch.
         *
         * IF the database row update failed this signal will be ignored.
        */
        if ( helper('MainPDSL')
            ->load('ApplicationTaskPool')->rpush($task_id) == 0 ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        $data = array(
            'status'     => 1,
            'started_at' => time()
        );
        $where = array(
            'Id'      => "={$task_id}",
            'user_id' => "={$this->user_id}",
            'status'  => '=0'
        );
        if ( model('ApplicationTaskSharding')
            ->getShardingModelFromId($task_id)
                ->update($data, $where) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, array(
            'Id' => $task_id,
            'started_at' => $data['started_at']
        ));
    }

}
