<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/01/31 10:56:47
 */

import('model.C_Model');

class NodeDiskDynamic17Model extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'opmt_record_db');
		$this->table = 'sarah_node_disk_dynamic_17';
		$this->primary_key = 'Id';
	}

}
