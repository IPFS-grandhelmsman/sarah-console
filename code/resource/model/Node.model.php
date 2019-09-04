<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/03 12:03:49
 */

import('model.C_Model');

class NodeModel extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_node';
		$this->primary_key = 'Id';

        // fragment define
        $this->fragments = array(
            array(
                'model'  => 'NodeStatistics',
                'sync_w' => true,
                'fields' => array(
                    '_user_id', 'status', 'load_avg', 'ram_utilization', 
                    'disk_utilization', 'incoming_bd', 'outgoing_bd', 
                    'stat_json', 'updated_at'
                )
            )
        );
	}

}
