<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/03 12:04:47
 */

import('model.C_Model');

class NodeStatisticsModel extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_node_statistics';
		$this->primary_key = 'node_id';
	}

}
