<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/20 18:09:03
 */

import('model.RouterShardingModel');

class NodeCommandShardingModel extends RouterShardingModel
{
	public function __construct()
	{
		parent::__construct();

		//router base algorithm must need the router
        $this->router = 'node_id';
        $this->uid_strategy = 'uint64';
	    $this->guidKey = 'Id';

        /*
         * once defined, the order of the sharding
         * (sub-model) can not be changed
        */
		$this->shardings = array(
            // 'package.Model',
            'computing.NodeCommand01',
            'computing.NodeCommand02',
            'computing.NodeCommand03',
            'computing.NodeCommand04',
            'computing.NodeCommand05',
            'computing.NodeCommand06',
            'computing.NodeCommand07',
            'computing.NodeCommand08',
            'computing.NodeCommand09',
            'computing.NodeCommand10',
            'computing.NodeCommand11',
            'computing.NodeCommand12',
            'computing.NodeCommand13',
            'computing.NodeCommand14',
            'computing.NodeCommand15',
            'computing.NodeCommand16',
            'computing.NodeCommand17',
            'computing.NodeCommand18',
            'computing.NodeCommand19',
            'computing.NodeCommand20',
            'computing.NodeCommand21',
            'computing.NodeCommand22',
            'computing.NodeCommand23',
            'computing.NodeCommand24',
            'computing.NodeCommand25',
            'computing.NodeCommand26',
            'computing.NodeCommand27',
            'computing.NodeCommand28',
            'computing.NodeCommand29'
        );
	}

}
