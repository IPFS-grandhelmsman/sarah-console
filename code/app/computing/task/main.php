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
        $pageno   = $input->getInt('pageno', 1);
        $pagesize = 10;

        # invoke the service to scroll the data sets
        # @see service.node.content#list
        $data = service('computing.task.content.paging', array(
            'user_id'       => $this->user_id,
            'pagesize'      => $pagesize,
            'pageno'        => $pageno,
            'date_format'   => 'Y/m/d H:i',
            'load_intro'    => true,
            'order_by'      => 'created_at',
            'sort_by'       => 'desc'
        ));

        if ( $data == false ) {
            $data = array();
        }

        view_paging_register(
            model('ComputingTaskSharding')->totals(
                array('user_id' => "={$this->user_id}")
            ), 
            $pagesize, 
            $pageno
        );

        return view("embed/computing-task-list.html", array(
            'data' => $data
        ));
    }

    /**
     * display the logic code for edit or whatever
    */
    public function actionCoding($input)
    {
        assert_std_tias($input, 'computing.list', $task_id);
        $task = service('computing.task.content.view', array(
            'user_id'      => $this->user_id,
            'id'           => $task_id,
            'load_engine'  => true,
            'date_format'  => 'Y/m/d H:i'
        ));

        if ( strlen($task['engine']) < 2 ) {
            $task['engine'] = 'lua';
        }

        if ( strlen($task['logic_code']) < 2 ) {
            $task['logic_code'] = '';
        }

        $task['editable'] = $task['status'] > 0 ? false : true;
        return view("embed/computing-task-coding.html", array(
            'data' => $task
        ));
    }

    /**
     * computing task view interface
    */
    public function actionView($input)
    {
        assert_std_tias($input, 'computing.list', $task_id);
        $pageno   = $input->getInt('pageno', 1);
        $pagesize = 10;

        /* Get the task information */
        $task = service('computing.task.content.view', array(
            'user_id'      => $this->user_id,
            'id'           => $task_id,
            'load_engine'  => true,
            'cal_percent'  => true,
            'date_format'  => 'Y/m/d H:i'
        ));

        /* Get the task dist list */
        $dist = service('computing.task.dist.content.paging', array(
            'user_id'      => $this->user_id,
            'task_id'      => $task_id,
            'load_node'    => true,
            'date_format'  => 'Y/m/d H:i'
        ));

        if ( $dist == false ) {
            $dist = array();
        }

        view_paging_register(
            model('ComputingTaskDistSharding')->totals(
                array('task_id' => "={$task_id}")
            ), 
            $pagesize, 
            $pageno
        );

        return view("embed/computing-task-view.html", array(
            'task' => $task,
            'dist' => $dist
        ));
    }

}
