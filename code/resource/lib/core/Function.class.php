<?php
/**
 * Application layer common functions
 *
 * 
 * @link    http://www.lionsoul.org/syrian
 * @see     framework/core/kerner/Function.php
 */

//-----------------------------------------------------------------

//standart error no define
const STATUS_OK             = 0;    //everything is fine
const STATUS_INVALID_ARGS   = 1;    //invalid arguments
const STATUS_NO_SESSION     = 2;    //no session
const STATUS_EMPTY_SETS     = 3;    //query empty sets
const STATUS_FAILED         = 4;    //operation failed
const STATUS_DUPLICATE      = 5;    //operation duplicate
const STATUS_ACCESS_DENY    = 6;    //privileges deny

const STATUS_SPASSWD_INVALID   = 50; // service password invalid
const STATUS_SPASSWD_NOT_SET   = 51; // service password not set
const STATUS_SPASSWD_INCORRECT = 52; // service password incorrect

// Note status constants define
const NODE_DOWN_SEC_FACTOR  = 60;
const NODE_DOWN      = 0;
const NODE_RUNNING   = 1;
const NODE_REBOOTING = 2;

// command synchronized control mask define
// @Note This should be the same with the sarah-client mask define
const CMD_SYNC_ERR_EXEC   = 0x01 << 0;
const CMD_SYNC_START_EXEC = 0x01 << 1;
const CMD_SYNC_ING_EXEC   = 0x01 << 2;
const CMD_SYNC_DONE_EXEC  = 0x01 << 3;

/**
 * Alert mode constants
 */
const EMAIL_ALERT   = 0x01 << 1;  // email alert
const MOBILE_ALERT  = 0x01 << 2; // mobile message alert
const WEICHAT_ALERT = 0x01 << 3; // push wechat message

// alert type contants
const ALERT_TYPE_LOADAVG     = 1; // loadavg alert
const ALERT_TYPE_RAM         = 2; // ram alert
const ALERT_TYPE_DISK        = 3; // disk alert
const ALERT_TYPE_INCOMING_BD = 4; // upload bandwith
const ALERT_TYPE_OUTGOING_BD = 5; // download bandwith
const ALERT_TYPE_FAULT = 6; // Server failure(downtime, network disconnection, etc.)
const ALERT_TYPE_CPU_FAN = 7; // cpu fan
const ALERT_TYPE_CPU_TEMP = 8; // cpu temperatrue


// application node status
const NODE_APP_TOBE_INSTALL     = 0;
const NODE_APP_INSTALL_ING      = 1;
const NODE_APP_TOBE_START       = 2;
const NODE_APP_START_ING        = 3;
const NODE_APP_RUNNING          = 4;
const NODE_APP_STOP_ING         = 5;
const NODE_APP_UNINSTALL_ING    = 6;
const NODE_APP_UNINSTALLED      = 7;


/**
 * quick way to response the data througth json view
 * and it will return the whole json encoded data string
 *
 * @param   $errno
 * @param   $data
 * @param   $ext    extension data
 * @return  string (json encoded)
*/
function json_view($errno, $data, $ext=NULL)
{
    //set the output content type
    E('output')->setHeader('Content-Type', 'application/json');

    $json = array(
        'errno'  => $errno,
        'data'   => $data
    );

    if ( $ext != NULL ) {
        $json['ext'] = $ext;
    }

    return json_encode($json);
}

/**
 * quick way to response the data througth json view
 * and it return the whole encoded data string 
 * @Note: and the data could be a json encoded string
 *
 * @param   $errno
 * @param   $data
 * @param   $ext    extension data
 * @return  string (data json encoded string)
*/
function json_define_view($errno, $data, $ext=NULL)
{
    //set the output content type
    E('output')->setHeader('Content-Type', 'application/json');

    if ( is_array($data) ) {
        $data = json_encode($data);
    }

    if ( $ext == NULL ) $ext = 'false';
    else if ( is_array($ext) ) $ext = json_encode($ext);

    $CC = <<<EOF
    {
        "errno": $errno,
        "data": $data,
        "ext": $ext
    }
EOF;

    return $CC;
}

