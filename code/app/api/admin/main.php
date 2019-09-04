<?php
/**
 * admin login Controller for the admin entrance
 *
 *
*/

class AdminController extends C_Controller
{
    private $consoleVCodeKey = 'console_vcode';

    public function actionLogin($input)
    {
        $username   = $input->post('username', array('/^[0-9a-zA-Z_]{4,}$/'));
        $verifycode = $input->post('verifycode', array('/^[a-z0-9A-Z]{4}$/'));
        $passwd     = $input->post('passwd', array('/^.{6,}$/'));
        
        if ( $username == false 
            || $passwd == false || $verifycode == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        //check the validate of the verify code with case sensitive
        if ( session($this->consoleVCodeKey) != strtolower($verifycode) ) {
            return json_view(8, 'Invalid verify code'); 
        }

        session($this->consoleVCodeKey, '');

        $adminModel = model('User');
        $ret = $adminModel->get('*', array('username' => "={$username}"));
        if ( $ret == false 
            || strncmp(sha1("{$passwd}@{$ret['pass_salt']}"), $ret['passwd'], 40) != 0 ) {
            return json_view(
                STATUS_ACCESS_DENY, 'Invalid username or password'
            );
        }

        //record the last login ip and login time
        import('Util');
        $user_id = $ret['Id'];
        $data    = array(
            'llogin_ip'   => Util::getIpAddress(true),
            'llogin_time' => time()
        );

        if ( $adminModel->updateById($data, $user_id) == false ) {
            //@TODO: do error log here
        }

        // load the basic profile information
        $profile = model('UserProfile')->getById(
            array('app_key', 'skin_name'), $user_id
        );
        if ( $profile == false ) {
            //@TODO: do error log here
        }

        if ( strlen($profile['skin_name']) > 2 ) {
            $skin_name = $profile['skin_name'];
        } else {
            $skin_name = 'default';
        }

		// assign admin id
        session('uid',     $ret['Id']);
        session('uname',   $ret['username']);
        session('app_key', isset($profile['app_key']) ? $profile['app_key'] : null);
        session('skin',   'dark');
        session('uAgent',  $input->server('HTTP_USER_AGENT'));
        
        return json_view(STATUS_OK, array(
            'uid' => $user_id
        ));
    }

}
