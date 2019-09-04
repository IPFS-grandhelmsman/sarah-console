<?php
/**
 * Alert setting api
 * 
 *
*/

import('core.Session_Controller', false);

//------------------------------------------------------
 
class SettingController extends C_Controller
{

    /**
     * fetch alert setting by user id
     * @param Input $input
     * @return string
     */
    public function actionGet(Input $input)
    {
        $userId = intval($input->get('userId'));
        if ($userId == 0) {
            return json_view(STATUS_INVALID_ARGS, "Invalid arguments");
        }
        $fields = array('user_id', 'open_alert', 'alert_interval', 'alert_mask', 'alert_item_config', 'alert_text_tpl', 'updated_at');
        $item = model('AlertSetting')->getById($fields, $userId);
        if (empty($item)) {
            return json_view(STATUS_EMPTY_SETS, "No record found");
        }
        $config = json_decode($item['alert_item_config'], true);
        // package data
        $data = array(
            'userId' => $item['user_id'],
            'openAlert' => $item['open_alert'],
            'alertMask' => $item['alert_mask'],
            'alertInterval' => $item['alert_interval'],
            'loadAvg' => $config['loadavg'],
            'ramPercent' => $config['ram_percent'],
            'diskPercent' => $config['disk_percent'],
            'incomingBd' => $config['incoming_bd'],
            'outgoingBd' => $config['outgoing_bd'],
            'alertTextTpl' => $item['alert_text_tpl'],
            'updateTime' => $item['updated_at']
        );
        return json_view(STATUS_OK, $data);
    }

}
