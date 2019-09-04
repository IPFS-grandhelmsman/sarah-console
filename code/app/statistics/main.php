<?php
/**
 * Statistics controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------
 
class StatisticsController extends Session_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionStatistics($input);
    }

    public function actionStatistics($input)
    {
        $cacher = helper('MainCache')->load('NodeStatistics', 'sum_data');
        if ( ($cc = $cacher->get()) == false 
            || ($node_stat = json_decode($cc, true)) == NULL ) {
            // 1, get the node number
            $node_num = model('NodeSharding')
                ->getShardingModelFromValue($this->user_id)->totals();

            // 2, sum the cpu_cores, ram_kb, disk_kb
            $size_stat = service('node.statistics.size', array(
                'user_id' => $this->user_id
            ));
            if ( $size_stat == false ) {
                $size_stat = array(
                    'cpu_cores' => 0,
                    'ram_kb'    => 0,
                    'disk_kb'   => 0
                );
            }

            // 3, get the used statistics
            $used_stat = service('node.statistics.used', array(
                'user_id' => $this->user_id
            ));
            if ( $used_stat == false ) {
                $used_stat = array(
                    'load_avg'    => 0,
                    'outgoing_bd' => 0,
                    'incoming_db' => 0
                );
            }

            $node_stat = array_merge($size_stat, $used_stat);
            $node_stat['total'] = $node_num;    // register the total number

            if ( $node_num == 0 ) {
                $node_stat['avg_cpu_cores'] = 0;
                $node_stat['ram_str']  = '0KB';
                $node_stat['disk_str'] = '0KB';
                $node_stat['avg_loadavg'] = 0.0;
            } else {
                $node_stat['avg_cpu_cores'] = sprintf(
                    "%.2f", $node_stat['cpu_cores'] / $node_num
                );

                $node_stat['ram_str']  = bytes_to_string($node_stat['ram_kb'] * 1024);
                $node_stat['disk_str'] = bytes_to_string($node_stat['disk_kb'] * 1024);
                $node_stat['avg_loadavg'] = sprintf(
                    "%.2f", $node_stat['load_avg'] / $node_num
                );
            }

            if ( $node_stat['ram_kb'] > 0 ) {
                $node_stat['ram_used_str'] = bytes_to_string(
                    $node_stat['ram_used_kb'] * 1024);
                $node_stat['ram_used_percent'] = sprintf(
                    "%.3f", $node_stat['ram_used_kb'] / $node_stat['ram_kb']
                );
            } else {
                $node_stat['ram_used_str'] = '0KB';
                $node_stat['ram_used_percent'] = '0KB';
            }

            if ( $node_stat['disk_kb'] > 0 ) {
                $node_stat['disk_used_str'] = bytes_to_string(
                    $node_stat['disk_used_kb'] * 1024);
                $node_stat['disk_used_percent'] = sprintf(
                    "%.3f", $node_stat['disk_used_kb'] / $node_stat['disk_kb']
                );
            } else {
                $node_stat['disk_used_str'] = '0KB';
                $node_stat['disk_used_percent'] = '0KB';
            }

            $node_stat['incoming_db_str'] = bytes_to_string($node_stat['incoming_db']);
            $node_stat['outgoing_bd_str'] = bytes_to_string($node_stat['outgoing_bd']);

            $node_stat['updated_at']   = time();
            $node_stat['updated_time'] = date('Y/m/d H:i', $node_stat['updated_at']);
            $cacher->set(json_encode($node_stat));
        }

        return view("{$this->skin}/node-statistics.html", array(
            'stat' => $node_stat
        ));
    }

}
