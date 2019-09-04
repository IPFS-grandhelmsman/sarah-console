<?php
/**
 * ApplicationNodeContent service class for 
 *  application node content handler
 *
 * 
*/

import('service.ContentService', false);

class ApplicationNodeContentService extends ContentService
{

    public function __construct()
    {
        $this->dataModel  = 'ApplicationNodeSharding';
        $this->indexModel = 'ApplicationNodeSharding';
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
            'Id', 'node_id', 'config_json', 'status', 'progress',
            'pid', 'created_at', 'started_at', 'finished_at', 'updated_at'
        );

        // check and query the stat_json field
        if ( ($load_stat = $input->get('load_stat')) == true ) {
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
        $c_time = time();
        $d_format = $input->get('date_format');
        foreach ( $data as $key => $val ) {
            $updated_at = intval($val['updated_at']);

            //format timestamp
            if ( $d_format != null ) {
                $val['created_time']  = date($d_format, $val['created_at']);
                $val['started_time']  = date($d_format, $val['started_at']);
                $val['finished_time'] = date($d_format, $val['finished_at']);
                $val['updated_time']  = date($d_format, $updated_at);
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

            if ( $load_stat == true ) {
                if ( ($c_time - $updated_at) < NODE_DOWN_SEC_FACTOR 
                    && strlen($val['stat_json']) > 2 
                    && ($stat_json = json_decode($val['stat_json'], true)) != null ) {
                    $stat_json['cpu'] = number_format($stat_json['cpu'], 2, '.', '');
                    $stat_json['mem'] = number_format($stat_json['mem'], 2, '.', '');
                } else {
                    $stat_json = array(
                        'user'  => 'root',
                        'pid'   => 0,
                        'cpu'   => 0,
                        'mem'   => 0,
                        'vsz'   => 0,
                        'rss'   => 0,
                        'tty'   => '?',
                        'stat'  => 'T',
                        'start' => '00:00',
                        'time'  => '00:00',
                        'cmd'   => 'not started yet...'
                    );
                } 
                
                $val['stat_json'] = $stat_json;
            }

            $val['v_qstr'] = build_std_tias(
                'app.node.list', $val['Id'], $val['created_at']
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
            'Id', 'app_id', 'user_id', 'node_id', 'config_json', 'status', 'progress',
            'pid', 'created_at', 'started_at', 'finished_at', 'updated_at'
        );

        $data = $model->openFragment()->startSepRaw()->get($fields, $where);
        if ( $data == false ) {
            return false;
        }

        if ( ($d_format = $input->get('date_format')) != null ) {
            $data['created_time']  = date($d_format, $data['created_at']);
            $data['started_time']  = date($d_format, $data['started_at']);
            $data['finished_time'] = date($d_format, $data['finished_at']);
            $data['updated_time']  = date($d_format, $data['updated_at']);
        }

        $data['v_qstr']  = build_std_tias(
            'app.node.list', $data['Id'], $data['created_at']
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

        // app_id check and auto append
        $app_id  = $input->get('app_id');
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
