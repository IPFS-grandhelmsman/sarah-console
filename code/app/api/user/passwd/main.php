<?php
/**
 * User Password Api Controller
 *
 *
*/

import('core.Session_Controller', false);

// ---------------------------------------------

class PasswdController extends Session_Controller
{

    public function actionUpdate($input)
    {
        $old_passwd = $input->post('old_passwd');
        $new_passwd = $input->post('new_passwd');
        $rep_passwd = $input->post('rep_passwd');

        if ( $old_passwd == false 
            || $new_passwd == false || $rep_passwd == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        // password length and basic checking
        if ( strlen($old_passwd) < 8 ) {
            return json_view(7, 'Old password too short');
        }

        if ( strlen($new_passwd) < 8 ) {
            return json_view(8, 'New password too short');
        }

        if ( strcmp($new_passwd, $rep_passwd) != 0 ) {
            return json_view(9, 'New password and repeat password are not the same');
        }

        // check the old password is validity or not
        $userModel = model('User');
        $user = $userModel->getById(array('passwd', 'pass_salt'), $this->user_id);
        if ( $user == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        $passwd = sha1("{$old_passwd}@{$user['pass_salt']}");
        if ( strncmp($passwd, $user['passwd'], 40) != 0 ) {
            return json_view(10, 'Invalid old password');
        }

        // Now try to update the password
        // for safety we also update the pass salt here
        import('StringUtil');
        $p_salt = StringUtil::randomLetters(6, false);
        $passwd = sha1("{$new_passwd}@{$p_salt}");
        $c_time = time();
        $data   = array(
            'passwd'     => $passwd,
            'pass_salt'  => $p_salt,
            'updated_at' => $c_time
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
