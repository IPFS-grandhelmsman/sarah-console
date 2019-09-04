<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/03/05 11:34:00
 */

import('model.C_Model');

class UserApplication02Model extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_user_application_02';
		$this->primary_key = 'Id';
	}

}
