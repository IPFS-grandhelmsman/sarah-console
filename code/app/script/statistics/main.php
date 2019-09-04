<?php
/**
 * Desktop script controller
 *
 * 
 */

class StatisticsController extends S_Controller
{

    public function actionIndex()
    {
        return array(
            'common/jquery.1.11.js',
            'common/echarts.min.js',
            'common/world.js',
            'desktop/link_params.js',
            'embed/node_map.js'
        );
    }

}
