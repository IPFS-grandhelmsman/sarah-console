<?php
/**
 * Desktop script controller
 *
 * 
*/

class DesktopController extends S_Controller
{

    public function actionIndex()
    {
        return array(
            'common/jquery.1.11.js',
            'common/md5.js',
            'common/util.js',
            'desktop/cache.js',
            'desktop/desktop-v1.js'
        );
    }

}
