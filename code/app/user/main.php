<?php
/**
 * user controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------
 
class UserController extends Session_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionProfile($input);
    }

    public function actionProfile($input)
    {
        // get the user information
        $profile = service('user.profile.content.view', array(
            'id'           => $this->user_id,
            'date_format'  => 'Y/m/d H:i'
        ));

        return view("{$this->skin}/user-profile.html", array(
            'profile' => $profile
        ));
    }

}
