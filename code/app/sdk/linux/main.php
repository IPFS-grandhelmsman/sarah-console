<?php
/**
 * Linux SDK Demo Controller
 *
 * 
 */
 
import('core.Session_Controller', false);

class LinuxController extends Session_Controller
{

    public function actionIndex($input)
    {
        return view("{$this->skin}/linux-sdk.html", array(
            'user_id' => $this->user_id,
            'app_key' => $this->app_key
        ));
    }

}
