<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/04/26 15:11:03
 */

import('model.RouterShardingModel');

class IpfsFilesShardingModel extends RouterShardingModel
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
            'storage.IpfsFiles01',
            'storage.IpfsFiles02',
            'storage.IpfsFiles03',
            'storage.IpfsFiles04',
            'storage.IpfsFiles05',
            'storage.IpfsFiles06',
            'storage.IpfsFiles07',
            'storage.IpfsFiles08',
            'storage.IpfsFiles09',
            'storage.IpfsFiles10',
            'storage.IpfsFiles11',
            'storage.IpfsFiles12',
            'storage.IpfsFiles13',
            'storage.IpfsFiles14',
            'storage.IpfsFiles15',
            'storage.IpfsFiles16',
            'storage.IpfsFiles17',
            'storage.IpfsFiles18',
            'storage.IpfsFiles19',
            'storage.IpfsFiles20',
            'storage.IpfsFiles21',
            'storage.IpfsFiles22',
            'storage.IpfsFiles23',
            'storage.IpfsFiles24',
            'storage.IpfsFiles25',
            'storage.IpfsFiles26',
            'storage.IpfsFiles27',
            'storage.IpfsFiles28',
            'storage.IpfsFiles29',
            'storage.IpfsFiles30',
            'storage.IpfsFiles31',
            'storage.IpfsFiles32',
            'storage.IpfsFiles33',
            'storage.IpfsFiles34',
            'storage.IpfsFiles35',
            'storage.IpfsFiles36',
            'storage.IpfsFiles37',
            'storage.IpfsFiles38',
            'storage.IpfsFiles39',
            'storage.IpfsFiles40',
            'storage.IpfsFiles41',
            'storage.IpfsFiles42',
            'storage.IpfsFiles43',
            'storage.IpfsFiles44',
            'storage.IpfsFiles45',
            'storage.IpfsFiles46',
            'storage.IpfsFiles47',
            'storage.IpfsFiles48',
            'storage.IpfsFiles49',
            'storage.IpfsFiles50',
            'storage.IpfsFiles51',
            'storage.IpfsFiles52',
            'storage.IpfsFiles53',
            'storage.IpfsFiles54',
            'storage.IpfsFiles55',
            'storage.IpfsFiles56',
            'storage.IpfsFiles57',
            'storage.IpfsFiles58',
            'storage.IpfsFiles59',
            'storage.IpfsFiles60',
            'storage.IpfsFiles61',
            'storage.IpfsFiles62',
            'storage.IpfsFiles63',
            'storage.IpfsFiles64',
            'storage.IpfsFiles65',
            'storage.IpfsFiles66',
            'storage.IpfsFiles67',
            'storage.IpfsFiles68',
            'storage.IpfsFiles69',
            'storage.IpfsFiles70',
            'storage.IpfsFiles71',
            'storage.IpfsFiles72',
            'storage.IpfsFiles73',
            'storage.IpfsFiles74',
            'storage.IpfsFiles75',
            'storage.IpfsFiles76',
            'storage.IpfsFiles77',
            'storage.IpfsFiles78',
            'storage.IpfsFiles79',
            'storage.IpfsFiles80',
            'storage.IpfsFiles81',
            'storage.IpfsFiles82',
            'storage.IpfsFiles83',
            'storage.IpfsFiles84',
            'storage.IpfsFiles85',
            'storage.IpfsFiles86',
            'storage.IpfsFiles87',
            'storage.IpfsFiles88',
            'storage.IpfsFiles89',
            'storage.IpfsFiles90',
            'storage.IpfsFiles91',
            'storage.IpfsFiles92',
            'storage.IpfsFiles93',
            'storage.IpfsFiles94',
            'storage.IpfsFiles95',
            'storage.IpfsFiles96',
            'storage.IpfsFiles97',
            'storage.IpfsFiles98',
            'storage.IpfsFiles99'
        );
	}

}
