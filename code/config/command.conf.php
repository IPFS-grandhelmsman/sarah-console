<?php
/**
 * all avalabile command define configuration file
 * @Note This command define is for simple terminal only
 * For some quick read and access operations like directory
 * list, file content read eg ...
 * @Note One basic single rule is: 
 * all the operations define here could be retracement and harmless.
 *
 *
*/

return array(
    // Regex Pattern => command define
    '/^ll$/'                => array(
        'exec' => 'ls -l',
        'cmd'  => 'll',
        'desc' => '列表当前目录的非隐藏文件'
    ),

    '/^ll\s+([^\s]+)$/'     => array(
        'exec' => 'ls -l $1',
        'cmd'  => 'll 目录路劲',
        'desc' => '列表指定目录的非隐藏文件'
    ),

    '/^ls$/'                => array(
        'exec' => 'ls',
        'cmd'  => 'ls',
        'desc' => '列表当前目录的非隐藏文件'
    ),

    '/^ls\s+([^\s]+)$/'     => array(
        'exec' => 'ls $1',
        'cmd'  => 'ls 目录路劲',
        'desc' => '列表指定目录的非隐藏文件'
    ),

    '/^ls\s+-l$/i'          => array(
        'exec' => 'ls -l',
        'cmd'  => 'ls -l',
        'desc' => '列表当前目录的下的非隐藏文件'
    ),

    '/^ls\s+([^\s]+)\s+-l$/i'   => array(
        'exec' => 'ls -l $1',
        'cmd'  => 'ls 目录路劲 -l',
        'desc' => '列表指定目录的下的非隐藏文件'
    ),

    '/^ls\s+-l\s+([^\s]+)$/i'   => array(
        'exec' => 'ls -l $1',
        'cmd'  => 'ls -l 目录路劲',
        'desc' => '列表指定目录的下的非隐藏文件'
    ),

    '/^ls\s+-a$/i'          => array(
        'exec' => 'ls -a',
        'cmd'  => 'ls -a',
        'desc' => '列表当前目录的下的全部文件'
    ),

    '/^ls\s+([^\s]+)\s+-a$/i'   => array(
        'exec' => 'ls -a $1',
        'cmd'  => 'ls 目录路径 -a',
        'desc' => '列表指定目录的下的全部文件'
    ),

    '/^ls\s+-a\s+([^\s]+)$/i'   => array(
        'exec' => 'ls -a $1',
        'cmd'  => 'ls -a 目录路径',
        'desc' => '列表指定目录的下的全部文件'
    ),

    '/^ls\s+-(la|al)$/i'    => array(
        'exec' => 'ls -$1',
        'cmd'  => 'ls -al',
        'desc' => '列表当前目录的下的全部文件'
    ),

    '/^ls\s+([^\s]+)\s+-(la|al)$/i'    => array(
        'exec' => 'ls -al $1',
        'cmd'  => 'ls 目录路径 -al',
        'desc' => '列表指定目录的下的全部文件'
    ),

    '/^ls\s+-(la|al)\s+([^\s]+)$/i'    => array(
        'exec' => 'ls -al $1',
        'cmd'  => 'ls -al 目录路径',
        'desc' => '列表指定目录的下的全部文件'
    ),

    '/^service\s+([a-z0-9A-Z\._-]{1,})\s+(start|reload|status|stop|restart)$/i' => array(
        'exec' => 'service $1 $2',
        'cmd'  => 'service 服务名 {start|stop|reload|status|restart}',
        'desc' => '调用service服务启动、重启、状态和停止指定服务'
    ),

    '/^cat\s+([^\s]+)$/i' => array(
        'exec' => 'cat $1',
        'cmd'  => 'cat 文件路径',
        'desc' => '查看指定文本文件的内容(超过10KB的文件请使用tail查看)'
    ),

    '/^tail\s+([^\s]+)$/i' => array(
        'exec' => 'tail $1',
        'cmd'  => 'tail 文件路径',
        'desc' => '查看指定文件的最后10行'
    ),

    '/^tail\s+-c\s+([\d]+)\s+([^\s]+)$/i' => array(
        'exec' => 'tail -c $1 $2',
        'cmd'  => 'tail -c 行数 文件路径',
        'desc' => '查看指定文件的最后指定行数'
    ),

    '/^ps$/' => array(
        'exec' => 'ps',
        'cmd'  => 'ps',
        'desc' => '查看当前终端运行的进程'
    ),

    '/^ps\s+-([auxef]+)$/' => array(
        'exec' => 'ps -$1',
        'cmd'  => 'ps -auxef',
        'desc' => '查看终端运行的进程的详细信息'
    ),

    '/^apt-get\s+install\s+([^\s]+)$/' => array(
        'exec' => 'apt-get install $1',
        'cmd'  => 'apt-get install app_name',
        'desc' => '安装指定的应用'
    ),

    '/^apt-get\s+update$/' => array(
        'exec' => 'apt-get update',
        'cmd'  => 'apt-get update',
        'desc' => '更新软件源信息'
    ),

    '/^shutdown\s+-c$/' => array(
        'exec' => 'shutdown -c',
        'cmd'  => 'shutdown -c',
        'desc' => '取消正在进行的shutdown操作'
    ),

    '/^md5sum\s+([^\s]+)$/' => array(
        'exec' => 'md5sum $1',
        'cmd'  => 'md5sum 文件路径',
        'desc' => '计算指定文件的md5签名值'
    ),

    '/^fdisk\s+-l$/' => array(
        'exec' => 'fdisk -l',
        'cmd'  => 'fdisk -l',
        'desc' => '磁盘设备列表'
    ),

    '/^hdparm\s+-(I|t|T|g)\s+([^\s]+)$/' => array(
        'exec' => 'hdparm -$1 $2',
        'cmd'  => 'hdparam -(I|t|T|g) 磁盘设备',
        'desc' => '查看指定磁盘设备的指定信息'
    ),

    '/^ifconfig$/' => array(
        'exec' => 'ifconfig',
        'cmd'  => 'ifconfig',
        'desc' => '查看网卡的网络信息'
    ),

    '/^du\s+-([chms]+)\s+([^\s]+)$/' => array(
        'exec' => 'du -$1 $2',
        'cmd'  => 'du -(chms) 目录地址',
        'desc' => '查看指定目录的统计信息'
    )

    // '/^kill\s+([0-9]+)$/i' => array(
    //     'cmd' => 'kill $1',
    //     'desc' => '通过进程Id结束指定进程'
    // ),

    // '/^reboot$/i' => array(
    //     'exec' => 'reboot',
    //     'cmd'  => 'reboot',
    //     'desc' => '重启系统'
    // )

);
