<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/01/08 18:24:08
 */

import('model.C_Model');

class AlertSettingModel extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_alert_setting';
		$this->primary_key = 'user_id';
	}

}
