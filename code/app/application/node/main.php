<?php
/**
 * Application node controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class NodeController extends Session_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        assert_std_tias($input, 'app.list', $app_id);
        $pageno   = $input->getInt('pageno', 1);
        $pagesize = 10;

        $app = service('application.content.view', array(
            'id'          => $app_id,
            'date_format' => 'Y/m/d H:i'
        ));

        # invoke the service to scroll the data sets
        # @see service.node.content#list
        $data = service('application.node.content.paging', array(
            'app_id'        => $app_id,
            'user_id'       => $this->user_id,
            'load_node'     => true,
            'load_stat'     => true,
            'pagesize'      => $pagesize,
            'pageno'        => $pageno,
            'date_format'   => 'Y/m/d H:i',
            'order_by'      => 'created_at',
            'sort_by'       => 'desc'
        ));

        if ( $data == false ) {
            $data = array();
        }

        view_paging_register(
            model('ApplicationNodeSharding')->totals(array(
                'app_id'  => "={$app_id}", 
                'user_id' => "={$this->user_id}"
            )), 
            $pagesize, 
            $pageno
        );

        return view("embed/application-node-list.html", array(
            'app'  => $app,
            'data' => $data,
        ));
    }

}
