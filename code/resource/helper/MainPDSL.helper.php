<?php
/**
 * main pdsl helper
 *
 * 
*/

import('PDSLHelper', false);

//------------------------------------

class MainPDSLHelper extends PDSLHelper
{

    /** 
     * construct method
     *
     * @param   $conf
    */
    public function __construct($conf=null)
    {   
        parent::__construct($conf);
    }   

    //-----------README-----------------------
    //@Note: for every method blow:
    //all the method of the cacher #setKey() MUST be invoked

    public function RemoteCommandPool($input)
    {
        $user_id  = $input[0];
        $node_uid = $input[1];

        /*
         * @Note We have a day (24hours) to wait for the command to
         *  pull and invoke, This might be changed later .
        */
        return self::getList('RedisList')
            ->setKey("rc_list:{$user_id}.{$node_uid}")->setTtl(86400);
    }

    public function RemoteCommandMap($input)
    {
        $user_id  = $input[0];
        $node_uid = $input[1];

        /*
         * @Note We could wait for a day (24 hours) to wait for the command
         *  to be notified, This might be changed later .
        */
        return self::getMap('RedisMap')
            ->setKey("rc_map:{$user_id}.{$node_uid}")->setTtl(86400);
    }

    /**
     * computing task dispatch queue
    */
    public function ComputingTaskPool($input)
    {
        return self::getList('RedisList')->setKey('g:computing_task_list');
    }

    /**
     * application task dispatch queue
    */
    public function ApplicationTaskPool($input)
    {
        return self::getList('RedisList')->setKey('g:application_task_list');
    }

    /**
     * node post queue
    */
    public function NodePostPool($input)
    {
        return self::getList('RedisList')->setKey('g:node_post_list');
    }

}
