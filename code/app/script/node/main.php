<?php
/**
 * Desktop script controller
 *
 * 
 */


class NodeController extends S_Controller
{

    public function actionList()
    {
        return array(
            'common/jquery.1.11.js',
            'common/md5.js',
            'common/util.js',
            'desktop/link_params.js',
            'common/table_select.js',
            'embed/node_list.js',
            'embed/node_operation.js'
        );
    }

    public function actionMonitor()
    {
        return array(
            'common/jquery.1.11.js',
            'common/echarts.common.min.js',
            'desktop/link_params.js',
            'common/util.js',
            'embed/get_node_status.js',
            'embed/node_line.js',
            'embed/node_operation.js'
        );
    }

    public function actionManager()
    {
        return array(
            'common/jquery.1.11.js',
            'common/JTE.js',
            'common/util.js',
            'desktop/link_params.js',
            'embed/get_node_status.js',
            'embed/node_manage.js',
            'embed/node_operation.js'
        );
    }

    public function actionView()
    {
        return array(
            'common/jquery.1.11.js',
            'common/util.js',
            'desktop/link_params.js',
            'embed/node_operation.js'
        );
    }

}
