<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/20 18:08:16
 */

import('model.C_Model');

class NodeCommand12Model extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'computing_db');
		$this->table = 'sarah_node_cmd_12';
		$this->primary_key = 'Id';
	}

}
