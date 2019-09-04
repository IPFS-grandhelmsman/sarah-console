<?php
/**
 * Node Controller
 * 
 *
*/

import('core.Session_Controller', false);

class NodeController extends Session_Controller
{

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        $cursor   = $input->getInt('cursor', 0);
        $pagesize = 10;

        # invoke the service to scroll the data sets
        # @see service.node.content#list
        $data = service('node.content.scroll', array(
            'user_id'      => $this->user_id,
            'load_stat'    => true,
            'cal_percent'  => true,
            'byte_convert' => true,
            'pagesize'     => $pagesize,
            'order_by'     => 'created_at',
            'sort_by'      => 'desc'
        ));

        if ( $data == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty sets');
        }

        $length   = count($data);
        $p_cursor = intval($data[0]['created_at']);
        $n_cursor = ($length == $pagesize)
            ? intval($data[$length-1]['created_at']) : 0;

        return json_view(STATUS_OK, array(
            'data' => $data,
            'p_cursor' => $p_cursor,
            'n_cursor' => $n_cursor
        ));
    }
    
    /**
     * get the node status information
    */
    public function actionStatus($input)
    {
        assert_std_tias($input, 'node.list', $node_id);

        // get the node information
        $node = model('NodeStatisticsSharding')
            ->getShardingModelFromValue($this->user_id)->getById(
            array(
                'status', 'load_avg', 'ram_used_kb', 'ram_utilization', 
                'disk_used_kb', 'disk_utilization', 'incoming_bd', 'outgoing_bd',
                'updated_at'
            ), 
            $node_id
        );

        if ( $node == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty Sets');
        }

        node_status_define($node);
        return json_view(STATUS_OK, $node);
    }


    public function actionEdit($input)
    {
        assert_std_tias($input, 'node.list', $node_id);
        $name = $input->post('name', array('/^[^`]{1,64}$/'));
        if ( $name == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $data = array(
            'name' => $name
        );

        $where = array(
            'Id' => "={$node_id}",
            'user_id' => "={$this->user_id}"
        );
        if ( model('NodeSharding')
            ->getShardingModelFromValue($this->user_id)
                ->update($data, $where) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, 'Ok');
    }

}
