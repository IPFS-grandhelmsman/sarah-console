<?php
/**
 * Node select controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class SelectController extends Session_Controller
{    

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        return view("{$this->skin}/node-select-list.html");
    }

}
