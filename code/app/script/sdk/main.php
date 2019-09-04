<?php
/**
 * Desktop script controller
 *
 * 
 */

class SdkController extends S_Controller
{

    public function actionLinux()
    {
        return array(
            'common/jquery.1.11.js',
            'common/util.js',
            'desktop/link_params.js'
        );
    }

}
