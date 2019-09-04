<?php
/**
 * Desktop script controller
 *
 * 
 */


class TaskController extends S_Controller
{

    public function actionList()
    {
        return array(
            'common/jquery.1.11.js',
            'common/util.js',
            'common/JTE.js',
            'desktop/link_params.js',
            'common/table_select.js',
            'embed/node_select_list.js',
            'embed/computing_task.js'
        );
    }

    public function actionCode()
    {
        return array(
            'common/jquery.1.11.js',
            'common/ace/ext-language_tools.js',
            'common/util.js',
            'desktop/link_params.js',
            'embed/get_auto_compute_tips.js',
            'embed/computing_task_coding.js'
        );
    }

    public function actionView()
    {
        return array(
            'common/jquery.1.11.js',
            'common/util.js',
            'common/table_select.js',
            'desktop/link_params.js',
            '/embed/computing_task_view.js'
        );
    }

    public function actionCommand()
    {
        return array(
            'common/jquery.1.11.js',
            'common/util.js',
            'desktop/link_params.js',
        );
    }
}
