<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/03 12:05:59
 */

import('model.RouterShardingModel');

class NodeDiskDynamicShardingModel extends RouterShardingModel
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
            // dist 01
            'opmt_record.NodeDiskDynamic01',
            'opmt_record.NodeDiskDynamic02',
            'opmt_record.NodeDiskDynamic03',
            'opmt_record.NodeDiskDynamic04',
            'opmt_record.NodeDiskDynamic05',
            'opmt_record.NodeDiskDynamic06',
            'opmt_record.NodeDiskDynamic07',
            'opmt_record.NodeDiskDynamic08',
            'opmt_record.NodeDiskDynamic09',
            'opmt_record.NodeDiskDynamic10',
            'opmt_record.NodeDiskDynamic11',
            'opmt_record.NodeDiskDynamic12',
            'opmt_record.NodeDiskDynamic13',
            'opmt_record.NodeDiskDynamic14',
            'opmt_record.NodeDiskDynamic15',
            'opmt_record.NodeDiskDynamic16',
            'opmt_record.NodeDiskDynamic17',
            'opmt_record.NodeDiskDynamic18',
            'opmt_record.NodeDiskDynamic19',
            'opmt_record.NodeDiskDynamic20',
            'opmt_record.NodeDiskDynamic21',
            'opmt_record.NodeDiskDynamic22',
            'opmt_record.NodeDiskDynamic23',
            'opmt_record.NodeDiskDynamic24',
            'opmt_record.NodeDiskDynamic25',
            'opmt_record.NodeDiskDynamic26',
            'opmt_record.NodeDiskDynamic27',
            'opmt_record.NodeDiskDynamic28',
            'opmt_record.NodeDiskDynamic29'
        );
	}

}
