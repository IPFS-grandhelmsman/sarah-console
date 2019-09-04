<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/12 14:48:29
 */

import('model.C_Model');

class NodeStatistics01Model extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_node_statistics_01';
		$this->primary_key = 'node_id';
	}

}
