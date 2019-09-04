<?php
/**
 * Default description, create by Syrian artisan.
 *
 * 
 * @date   2018/12/12 14:47:19
 */

import('model.C_Model');

class Node03Model extends C_Model
{
	public function __construct()
	{
		parent::__construct();

		$this->db    = self::getDatabase('Mysql', 'core_db');
		$this->table = 'sarah_node_03';
		$this->primary_key = 'Id';

        // define the fragments
        $this->fragments = array(
            array(
                'model'  => 'node.NodeStatistics03',
                'sync_w' => true,
                'fields' => array(
                    '_user_id', '_node_uid', 'status', 'load_avg', 'ram_used_kb', 
                    'ram_utilization', 'disk_used_kb', 'disk_utilization', 
                    'incoming_bd', 'outgoing_bd', 'stat_json', 'updated_at'
                )
            )
        );
	}

}
