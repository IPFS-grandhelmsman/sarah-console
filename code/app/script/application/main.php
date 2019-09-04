<?php
/**
 * Desktop script controller
 *
 * 
 */

class ApplicationController extends S_Controller
{
    public function actionNodeList()
    {
        return array(
            'common/jquery.1.11.js',
            'common/JTE.js',
            'common/util.js',
            'common/validator.js',
            'desktop/link_params.js',
            'common/application.js',
            'embed/application_node_list.js',
            'embed/application_config.js',
            'embed/node_select_list.js'
        );
    }

    public function actionTaskList()
    {
        return array(
            'common/jquery.1.11.js',
            'common/JTE.js',
            'common/util.js',
            'desktop/link_params.js',
            'embed/application_task_list.js',
            'common/application.js',
            'embed/node_select_list.js'
        );
    }

    public function actionUserView()
    {
        return array(
            'common/jquery.1.11.js',
            'common/JTE.js',
            'common/validator.js',
            'common/util.js',
            'desktop/link_params.js',
            'embed/application_config.js'
        );
    }

    public function actionList()
    {
        return array(
            'common/jquery.1.11.js',
            'common/util.js',
            'desktop/link_params.js',
            'embed/application_list.js'
        );
    }

    public function actionView()
    {
        return array(
            'common/jquery.1.11.js',
            'common/util.js',
            'desktop/link_params.js',
            'embed/application_view.js'
        );
    }


}
