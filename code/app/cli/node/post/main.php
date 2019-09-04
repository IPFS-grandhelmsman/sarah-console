<?php
/**
 * Node post consume cli script
 *
 *
*/

import('Util');
import("JNodeClient", false);

class PostController extends Cli_Controller
{

    public function actionConsume($input)
    {
        $idle_wait = 5;
        $c_timestamp = 0;

        $nodeSharding = model('NodeSharding');
        $nodeStatSharding = model('NodeStatisticsSharding');
        $nodePostSharding = model('NodePostSharding');
        $userAppSharding  = model('UserApplicationSharding');
        $appNodeSharding  = model('ApplicationNodeSharding');
        $taskPool = helper('MainPDSL')->load('NodePostPool');
        $jNodeClient = new JNodeClient(config('jnode#master'));

        while ( true ) {
            $this->dispatchSignal();    /* Dispatch the process signal */

            echo "+-Try to get the next post record ... \n";
            if ( ($pack = $taskPool->lpop()) == null ) {
                echo "|-[Info]: empty pool, wait for the next invocation.\n";
                $taskPool->close();     /* Close the pool for the idle time range */
                sleep($idle_wait);
                continue;
            }
            echo "|--[Info]: get post with pack={$pack}.\n";


            /* 1, unpack the package */
            $parts   = explode(',', $pack);
            if ( count($parts) < 2 ) {
                unset($pack, $parts);
                continue;
            }

            $node_id = intval($parts[0]);
            $post_at = intval($parts[1]);
            unset($pack, $parts);

            /* @Note added at 2019/03/25 ignore the record that its post at is too old */
            if ( ($post_at + 300) < time() ) {
                echo "|--[Warning]: posted 5mins ago --ignore\n";
                unset($node_id, $post_at);
                continue;
            }
            

            /* 2, Query the node post information */
            echo "+-Try to get the node post info ... ";
            $nodePostModel = $nodePostSharding->getShardingModelFromValue($node_id);
            $post = $nodePostModel->get(
                array('user_id', 'stat_json'),
                array('node_id' => "={$node_id}", 'created_at' => "={$post_at}")
            );
            if ( $post == false ) {
                unset($node_id, $post_at);
                unset($nodePostModel, $post);
                echo " --[Failed]\n";
                continue;
            }
            echo " --[Ok]\n";


            /* 3, do the post statistics */
            $user_id = $post['user_id'];
            $jobj = json_decode($post['stat_json']);
            if ( isset($jobj->cpu->stat->sys_loadavg) ) {
                $load_avg = sprintf("%.3f", $jobj->cpu->stat->sys_loadavg->t_1m);
            } else {
                $load_avg = sprintf("%.3f", $jobj->cpu->stat->load_avg);
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


            /* 4, Post the message package to the sarah-jNode service */
            $jnode_data = array(
                'nodeId'      => $node_id,
                'userId'      => $user_id,
                'status'      => NODE_RUNNING,
                'loadAvg'     => $load_avg,
                'ramFree'     => $jobj->ram->available,
                'ramPercent'  => $ram_utilization,
                'diskFree'    => $disk_size - $disk_used,
                'diskPercent' => $disk_utilization,
                'incomingBd'  => $incoming_bd,
                'outgoingBd'  => $outgoing_bd,
                'updateTime'  => $post_at
            );
            echo "+-Try to post the data to jnode ... ";
            $jnode_ret = $jNodeClient->postData($jnode_data);
            if ( $jnode_ret == false ) {
                echo " --[Failed]\n";
            } else if ( $jnode_ret->code != '000' ) {
                echo " --[Failed] with code={$jnode_ret->code}\n";
                // TODO: do error log here
            } else {
                echo " --[Ok]\n";
            }

            unset($load_avg, $ram_used, $ram_utilization);
            unset($disk_size, $disk_used, $disk_utilization);
            unset($incoming_bd, $outgoing_bd, $jnode_data, $jnode_ret);


            /* 5, do the application statistics info update */
            $userAppModel = $userAppSharding->getShardingModelFromValue($user_id);
            $userApps = $userAppModel->getList(
                array('app_id'), array('user_id' => "={$user_id}")
            );
            echo "+[Info]:Try to do the application stat_json analysis ... \n";
            if ( $userApps != false ) {
                foreach ( $userApps as $app ) {
                    $app_id = intval($app['app_id']);
                    echo "+-Try to update the stat info for app with Id={$app_id} ... ";
                    $appNodeModel = $appNodeSharding->getShardingModelFromValue($app_id);
                    $appNode = $appNodeModel->get(
                        array('status', 'pid'), 
                        array('app_id' => "={$app_id}", 'node_id' => "={$node_id}")
                    );

                    /*
                     * @Note we only update the app node record
                     *  which its status is running and its pid is not 0
                    */
                    if ( $appNode == false 
                        || $appNode['status'] != NODE_APP_RUNNING 
                            || $appNode['pid'] == '0' ) {
                        echo " --[Ignore]\n";
                        unset($appNodeModel, $appNode);
                        usleep(20000);  // sleep for 20 ms
                        continue;
                    }

                    // get the process info with the pid
                    $pid = intval($appNode['pid']);
                    $stat_json = null;
                    foreach ( $jobj->process as $p ) {
                        if ( $p->pid == $pid ) {
                            $stat_json = $p;
                            break;
                        }
                    }

                    if ( $stat_json == null ) {
                        $data = array(
                            'pid'        => 0,
                            'status'     => NODE_APP_TOBE_START,
                            'stat_json'  => '0',
                            'updated_at' => time()
                        );
                    } else {
                        $data = array(
                            'stat_json'  => json_encode($stat_json),
                            'updated_at' => time()
                        );
                    }
                    if ( $appNodeModel->update($data, 
                        array('app_id' => "={$app_id}", 
                            'node_id' => "={$node_id}")) == false ) {
                        echo " --[Failed]\n";
                    } else {
                        echo " --[Ok]\n";
                    }

                    unset($appNodeModel, $appNode, $pid, $stat_json);
                    usleep(20000);  // sleep for 20 ms
                }
            }
            echo "|--[Done]\n";


            /* 6, @TODO: do the device dynamic checking */


            // resource clean up
            unset($user_id, $node_id, $post_at, $jobj);
            unset($nodePostModel, $post, $userAppModel, $userApps);
            usleep(2000);  // sleep for 2 ms
        } /* End for loop */

    }

}
