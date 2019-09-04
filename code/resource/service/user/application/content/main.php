<?php
/**
 * UserApplicationContent service class for 
 *  user application content handler
 *
 * 
*/

import('service.ContentService', false);

class UserApplicationContentService extends ContentService
{

    public function __construct()
    {
        $this->dataModel  = 'UserApplicationSharding';
        $this->indexModel = 'UserApplicationSharding';
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
            'Id', 'user_id', 'app_id', 'created_at'
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

        if ( ($load_app = $input->get('load_app')) == true ) {
            import('Util');
            $idstr = Util::implode($data, 'app_id', ',', false);
            $apps  = model('Application')->getList(
                array('Id', 'name', 'icon_url', 'created_at'),
                array('Id' => "in({$idstr})")
            );
            $appIdx = Util::makeIndex($apps, 'Id', true);
            unset($apps);
        }

        # pre-process the output posts data:
        # count the view query string
        $d_format = $input->get('date_format');
        foreach ( $data as $key => $val ) {
            //format timestamp
            if ( $d_format != null ) {
                $val['created_time'] = date($d_format, $val['created_at']);
            }

            if ( $load_app == true ) {
                $app_id = $val['app_id'];
                if ( isset($appIdx["{$app_id}"]) ) {
                    $app = $appIdx["{$app_id}"];
                    $app['v_qstr']  = build_std_tias(
                        'app.list', $app['Id'], $app['created_at']
                    );
                    $val['app'] = $app;
                } else {
                    $val['app'] = null;
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
            'Id', 'user_id', 'app_id', 'config_json', 'created_at', 'updated_at'
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

        // user_id check and auto append
        $user_id = $input->get('user_id');
        if ( $user_id != false ) {
            $_where['user_id'] = "={$user_id}";
        }

        return $_where;
    }

}
