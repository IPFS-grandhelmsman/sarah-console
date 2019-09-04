<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2019/01/09 10:15:02
 */

import('model.C_Model');

class AlertReceiverModel extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_alert_receiver';
		$this->primary_key = 'Id';
	}

}
