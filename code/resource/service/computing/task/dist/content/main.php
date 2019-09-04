<?php
/**
 * ComputingTaskDistContent service class for 
 *  computing task distribution content handler
 *
 * 
*/

import('service.ContentService', false);

class ComputingTaskDistContentService extends ContentService
{

    public function __construct()
    {
        $this->dataModel  = 'ComputingTaskDistSharding';
        $this->indexModel = 'ComputingTaskDistSharding';
    }

    /**
     * data model fetch override
    */
    public function get_data_model($dataModel, $input)
    {
        if ( $this->_dataModelObj != null ) {
            return $this->_dataModelObj;
        }

        $task_id = $input->get('task_id');
        if ( $task_id == null ) {
            throw new Exception("Missing mapping field");
        }

        $this->_dataModelObj = model($dataModel)->getShardingModelFromValue($task_id);
        return $this->_dataModelObj;
    }

    /**
     * query a data list througth the specified query condition
     *
     * @param   $model
     * @param   $where
     * @param   $order
     * @param   $limit
     * @param   $shift do the result shitf
     * @return  Mixed(Array or false for empty data sets)
     * @Override
    */
    protected function getDataSets(
        $input, $model, $where, $order=null, $limit=null, $shift=false)
    {
        $fields = array(
            'Id', 'node_id', 'cmd_id', 'status', 'progress', 'created_at'
        );

        $data = $model->openFragment()->startSepRaw()->getList(
            $fields, $where, $order, $limit
        );

        if ( $data == false ) {
            return false;
        }

        /*
         * we don't have any mechanism to make sure the cursor_time cursor is unique
         * so if set the cursor_time = '>{$cursor}' then we are going to lost some rows 
         * with the same cursor_time value with the last record of the last cursor:
         * @Note : we query pagesize + 1 rows if the cursor is specified,
         * so, of course we need to shift away the first record 
        */
        if ( $shift == true ) {
            array_shift($data);
            if ( empty($data) ) {
                return false;
            }
        }

        $user_id = $input->get('user_id');
        if ( $user_id != null 
            && ($load_node = $input->get('load_node')) == true ) {
            import('Util');
            $idstr = Util::implode($data, 'node_id', ',', false);
            $nodes = model('NodeSharding')
                ->getShardingModelFromValue($user_id)
                    ->openFragment()->getList(
                array('Id', 'node_uid', 'name', 'status', 'created_at', 'updated_at'),
                array('Id' => "in({$idstr})")
            );
            $nodeIdx = Util::makeIndex($nodes, 'Id', true);
            unset($nodes);
        }

        # pre-process the output posts data:
        # count the view query string
        $d_format = $input->get('date_format');
        foreach ( $data as $key => $val ) {
            //format timestamp
            if ( $d_format != null ) {
                $val['created_time'] = date($d_format, $val['created_at']);
            }

            if ( $load_node == true ) {
                $node_id = $val['node_id'];
                if ( isset($nodeIdx["{$node_id}"]) ) {
                    $node = $nodeIdx["{$node_id}"];
                    $node['v_qstr']  = build_std_tias(
                        'node.list', $node['Id'], $node['created_at']
                    );
                    $val['node'] = $node;
                    node_status_define($val['node']);
                } else {
                    $val['node'] = null;
                }
            }

            $data[$key] = $val;
        }

        return $data;
    }

    /**
     * query a data item
     *
     * @param   $input
     * @param   $model
     * @param   $where
     * @return  Mixed
     * @Override
    */
    protected function getData($input, $model, $where)
    {
        $fields = array(
            'task_id', 'node_id', 'cmd_id', 'status', 'progress', 'created_at', 
        );

        $data = $model->openFragment()->startSepRaw()->get($fields, $where);
        if ( $data == false ) {
            return false;
        }

        if ( ($d_format = $input->get('date_format')) != null ) {
            $data['created_time'] = date($d_format, $data['created_at']);
        }

        return $data;
    }

    /**
     * get the corpus base where
     *
     * @param   $input
     * @return  Array
     * @Override
    */
    protected function pre_where($input)
    {
        $_where = array();

        // task_id check and auto append
        $task_id = $input->get('task_id');
        if ( $task_id != false ) {
            $_where['task_id'] = "={$task_id}";
        }

        return $_where;
    }

}
