<?php
//Framework Base Path
define('BASEPATH',          dirname(__DIR__).'/syrian/syrian/');
 
//Application base path
define('APPPATH',           dirname(__FILE__).'/');

define('SR_LIBPATH',        APPPATH.'resource/lib/');       //library directory name
define('SR_DATPATH',        APPPATH.'resource/data/');      //data directory name
define('SR_CONFPATH',       APPPATH.'config/');             //config directory name
define('SR_STATICPATH',     APPPATH.'www/static/');         //static directory name
define('SR_MODELPATH',      APPPATH.'resource/model/');     //model directory name
define('SR_CTRLPATH',       APPPATH.'app/');                //controller directory name
define('SR_HELPERPATH',     APPPATH.'resource/helper/');    //helper directory name
define('SR_VIEWPATH',       APPPATH.'resource/template/');  //template directory name
define('SR_CACHEPATH',      APPPATH.'storage/cache/');      //cache directory name
define('SR_TMPPATH',        APPPATH.'storage/tmp/');        //tmp directory name
define('SR_SERVICEPATH',    APPPATH.'resource/service/');   //service directory name
define('SR_SCRIPTPATH',     APPPATH.'resource/script/');    //script directory name
define('SR_UPLOADDIR',      'uploadfiles');
define('SR_UPLOADPATH',     APPPATH.'www/'.SR_UPLOADDIR.'/');
define('SR_CHARSET',        'utf-8');   //default charset
define('SR_POWERBY',        'Syrian/2.0');

/**
 * The cluster and the node name
 * foreach different running cluster
 * better keep it unique in case of the cross-site key use.
*/
define('SR_CLUSTER_NAME',   'c2FyYWguY29tfjFiMmMwYjY5NjU0YWRiNTNkMGY4MDkyMTI2YzM1YWVm');            // cluster name
define('SR_NODE_NAME',      'node1');               //define the node name

/*
 * require the framework kernel file
 * set the SR_INC_COMPONENTS to controll the parts to load
*/
define('SR_INC_COMPONENTS', 0xFF);
require(BASEPATH . 'core/Syrian.merge.min.php');

//-----------------------------------------------------------------

import('core.Function', false);
date_default_timezone_set('PRC');

/*
 * create the request input and output 
 * then register the output & uri to the global environment variables
*/
$input  = new Input(NULL);
$output = new Output();
E('output', $output);

/*
 * parse the current request uri that fetched througth $_SERVER['REQUEST_URI']
 * then locate the controller througth the parsed result
 * finally invoke the controller#run method to handler the request
 *
 * @see syrian.core.kerner.Function#parse_uri
 * @see syrian.core.kerner.Function#controller
 * @see app.core.Function#resource_preload_callback
*/

try {
    $uri = parse_uri($_SERVER['REQUEST_URI'], '/', array('statistics', 'index'));
    $ret = controller($uri, $input, $output, 'resource_preload_callback');
    $output->display(is_array($ret) ? json_encode($ret) : $ret);
} catch ( Exception $e ) {
    if ( SR_CLI_MODE ) echo $e, "\n";
    else {
        echo $e;
        echo("Oops, Something is wrong while processing the request \"{$_SERVER['REQUEST_URI']}\"\n");
    }

    //@Note: You may need to do the error log here
}