/**
 * quick interface to build or fetch the cache
 *
 * @param   $key cache service logic name defined in config/cache.conf.php
 * @return  Object specified cache object
 * @see     app/config/cache.config.php
*/
function build_cache($key='NFile')
{
    static $_loaded = array();

    if ( isset($_loaded[$key]) ) {
        return $_loaded[$key];
    }

    import('cache.CacheFactory');
    $conf  = config("cache#{$key}");
    $cache = CacheFactory::create($conf['key'], $conf['conf']);

    //cache the current cache instance
    $_loaded[$key] = $cache;

    return $cache;
}

/**
 * quick interface to build or fetch the session
 *
 * @param   $key session service logic name defined in the config/session.conf.php
 * @param   $sessid user-define session id
 * @return  Object specified session object
 * @see     app/config/session.conf.php
*/
function build_session($key='File', $gen=false, $sessid=null)
{
    static $_loaded = array();

    if ( isset($_loaded[$key]) ) {
        return $_loaded[$key];
    }

    import('Session', false);
    $conf = config("session#{$key}");
    if ( $sessid != null ) {
        $conf['sessid'] = $sessid;
    }

    //create and cache the session instance
    $sess = new Session($key, $conf);
    $_loaded[$key] = $sess;

    return $sess->start($gen, $sessid);
}

/**
 * quick way to start and handler the mempure session
 * As a totally rewrite session implements and this has no
 * conflicts with the original php internal session
 *
 * @param   $key
 * @param   $val
 * @return  Mixed(The value mapping with the key or the session Object)
*/
function pure_session($key, $val=null)
{
    $e_name = 'pure_session_start';
    if ( ($sessObj = E($e_name)) == null ) {
        import('session.SessionFactory');
        $config  = config("session#Mempure");
        $sessObj = SessionFactory::create(
            $config['key'], $config['conf']
        );

        $sessObj->start();
        E($e_name, $sessObj);
    }

    if ( $val === null ) {
        return $sessObj->get($key);
    }

    $sessObj->set($key, $val);
    return $sessObj;
}

/**
 * application layer dynamic request resource pre-load
 * main for #controller function, cuz:
 * import('core.Cli_Controller') will cause the singal not working
 * and pre-load is the current way i choose to solve this problem
 *
 * @param   $uri (standart parse_uri result)
*/
function resource_preload_callback($uri)
{
    switch ( $uri->parts[0] ) {
    case 'cli':
        import('core.Cli_Controller', false);
        break;
    case 'script':
        import('core.S_Controller', false);
        break;
    case 'console':
        import('core.Console_Controller', false);
        break;
    #add more case here
    default:
        import('core.C_Controller', false);
        break;
    }
}

/**
 * build the standart ias arguments
 *
 * @param   $secret_type
 * @param   $id
 * @param   $timestamp
 * @return  String
*/
function build_std_tias($secret_type, $id, $timestamp)
{
    $acm  = sprintf(
        "%04x-%02x-%02x",
        date('Y', $timestamp),
        date('m', $timestamp),
        date('d', $timestamp)
    );
    $id   = intval($id);
    $sign = build_signature(array($secret_type, $id, $acm, 'tias'));
    return "id={$id}&acm={$acm}&sign={$sign}";
}

/**
 * validate the standart id,acm,sign arguments with a secret type string
 *
 * @param   $input
 * @param   $secret_type
 * @param   $id
 * @param   $acm
 * @param   $sign
 * @return  bool
*/
function valid_std_tias($input, $secret_type, &$id=null, &$acm=null, &$sign=null)
{
    $id   = $input->getInt('id');
    $acm  = $input->get('acm',  array('/^[\w-]{10,15}$/'));
    $sign = $input->get('sign', array('/^\w{40}$/'));
    if ( $id == false || $acm == false || $sign == false 
        || valid_signature(
            array($secret_type, $id, $acm, 'tias'), $sign) == false ) {
        return false;
    }

    return true;
}

