<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/03/05 11:34:29
 */

import('model.RouterShardingModel');

class UserApplicationShardingModel extends RouterShardingModel
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
            'core.UserApplication01',
            'core.UserApplication02',
            'core.UserApplication03'
        );
	}

}
