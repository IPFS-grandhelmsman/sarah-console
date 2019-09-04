<?php
/**
 * ApplicationTaskContent service class for application task content handler
 *
 * 
*/

import('service.ContentService', false);

class ApplicationTaskContentService extends ContentService
{

    public function __construct()
    {
        $this->dataModel   = 'ApplicationTaskSharding';
        $this->indexModel  = 'ApplicationTaskSharding';
    }

    /**
     * data model fetch override
    */
    public function get_data_model($dataModel, $input)
    {
        if ( $this->_dataModelObj != null ) {
            return $this->_dataModelObj;
        }

        $app_id = $input->get('app_id');
        if ( $app_id == null ) {
            throw new Exception("Missing mapping field");
        }

        $this->_dataModelObj = model($dataModel)->getShardingModelFromValue($app_id);
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
            'Id', 'opt_type', 'name', 'status', 'dist_type', 
            'distribute_num', 'completed_num', 'created_at'
        );

        if ( ($load_stat = $input->get('load_intro')) ) {
            $fields[] = 'intro';
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
        $cur_time    = time();
        $d_format    = $input->get('date_format');
        $cal_percent = $input->get('cal_percent');
        foreach ( $data as $key => $val ) {
            //format timestamp
            if ( $d_format != null ) {
                $val['created_time'] = date($d_format, $val['created_at']);
            }

            // status override
            if ( $val['status'] != 2 && $val['distribute_num'] > 0 
                && $val['distribute_num'] == $val['completed_num'] ) {
                $val['status'] = 2;
            }

            if ( $cal_percent === true ) {
                if ( $val['status'] == 2 ) {
                    $val['complete_percent'] = 1.00;
                } else if ( $val['distribute_num'] == '0' ) {
                    $val['complete_percent'] = 0.00;
                } else {
                    $val['complete_percent'] = number_format(
                        $val['completed_num'] / $val['distribute_num'],
                        2, '.', ''
                    );
                }
            }

            $val['v_qstr'] = build_std_tias(
                'apptask.list', $val['Id'], $val['created_at']
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
            'Id', 'user_id', 'opt_type', 'name', 'intro', 'status', 
            'dist_type', 'distribute_num', 'completed_num', 
            'created_at', 'started_at', 'done_at'
        );

        $data = $model->openFragment()->startSepRaw()->get($fields, $where);
        if ( $data == false ) {
            return false;
        }

        if ( ($d_format = $input->get('date_format')) != null ) {
            $data['created_time'] = date($d_format, $data['created_at']);
            $data['started_time'] = date($d_format, $data['started_at']);
            $data['done_time']    = date($d_format, $data['done_at']);
        }

        if ( $data['status'] != 2 && $data['distribute_num'] > 0 
            && $data['distribute_num'] == $data['completed_num'] ) {
            $data['status'] = 2;
        }

        if ( $input->get('cal_percent') === true ) {
            if ( $val['status'] == 2 ) {
                $val['complete_percent'] = 1.00;
            } else if ( $data['distribute_num'] == 0 ) {
                $data['complete_percent'] = 0.00;
            } else {
                $data['complete_percent'] = number_format(
                    $data['completed_num'] / $data['distribute_num'],
                    2, '.', ''
                );
            }
        }

        $data['v_qstr'] = build_std_tias(
            'apptask.list', $data['Id'], $data['created_at']
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

        // app_id & user_id check and auto append
        $app_id = $input->get('app_id');
        if ( $app_id != false ) {
            $_where['app_id'] = "={$app_id}";
        }

        $user_id = $input->get('user_id');
        if ( $user_id != false ) {
            $_where['user_id'] = "={$user_id}";
        }

        return $_where;
    }

}
