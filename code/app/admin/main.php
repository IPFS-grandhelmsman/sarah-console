<?php
/**
 * AdminController for the admin entrance
 *
 *
*/

class AdminController extends C_Controller
{
    private $consoleVCodeKey = 'console_vcode';

    public function actionLogin($input)
    {
        return view('login.html');
    }

    public function actionLogOut()
    {
        session_close();
        redirect('admin/login');
    }
    
    public function actionVerifyCode()
    {
        import('image.Verifycode');
        $verifyCode = Verifycode::getInstance()->setFontSize(25)->setX(25)->setY(35)->generate(4);
        session($this->consoleVCodeKey, strtolower($verifyCode->getCode()));
        $verifyCode->show();
    }

}
