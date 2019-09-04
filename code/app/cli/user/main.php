<?php
/**
 * Common user Controller manager class
 *
 *
*/

class UserController extends Cli_Controller
{

    public function actionIndex($input)
    {
    }

    public function actionAdd($input)
    {
        $username = $input->get('username');
        $password = $input->get('password');
        $product_name   = $input->get('product_name', null, '未命名项目');
        
        if ( $username == null ) {
            exit("Error: Missing arguments username\n");
        }

        if ( $password == null ) {
            exit("Error: Missing arguments password\n");
        }

        if ( strlen($password) < 8 ) {
            exit("Error: length of password should not be less than 8\n");
        }

        import('StringUtil');
        $p_salt = StringUtil::randomLetters(6, false);
        $passwd = sha1("{$password}@{$p_salt}");
        $c_time = time();

        # make the user data
        $data = array(
            'username'   => $username,
            'passwd'     => $passwd,
            'pass_salt'  => $p_salt,
            'created_at' => $c_time,

            # for user profile
            'app_key'        => null,
            'product_name'   => $product_name
        );

        # insert the user data
        $user_id = model('User')->openFragment()->add($data);
        if ( $user_id == false ) {
            exit("Error: Fail to create a new user record\n");
        }

        # generate a app_key for the current user
        $app_key = gen_app_key($user_id, $c_time);
        if ( model('UserProfile')->setById(
            'app_key', $app_key, $user_id) == false ) {
            exit("Error: Fail to set the UserProfile.app_key\n");
        }

        return "A new user created with Id={$user_id} and app_key={$app_key}\n";
    }

    # edit the specified user record
    public function actionEdit($input)
    {
        $user_id = $input->getInt('user_id');
        if ( $user_id == false ) {
            exit("Error: Missing argument user_id\n");
        }

        $username = $input->get('username');
        $password = $input->get('password');
        $product_name   = $input->get('product_name');

        $data = array();
        if ( $username != null && strlen($username) > 3 ) {
            $data['username'] = $username;
        }

        if ( $password != null && strlen($password) >= 8 ) {
            import('StringUtil');
            $p_salt = StringUtil::randomLetters(6, false);
            $passwd = sha1("{$password}@{$p_salt}");
            $data['passwd']    = $passwd;
            $data['pass_salt'] = $p_salt;
        }

        if ( $product_name != null 
            && strlen($product_name) >= 3 ) {
            $data['product_name'] = $product_name;
        }

        # check if there is any changes to save
        if ( empty($data) ) {
            exit("Error: No changes to save\n");
        }

        $data['updated_at'] = time();
        if ( model('User')->openFragment()
            ->updateById($data, $user_id) == false ) {
            exit("Error: Fail to save the changes\n");
        }

        return "Changes saved\n";
    }

    # update the app_key for the specified user
    public function actionSetAppKey($input)
    {
        $user_id = $input->getInt('user_id');
        if ( $user_id == false ) {
            exit("Error: Missing argument user_id\n");
        }

        # query the basic infor
        $user = model('User')->openFragment()->getById(
            array('created_at'), $user_id
        );

        if ( $user == false ) {
            exit("Error: Invalid user_id\n");
        }

        # generate a app_key for the current user
        $app_key = gen_app_key($user_id, intval($user['created_at']));
        if ( model('UserProfile')->setById(
            'app_key', $app_key, $user_id) == false ) {
            exit("Error: Fail to set the UserProfile.app_key\n");
        }

        return "UserProfile.Id={$user_id} app_key set to {$app_key}\n";
    }

}
?>
