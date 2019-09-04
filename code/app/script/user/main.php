<?php
/**
 * Desktop script controller
 *
 * 
 */

class UserController extends S_Controller
{

    public function actionProfile()
    {
        return array(
            'common/jquery.1.11.js',
            'common/util.js',
            'common/validator.js',
            'desktop/link_params.js',
            'embed/user_profile.js'
        );
    }

}
