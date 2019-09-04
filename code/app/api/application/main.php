<?php
/**
 * Application api controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class ApplicationController extends Session_Controller
{    

    /*
     * add the application to the desktop
    */
    public function actionAdd($input)
    {
        assert_std_tias($input, 'app.list', $app_id);

        $data = array(
            'user_id'     => $this->user_id,
            'app_id'      => $app_id,
            'config_json' => '0',
            'created_at'  => time()
        );

        $userAppSharding = model('UserApplicationSharding');
        if ( ($data['Id'] = $userAppSharding->add($data)) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        $data['v_qstr'] = build_std_tias(
            'app.list', $data['Id'], $data['created_at']
        );

        return json_view(STATUS_OK, array(
            'data' => $data
        ));
    }

    /**
     * remove the application from the desktop
    */
    public function actionRemove($input)
    {
        assert_std_tias($input, 'app.list', $app_id);

        $userAppModel = model('UserApplicationSharding')
            ->getShardingModelFromValue($this->user_id);
        if ( $userAppModel->delete(array(
            'user_id' => "={$this->user_id}", 'app_id' => "{$app_id}")) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, array(
            'app_id' => $app_id
        ));
    }

}
