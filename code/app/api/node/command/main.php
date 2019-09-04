<?php
/**
 * Node command Controller
 * 
 * @Note We need the current client sign in to do this
 * So here we extend the Session_Controller instead of C_Controller
 *
 *
*/

import('core.Session_Controller', false);

class CommandController extends Session_Controller
{
    
    /**
     * push a command to the target node
    */
    public function actionPush($input)
    {
        assert_std_tias($input, 'node.list', $node_id);
        $command = $input->post('command', array('/^[\s\S]{1,}$/'));
        if ( $command == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $cmd_exec = null;
        $command  = trim($command);
        $cmd_list = config('command');
        foreach ( $cmd_list as $pattern => $def ) {
            if ( preg_match($pattern, $command) == 1 ) {
                $cmd_exec = $def;
                $cmd_exec['exec'] = preg_replace(
                    $pattern, $cmd_exec['exec'], $command
                );
                break;
            }
        }

        if ( $cmd_exec == null ) {
            return json_view(STATUS_INVALID_ARGS, 'Unsupported command');
        }

        // push the command to the remote server
        $status = self::pushCommand(
            $this->user_id, $node_id, $cmd_exec['exec'], 
            CMD_SYNC_DONE_EXEC | CMD_SYNC_ERR_EXEC, 
            $data, $llen
        );
        if ( $status != STATUS_OK ) {
            return json_view($status, 'command push failed');
        }

        return json_view(STATUS_OK, array(
            'id'     => $data['Id'],
            'id_str' => "{$data['Id']}",
            'queue_len' => $llen,
            'exec' => $cmd_exec['exec'],
            'desc' => $cmd_exec['desc']
        ));
    }

    /**
     * command help
    */
    public function actionHelp($input)
    {
        $cmd_list = config('command');
        $data = array();
        foreach ( $cmd_list as $cmd ) {
            $data[] = array(
                'cmd'  => $cmd['cmd'],
                'desc' => $cmd['desc']
            );
        }

        // append the fixed client command
        $data[] = array(
            'cmd'  => 'clear',
            'desc' => '清空屏幕输出'
        );

        $data[] = array(
            'cmd'  => 'exit',
            'desc' => '退出当前终端'
        );

        return json_view(STATUS_OK, $data);
    }

    /**
     * send a reboot quick command
    */
    public function actionReboot($input)
    {
        $wait_min = $input->getInt('wait_min', 0);
        assert_std_tias($input, 'node.list', $node_id);

        /* 
         * To reboot the system we could use reboot or shutdown 
         * Here we use the shutdown -r -t $wait_sec to make sure the 
         * command execution result will be synchronized by default
        */
        if ( $wait_min < 0 ) {
            $wait_min = 0;
        } else if ( $wait_min > 10 ) {
            // basically now doing nothing
        }

        $status = self::pushCommand(
            $this->user_id, $node_id, "shutdown -r {$wait_min}", 
            CMD_SYNC_DONE_EXEC | CMD_SYNC_ERR_EXEC, 
            $data, $llen
        );
        if ( $status != STATUS_OK ) {
            return json_view($status, 'command push failed');
        }

        /* Update the node status to rebooting */
        if ( model('NodeStatisticsSharding')
            ->getShardingModelFromValue($this->user_id)
                ->setById('status', NODE_REBOOTING, $node_id) == false ) {
            // @TODO: do error log here
        }

        return json_view(STATUS_OK, array(
            'id'   => $data['Id'],
            'queue_len' => $llen,
            'exec' => 'reboot',
            'desc' => '系统重启'
        ));
    }

    /**
     * internal method to push a command to the remote server
     *
     * @param   $user_id
     * @param   $node_id
     * @param   $command
     * @param   $data
     * @return  Array
    */
    protected static function pushCommand(
        $user_id, $node_id, $command, $sync_mask, &$data=null, &$llen=0)
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
            't_type'    => 0,       # command line task
            'task_id'   => 0,       # no task id define
            'sync_mask' => $sync_mask,
            'status'    => 0,
            'progress'  => 0.00,
            'cmd_argv'  => '0',
            'cmd_text'  => $command,
            'res_data'  => '0',
            'res_error' => '0',
            'engine'    => 'bash',
            'sign'      => build_remote_command_sign(
                $node['node_uid'], $command, 'bash', $c_time
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
            return 7;
        }

        // set the command execution status
        $status = $mainPDSL->load(
            'RemoteCommandMap', $node['user_id'], $node['node_uid']
        )->set($data['Id'], json_encode(array(
            't_type'   => 0,    # command line task
            'task_id'  => 0,    # no task id define
            'status'   => 0,
            'progress' => 0.00,
            'send_at'  => $c_time,      // send unix time stamp
            'pull_at'  => 0,            // being pull unix time stamp
            'exec_at'  => 0,            // start execution unix time stamp
            'done_at'  => 0             // done execution unix time stamp
        )));
        if ( $status === false ) {
            return 8;
        }

        return STATUS_OK;
    }

}
