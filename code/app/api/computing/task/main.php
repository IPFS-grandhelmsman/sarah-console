<?php
/**
 * Computing task controller
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
        $name  = $input->post('name', array(OP_STRING, null, OP_SANITIZE_TRIM));
        $intro = $input->post('intro', array(OP_STRING, 
            null, OP_SANITIZE_HTML | OP_SANITIZE_TRIM ));
        if ( $name == false || strlen($name) >= 60 
            || $intro == false || strlen($intro) >= 300 ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        /* 
         * Query the latest record make sure for every 10 seconds 
         * there is only one add operation.
        */
        $c_time = time();
        $last = model('ComputingTaskSharding')->getList(
            array('Id', 'created_at'), 
            array('user_id' => "={$this->user_id}"),
            array('created_at' => 'desc'),
            array(0, 1)
        );
        if ( $last != false && (10 + $last[0]['created_at']) >= $c_time ) {
            return json_view(8, 'Operation too frequent');
        }


        $data = array(
            'user_id'           => $this->user_id,
            'name'              => $name,
            'intro'             => $intro,
            'status'            => 0,
            'created_at'        => $c_time,
            'logic_code'        => '0',
            'dist_node_id_set'  => '0'
        );

        $data['Id'] = model('ComputingTaskSharding')->add($data);
        if ( $data['Id'] == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, $data);
    }

    public function actionEdit($input)
    {
        assert_std_tias($input, 'computing.list', $task_id);
        $_args = array();

        $name  = $input->post('name', array(OP_STRING, NULL, OP_SANITIZE_HTML));
        if ( $name != false && strlen($name) < 60 ) {
            $_args['name'] = $name;
        }

        $intro = $input->post('intro', array(OP_STRING, NULL, OP_SANITIZE_HTML));
        if ( $intro != false && strlen($intro) < 300 ) {
            $_args['intro'] = $intro;
        }

        $engine = $input->post('engine', array('/^(bash|lua|php)$/'));
        if ( $engine != false ) {
            $_args['engine'] = $engine;
        }

        /* With the logic code field menas the engine must be set */
        $logic_code = $input->post('logic_code');
        if ( $logic_code != false && $engine != false ) {
            $_args['logic_code'] = $logic_code;
        }

        if ( empty($_args) ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }


        $task = model('ComputingTaskSharding')->getById(
            array('user_id', 'status'), $task_id
        );
        if ( $task == false || $task['user_id'] != $this->user_id ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        /* 
         * Task will become uneditable if it's status is greater than 0
         * That is running or finished running
        */
        if ( $task['status'] != 0 ) {
            return json_view(8, 'task uneditable');
        }


        $_args['updated_at'] = time();
        if ( model('ComputingTaskSharding')->updateById($_args, $task_id) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, array(
            'Id' => $task_id,
            'updated_at' => $_args['updated_at']
        ));
    }

    /**
     * start up the task which will send command to each of the nodes selected to
     * join the computing.
     *
     * @Note the dispatch work will be finished asynchronized.
    */
    public function actionStartup($input)
    {
        assert_std_tias($input, 'computing.list', $task_id);

        $dist_type  = $input->postInt('dist_type');
        $sarah_sign = $input->post('sarah_sign', array('/^[a-z0-9]{32}$/'));
        if ( $dist_type == false || $dist_type < 1 
            || $dist_type > 7 || $sarah_sign == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        # check the assert service password
        assert_service_passwd($this->user_id, $input->post('service_passwd'));

        # check the dist_type and the dispatch node id sets
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
         * Added at 2019/03/08
         * check and make sure the logic code is at least with something
        */
        $task = model('ComputingTaskSharding')->getById(
            array('engine', 'logic_code'), $task_id
        );
        if ( $task == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        if ( strlen($task['engine']) < 2 || strlen($task['logic_code']) < 2 ) {
            return json_view(8, 'Please do the code work first');
        }

        /* 
         * Send a start up signal to the start up task list 
         * So the asynchronize worker could start the dispatch.
         *
         * IF the database row update failed this signal will be ignored.
        */
        if ( helper('MainPDSL')
            ->load('ComputingTaskPool')->rpush($task_id) == 0 ) {
            return json_view(STATUS_FAILED, 'Failed');
        }


        $data = array(
            'status'           => 1,
            'dist_type'        => $dist_type,
            'sarah_sign'       => $sarah_sign,
            'dist_node_id_set' => $node_id_sets,
            'started_at'       => time()
        );
        $where = array(
            'Id'      => "={$task_id}",
            'user_id' => "={$this->user_id}",
            'status'  => '=0'
        );
        if ( model('ComputingTaskSharding')
            ->getShardingModelFromValue($this->user_id)
                ->update($data, $where) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, array(
            'Id' => $task_id,
            'started_at' => $data['started_at']
        ));
    }

}
