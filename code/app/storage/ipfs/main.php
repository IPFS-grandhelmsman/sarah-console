<?php
/**
 * IPFS storage controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class IpfsController extends Session_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        $pid = $input->getInt('id', 0);
        if ( $pid > 0 ) {
            assert_std_tias($input, 'storage.ipfs.list', $pid);
        }

        $pageno   = $input->getInt('pageno', 1);
        $pagesize = 10;

        # invoke the service to scroll the data sets
        # @see service.node.content#list
        $data = service('storage.ipfs.content.paging', array(
            'user_id'       => $this->user_id,
            'pid'           => $pid,
            'pagesize'      => $pagesize,
            'pageno'        => $pageno,
            'date_format'   => 'Y/m/d H:i',
            'type_format'   => true,
            'byte_convert'  => true,
            'order_by'      => 'created_at',
            'sort_by'       => 'desc'
        ));

        view_paging_register(
            model('IpfsFilesSharding')->totals(
                array(
                    'user_id' => "={$this->user_id}",
                    'pid'     => "={$pid}"
                )
            ), 
            $pagesize, 
            $pageno
        );

        return view("embed/storage-ipfs-list.html", array(
            'data' => $data == false ? array() : $data,
            'config' => array(
                'host'       => '120.76.197.135',
                'read_port'  => 5001,
                'write_port' => 8090
            )
        ));
    }

}
