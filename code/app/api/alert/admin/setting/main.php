<?php
/**
 * Alert setting for user
 * 
 *
*/

import('core.Session_Controller', false);

//------------------------------------------------------
 
class SettingController extends Session_Controller
{

    /**
     * Saving the alert setting
     * @param Input $input
     * @return string
     */
    public function actionSave(Input $input)
    {
        $loadavg = $input->post('loadavg', array(OP_NUMERIC));
        $ramPercent = $input->post('ram_percent', array(OP_NUMERIC));
        $diskPercent = $input->post('disk_percent', array(OP_NUMERIC));
        $incomingBd = $input->post('incoming_bd', array(OP_NUMERIC));
        $outgoingBd = $input->post('outgoing_bd', array(OP_NUMERIC));
        $alertTextTpl = $input->post('alert_text_tpl', 
            array(OP_STRING, OP_LIMIT(0, 255), OP_MAGIC_QUOTES | OP_SANITIZE_HTML));
        $openAlert = $input->postBoolean('open_alert');

        // close the alert function
        if ($openAlert === false) {
            if (model("AlertSetting")->setById('open_alert', 0, $this->user_id) === false) {
                return json_view(STATUS_FAILED, "Faild");
            } else {
                return json_view(STATUS_OK, "Success");
            }
        }
        if ($loadavg == false || $ramPercent == false || $diskPercent == false
            || $incomingBd == false || $outgoingBd == false) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        // make alert type to mask code
        $data = array(
            'open_alert' => $openAlert,
            'alert_text_tpl' => $alertTextTpl,
            'updated_at' => time()
        );

        $alertItemConfig = array(
            'loadavg' => $loadavg,
            'ram_percent' => $ramPercent,
            'disk_percent' => $diskPercent,
            'incoming_bd' => $incomingBd,
            'outgoing_bd' => $outgoingBd,
        );

        $data['alert_item_config'] = json_encode($alertItemConfig, JSON_UNESCAPED_UNICODE);
        $data['updated_at'] = time();

        // update user's alert settings
        if (model("AlertSetting")->updateById($data, $this->user_id)) {

            $this->post_setting_to_jnode();
            return json_view(STATUS_OK, "Success");
        } else {
            return json_view(STATUS_FAILED, "Failed");
        }
    }

    /**
     * post setting data to jnode
     */
    private function post_setting_to_jnode()
    {
        // import("JNodeApi", false);
        // $jnodeConfig = config('jnode');
        // JNodeApi::post($jnodeConfig['alert_setting_update_url'], $data);
        $setting = service('alert.setting.row', array(
            'user_id'     => $this->user_id,
            'json_decode' => true,
        ));
        if ( $setting == false ) {
            return false;
        }

        $data = array(
            'userId'        => $setting['user_id'],
            'openAlert'     => $setting['open_alert'],
            'alertMask'     => $setting['alert_mask'],
            'alertInterval' => $setting['alert_interval'],
            'loadAvg'       => $setting['itemConfig']['loadavg'],
            'ramPercent'    => $setting['itemConfig']['ram_percent'],
            'diskPercent'   => $setting['itemConfig']['disk_percent'],
            'incomingBd'    => $setting['itemConfig']['incoming_bd'],
            'outgoingBd'    => $setting['itemConfig']['outgoing_bd'],
            'updateTime'    => $setting['updated_at'],
        );

        import('JNodeClient', false);
        $jNodeClient = new JNodeClient(config('jnode#master'));
        return $jNodeClient->updateAlert($data);
    }

    /**
     * 更改通知方式
     * @param Input $input
     * @return string
     */
    public function actionAlertMethod(Input $input)
    {
        $emailAlert  = $input->postBoolean('email_alert');
        $mobileAlert = $input->postBoolean('mobile_alert');
        $wechatAlert = $input->postBoolean('wechat_alert');

        $alertMask = 0x01;
        if ($emailAlert) {
            $alertMask = $alertMask | EMAIL_ALERT;
        }
        if ($mobileAlert) {
            $alertMask = $alertMask | MOBILE_ALERT;
        }
        if ($wechatAlert) {
            $alertMask = $alertMask | WEICHAT_ALERT;
        }
        $data = array(
            'alert_mask' => $alertMask,
            'updated_at' => time()
        );
        if (model("AlertSetting")->updateById($data, $this->user_id) === false) {
            return json_view(STATUS_FAILED, "Faild");
        } else {
            $this->post_setting_to_jnode();
            return json_view(STATUS_OK, "Success");
        }
    }

}
