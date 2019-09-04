<?php
/**
 * Application node API controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class NodeController extends Session_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        return null;
    }

    /*
     * Application node statistics interface
     * to get how much nodes that are still 
     * not install the specified application yet ...
    */
    public function actionStat($input)
    {
        assert_std_tias($input, 'app.list', $app_id);

        # get the total number of the nodes of the specified user
        $node_all_count = model('NodeSharding')
            ->getShardingModelFromValue($this->user_id)
            ->totals(array('user_id' => "={$this->user_id}"));

        # get the total number of nodes that has install the specified app
        $node_ins_count = model('ApplicationNodeSharding')
            ->getShardingModelFromValue($app_id)
            ->totals(array('app_id' => "={$app_id}", 'user_id' => "={$this->user_id}"));

        # get the total number of nodes that it not running
        $node_run_count = 0;
        // $node_run_count = model('ApplicationNodeSharding')
        //     ->getShardingModelFromValue($app_id)
        //     ->totals(array('app_id' => "={$app_id}", 
        //         'user_id' => "={$this->user_id}", 'status' => '=3'));

        return json_view(STATUS_OK, array(
            'all_count' => intval($node_all_count),
            'ins_count' => intval($node_ins_count),
            'run_count' => intval($node_run_count)
        ));
    }


    /**
     * application node status refresh interface
    */
    public function actionStatRef($input)
    {
        assert_std_tias($input, 'app.list', $app_id);
        $id_str = $input->post('id_str', array('/^[0-9,]{19,}$/'));
        if ( $id_str == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $parts = explode(',', $id_str);
        if ( count($parts) < 1 ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $id_sets  = array();
        $max_rows = 15;
        foreach ( $parts as $p ) {
            if ( strlen($p) < 19 ) {
                continue;
            }

            if ( count($id_sets) > $max_rows ) {
                break;
            }

            $id_sets[] = intval($p);
        }

        if ( empty($id_sets) ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        // do the query
        $idstr = implode(',', $id_sets);
        $model = model('ApplicationNodeSharding')->getShardingModelFromValue($app_id);
        $ret = $model->getList(
            array(
                'node_id', 'user_id', 'status', 'progress', 
                'pid', 'stat_json', 'updated_at'
            ),
            array('app_id' => "={$app_id}", 'node_id' => "in({$idstr})")
        );
        if ( $ret == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty Sets');
        }

        $c_time = time();
        $data = array();
        foreach ( $ret as $val ) {
            # ignore the illegal query record
            if ( $val['user_id'] != $this->user_id ) {
                continue;
            }

            $updated_at = intval($val['updated_at']);
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
            $data[] = $val;
        }

        return json_view(STATUS_OK, $data);
    }

}
