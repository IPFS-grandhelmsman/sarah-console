<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/03/08 14:51:50
 */

import('model.RouterShardingModel');

class ApplicationTaskShardingModel extends RouterShardingModel
{
	public function __construct()
	{
		parent::__construct();

		//router base algorithm must need the router
        $this->router = 'app_id';
        $this->uid_strategy = 'uint64';
	    $this->guidKey = 'Id';

        /*
         * once defined, the order of the sharding
         * (sub-model) can not be changed
        */
		$this->shardings = array(
            'computing.ApplicationTask01',
            'computing.ApplicationTask02',
            'computing.ApplicationTask03',
            'computing.ApplicationTask04',
            'computing.ApplicationTask05',
            'computing.ApplicationTask06',
            'computing.ApplicationTask07'
        );
	}

}
