<?php
/**
 * Collector controller
 * 
 * 
*/

 //------------------------------------------------------

class CollectorController extends C_Controller
{    

    public function actionPost($input)
    {
        $app_key = $input->get('app_key', array('/^[a-zA-Z0-9_-]{32,56}$/'));
        $seed = $input->get('seed', array('/^[0-9]{1,12}$/'));
        $sign = $input->get('sign', array('/^[a-zA-Z0-9_-]{1,32}$/'));
        $json = get_post_raw_data();

        if ( $app_key == false || $seed == false 
            || $sign == false || $json == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $jobj = NULL;
        if ( ($jobj = json_decode($json)) == NULL ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid JSON string');
        }

        // signature checking
        if ( strncmp($sign, md5("{$seed}{$json}{$app_key}"), 32) != 0 ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid signature');
        }

        // @Note Added at 2018/12/11
        // ignore all the data coming from the old version under 1.1
        // $user_id = 1;
        assert_app_key($app_key, $user_id);
        if ( $jobj->version < 1.52 ) {
            return json_view(8, "Too old version {$jobj->version}");
        }



        // calculate the basic statistic data
        if ( isset($jobj->cpu->stat->sys_loadavg) ) {
            $load_avg = sprintf("%.3f", $jobj->cpu->stat->sys_loadavg->t_1m);
        } else {
            $load_avg = sprintf("%.3f", $jobj->cpu->stat->load_avg);
        }

        $cpu_cores = 0;
        if ( isset($jobj->cpu->list) && count($jobj->cpu->list) > 0 ) {
            // $cpu_cores = $jobj->cpu->list[0]->cores;
            $cpu_cores = count($jobj->cpu->list);
        }

        $ram_used = $jobj->ram->total - $jobj->ram->available;
        $ram_utilization = sprintf("%.3f", $ram_used / $jobj->ram->total);

        // disk size and used usage
        $disk_size = 0;
        $disk_used = 0;
        foreach ( $jobj->disk as $disk ) {
            if ( $disk->pt_no == -1 || $disk->pt_no == 0 ) {     /* Disk device */
                $disk_size += $disk->p_size;
            } else {
                $disk_used += $disk->size - $disk->free;
            }
        }

        $disk_size = ceil($disk_size / 1024);     // convert to KBytes
        $disk_used = ceil($disk_used / 1024);     // convert to KBytes

        if ( $disk_size > 0 ) {
            $disk_utilization = sprintf("%.3f", $disk_used / $disk_size);
        } else {
            $disk_utilization = 0;
        }

        // network incoming and outgoing
        $incoming_bd = 0;
        $outgoing_bd = 0;
        foreach ( $jobj->network as $network ) {
            if ( $network->name == "lo" ) {     // clear the local device
                continue;
            }

            $incoming_bd += $network->incoming;
            $outgoing_bd += $network->outgoing;
        }

        import('Util');
        $c_time  = time();
        $ip_addr = Util::getIpAddress(true);
        $_md5_p  = array(
            $jobj->version,
            $jobj->node->interval,
            $cpu_cores,
            $jobj->ram->total,
            $disk_size,
            $ip_addr
        );

        $d_sign = md5(implode('', $_md5_p));



        // 1, check and register the Node
        $node_info_update = 0;
        $nodeShardingModel = model('NodeSharding');
        // $nodeModel = model('NodeSharding')->getShardingModelFromValue($user_id);
        $node = $nodeShardingModel->get(
            array('Id', 'd_sign'), array(
                'user_id'  => "={$user_id}",
                'node_uid' => "={$jobj->node->id}"
            )
        );
        if ( $node == false ) {
            $node = array(
                'user_id'        => $user_id,
                '_user_id'       => $user_id,
                'node_uid'       => $jobj->node->id,
                'name'           => isset($jobj->system->node_name) 
                    ? $jobj->system->node_name : '0',
                '_node_uid'      => $jobj->node->id,
                'd_sign'         => $d_sign,
                'sarah_ver'      => floatval($jobj->version),
                'sarah_interval' => $jobj->node->interval,
                'cpu_cores'      => $cpu_cores,
                'ram_kb'         => $jobj->ram->total,
                'disk_kb'        => $disk_size,
                'ip_addr'        => $ip_addr,
                'created_at'     => $c_time,
                's_updated_at'   => $c_time
            );

            if ( ($node['Id'] = $nodeShardingModel->openFragment()->add($node)) == false ) {
                // @TODO: do error log here
            }
        } else if ( strncmp($node['d_sign'], $d_sign, 32) != 0 ) {
            $node_info_update = 1;
            $d = array(
                'd_sign'         => $d_sign,
                'sarah_ver'      => floatval($jobj->version),
                'sarah_interval' => $jobj->node->interval,
                'cpu_cores'      => $cpu_cores,
                'ram_kb'         => $jobj->ram->total,
                'disk_kb'        => $disk_size,
                'ip_addr'        => $ip_addr,
                's_updated_at'   => $c_time
            );

            if ( $nodeShardingModel->closeFragment()->updateById($d, $node['Id']) == false ) {
                $node_info_update = -1;
                // @TODO: do error log here
            }
        }


        // 2, Update the statistic information
        $json_unicode = json_encode($jobj);
        $node_stat_update = 0;
        if ( isset($node['Id']) && $node['Id'] != false ) {
            $d = array(
                '_node_uid'        => $jobj->node->id,
                'status'           => NODE_RUNNING,
                'load_avg'         => $load_avg,
                'ram_used_kb'      => $ram_used,
                'ram_utilization'  => $ram_utilization,
                'disk_used_kb'     => $disk_used,
                'disk_utilization' => $disk_utilization,
                'incoming_bd'      => $incoming_bd,
                'outgoing_bd'      => $outgoing_bd,
                'stat_json'        => $json_unicode,
                'updated_at'       => $c_time
            );

            $node_stat_update = 1;
            // $nodeStat = model('NodeStatistics')->startSepRaw();
            if ( $nodeShardingModel->openFragment()->updateById($d, $node['Id']) == false ) {
                $node_stat_update = -1;
                // @TODO: do error log here
            }
        }


        // 3, Store the statistic post
        $node_post_append = 0;
        if ( isset($node['Id']) && $node['Id'] != false ) {
            $d = array(
                'node_id'           => $node['Id'],
                'user_id'           => $user_id,
                'load_avg'          => $load_avg,
                'ram_utilization'   => $ram_utilization,
                'disk_utilization'  => $disk_utilization,
                'incoming_bd'       => $incoming_bd,
                'outgoing_bd'       => $outgoing_bd,
                'stat_json'         => $json_unicode,
                'created_at'        => $c_time
            );

            $node_post_append = 1;
            $nodePostSharding = model('NodePostSharding')->startSepRaw();
            if ( $nodePostSharding->add($d) == false ) {
                $node_post_append = -1;
                // @TODO: do error log here
            }
        }

        // 4, Push the record to the post list for asynchronized analysis
        if ( helper('MainPDSL')
            ->load('NodePostPool')->rpush("{$node['Id']},{$c_time}") == 0 ) {
            // @TODO: do error log here
        }

        return json_view(STATUS_OK, array(
            'c_time'      => $c_time,
            'register_id' => isset($node['Id']) ? intval($node['Id']) : 0,
            'info_update' => $node_info_update,
            'stat_update' => $node_stat_update,
            'post_append' => $node_post_append
        ));
    }

}
