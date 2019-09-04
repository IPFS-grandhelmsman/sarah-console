<?php
/**
 * node statistics service class
 *
 * 
*/

 //------------------------------------------------

import('service.Service');

class NodeStatisticsService extends Service
{

    /**
     * get the sum cpu_cores, ram_kb, disk_kb
     * for all the nodes
     *
     * @param   $input
     * @param   Mixed
    */
    public function size($input)
    {
        $user_id = $input->get('user_id');
        if ( $user_id == null ) {
            return 0;
        }

        $nodeModel = model('NodeSharding')
            ->getShardingModelFromValue($user_id);

        $_sql = 'select sum(cpu_cores) as cpu_cores, 
            sum(ram_kb) as ram_kb, sum(disk_kb) as disk_kb
            from ' . $nodeModel->getTableName() . " where user_id = {$user_id}";
        $exe_ret = $nodeModel->execute($_sql, 1, false);
        if ( $exe_ret == FALSE ) {
            return false;
        }

        return mysqli_fetch_array($exe_ret, MYSQLI_ASSOC);
    }

    /**
     * sum the used ram, disk, incoming bandwidth, outgoing bandwidth
     *
     * @param   $input
    */
    public function used($input)
    {
        $user_id = $input->get('user_id');
        if ( $user_id == null ) {
            return false;
        }

        $nodeStatModel = model('NodeStatisticsSharding')
            ->getShardingModelFromValue($user_id);
        $_sql = 'select sum(load_avg) as load_avg,
            sum(ram_used_kb) as ram_used_kb, sum(disk_used_kb) as disk_used_kb,
            sum(incoming_bd) incoming_db, sum(outgoing_bd) outgoing_bd
            from ' . $nodeStatModel->getTableName() . " where _user_id = {$user_id}";
        $exe_ret = $nodeStatModel->execute($_sql, 1, false);
        if ( $exe_ret == FALSE ) {
            return false;
        }

        return mysqli_fetch_array($exe_ret, MYSQLI_ASSOC);
    }

}
