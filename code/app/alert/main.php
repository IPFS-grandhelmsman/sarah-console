<?php
/**
 * Alert controller
 *
 *
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class AlertController extends Session_Controller
{

    public function actionIndex(Input $input)
    {
        return $this->actionList($input);
    }

    /**
     * 警报列表
     * @param Input $input
     * @return string
     */
    public function actionList(Input $input)
    {
        $pageno   = $input->getInt('pageno', 1);
        $pagesize = 10;
        $list = service('alert.content.paging', array(
            'user_id'       => $this->user_id,
            'load_json'     => true,
            'load_node'     => true,
            'date_format'   => 'Y/m/d H:i',
            'number_format' => true,
            'pageno'        => $pageno,
            'pagesize'      => $pagesize,
            'order_by'      => 'created_at',
            'sort_by'       => 'desc',
        ));

        view_paging_register(
            model('AlertSharding')->totals(
                array('user_id' => "={$this->user_id}")
            ),
            $pagesize,
            $pageno
        );

        return view("{$this->skin}/alert-list.html", array(
            'data' => $list == false ? array() : $list
        ));
    }

    /**
     * The view of alert setting
     * @param $input
     * @return string
     */
    public function actionSetting($input)
    {
        // query alert settings
        $setting = service('alert.setting.row', array(
            'user_id'     => $this->user_id,
            'json_decode' => true,
        ));

        // query alert receiver
        $receivers = service('alert.receiver._list', array(
            'user_id'     => $this->user_id,
            'date_format' => 'Y-m-d H:i:s',
            'order'       => 'Id DESC'
        ));

        // parse alert mask
        $setting['mobile_alert'] = false;
        if ( ($setting['alert_mask'] & MOBILE_ALERT) != 0 ) {
            $setting['mobile_alert'] = true;
        }

        $setting['email_alert'] = false;
        if ( ($setting['alert_mask'] & EMAIL_ALERT) != 0 ) {
            $setting['email_alert'] = true;
        }

        $setting['wechat_alert'] = false;
        if ( ($setting['alert_mask'] & WEICHAT_ALERT) != 0 ) {
            $setting['wechat_alert'] = true;
        }

        return view("{$this->skin}/alert-setting.html", array(
            'setting' => $setting,
            'receivers' => $receivers
        ));
    }

}
