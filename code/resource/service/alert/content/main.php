<?php
/**
 * alert content service
 * Packaged all logic code ralated to the content of alert
 *
*/

import('service.ContentService', false);

class AlertContentService extends ContentService
{

    static $alertTypeStr = array(
        ALERT_TYPE_LOADAVG      => "系统负载",
        ALERT_TYPE_RAM          => "内存使用率",
        ALERT_TYPE_DISK         => "磁盘使用率",
        ALERT_TYPE_INCOMING_BD  => "上传带宽",
        ALERT_TYPE_OUTGOING_BD  => "下载带宽",
        ALERT_TYPE_FAULT        => "节点故障"
    );

    public function __construct()
    {
        $this->dataModel  = 'AlertSharding';
        $this->indexModel = 'AlertSharding';
    }

    /**
     * data model fetch override
    */
    public function get_data_model($dataModel, $input)
    {
        if ( $this->_dataModelObj != null ) {
            return $this->_dataModelObj;
        }

        $user_id = $input->get('user_id');
        if ( $user_id == null ) {
            throw new Exception("Missing mapping field");
        }

        $this->_dataModelObj = model($dataModel)->getShardingModelFromValue($user_id);
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
        $_fields = array(
            'Id', 'user_id', 'node_id', 'alert_type',
            'alert_value_json', 'created_at', 'readed_at'
        );

        if ( ($loadJson = $input->get('load_json')) == true ) {
            $_fields[] = 'alert_value_json';
        }

        $data = $model->openFragment()
            ->startSepRaw()->getList($_fields, $where, $order, $limit);
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

        /* check and load the basic node rows */
        if ( ($load_node = $input->get('load_node')) == true ) {
            import('Util');
            $idstr = Util::implode($data, 'node_id', ',', true);
            $nodeDat = model('NodeSharding')
                ->getShardingModelFromValue($input->get('user_id'))->getList(
                array('Id', 'node_uid', 'name', 'created_at'), 
                array('Id' => "in($idstr)")
            );
            $nodeIdx = Util::makeIndex($nodeDat, 'Id', true);
            unset($nodeDat);
        }

        # pre-process the output posts data:
        # count the view query string
        $d_format = $input->get('date_format');
        $n_format = $input->get('number_format');
        foreach ( $data as $key => $val ) {
            //format timestamp
            if ( $d_format != null ) {
                $val['created_time']   = date($d_format, $val['created_at']);
                $val['readed_time'] = date($d_format, $val['readed_at']);
            }

            // Json decode
            if ( $loadJson ) {
                $val['alert_value'] = json_decode($val['alert_value_json'], true);
            }

            if ( $n_format ) {
                switch($val['alert_type']) {
                case ALERT_TYPE_OUTGOING_BD:
                case ALERT_TYPE_INCOMING_BD:
                    $val['alert_value_str'] = bytes_to_string($val['alert_value'][1], 2);
                    break;
                case ALERT_TYPE_RAM:
                case ALERT_TYPE_DISK:
                    $val['alert_value_str'] = ($val['alert_value'][1] * 100).'%';
                    break;
                default:
                    $val['alert_value_str'] = $val['alert_value'][1];
                }
            }

            $val['alert_type_str'] = self::$alertTypeStr[$val['alert_type']];

            /* check and append the node information */
            if ( $load_node == true) {
                $node_id = $val['node_id'];
                if ( isset($nodeIdx["{$node_id}"]) ) {
                    $node = $nodeIdx["{$node_id}"];
                    $node['v_qstr']  = build_std_tias(
                        'node.list', $node['Id'], $node['created_at']
                    );
                    $val['node'] = $node;
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

        $data = $model->openFragment()
            ->startSepRaw()->get(self::$_FIELDS, $where);
        if ( $data == false ) {
            return false;
        }

        if ( ($d_format = $input->get('date_format')) != null ) {
            $data['created_time'] = date($d_format, $data['created_at']);
            $data['updated_time'] = date($d_format, $data['updated_at']);
            $data['readed_time']  = date($d_format, $data['readed_at']);
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

        // user_id check and auto append
        $user_id = $input->get('user_id');
        if ( $user_id != false ) {
            $_where['user_id'] = "={$user_id}";
        }

        return $_where;
    }

}
