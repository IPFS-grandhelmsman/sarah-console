<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/03 12:05:59
 */

import('model.RouterShardingModel');

class NodePostShardingModel extends RouterShardingModel
{
	public function __construct()
	{
		parent::__construct();

		//router base algorithm must need the router
        $this->router = 'node_id';
		// $this->guidKey = 'Id';

        /*
         * once defined, the order of the sharding
         * (sub-model) can not be changed
        */
		$this->shardings = array(
            // dist 01
            'opmt_record.NodePost01',
            'opmt_record.NodePost02',
            'opmt_record.NodePost03',
            'opmt_record.NodePost04',
            'opmt_record.NodePost05',
            'opmt_record.NodePost06',
            'opmt_record.NodePost07',
            'opmt_record.NodePost08',
            'opmt_record.NodePost09',
            'opmt_record.NodePost10',
            'opmt_record.NodePost11',
            'opmt_record.NodePost12',
            'opmt_record.NodePost13',
            'opmt_record.NodePost14',
            'opmt_record.NodePost15',
            'opmt_record.NodePost16',
            'opmt_record.NodePost17',
            'opmt_record.NodePost18',
            'opmt_record.NodePost19',
            'opmt_record.NodePost20',
            'opmt_record.NodePost21',
            'opmt_record.NodePost22',
            'opmt_record.NodePost23',
            'opmt_record.NodePost24',
            'opmt_record.NodePost25',
            'opmt_record.NodePost26',
            'opmt_record.NodePost27',
            'opmt_record.NodePost28',
            'opmt_record.NodePost29',
            'opmt_record.NodePost30',
            'opmt_record.NodePost31',
            'opmt_record.NodePost32',
            'opmt_record.NodePost33',
            'opmt_record.NodePost34',
            'opmt_record.NodePost35',
            'opmt_record.NodePost36',
            'opmt_record.NodePost37',
            'opmt_record.NodePost38',
            'opmt_record.NodePost39',
            'opmt_record.NodePost40',
            'opmt_record.NodePost41',
            'opmt_record.NodePost42',
            'opmt_record.NodePost43',
            'opmt_record.NodePost44',
            'opmt_record.NodePost45',
            'opmt_record.NodePost46',
            'opmt_record.NodePost47',
            'opmt_record.NodePost48',
            'opmt_record.NodePost49',
            'opmt_record.NodePost50',
            'opmt_record.NodePost51',
            'opmt_record.NodePost52',
            'opmt_record.NodePost53',
            'opmt_record.NodePost54',
            'opmt_record.NodePost55',
            'opmt_record.NodePost56',
            'opmt_record.NodePost57',
            'opmt_record.NodePost58',
            'opmt_record.NodePost59',
            'opmt_record.NodePost60',
            'opmt_record.NodePost61',
            'opmt_record.NodePost62',
            'opmt_record.NodePost63',
            'opmt_record.NodePost64',
            'opmt_record.NodePost65',
            'opmt_record.NodePost66',
            'opmt_record.NodePost67',
            'opmt_record.NodePost68',
            'opmt_record.NodePost69',
            'opmt_record.NodePost70',
            'opmt_record.NodePost71',
            'opmt_record.NodePost72',
            'opmt_record.NodePost73',
            'opmt_record.NodePost74',
            'opmt_record.NodePost75',
            'opmt_record.NodePost76',
            'opmt_record.NodePost77',
            'opmt_record.NodePost78',
            'opmt_record.NodePost79',
            'opmt_record.NodePost80',
            'opmt_record.NodePost81',
            'opmt_record.NodePost82',
            'opmt_record.NodePost83',
            'opmt_record.NodePost84',
            'opmt_record.NodePost85',
            'opmt_record.NodePost86',
            'opmt_record.NodePost87',
            'opmt_record.NodePost88',
            'opmt_record.NodePost89',
            'opmt_record.NodePost90',
            'opmt_record.NodePost91',
            'opmt_record.NodePost92',
            'opmt_record.NodePost93',
            'opmt_record.NodePost94',
            'opmt_record.NodePost95',
            'opmt_record.NodePost96',
            'opmt_record.NodePost97'
        );
	}

}
