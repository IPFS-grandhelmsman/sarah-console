<?php
/**
 * Node post controller
 * 
 * 
*/

 //------------------------------------------------------
 
class PostController extends C_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        assert_std_tias($input, 'node.list', $node_id);

        $nodePostSharding = model('NodePostSharding')->startSepRaw();
        $list = $nodePostSharding->getList(
            array(
                'load_avg', 'ram_utilization', 'disk_utilization',
                'incoming_bd', 'outgoing_bd', 'created_at'
            ),
            array(
                'node_id' => "={$node_id}"
            ),
            array('created_at' => 'desc'),
            array(0, 20)
        );

        if ( $list == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty sets');
        }

        // make the X Axis
        $r_data = array();
        $x_axis = array();
        if ( ($last = end($list)) != false ) {
            $r_data[] = $last;
            $x_axis[] = date('H:i:s', $last['created_at']);
            while ( ($last = prev($list)) != FALSE ) {
                $r_data[] = $last;
                $x_axis[] = date('H:i:s', $last['created_at']);
            }
        }

        return json_view(STATUS_OK, array(
            '_list'  => $r_data,
            'x_axis' => $x_axis
        ));
    }

    public function actionFresh($input)
    {
        assert_std_tias($input, 'node.list', $node_id);

        $last_created_at = $input->getInt('last_created_at');
        if ( $last_created_at == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $list = model('NodePostSharding')->startSepRaw()->getList(
            array(
                'load_avg', 'ram_utilization', 'disk_utilization',
                'incoming_bd', 'outgoing_bd', 'stat_json', 'created_at'
            ),
            array(
                'node_id' => "={$node_id}",
                'created_at' => ">{$last_created_at}"
            ),
            array('created_at' => 'asc'),
            array(0, 20)
        );

        if ( $list == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty sets');
        }

        // make the X Axis
        $x_axis = array();
        $x_last = null;
        if ( ($last = end($list)) != false ) {
            $x_last = $last;
            $x_axis[] = date('H:i:s', $last['created_at']);
            while ( ($last = prev($list)) != FALSE ) {
                $x_axis[] = date('H:i:s', $last['created_at']);
            }
        }

        $_stat = array();
        if ( ($json = json_decode($x_last['stat_json'])) != null ) {
            $load_avg = $x_last['load_avg'];
            $sys_loadavg = $json->cpu->stat->sys_loadavg;
            $_stat['load_avg'] = array(
                't_1m'  => sprintf("%.2f", $sys_loadavg->t_1m),
                't_5m'  => sprintf("%.2f", $sys_loadavg->t_5m),
                't_15m' => sprintf("%.2f", $sys_loadavg->t_15m)
            );

            $_cpu_cores = $json->cpu->list[0]->cores;
            if ( $load_avg >= $_cpu_cores * 0.7 ) {
                $_stat['load_state'] = 'urgent';
            } else if ( $load_avg >= $_cpu_cores * 0.45 ) {
                $_stat['load_state'] = 'warning';
            } else {
                $_stat['load_state'] = 'normal';
            }

            // get the used ram
            $ram_used = $json->ram->total - $json->ram->available;
            $_stat['ram_used'] = $ram_used;
            $_stat['ram_used_str'] = bytes_to_string($ram_used * 1024);
            $_stat['ram_percent'] = floatval($x_last['ram_utilization']) * 100;
            $_stat['ram_utilization']  = $x_last['ram_utilization'];
            if ( $_stat['ram_percent'] > 90 ) {
                $_stat['ram_state'] = 'urgent';
            } else if ( $_stat['ram_percent'] > 60 ) {
                $_stat['ram_state'] = 'warning';
            } else {
                $_stat['ram_state'] = 'normal';
            }


            // get the used disk
            $disk_used = 0;
            foreach ( $json->disk as $disk ) {
                $disk_used += ($disk->size - $disk->free);
            }
            $_stat['disk_used'] = $disk_used;
            $_stat['disk_used_str'] = bytes_to_string($disk_used * 1024);
            $_stat['disk_percent'] = floatval($x_last['disk_utilization']) * 100;
            $_stat['disk_utilization'] = $x_last['disk_utilization'];
            if ( $_stat['disk_percent'] > 80 ) {
                $_stat['disk_state'] = 'urgent';
            } else if ( $_stat['disk_percent'] > 60 ) {
                $_stat['disk_state'] = 'warning';
            } else {
                $_stat['disk_state'] = 'normal';
            }


            $_stat['incoming_bd'] = $x_last['incoming_bd'];
            $_stat['incoming_bd_str'] = bytes_to_string($x_last['incoming_bd']);
            $_stat['outgoing_bd'] = $x_last['outgoing_bd'];
            $_stat['outgoing_bd_str'] = bytes_to_string($x_last['outgoing_bd']);
            $_stat['created_at'] = $x_last['created_at'];
            $_stat['created_time'] = date('Y/m/d H:i', $x_last['created_at']);
        }

        // remove the stat_json field
        $data = array();
        foreach ( $list as $val ) {
            unset($val['stat_json']);
            $data[] = $val;
        }

        return json_view(STATUS_OK, array(
            '_list'  => $data,
            'x_axis' => $x_axis,
            '_stat'  => $_stat
        ));
    }


    /**
     * for node manage
     * mainly response the system&kernel and process information
    */
    public function actionManage($input)
    {
        assert_std_tias($input, 'node.list', $node_id);
        $last_created_at = $input->getInt('last_created_at');
        if ( $last_created_at == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $nodePostSharding = model('NodePostSharding')->startSepRaw();
        $list = $nodePostSharding->getList(
            array(
                'load_avg', 'ram_utilization', 'disk_utilization',
                'incoming_bd', 'outgoing_bd', 'stat_json', 'created_at'
            ),
            array(
                'node_id' => "={$node_id}",
                'created_at' => ">{$last_created_at}"
            ),
            array('created_at' => 'desc'),
            array(0, 1)
        );

        if ( $list == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty Sets');
        }

        $node = $list[0];
        $stat = json_decode($node['stat_json'], true);
        unset($node['stat_json']);

        $last_sync_diff = time() - $node['created_at'];
        if ( $last_sync_diff <= 60 ) {
            $node['node_state'] = 'normal';
        } else {
            $node['node_state'] = 'urgent';
        }

        $process = array();
        $cpu_percent = array();
        $mem_percent = array();
        foreach ( $stat['process'] as $key => $ps ) {
            $ps['cpu'] = sprintf("%.2f", $ps['cpu']);
            $ps['mem'] = sprintf("%.2f", $ps['mem']);
            $ps['stat'] = str_replace(
                array('<', '>'), array('&lt;', '&gt;'), $ps['stat']
            );

            $ps['cmd'] = str_replace(
                array('<', '>'), array('&lt;', '&gt;'), $ps['cmd']
            );

            $process[$key] = $ps;
            $cpu_percent[$key] = $ps['cpu'];
            $mem_percent[$key] = $ps['mem'];
        }

        // sort the process list by the CPU and memory usage
        array_multisort(
            $cpu_percent, SORT_DESC, SORT_REGULAR, 
            $mem_percent, SORT_DESC, SORT_REGULAR, 
            $process
        );

        return json_view(STATUS_OK, array(
            'node'    => $node,
            'system'  => $stat['system'],
            'process' => $process
        ));
    }

}