/**
 * assert the standart id,acm,sign arguments with a secret data type
 * if everything is fine and it will just assign the variable
 * or output the standart json error and exit
 *
 * @param   $input
 * @param   $secret_type
 * @param   $id
 * @param   $acm
 * @param   $sign
*/
function assert_std_tias($input, $secret_type, &$id=null, &$acm=null, &$sign=null)
{
    if ( valid_std_tias($input, $secret_type, $id, $acm, $sign) == false ) {
        E('output')->display(
            json_view(STATUS_INVALID_ARGS, 'Invalid Arguments')
        );
        exit();
    }
}

/**
 * display the prompt message and exit the program
 *
 * @param   $type (optional value: info, warning, danger, success)
 * @param   $message
 * @param   $package
*/
function throw_prompt($type, $message, $package=null)
{
    E('output')->display(
        view("{$package}/prompt.html", array(
            'type'    => $type,
            'message' => $message
        ))
    );
    exit();
}


/**
 * get the positive numeric length
 *
 * @param   $num
 * @return  int
*/
function numeric_length($num)
{
    if ( $num < 10 ) {
        return 1;
    } else if ( $num < 100 ) {
        return 2;
    }

    return 3;
}

/**
 * check if the current request is login or not
 * 
 * @param   $input
 * @param   $user_id
 * @param   boolean
*/
function is_logged_in($input, &$user_id=null)
{
    if ( session('uid') == null
        || session('uname') == null
        || strcmp(session('uAgent'), 
            $input->server('HTTP_USER_AGENT')) != 0 ) {
        return false;
    }

    $user_id = session('uid');
    return true;
}

/**
 * assert the login status
 *
 * @param   $input
 * @param   $user_id
*/
function assert_logged_in($input, &$user_id=null)
{
    if ( is_logged_in($input, $user_id) == false ) {
        E('output')->display(
            json_view(STATUS_NO_SESSION, 'No session')
        );
        exit();
    }
}


/**
 * generate a new app key
 *
 * @param   $user_id
 * @param   $c_time
 * @return  String
*/
function gen_app_key($user_id, $c_time)
{
    $cls_seed = SR_CLUSTER_NAME;
    $md5_seed = md5("^{$cls_seed}#{$user_id}@{$c_time}!@#");
    // $seed_s[] = substr($md5_seed,  0, 8);
    // $seed_s[] = substr($md5_seed,  8, 4);
    // $seed_s[] = substr($md5_seed, 12, 4);
    $seed_s[] = $md5_seed;
    $seed_s[] = sprintf("%08x", $user_id);
    $seed_s[] = sprintf("%08x", $c_time);

    return implode('', $seed_s);
}

/**
 * check if the given app key is validate or not
 *
 * @param   $app_key
 * @param   $user_id
 * @return  boolean
*/
function is_app_key($app_key, &$user_id=0)
{
    $key_len  = strlen($app_key);
    if ( $key_len != 48 ) {
        return false;
    }

    $cls_seed = SR_CLUSTER_NAME;
    $user_id  = hexdec(substr($app_key, 32, 8));
    $c_time   = hexdec(substr($app_key, 40, 8));
    $md5_seed = md5("^{$cls_seed}#{$user_id}@{$c_time}!@#");

    return (strncmp($md5_seed, $app_key, 32) == 0);
}

/**
 * assert the app key
 *
 * @param   $app_key
*/
function assert_app_key($app_key, &$user_id=0)
{
    if ( is_app_key($app_key, $user_id) == false ) {
        E('output')->display(
            json_view(STATUS_INVALID_ARGS, 'Invalid app_key')
        );
        exit();
    }
}

