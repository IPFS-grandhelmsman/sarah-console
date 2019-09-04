<?php
/**
 * Desktop main UI Controller
 *
 *
*/

import('core.Session_Controller', false);

class DesktopController extends Session_Controller
{

    public function actionIndex($input)
    {
        /* Load all the applications installed */
        $apps = service('user.application.content.paging', array(
            'user_id'       => $this->user_id,
            'pagesize'      => 10,
            'pageno'        => 1,
            'load_app'      => true,
            'date_format'   => 'Y/m/d H:i',
            'order_by'      => 'created_at',
            'sort_by'       => 'ASC'
        ));

        if ( $apps == false ) {
            $apps = array();
        }

        return view('desktop-v1.html', array(
            'apps' => $apps
        ));
    }

}
