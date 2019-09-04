<?php
/**
 * Admin Setting Controller
 *
 *
*/

import('core.Session_Controller', false);

//--------------------------------------------

class SettingController extends Session_Controller
{

    public function actionSkin($input)
    {
        $referer = $input->server('HTTP_REFERER');
        $name = $input->get('name', array('/^[A-Za-z0-9_-]+$/'));
        if ( $name != false 
            && in_array($name, array('default', 'dark', 'embed')) ) {
            // setcookie('locale_skin', $lang, time() + 86400 * 7, '/');
            if ( model('UserProfile')->setById(
                'skin_name', $name, $this->user_id) == false ) {
                // @TODO: do error log here
            }

            session('skin', $name);
        }

        if ( $referer == false ) {
            header("Location: /");
        } else {
            header("Location: {$referer}");
        }
    }

}
