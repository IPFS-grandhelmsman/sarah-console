<?php
/**
 * Application task node controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class NodeController extends Session_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        assert_std_tias($input, 'apptask.list', $task_id);
        
        $task = model('ApplicationTaskSharding')->getById(
            array('dist_node_id_set'), $task_id
        );
        if ( $task == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $dist_node_id_set = $task['dist_node_id_set'];
        if ( strlen($dist_node_id_set) < 19 ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty sets');
        }

        // query the node info
        $nodes = model('NodeSharding')
            ->getShardingModelFromValue($this->user_id)
                ->openFragment()->getList(
            array('Id', 'node_uid', 'name', 'status', 'updated_at'),
            array('Id' => "in({$dist_node_id_set})")
        );
        if ( $nodes == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty sets');
        }

        $data = array();
        foreach ( $nodes as $val ) {
            node_status_define($val);
            $data[] = $val;
        }

        return json_view(STATUS_OK, $data);
    }

}
