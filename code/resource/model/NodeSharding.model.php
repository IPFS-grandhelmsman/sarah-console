<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/12 14:50:19
 */

import('model.RouterShardingModel');

class NodeShardingModel extends RouterShardingModel
{
	public function __construct()
	{
		parent::__construct();

		// router base algorithm must need the router
        $this->router = 'user_id';
        $this->uid_strategy = 'uint64';
	    $this->guidKey = 'Id';

        /*
         * once defined, the order of the sharding
         * (sub-model) can not be changed
        */
		$this->shardings = array(
            // 'package.Model',
            'node.Node01',
            'node.Node02',
            'node.Node03',
            'node.Node04',
            'node.Node05',
            'node.Node06',
            'node.Node07'
        );
	}

}
