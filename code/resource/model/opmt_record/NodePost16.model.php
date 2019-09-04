<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/01/31 10:56:15
 */

import('model.C_Model');

class NodePost16Model extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'opmt_record_db');
		$this->table = 'sarah_node_post_16';
		$this->primary_key = 'Id';
	}

}
