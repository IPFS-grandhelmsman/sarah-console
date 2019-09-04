<?php
/**
 * node command controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class CommandController extends Session_Controller
{    

    public function actionView($input)
    {
        assert_std_tias($input, 'node.list', $node_id);
        $cmd_id = $input->getInt('cmd_id');
        if ( $cmd_id == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        /* Get the node information */
        $node = model('NodeSharding')->getById(array('node_uid'), $node_id);
        if ( $node == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        /* Get the command information */
        $command = model('NodeCommandSharding')
            ->getShardingModelFromValue($node_id)->getById(
            array(
                'user_id', 'task_id', 'sync_mask', 
                'status', 'progress', 'engine', 'cmd_text', 'res_data', 
                'created_at', 'pull_at', 'exec_at', 'done_at'
            ),
            $cmd_id
        );

        if ( $command == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        if ( $command['user_id'] != $this->user_id ) {
            return json_view(STATUS_ACCESS_DENY, 'Access Deny');
        }

        # Track the node_uid
        $command['node'] = array(
            'node_id'  => $node_id,
            'node_uid' => $node['node_uid'],
            'v_qstr'   => 'id=' . $input->get('id') 
                            . '&acm=' . $input->get('acm') 
                            . '&sign=' . $input->get('sign')
        );

        /* Define the sync attributes */
        $sync_mask = intval($command['sync_mask']);
        $command['sync_err']   = ($sync_mask & CMD_SYNC_ERR_EXEC) != 0 ? true : false;
        $command['sync_start'] = ($sync_mask & CMD_SYNC_START_EXEC) != 0 ? true : false;
        $command['sync_ing']   = true;
        $command['sync_done']  = ($sync_mask & CMD_SYNC_DONE_EXEC) != 0 ? true : false;

        /* Define the life circle time string */
        $command['created_time'] = date('Y/m/d H:i:s', $command['created_at']);
        $command['pull_time'] = date('Y/m/d H:i:s', $command['pull_at']);
        $command['exec_time'] = date('Y/m/d H:i:s', $command['exec_at']);
        $command['done_time'] = date('Y/m/d H:i:s', $command['done_at']);

        return view("embed/node-command-view.html", array(
            'data' => $command
        ));
    }

}
