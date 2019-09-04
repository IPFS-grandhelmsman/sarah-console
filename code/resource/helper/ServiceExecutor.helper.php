<?php
/**
 * service executor helper
 *
 * 
*/

class ServiceExecutorHelper extends Helper
{
    /**
     * construct method
     *
     * @param    $conf
    */
    public function __construct($conf=NULL)
    {
        parent::__construct($conf);
    }

    /**
     * get the local executor
     *
     * @param   $sharding
     * @return  LocalExecutor
    */
    protected function createLocalExecutor($sharding=NULL)
    {
        import('service.LocalExecutor');
        return new LocalExecutor(NULL);
    }

    /**
     * get the Gearman executor
     * @Note added at 2017/01/03
     * if there is no GearmanClient class find (like php 7.0)
     * we will take the local executor instead
     *
     * @param   $sharding
     * @return  GearmanExecutor
    */
    protected function createGearmanExecutor($sharding)
    {
        if ( ! class_exists('GearmanClient') ) {
            return $this->createLocalExecutor();
        }

        import('service.GearmanExecutor');
        $conf = config("executor#{$sharding}");
        return new GearmanExecutor($conf);
    }

    public function Test($input)
    {
        //$async = isset($input[0]) ? $input[0] : false;
        //return $async ? $this->createGearmanExecutor('dist_main') : $this->createLocalExecutor();
        return $this->createLocalExecutor();
    }

    public function SceneHook($input)
    {
        $async = isset($input[0]) ? $input[0] : true;
        return $async 
            ? $this->createGearmanExecutor('dist_main') 
            : $this->createLocalExecutor();
    }

}
?>
