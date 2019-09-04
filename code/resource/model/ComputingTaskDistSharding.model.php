<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/01/28 18:28:36
 */

import('model.RouterShardingModel');

class ComputingTaskDistShardingModel extends RouterShardingModel
{
	public function __construct()
	{
		parent::__construct();

		//router base algorithm must need the router
        $this->router = 'task_id';
        $this->uid_strategy = 'uint64';
	    $this->guidKey = 'Id';

        /*
         * once defined, the order of the sharding
         * (sub-model) can not be changed
        */
		$this->shardings = array(
            // 'package.Model',
            'computing.ComputingTaskDist01',
            'computing.ComputingTaskDist02',
            'computing.ComputingTaskDist03',
            'computing.ComputingTaskDist04',
            'computing.ComputingTaskDist05',
            'computing.ComputingTaskDist06',
            'computing.ComputingTaskDist07',
            'computing.ComputingTaskDist08',
            'computing.ComputingTaskDist09',
            'computing.ComputingTaskDist10',
            'computing.ComputingTaskDist11',
            'computing.ComputingTaskDist12',
            'computing.ComputingTaskDist13',
            'computing.ComputingTaskDist14',
            'computing.ComputingTaskDist15',
            'computing.ComputingTaskDist16',
            'computing.ComputingTaskDist17',
            'computing.ComputingTaskDist18',
            'computing.ComputingTaskDist19',
            'computing.ComputingTaskDist20',
            'computing.ComputingTaskDist21',
            'computing.ComputingTaskDist22',
            'computing.ComputingTaskDist23',
            'computing.ComputingTaskDist24',
            'computing.ComputingTaskDist25',
            'computing.ComputingTaskDist26',
            'computing.ComputingTaskDist27',
            'computing.ComputingTaskDist28',
            'computing.ComputingTaskDist29'
        );
	}

}
