<?php
/**
 * NodeContent service class for Node content handler
 *
 * 
*/

import('service.ContentService', false);

class NodeContentService extends ContentService
{

    public function __construct()
    {
        $this->dataModel   = 'NodeSharding';
        $this->indexModel  = 'NodeSharding';
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
        $fields = array(
            'Id', 'node_uid', 'name', 'sarah_ver',
            'sarah_interval', 'cpu_cores', 'ram_kb', 'disk_kb',
            'ip_addr', 'created_at', 's_updated_at'
        );

        if ( ($load_stat = $input->get('load_stat')) ) {
            $fields = array_merge($fields, array(
                'status', 'load_avg', 'ram_utilization', 'disk_utilization',
                'incoming_bd', 'outgoing_bd', 'updated_at'
            ));
        }

        $load_ps = $input->get('load_ps', false);
        if ( ($load_json = $input->get('load_json')) ) {
            $fields[] = 'stat_json';
        }

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

        # pre-process the output posts data:
        # count the view query string
        $cur_time  = time();
        $d_format  = $input->get('date_format');
        $c_percent = $input->get('cal_percent');
        $b_convert = $input->get('byte_convert');
        foreach ( $data as $key => $val ) {
            //format timestamp
            if ( $d_format != null ) {
                $val['created_time']   = date($d_format, $val['created_at']);
                $val['s_updated_time'] = date($d_format, $val['s_updated_at']);
                if ( isset($val['updated_at']) ) {
                    $val['updated_time'] = date($d_format, $val['updated_at']);
                }
            }

            if ( $load_json ) {
                if ( strlen($val['stat_json']) < 2 ) {
                    $val['stat_json'] = null;
                } else {
                    $val['stat_json'] = json_decode($val['stat_json'], true);
                    if ( $load_ps == false ) {
                        unset($val['stat_json']['process']);
                    }
                }
            }

            if ( $c_percent ) {
                $val['ram_percent']  = ($val['ram_utilization']  * 100);
                $val['disk_percent'] = ($val['disk_utilization'] * 100);
            }

            if ( $b_convert ) {
                $val['ram_str']  = bytes_to_string($val['ram_kb'] * 1024);
                $val['disk_str'] = bytes_to_string($val['disk_kb'] * 1024);
            }

            /* node status define */
            node_status_define($val);
            $val['v_qstr']  = build_std_tias(
                'node.list', $val['Id'], $val['created_at']
            );

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
            'Id', 'node_uid', 'name', 'sarah_ver', 'sarah_interval', 
            'cpu_cores', 'ram_kb', 'disk_kb', 'ip_addr', 'created_at', 
            's_updated_at'
        );

        if ( ($load_stat = $input->get('load_stat')) ) {
            $fields = array_merge($fields, array(
                'status', 'load_avg', 'ram_utilization', 'disk_utilization',
                'incoming_bd', 'outgoing_bd', 'updated_at'
            ));
        }

        $load_ps = $input->get('load_ps');
        if ( ($load_json = $input->get('load_json')) ) {
            $fields[] = 'stat_json';
        }

        $data = $model->openFragment()
            ->startSepRaw()->get($fields, $where);
        if ( $data == false ) {
            return false;
        }

        if ( $load_json ) {
            if ( strlen($data['stat_json']) > 2 ) {
                $data['stat_json'] = json_decode($data['stat_json'], true);
                if ( $load_ps == false ) {
                    unset($data['stat_json']['process']);
                }
            } else {
                $data['stat_json'] = null;
            }
        }

        if ( $input->get('byte_convert') ) {
            $data['ram_str']  = bytes_to_string($data['ram_kb'] * 1024);
            $data['disk_str'] = bytes_to_string($data['disk_kb'] * 1024);
        }

        if ( $load_stat && $input->get('cal_percent') ) {
            $data['ram_percent']  = ($data['ram_utilization']  * 100);
            $data['disk_percent'] = ($data['disk_utilization'] * 100);
        }

        if ( ($d_format = $input->get('date_format')) != null ) {
            $data['created_time'] = date($d_format, $data['created_at']);
            $data['s_updated_time'] = date($d_format, $data['s_updated_at']);
            if ( isset($data['updated_at']) ) {
                $data['updated_time'] = date($d_format, $data['updated_at']);
            }
        }

        /* node status define */
        node_status_define($val);
        $data['v_qstr']  = build_std_tias(
            'node.list', $data['Id'], $data['created_at']
        );

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
