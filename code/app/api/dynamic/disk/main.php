<?php
/**
 * disk dynamic api controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class DiskController extends Session_Controller
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
        $name  = $input->post('name');
        $intro = $input->post('intro');
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
            'user_id' => $this->user_id,
            'name'    => $name,
            'intro'   => $intro,
            'status'  => 0,
            'created_at' => $c_time
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

        $name  = $input->post('name');
        if ( $name != false && strlen($name) < 60 ) {
            $_args['name'] = $name;
        }

        $intro = $input->post('intro');
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
            || $dist_type > 3 || $sarah_sign == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $data = array(
            'status'     => 1,
            'dist_type'  => $dist_type,
            'sarah_sign' => $sarah_sign,
            'started_at' => time()
        );
        if ( model('ComputingTaskSharding')->updateById($data, $task_id) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        /* 
         * @TODO:
         * Send a start up signal to the start up task list 
         * So the asynchronize worker could start the dispatch
        */

        return json_view(STATUS_OK, array(
            'Id' => $task_id,
            'started_at' => $data['started_at']
        ));
    }

}
