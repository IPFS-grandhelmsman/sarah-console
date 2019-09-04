<?php
/**
 * cache configuration array
 * 
 * 
*/

return array(
    /*
     * script local file cache:
    */
    'ScriptMerge'   => array(
        'key'   => 'NFile',
        'conf'  => array(
            'cache_dir' => APPPATH.'www/cache/',
            'length'    => 1000,
            'file_ext'  => '.js'
        )
    )

    /*
     * default ditributed memory cache:
     * 1. database search data with high concurrency requests
     * 2. page execution accelerate
    */
    ,'Memcached' => array(
        'key'   => 'Memcached',
        'conf'  => array(
            'servers'   => array(
                array('localhost', 11211, 100)    // host, port, weight
            ),
            'ttl'       => 600, // time to live, default not expired
            // default: standard,  consistent was recommended,
            // for more infomation,  search 'consistent hash'
            'hash_strategy' => 'consistent',
            'prefix'        => ''
        )
    ),

    /*
     * @added at 2015-08-24
     * for all kinds of verification service
    */
    'Verify_dmem'   => array(
        'key'   => 'Memcached',
        'conf'  => array(
            'servers'   => array(
                array('localhost', 11211, 100)    // host, port, weight
            ),
            'ttl'       => 600, // time to live, default not expired
            // default: standard,  consistent was recommended,
            // for more infomation,  search 'consistent hash'
            'hash_strategy' => 'consistent',
            'prefix'        => ''
        )
    )

);
