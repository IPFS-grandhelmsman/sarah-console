<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/12 14:50:19
 */

import('model.RouterShardingModel');

class NodeStatisticsShardingModel extends RouterShardingModel
{
	public function __construct()
	{
		parent::__construct();

        // @Note from lion
        // be aware that the shardings and the router field
        // should always be the same with NodeSharding setting

		//router base algorithm must need the router
        $this->router = 'user_id';
		// $this->guidKey = 'Id';

        /*
         * once defined, the order of the sharding
         * (sub-model) can not be changed
        */
		$this->shardings = array(
            // 'package.Model',
            'node.NodeStatistics01',
            'node.NodeStatistics02',
            'node.NodeStatistics03',
            'node.NodeStatistics04',
            'node.NodeStatistics05',
            'node.NodeStatistics06',
            'node.NodeStatistics07'
        );
	}

}
