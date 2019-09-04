<?php
/**
 * User service password api Controller
 *
 *
*/

import('core.Session_Controller', false);

// ---------------------------------------------

class ServiceController extends Session_Controller
{

    public function actionUpdate($input)
    {
        $std_passwd  = $input->post('std_passwd');
        $new_spasswd = $input->post('new_spasswd');
        $rep_spasswd = $input->post('rep_spasswd');

        if ( $std_passwd == false 
            || $new_spasswd == false || $rep_spasswd == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        // password length and basic checking
        if ( strlen($std_passwd) < 8 ) {
            return json_view(7, 'password too short');
        }

        if ( strlen($new_spasswd) < 6 || strlen($new_spasswd) > 8 ) {
            return json_view(8, 'length of service password should be bettween 6 and 8');
        }

        if ( strcmp($new_spasswd, $rep_spasswd) != 0 ) {
            return json_view(9, 'New service password and repeat service password are not the same');
        }

        // check the old password is validity or not
        $userModel = model('User');
        $user = $userModel->getById(array('passwd', 'pass_salt'), $this->user_id);
        if ( $user == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        $passwd = sha1("{$std_passwd}@{$user['pass_salt']}");
        if ( strncmp($passwd, $user['passwd'], 40) != 0 ) {
            return json_view(10, 'Invalid password');
        }

        // Now try to update the service password
        // for safety we also update the pass salt here
        import('StringUtil');
        $p_salt = StringUtil::randomLetters(6, false);
        $passwd = sha1("{$new_spasswd}#{$p_salt}");
        $c_time = time();
        $data   = array(
            'service_passwd' => $passwd,
            'service_psalt'  => $p_salt,
            'updated_at'     => $c_time
        );
        
        if ( $userModel->updateById($data, $this->user_id) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, array(
            'user_id'    => $this->user_id,
            'updated_at' => $c_time
        ));
    }

}
