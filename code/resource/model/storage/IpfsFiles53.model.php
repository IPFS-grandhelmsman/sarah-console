<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/04/26 15:10:20
 */

import('model.C_Model');

class IpfsFiles53Model extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'storage_db');
		$this->table = 'sarah_ipfs_files_53';
		$this->primary_key = 'Id';
	}

}
