<?php
/**
 * Script Controller manager class
 *
 *
*/

class ScriptController extends Cli_Controller
{

    public function actionLua($input)
    {
        $app_key = $input->get('app_key', array('/^[a-zA-Z0-9_-]{32,56}$/'));
        $node_id = $input->getInt('node_id');
        $demo = $input->get('demo', NULL, 'test');
        if ( $app_key == false || $node_id == false ) {
            return json_view(STATUS_INVALID_ARGS, 'app_key or node_id is not set');
        }

        assert_app_key($app_key, $user_id);
        $lua_code = self::load_lua_script($demo);
        if ( $lua_code == null ) {
            return json_view(STATUS_INVALID_ARGS, "Invalid demo={$demo}");
        }

        // push the command to the remote server
        $status = self::pushCommand(
            $user_id, $node_id, 'lua', $lua_code, 
            CMD_SYNC_DONE_EXEC | CMD_SYNC_ERR_EXEC, 
            $data, $llen
        );
        if ( $status != STATUS_OK ) {
            return json_view($status, 'script push failed');
        }

        return json_view(STATUS_OK, array(
            'id'   => $data['Id'],
            'queue_len' => $llen,
            'exec' => $lua_code,
            'desc' => 'lua script'
        ));
    }

    /**
     * internal interface to load the script content
    */
    protected static function load_lua_script($demo)
    {
        $demoFile = SR_DATPATH . "script/lua/{$demo}.lua";
        if ( ($handler = fopen($demoFile, 'r')) == false ) {
            return null;
        }

        $line = null;
        $code_blocks = array();
        while ( ! feof($handler) ) {
            $line = trim(fgets($handler, 2048));
            if ( strlen($line) == 0 ) {
                continue;
            }

            if ( $line[0] == '-' && $line[1] == '-' ) {
                continue;
            }

            $code_blocks[] = $line;
        }

        fclose($handler);
        return implode("\n", $code_blocks);
    }

    /**
     * internal method to push a block of script to the remote server
     *
     * @param   $user_id
     * @param   $node_id
     * @param   $cmd_text
     * @param   $data
     * @return  Array
    */
    protected static function pushCommand(
        $user_id, $node_id, $syntax, $cmd_text, $sync_mask, &$data=null, &$llen=0)
    {
        // get the node information
        $node = model('NodeSharding')
            ->getShardingModelFromValue($user_id)->closeFragment()
            ->getById(array('user_id', 'node_uid'), $node_id);
        if ( $node == false || $node['user_id'] != $user_id ) {
            return STATUS_INVALID_ARGS;
        }

        // add the command to the command model
        $c_time = time();
        $data = array(
            'user_id'   => $user_id,
            'node_id'   => $node_id,
            'sync_mask' => $sync_mask,
            'status'    => 0,
            'progress'  => 0.00,
            'cmd_argv'  => '0',
            'cmd_text'  => $cmd_text,
            'res_data'  => '0',
            'res_error' => '0',
            'engine'    => $syntax,
            'sign'      => build_remote_command_sign(
                $node['node_uid'], $cmd_text, $syntax, $c_time
            ),
            'created_at' => $c_time
        );

        $data['Id'] = model('NodeCommandSharding')->add($data);
        if ( $data['Id'] == false ) {
            return STATUS_FAILED;
        }

        // push the command package to the command pool of the current node
        $mainPDSL = helper('MainPDSL');
        $llen = $mainPDSL->load(
            'RemoteCommandPool', $node['user_id'], $node['node_uid']
        )->rpush(json_encode(array(
            'id' => $data['Id'],
            'sync_mask' => $sync_mask
        )));
        if ( $llen < 1 ) {
            // @TODO: do error log here
            return STATUS_FAILED;
        }

        // set the command execution status
        $status = $mainPDSL->load(
            'RemoteCommandMap', $node['user_id'], $node['node_uid']
        )->set($data['Id'], json_encode(array(
            'status'   => 0,
            'progress' => 0.00,
            'send_at'  => $c_time,      // send unix time stamp
            'pull_at'  => 0,            // being pull unix time stamp
            'exec_at'  => 0,            // start execution unix time stamp
            'done_at'  => 0             // done execution unix time stamp
        )));
        if ( $status === false ) {
            return STATUS_FAILED;
        }

        return STATUS_OK;
    }

}
