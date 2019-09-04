<?php
/**
 * Computing task distribution controller
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
        assert_std_tias($input, 'computing.list', $task_id);

        $pageno   = $input->getInt('pageno', 1);
        $pagesize = 10;

        # invoke the service to scroll the data sets
        # @see service.node.content#list
        $ret = service('computing.task.dist.content.paging', array(
            'task_id'   => $task_id,
            'pagesize'  => $pagesize,
            'pageno'    => $pageno,
            'order_by'  => 'node_id',
            'sort_by'   => 'desc'
        ));

        if ( $ret == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty sets');
        }

        return json_view(STATUS_OK, $ret);
    }

}
