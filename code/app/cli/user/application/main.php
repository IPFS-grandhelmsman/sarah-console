<?php
/**
 * user application Controller manager class
 *
 *
*/

class ApplicationController extends Cli_Controller
{

    public function actionInstall($input)
    {
        $user_id = $input->getInt('user_id');
        $app_id  = $input->getInt('app_id');
        if ( $user_id == false ) {
            exit("Error: Missing arguments user_id\n");
        }

        if ( $app_id == false ) {
            exit("Error: Missing arguments app_id\n");
        }

        $u = model('User')->getById(array('username'), $user_id);
        if ( $u == false ) {
            exit("Error: Invalid user_id\n");
        }

        $a = model('Application')->getById(array('name'), $app_id);
        if ( $a == false ) {
            exit("Error: Invalid app_id\n");
        }

        # make the user application data
        $data = array(
            'user_id'     => $user_id,
            'app_id'      => $app_id,
            'config_json' => '0',
            'created_at'  => time()
        );

        # insert the user data
        $Id = model('UserApplicationSharding')->add($data);
        if ( $Id == false ) {
            exit("Error: Fail to install a new user application\n");
        }

        return "user={$u['username']} successfully installed app={$a['name']}\n";
    }

    public function actionUninstall($input)
    {
        $user_id = $input->getInt('user_id');
        $app_id  = $input->getInt('app_id');
        if ( $user_id == false ) {
            exit("Error: Missing arguments user_id\n");
        }

        if ( $app_id == false ) {
            exit("Error: Missing arguments app_id\n");
        }

        $where = array('user_id' => "={$user_id}", 'app_id' => "={$app_id}");
        if ( model('UserApplicationSharding')->delete($where) == false ) {
            exit("Error: Fail to uninstall the user application\n");
        }

        return "user={$user_id} successfully uninstalled app={$app_id}\n";
    }

}
