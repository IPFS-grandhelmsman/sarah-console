<?php
/**
 * user application controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class ApplicationController extends Session_Controller
{    

    public function actionView($input)
    {
        assert_std_tias($input, 'app.list', $app_id);

        $uapp = model('UserApplicationSharding')->get(
            array('config_json', 'updated_at'), 
            array(
                'user_id' => "={$this->user_id}",
                'app_id'  => "={$app_id}"
            )
        );
        if ( $uapp == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $app = service('application.content.view', array(
            'id'          => $app_id,
            'date_format' => 'Y/m/d H:i'
        ));


        # try to merge the config
        # extends the config from the default application config
        $config = json_decode($app['config_json'], true);
        if ( strlen($uapp['config_json']) > 2 
            && ($json = json_decode($uapp['config_json'], true)) != null ) {
            foreach ( $json as $K => $V ) {
                $config[$K] = $V;
            }
        }

        return view("embed/user-application-view.html", array(
            'app'    => $app,
            'config' => $config
        ));
    }

}
