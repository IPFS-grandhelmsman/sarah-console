<?php
/**
 * StorageIpfsContent service class for ipfs storage content handler
 *
 * 
*/

import('service.ContentService', false);

class StorageIpfsContentService extends ContentService
{

    public function __construct()
    {
        $this->dataModel  = 'IpfsFilesSharding';
        $this->indexModel = 'IpfsFilesSharding';
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
            'Id', 'pid', 'file', 'size', 'hash', 'mimetype', 'created_at'
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

        # pre-process the output posts data:
        # count the view query string
        $cur_time = time();
        $d_format = $input->get('date_format');
        $t_format = $input->get('type_format');
        $byte_convert = $input->get('byte_convert');
        foreach ( $data as $key => $val ) {
            //format timestamp
            if ( $d_format != null ) {
                $val['created_time'] = date($d_format, $val['created_at']);
            }

            if ( $t_format == true ) {
                if ( ($idx = strpos($val['mimetype'], '/')) === FALSE ) {
                    $val['top_type'] = null;
                } else {
                    $val['top_type'] = substr($val['mimetype'], 0, $idx);
                }

                $val['cls_type'] = str_replace(array('/', '.'), '_', $val['mimetype']);
            }

            if ( $byte_convert == true ) {
                $val['size_str'] = bytes_to_string(intval($val['size']), 1);
            }

            $val['v_qstr'] = build_std_tias(
                'storage.ipfs.list', $val['Id'], $val['created_at']
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
            'Id', 'user_id', 'pid', 'file', 'size', 'hash', 
            'mimetype', 'created_at', 'updated_at'
        );

        $data = $model->openFragment()->startSepRaw()->get($fields, $where);
        if ( $data == false ) {
            return false;
        }

        if ( ($d_format = $input->get('date_format')) != null ) {
            $data['created_time'] = date($d_format, $data['created_at']);
            $data['updated_time'] = date($d_format, $data['updated_at']);
        }

        $data['v_qstr'] = build_std_tias(
            'storage.ipfs.list', $data['Id'], $data['created_at']
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

        $pid = $input->get('pid');
        if ( $pid >= 0 ) {
            $_where['pid'] = "={$pid}";
        }

        return $_where;
    }

}
