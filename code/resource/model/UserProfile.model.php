<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/03 12:03:49
 */

import('model.C_Model');

class UserProfileModel extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_user_profile';
		$this->primary_key = 'user_id';
	}

}
