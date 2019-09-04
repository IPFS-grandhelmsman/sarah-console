<?php
/**
 * Application controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class ApplicationController extends Session_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        $pageno   = $input->getInt('pageno', 1);
        $pagesize = 10;

        # invoke the service to scroll the data sets
        # @see service.application.content#list
        $ret = service('application.content.paging', array(
            'user_id'      => $this->user_id,
            'load_status'  => true,
            'date_format'  => 'Y/m/d H:i',
            'pagesize'     => $pagesize,
            'pageno'       => $pageno,
            'order_by'     => 'created_at',
            'sort_by'      => 'desc'
        ));

        if ( $ret == false ) {
            $ret = array();
        }

        view_paging_register(
            model('Application')->totals(), 
            $pagesize, 
            $pageno
        );

        return view('embed/application-list.html', array(
            'data' => $ret
        ));
    }

    public function actionView($input)
    {
        assert_std_tias($input, 'app.list', $app_id);
        $app = service('application.content.view', array(
            'id'          => $app_id,
            'user_id'     => $this->user_id,
            'load_status' => true,
            'json_decode' => true,
            'date_format' => 'Y/m/d H:i'
        ));

        return view("embed/application-view.html", array(
            'app' => $app,
        ));
    }

}
