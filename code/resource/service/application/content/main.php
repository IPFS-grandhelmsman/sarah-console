<?php
/**
 * ApplicationContent service class for 
 *  application content handler
 *
 * 
*/

import('service.ContentService', false);

class ApplicationContentService extends ContentService
{

    public function __construct()
    {
        $this->dataModel  = 'Application';
        $this->indexModel = 'Application';
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
            'Id', 'name', 'icon_url', 'config_json', 'created_at', 'updated_at'
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

        /* Check and load the biz status */
        $user_id = $input->get('user_id');
        $load_status = $input->get('load_status');
        if ( $user_id != null && $load_status == true ) {
            import('Util');
            $idstr  = Util::implode($data, 'Id', ',');
            $userApps = model('UserApplicationSharding')->getList(
                array('Id', 'app_id', 'created_at'),
                array('user_id' => "={$user_id}", 'app_id' => "in({$idstr})")
            );
            $usrAppIdx = Util::makeIndex($userApps, 'app_id', false);
        }

        # pre-process the output posts data:
        # count the view query string
        $d_format    = $input->get('date_format');
        $json_decode = $input->get('json_decode');
        foreach ( $data as $key => $val ) {
            $app_id = $val['Id'];
            // format timestamp
            if ( $d_format != null ) {
                $val['created_time'] = date($d_format, $val['created_at']);
                $val['updated_time'] = date($d_format, $val['updated_at']);
            }

            if ( $json_decode === true ) {
                $val['config_json'] = json_decode($val['config_json'], true);
            }

            if ( $load_status == true ) {
                $val['installed'] = isset($usrAppIdx[$app_id]) ? true : false;
            }

            $val['v_qstr']  = build_std_tias(
                'app.list', $app_id, $val['created_at']
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
            'Id', 'name', 'intro', 'icon_url', 
            'config_json', 'created_at', 'updated_at'
        );

        $data = $model->openFragment()->startSepRaw()->get($fields, $where);
        if ( $data == false ) {
            return false;
        }

        /* check and load the user install status */
        $user_id = $input->get('user_id');
        if ( $user_id != null 
            && ($load_status = $input->get('load_status')) == true ) {
            $userApp = model('UserApplicationSharding')->get(
                array('created_at'), 
                array(
                    'user_id' => "={$user_id}",
                    'app_id'  => $where[$model->getPrimaryKey()]
                )
            );

            $data['installed'] = $userApp == false ? false : true;
        }

        if ( ($d_format = $input->get('date_format')) != null ) {
            $data['created_time'] = date($d_format, $data['created_at']);
            $data['updated_time'] = date($d_format, $data['updated_at']);
        }

        if ( ($json_decode = $input->get('json_decode')) === true ) {
            $data['config_json'] = json_decode($data['config_json'], true);
        }

        $data['v_qstr'] = build_std_tias(
            'app.list', $data['Id'], $data['created_at']
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
        return array();
    }

}