/**
 * bytes to string
 *
 * @param   $bytes
 * @return  string
*/
function bytes_to_string($bytes, $decimal=2)
{
    $n_val = 0;
    $u_val = 'B';

    if ( $bytes < 1024 ) {
        $n_val = $bytes;
        $u_val = 'B';
    } else if ( $bytes < 1048576 ) {        // MB = 1024 * 1024
        $n_val = $bytes / 1024;
        $u_val = 'KB';
    } else if ( $bytes < 1073741824 ) {     // GB = 1024 * 1024 * 1024
        $n_val = ($bytes / 1048576);
        $u_val = 'MB';
    } else if ( $bytes < 1099511627776 ) {  // TB = 1024 * 1024 * 1024 * 1024
        $n_val = ($bytes / 1073741824);
        $u_val = 'GB';
    } else {
        $n_val = ($bytes / 1099511627776);
        $u_val = 'TB';
    }

    // check and do the decimal format
    if ( $decimal == 0 ) {
        $n_val = ceil($n_val);
    } else {
        $n_val = number_format($n_val, $decimal, '.', '');
    }

    return "{$n_val}{$u_val}";
}

/**
 * build the signature for the specified command
 * @Note This should be the same for the sarah-client verification procedure
 *
 * @param   $node_uid
 * @param   $cmd
 * @param   $engine
 * @param   $timestamp
*/
function build_remote_command_sign($node_uid, $cmd, $engine, $timestamp)
{
    return md5("{$node_uid}{$cmd}{$engine}{$timestamp}");
}

/**
 * define node status
 *
 * @param   $val
 * @return  bool
*/
function node_status_define(&$val)
{
    if ( ! isset($val['status']) 
        || ! isset($val['updated_at']) ) {
        return false;
    }

    if ( $val['status'] == 0 ) {
        $val['status'] = NODE_DOWN;
    } else if ( $val['status'] == 2 ) {
        if ( (time() - $val['updated_at']) >= 2 * NODE_DOWN_SEC_FACTOR ) {
            $val['status'] = NODE_DOWN;
        } else {
            $val['status'] = NODE_REBOOTING;
        }
    } else if ( $val['status'] == 1 
        && (time() - $val['updated_at']) >= NODE_DOWN_SEC_FACTOR ) {
        $val['status'] = NODE_DOWN;
    } else {
        $val['status'] = NODE_RUNNING;
    }

    return true;
}

/**
 * check if the specified node application is
 *  in the specified status set.
 *
 * @param   status
 * @param   ...
 * @return  bool
*/
function status_in_list()
{
    if ( func_get_args() < 2 ) {
        return false;
    }

    $argv = func_num_args();
    $status = intval(array_shift($argv));
    foreach ( $argv as $item ) {
        if ( $status == $item ) {
            return true;
        }
    }

    unset($argv, $status);
    return false;
}

/**
 * assert the service password
 *
 * @param   user_id
 * @param   service_passwd
*/
function assert_service_passwd($user_id, $service_passwd)
{
    if ( $service_passwd == false 
        || strlen($service_passwd) < 6 || strlen($service_passwd) > 8 ) {
        E('output')->display(
            json_view(STATUS_SPASSWD_INVALID, 'Service passwd invalid')
        );
        exit();
    }

    $user = model('User')->getById(
        array('service_passwd', 'service_psalt'), $user_id);
    if ( $user == false ) {
        E('output')->display(
            json_view(STATUS_INVALID_ARGS, 'Fail to get the user')
        );
        exit();
    }

    if ( strlen($user['service_passwd']) != 40 ) {
        E('output')->display(
            json_view(STATUS_SPASSWD_NOT_SET, 'Service passwd not set')
        );
        exit();
    }

    if ( strncmp($user['service_passwd'], 
        sha1("{$service_passwd}#{$user['service_psalt']}"), 40) != 0 ) {
        E('output')->display(
            json_view(STATUS_SPASSWD_INCORRECT, 'Service passwd incorrect')
        );
        exit();
    }
}
