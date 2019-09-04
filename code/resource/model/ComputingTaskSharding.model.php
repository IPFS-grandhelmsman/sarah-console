<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/01/28 18:28:29
 */

import('model.RouterShardingModel');

class ComputingTaskShardingModel extends RouterShardingModel
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
            'computing.ComputingTask01',
            'computing.ComputingTask02',
            'computing.ComputingTask03',
            'computing.ComputingTask04',
            'computing.ComputingTask05',
            'computing.ComputingTask06',
            'computing.ComputingTask07',
            'computing.ComputingTask08',
            'computing.ComputingTask09',
            'computing.ComputingTask10',
            'computing.ComputingTask11',
            'computing.ComputingTask12',
            'computing.ComputingTask13'
        );
	}

}
