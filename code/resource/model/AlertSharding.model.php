<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/01/08 17:17:26
 */

import('model.RouterShardingModel');

class AlertShardingModel extends RouterShardingModel
{
	public function __construct()
	{
		parent::__construct();

		//router base algorithm must need the router
        $this->router = 'user_id';
        $this->uid_strategy = 'uint64';
		$this->guidKey = 'Id';

        /*
         * once defined, the order of the sharding
         * (sub-model) can not be changed
        */
		$this->shardings = array(
            // 'package.Model',
            'alert.Alert01',
            'alert.Alert02',
            'alert.Alert03',
            'alert.Alert04',
            'alert.Alert05',
            'alert.Alert06',
            'alert.Alert07'
        );
	}

}
