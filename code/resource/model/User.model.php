<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/03 12:03:49
 */

import('model.C_Model');

class UserModel extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_user';
		$this->primary_key = 'Id';

        // fragment define
        $this->fragments = array(
            array(
                'model'  => 'UserProfile',
                'sync_w' => true,
                'fields' => array('app_key', 'product_name')
            ),
			array(
				'model'  => 'AlertSetting',
				'sync_w' => true,
				'fields' => array()
			)
        );
	}

}
