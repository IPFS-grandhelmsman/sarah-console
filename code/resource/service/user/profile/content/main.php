<?php
/**
 * UserProfile content service class for corpus content handler
 *
 * 
*/

import('service.ContentService', false);

class UserProfileContentService extends ContentService
{

    public function __construct()
    {
        $this->dataModel   = 'UserProfile';
        $this->indexModel  = 'UserProfile';
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
            'user_id', 'app_key', 'skin_name', 'product_name', '_updated_at'
        );

        $data = $model->startSepRaw()->getList(
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
                $val['_updated_time'] = date($d_format, $val['_updated_at']);
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
            'user_id', 'app_key', 'skin_name', 'product_name', '_updated_at'
        );

        $data = $model->startSepRaw()->get($fields, $where);
        if ( $data == false ) {
            return false;
        }

        if ( ($d_format = $input->get('date_format')) != null ) {
            $data['_updated_time'] = date($d_format, $data['_updated_at']);
        }

        // $data['v_qstr'] = build_std_tias(
        //     'user.info', $data['user_id'], $data['created_at']
        // );

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
        return array();
    }

}
