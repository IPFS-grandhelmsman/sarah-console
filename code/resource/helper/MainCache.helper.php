<?php
/**
 * main cacher helper
 *
 * 
*/

import('CacheHelper', false);

//------------------------------------
class MainCacheHelper extends CacheHelper
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
    //all the method of the cacher #baseKey(),#factor(),#fname(),#setTtl()
    //    MUST be invoked
    
    // semantics input cache
    public function NodeStatistics($input)
    {
        $name = isset($input[0]) ? $input[0] : 'stat';
        return self::getCacher('Memcached')
            ->baseKey("node.statistics")
                ->factor(null)->fname($name)->setTtl(180);
    }
    
}
?>
