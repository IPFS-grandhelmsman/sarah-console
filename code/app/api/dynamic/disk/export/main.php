<?php
/**
 * disk dynamic api controller
 * 
 * 
*/

class ExportController extends C_Controller
{

    public function actionAdd($input)
    {
        $app_key  = $input->get('app_key', array('/^[a-zA-Z0-9_-]{32,56}$/'));
        $node_uid = $input->get('node_uid', array('/^[a-zA-Z0-9_-]{40}$/'));
        $seed = $input->get('seed', array('/^[0-9]{1,12}$/'));
        $sign = $input->get('sign', array('/^[a-zA-Z0-9_-]{1,32}$/'));
        $json = get_post_raw_data();
        
        if ( $app_key == false || $node_uid == false 
            || $seed == false || $sign == false || $json == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $jobj = NULL;
        if ( ($jobj = json_decode($json)) == NULL ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid JSON string');
        }

        // signature checking
        assert_app_key($app_key, $user_id);
        if ( strncmp($sign, md5("{$app_key}{$node_uid}{$json}{$seed}"), 32) != 0 ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid signature');
        }

        $act_code = 0;
        if ( $jobj->action == 'new' ) {
            $act_code = 1;
        } else if ( $jobj->action == 'remove' ) {
            $act_code = 2;
        } else if ( $jobj->action == 'damage') {
            $act_code = 3;
        } else {
            return json_view(STATUS_INVALID_ARGS, 'Invalid disk action');
        }


        $data = array(
            'user_id'    => $user_id,
            'device'     => $jobj->disk->name,
            'action'     => $act_code,
            'disk_info'  => json_encode($jobj->disk),
            'created_at' => time()
        );
        if ( ($data['Id'] = model('NodeDiskDynamicSharding')->add($data)) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, array(
            'Id'         => $data['Id'],
            'created_at' => $data['created_at']
        ));
    }

}
