<?php
/**
 * Common Controller supper class for common application module
 *
 * 
*/

 //-----------------------------------------------------
import('Util');

class C_Controller extends Controller
{

    /*
     * @Note Override the run method to
     * 
     * 1, automatically define the data_type for the common ui
    */
    public function run($input, $output, $uri)
    {
        return parent::run($input, $output, $uri);
    }

}
