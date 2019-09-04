<?php
/**
 * Node controller
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
        $c_time   = time();
        $pageno   = $input->getInt('pageno', 1);
        $pagesize = 10;

        # invoke the service to scroll the data sets
        # @see service.node.content#list
        $ret = service('node.content.paging', array(
            'user_id'      => $this->user_id,
            'load_stat'    => true,
            'cal_percent'  => true,
            'byte_convert' => true,
            'pagesize'     => $pagesize,
            'pageno'       => $pageno,
            'order_by'     => 'created_at',
            'sort_by'      => 'desc'
        ));

        if ( $ret == false ) {
            $ret = array();
        }

        // pre-process the output data
        $data = array();
        foreach ( $ret as $val ) {
            // system load average state define
            if ( $val['load_avg'] >= $val['cpu_cores'] * 0.7 ) {
                $val['load_state'] = 'urgent';
            } else if ( $val['load_avg'] >= $val['cpu_cores'] * 0.45 ) {
                $val['load_state'] = 'warning';
            } else {
                $val['load_state'] = 'normal';
            }

            // RAM state define
            if ( $val['ram_percent'] > 90 ) {
                $val['ram_state'] = 'urgent';
            } else if ( $val['ram_percent'] > 60 ) {
                $val['ram_state'] = 'warning';
            } else {
                $val['ram_state'] = 'normal';
            }

            // DISK state define
            if ( $val['disk_percent'] > 80 ) {
                $val['disk_state'] = 'urgent';
            } else if ( $val['disk_percent'] > 60 ) {
                $val['disk_state'] = 'warning';
            } else {
                $val['disk_state'] = 'normal';
            }

            $data[] = $val;
        }

        view_paging_register(
            model('NodeSharding')->totals(
                array('user_id' => "={$this->user_id}")
            ), 
            $pagesize, 
            $pageno
        );
        return view("{$this->skin}/node-list.html", array(
            'data' => $data
        ));
    }

    public function actionView($input)
    {
        assert_std_tias($input, 'node.list', $node_id);

        // get the node information
        $node = service('node.content.view', array(
            'user_id'      => $this->user_id,
            'id'           => $node_id,
            'load_json'    => true,
            'byte_convert' => true,
            'date_format'  => 'Y/m/d H:i'
        ));

        // hardware information list
        $node['_hd_bios'] = $node['stat_json']['hd_bios'];
        $node['_hd_bios']['run_size_str'] = bytes_to_string($node['_hd_bios']['run_size']);
        $node['_hd_bios']['rom_size_str'] = bytes_to_string($node['_hd_bios']['rom_size']);

        $node['_hd_sys'] = $node['stat_json']['hd_sys'];
        $node['_hd_board'] = $node['stat_json']['hd_board'];

        // CPU details list
        $cpu_list = array();
        foreach ( $node['stat_json']['cpu']['list'] as $cpu ) {
            $cpu_list[] = array(
                'core_id'    => $cpu['core_id'],
                'model_name' => $cpu['model_name'],
                'mhz'        => sprintf("%.2f", $cpu['mhz']),
                'cache'      => $cpu['cache_size']
            );
        }
        $node['_cpu_list'] = $cpu_list;

        // DISK details list
        $disk_list = array();
        // foreach ( $node['stat_json']['disk'] as $disk ) {
        //     $disk_list[] = array(
        //         'name'     => $disk['name'],
        //         'type'     => $disk['type'],
        //         'size'     => $disk['size'],
        //         'size_str' => bytes_to_string($disk['size'] * 1024),
        //         'used'     => $disk['used'],
        //         'used_str' => bytes_to_string($disk['used'] * 1024)
        //     );
        // }
        foreach ( $node['stat_json']['disk'] as $disk ) {
            $wwn = $disk['wwn'];
            if ( $disk['pt_no'] == -1 || $disk['pt_no'] == 0 ) {
                $disk['used']       = $disk['size'] - $disk['free'];
                $disk['size_str']   = bytes_to_string($disk['size']);
                $disk['used_str']   = bytes_to_string($disk['used']);
                $disk['p_size_str'] = bytes_to_string($disk['p_size']);
                if ( $disk['size'] == 0 ) {
                    $disk['used_percent'] = 0.00;
                } else {
                    $disk['used_percent'] = number_format(
                        ($disk['used'] / $disk['size']) * 100, 2, '.', ''
                    );
                }

                $disk_list[$wwn] = array(
                    'wwn'        => $wwn,
                    'serial_no'  => $disk['serial_no'],
                    'model'      => $disk['model'],
                    'p_size'     => $disk['p_size'],
                    'p_size_str' => $disk['p_size_str'],
                    'part_num'   => 1,
                    'partitions' => array($disk)
                );
            }
        }

        foreach ( $node['stat_json']['disk'] as $disk ) {
            $wwn = $disk['wwn'];
            if ( $disk['pt_no'] == -1 || $disk['pt_no'] == 0 ) {   // ignore the disk device
                continue;
            }

            $disk['used']       = $disk['size'] - $disk['free'];
            $disk['size_str']   = bytes_to_string($disk['size']);
            $disk['used_str']   = bytes_to_string($disk['used']);
            $disk['p_size_str'] = bytes_to_string($disk['p_size']);
            if ( $disk['size'] == 0 ) {
                $disk['used_percent'] = 0.00;
            } else {
                $disk['used_percent'] = number_format(
                    ($disk['used'] / $disk['size']) * 100, 2, '.', ''
                );
            }

            if ( $disk_list[$wwn]['part_num'] == 1 ) {
                array_shift($disk_list[$wwn]['partitions']);
            }

            $disk_list[$wwn]['part_num']++;
            $disk_list[$wwn]['partitions'][] = $disk;
        }
        $node['_disk_list'] = $disk_list;

        // Network details list
        $network_list = array();
        foreach ( $node['stat_json']['network'] as $network ) {
            $network_list[] = array(
                'name'         => $network['name'],
                'hd_addr'      => $network['hd_addr'],
                'receive'      => $network['round_2']['receive'],
                'receive_str'  => bytes_to_string($network['round_2']['receive']),
                'r_packets'    => $network['round_2']['r_packets'],
                'transmit'     => $network['round_2']['transmit'],
                'transmit_str' => bytes_to_string($network['round_2']['transmit']),
                't_packets'    => $network['round_2']['t_packets'],
            );
        }
        $node['_network_list'] = $network_list;

        $node['ipaddr_str'] = long2ip($node['ip_addr']);
        return view("{$this->skin}/node-view.html", array(
            'node' => $node
        ));
    }

    public function actionMonitor($input)
    {
        assert_std_tias($input, 'node.list', $node_id);

        // get the node information
        $node = service('node.content.view', array(
            'user_id'      => $this->user_id,
            'id'           => $node_id,
            'load_stat'    => true,
            'load_json'    => true,
            'cal_percent'  => true,
            'byte_convert' => true,
            'date_format'  => 'Y/m/d H:i'
        ));

        // system load average state define
        if ( $node['load_avg'] >= $node['cpu_cores'] * 0.7 ) {
            $node['load_state'] = 'urgent';
        } else if ( $node['load_avg'] >= $node['cpu_cores'] * 0.45 ) {
            $node['load_state'] = 'warning';
        } else {
            $node['load_state'] = 'normal';
        }

        // RAM state define
        if ( $node['ram_percent'] > 90 ) {
            $node['ram_state'] = 'urgent';
        } else if ( $node['ram_percent'] > 60 ) {
            $node['ram_state'] = 'warning';
        } else {
            $node['ram_state'] = 'normal';
        }

        // DISK state define
        if ( $node['disk_percent'] > 80 ) {
            $node['disk_state'] = 'urgent';
        } else if ( $node['disk_percent'] > 60 ) {
            $node['disk_state'] = 'warning';
        } else {
            $node['disk_state'] = 'normal';
        }


        $node['ipaddr_str']   = long2ip($node['ip_addr']);
        $node['ram_used_str'] = bytes_to_string(
            $node['ram_kb'] * $node['ram_utilization'] * 1024
        );
        $node['disk_used_str'] = bytes_to_string(
            $node['disk_kb'] * $node['disk_utilization'] * 1024
        );

        $node['incoming_bd_str'] = bytes_to_string($node['incoming_bd']);
        $node['outgoing_bd_str'] = bytes_to_string($node['outgoing_bd']);
        $node['bootat_time'] = 0;
        if ( isset($node['stat_json']['node']) ) {
            $node['bootat_time'] = date('Y/m/d H:i', $node['stat_json']['node']['last_boot_at']);
        }

        if ( isset($node['stat_json']['cpu']['stat']['sys_loadavg']) ) {
            $sys_load_avg = $node['stat_json']['cpu']['stat']['sys_loadavg'];
            $node['load_avg_str'] = implode(', ', array(
                sprintf("%.2f", $sys_load_avg['t_1m']), 
                sprintf("%.2f", $sys_load_avg['t_5m']), 
                sprintf("%.2f", $sys_load_avg['t_15m'])
            ));
        } else {
            $node['load_avg_str'] = $node['load_avg'];
        }

        return view("{$this->skin}/node-monitor.html", array(
            'node' => $node
        ));
    }

    public function actionManage($input)
    {
        assert_std_tias($input, 'node.list', $node_id);

        $nodePostSharding = model('NodePostSharding')->startSepRaw();
        $list = $nodePostSharding->getList(
            array(
                'load_avg', 'ram_utilization', 'disk_utilization',
                'incoming_bd', 'outgoing_bd', 'stat_json', 'created_at'
            ),
            array(
                'node_id' => "={$node_id}"
            ),
            array('created_at' => 'desc'),
            array(0, 1)
        );

        $node = array();
        if ( $list == false ) {
            $node['node_uid'] = $input->get('node_uid');
        } else {
            $node = $list[0];
            $stat = json_decode($node['stat_json'], true);
            unset($node['stat_json']);

            $process = array();
            $cpu_percent = array();
            $mem_percent = array();
            foreach ( $stat['process'] as $key => $ps ) {
                $ps['cpu']  = sprintf("%.2f", $ps['cpu']);
                $ps['mem']  = sprintf("%.2f", $ps['mem']);
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

            $node['system']   = $stat['system'];
            $node['process']  = $process;
            $node['node_uid'] = $stat['node']['id'];
        }

        return view("{$this->skin}/node-manage.html", array(
            'node'    => $node,
            'app_key' => $this->app_key,
            'v_qstr'  => $input->server('QUERY_STRING')
        ));
    }

}
