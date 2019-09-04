<?php
/**
 * application common configuration setting
 *
 * 
*/

 //---------------------------------------------------------

$config = new StdClass();
$config->url     = 'http://sarah.grandhelmsman.com';
$config->img_url = 'http://sarah.grandhelmsman.com';

//script debug conf
$config->script = array(
    'debug'     => false,
    'compress'  => 0
);

$config->flush_key   = 'devnlu-flush-key';
$config->session_key = 'File';  //default session key

/*
 * script configuration
 * debug: merge & cache & compress the script ?
 * compress: compress level setting
*/
$config->script = array(
    'debug'     => true,
    'compress'  => 0
);

//distribute servers
// multiples web servers will be use to do the load balancing
//DNS resolution is the current way
//unique domain to the specifield server sets
$config->clusters   = array(
    'http://localhost/'
);

/*
 * admin allow access hosts
*/
$config->admin_allow_hosts  = array(
    'localhost' => true,
    'sarah.grandhelmsman.com'  => true,
);

return $config;
