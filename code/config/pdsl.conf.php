<?php
/**
 * pdsl configuration array at 2018/12/24
 * 
 * 
 */

return array(
    /*  
     * default redis list implementation
    */
    'RedisList' => array(
        'key'   => 'Redis',
        'conf'  => array(
            'servers' => array(
                array('127.0.0.1', 6379)
            ),  
            'ttl' => 0,
            'hash_strategy' => 'bkdr_hash',
            'prefix' => null
        )   
    ),   

    /*  
     * default redis map implementation
    */
    'RedisMap' => array(
        'key'   => 'Redis',
        'conf'  => array(
            'servers' => array(
                array('127.0.0.1', 6379)
            ),  
            'ttl' => 0,
            'hash_strategy' => 'bkdr_hash',
            'prefix' => null
        )   
    )   

);
