<?php
/**
 * Scene CorpusContent service class for corpus content handler
 *
 * 
*/

import('service.ContentService', false);

class AlertSettingService extends ContentService
{

    private static $_FIELDS = array("user_id", "open_alert", "alert_interval", "alert_mask", "alert_item_config", "alert_text_tpl", "updated_at");

    public function __construct()
    {
        $this->dataModel   = 'AlertSetting';
        $this->indexModel  = 'AlertSetting';
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
        $json_decode = $input->get('json_decode', false);
        foreach ( $data as $key => $val ) {
            //format timestamp
            if ( $d_format != null ) {
                $val['updated_time'] = date($d_format, $val['updated_time']);
            }
            // json string decode
            if ($json_decode) {
                $val['itemConfig'] = json_decode($val['alert_item_config'], true);
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
            $data['updated_time'] = date($d_format, $data['updated_at']);
        }
        if ($input->get('json_decode', false)) {
            $data['itemConfig'] = json_decode($data['alert_item_config'], true);
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
