<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/03/04 17:40:25
 */

import('model.C_Model');

class ApplicationModel extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_application';
		$this->primary_key = 'Id';
        $this->autoPrimaryKey = true;
        $this->uid_strategy = 'uint64';
	}

}
