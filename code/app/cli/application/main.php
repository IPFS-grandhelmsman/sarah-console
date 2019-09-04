<?php
/**
 * Common Application Controller manager class
 *
 *
*/

class ApplicationController extends Cli_Controller
{

    public function actionAdd($input)
    {
        $name  = $input->get('name');
        $intro = $input->get('intro');
        $debug = $input->getBoolean('debug');
        
        if ( $name == null ) {
            exit("Error: Missing arguments name\n");
        }

        if ( $intro == null ) {
            exit("Error: Missing arguments intro\n");
        }

        # make the application data
        $data = array(
            'name'  => $name,
            'intro' => $intro,
            'icon_url'          => '0',
            'install_engine'    => 'lua',
            'install_script'    => self::loadScript('app-install'),
            'startup_engine'    => 'lua',
            'startup_script'    => self::loadScript('app-start'),
            'stop_engine'       => 'lua',
            'stop_script'       => self::loadScript('app-stop'),
            'uninstall_engine'  => 'lua',
            'uninstall_script'  => self::loadScript('app-uninstall'), 
            'config_json'       => json_encode(array(
                # about application
                'exe_file'  => array(
                    'value' => strtolower($name),       // binary executable file name
                    'desc'  => '可执行程序名称'
                ),

                # about install and boot up
                'bootup'    => array(
                    'value' => true,                // boot up ?
                    'desc'  => '开机启动'
                ),
                'monitor'   => array(
                    'value' => true,                // monitor the current process ?
                    'desc'  => '进程监测'
                ),
                'dynamic'   => array(
                    'value' => false,               // post the process dynamic ?
                    'desc'  => '推送进程动态'
                ),
                'base_dir'  => array(
                    'value' => "/opt/{$name}",      // package install base directory
                    'desc'  => '应用根目录'
                ),
                'log_dir'   => array(
                    'value' => "/data/{$name}/log",  // log base directory
                    'desc'  => '日志目录'
                ),
                'data_dir'  => array(
                    'value' => "/data/{$name}/data", // data base directory
                    'desc'  => '数据目录'
                ),

                # about uninstall
                'uninstall_rm_file' => array(
                    'value' => true,                // remove the files while uninstall 
                    'desc'  => '卸载时删除安装文件'
                ),
                'uninstall_rm_log'  => array(
                    'value' => false,               // remove the logs while uninstall
                    'desc'  => '卸载时是否删除日志'
                ),
                'uninstall_rm_data' => array(
                    'value' => false,               // remove the data while uninstall
                    'desc'  => '卸载时是否删除数据(谨慎)'
                ),

                # about init and boot
                'app_init_cmd'  => array(
                    'value' => '${base_dir}/${exe_file} init --devnet-user --genesisfile=http://user.kittyhawk.wtf:8020/genesis.car --repodir=${data_dir}',
                    'desc'  => '应用初始化命令'
                ),
                'app_boot_cmd'  => array(
                    'value' => '${base_dir}/${exe_file} daemon --repodir=${data_dir}',
                    'desc'  => '应用启动命令'
                )
            )),
            'created_at'    => time()
        );

        # insert the user data
        $app_id = model('Application')->setDebug($debug)->add($data);
        if ( $app_id == false ) {
            exit("Error: Fail to create a new application with name={$name}\n");
        }

        return "A new application created with Id={$app_id}\n";
    }

    protected static function loadScript($file)
    {
        $scriptFile = SR_DATPATH . "script/lua/{$file}.lua";
        if ( ($handler = fopen($scriptFile, 'r')) == false ) {
            return null;
        }

        $line = null;
        $code_blocks = array();
        while ( ! feof($handler) ) {
            # $line = trim(fgets($handler, 2048));
            $line = fgets($handler, 2048);
            if ( strlen(trim($line)) == 0 ) {
                continue;
            }

            if ( $line[0] == '-' && $line[1] == '-' ) {
                continue;
            }

            $code_blocks[] = $line;
        }

        fclose($handler);
        return implode('', $code_blocks);
    }

    public function actionConfig($input)
    {
        $name = $input->get('name');
        if ( $name == false ) {
            return "[Error]: missing name arguments\n";
        }

        $init_argv = $input->get('init_argv', null, '');
        $boot_argv = $input->get('boot_argv', null, '');
        return json_encode(array(
            # about application
            'exe_file'  => array(
                'value' => strtolower($name),       // binary executable file name
                'desc'  => '可执行程序名称'
            ),

            # about install and boot up
            'bootup'    => array(
                'value' => true,                // boot up ?
                'desc'  => '开机启动'
            ),
            'monitor'   => array(
                'value' => true,                // monitor the current process ?
                'desc'  => '进程监测'
            ),
            'dynamic'   => array(
                'value' => false,               // post the process dynamic ?
                'desc'  => '推送进程动态'
            ),
            'base_dir'  => array(
                'value' => "/opt/{$name}",      // package install base directory
                'desc'  => '应用根目录'
            ),
            'log_dir'   => array(
                'value' => "/data/{$name}/log",  // log base directory
                'desc'  => '日志根目录'
            ),
            'data_dir'  => array(
                'value' => "/data/{$name}/data", // data base directory
                'desc'  => '数据根目录'
            ),

            # about uninstall
            'uninstall_rm_file' => array(
                'value' => true,                // remove the files while uninstall 
                'desc'  => '卸载时删除安装文件'
            ),
            'uninstall_rm_log'  => array(
                'value' => false,               // remove the logs while uninstall
                'desc'  => '卸载时是否删除日志'
            ),
            'uninstall_rm_data' => array(
                'value' => false,               // remove the data while uninstall
                'desc'  => '卸载时是否删除数据(谨慎)'
            ),

            # about init and boot
            'app_init_cmd'  => array(
                'value' => '${base_dir}/${exe_file} init --devnet-user --genesisfile=http://user.kittyhawk.wtf:8020/genesis.car --repodir=${data_dir}',
                'desc'  => '应用初始化命令'
            ),
            'app_boot_cmd'  => array(
                'value' => '${base_dir}/${exe_file} daemon --repodir=${data_dir}',
                'desc'  => '应用启动命令'
            )
        ));
    }

    public function actionScript($input)
    {
        $opt = $input->get('opt');
        if ( $opt == false ) {
            exit("[Error]: Missing argument opt=[install|start|stop|uninstall]\n");
        }

        if ( $opt == 'install' ) {
            return self::loadScript('app-install');
        } else if ( $opt == 'start' ) {
            return self::loadScript('app-start');
        } else if ( $opt == 'stop' ) {
            return self::loadScript('app-stop');
        } else if ( $opt == 'uninstall' ) {
            return self::loadScript('app-uninstall');
        }
    }

}
