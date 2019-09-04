<?php
/**
 * Scene CorpusContent service class for corpus content handler
 *
 * 
*/

import('service.ContentService', false);

class AlertReceiverService extends ContentService
{

    private static $_FIELDS = array("Id", "user_id", "name", "mobile", "email", "wx_openid", "created_at", "updated_at");

    public function __construct()
    {
        $this->dataModel   = 'AlertReceiver';
        $this->indexModel  = 'AlertReceiver';
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

        $this->_dataModelObj = model($dataModel);
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
        $fields = self::$_FIELDS;

        $data = $model->openFragment()
            ->startSepRaw()->getList(
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
        $d_format  = $input->get('date_format');
        foreach ( $data as $key => $val ) {
            //format timestamp
            if ( $d_format != null ) {
                $val['created_time']   = date($d_format, $val['created_at']);
                if ( isset($val['updated_at']) ) {
                    $val['updated_time'] = date($d_format, $val['updated_at']);
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
        $fields = self::$_FIELDS;

        $data = $model->openFragment()
            ->startSepRaw()->get($fields, $where);
        if ( $data == false ) {
            return false;
        }

        if ( ($d_format = $input->get('date_format')) != null ) {
            $data['created_time'] = date($d_format, $data['created_at']);
            $data['updated_time'] = date($d_format, $data['updated_time']);
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
