<?php
/**
 * super class for PDSL Helper
 *
 * 
*/

 //-----------------------------------------------------

class PDSLHelper extends Helper
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

    /**
     * quick interface to create the list instance
     *
     * @param   $key service cache name
     */
    protected static function getList($key)
    {
        static $_loaded = array();

        if ( isset($_loaded[$key]) ) {
            $conf = $_loaded[$key];
        } else {
            $conf = $_loaded[$key] = config("pdsl#{$key}", false);
        }

        import('pdsl.ListFactory');
        return ListFactory::create(
            isset($conf['key'])  ? $conf['key']  : $key,
            isset($conf['conf']) ? $conf['conf'] : $conf
        );
    }


    /**
     * quick interface to create the Map instance
     *
     * @param   $key service cache name
     */
    protected static function getMap($key)
    {
        static $_loaded = array();

        if ( isset($_loaded[$key]) ) {
            $conf = $_loaded[$key];
        } else {
            $conf = $_loaded[$key] = config("pdsl#{$key}", false);
        }

        import('pdsl.MapFactory');
        return MapFactory::create(
            isset($conf['key'])  ? $conf['key']  : $key,
            isset($conf['conf']) ? $conf['conf'] : $conf
        );
    }

}
