<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/03/04 17:43:05
 */

import('model.RouterShardingModel');

class ApplicationNodeShardingModel extends RouterShardingModel
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
            'computing.ApplicationNode01',
            'computing.ApplicationNode02',
            'computing.ApplicationNode03',
            'computing.ApplicationNode04',
            'computing.ApplicationNode05',
            'computing.ApplicationNode06',
            'computing.ApplicationNode07',
            'computing.ApplicationNode08',
            'computing.ApplicationNode09',
            'computing.ApplicationNode10',
            'computing.ApplicationNode11',
            'computing.ApplicationNode12',
            'computing.ApplicationNode13'
        );
	}

}
