<?php
/**
 * Desktop script controller
 *
 * 
 */


class AlertController extends S_Controller
{

    public function actionList()
    {
        return array(
            'common/jquery.1.11.js',
            'common/util.js',
            'desktop/link_params.js',
            'embed/alert_list.js'
        );
    }

    public function actionSetting()
    {
        return array(
            'common/jquery.1.11.js',
            'common/JTE.js',
            'common/util.js',
            'common/table_select.js',
            'common/validator.js',
            'desktop/link_params.js',
            'embed/alert_setting.js'
        );
    }


}
