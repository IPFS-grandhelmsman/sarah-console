<?php
/**
 * client for sarah-jnode middleware service
 *
 * @since   1.5.0
 * 
*/

//-----------------------------------

class JNodeClient
{
    /**
     * server exchange protocol
    */
    private $protocol = 'http';

    /**
     * jnode server host
     * an ip address, domain name or whatever
    */
    private $host = 'localhost';

    /**
     * the server port and default to 1990
    */
    private $port = 8090;

    /**
     * default request timeout in seconds
    */
    private $timeout = 15;

    /**
     * construct method to initialize the instance
     *
     * @param   $conf - whatever you need
     * array(
     *  protocol => http,
     *  host => localhost,
     *  port => 1990
     * )
    */
    public function __construct($conf)
    {
        if ( isset($conf['protocol']) ) $this->protocol = $conf['protocol'];
        if ( isset($conf['timeout'])  ) $this->timeout  = $conf['timeout'];
        if ( isset($conf['host']) ) $this->host = $conf['host'];
        if ( isset($conf['port']) ) $this->port = $conf['port'];
    }

    /**
     * do the final http request and parse the server response
     * And this is the core part of all the other direct function interface
     *
     * @param   $uri with the query string maybe
     * @param   $param post arguments string or Array
     * @return  Mixed Array for succeed or false for failed
    */
    protected function _do_request($uri, $param=null)
    {
        $curl = curl_init();
        if( $this->protocol == 'https' ) {
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        }

        $postfields = NULL;
        if ( is_string($param) ) $postfields = $param;
        else if ( $param != null ) {
            $args = array();
            foreach ( $param as $key => $val) {
                $args[] = "{$key}=".urlencode($val);
            }

            $postfields = implode('&', $args);
            unset($args);
        }

        $url = "{$this->protocol}://{$this->host}:{$this->port}{$uri}";
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $postfields);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json; charset=utf-8',
            'User-Agent: jnode client 1.5/@lang:php/@date:2019-03-20',
            "token: SarahOS-6008647277c4454cecd97d33c069f0ca",
            "version: 1.5"
        ));
        curl_setopt($curl, CURLOPT_TIMEOUT, $this->timeout);

        $ret  = curl_exec($curl);
        $info = curl_getinfo($curl);
        curl_close($curl);

        /* http status 200 and the response string is a valid json string */
        if ( intval($info['http_code']) == 200 
            && ($json = json_decode($ret)) != null ) {
            return $json;
        }

        return false;
    }


    //---------------------interface-------------------

    /**
     * post the data to the jNode terminal
     *
     * @param   $data
     * @return  boolean
    */
    public function postData($data)
    {
        return $this->_do_request(
            '/node/data/post', is_array($data) ? json_encode($data) : $data
        );
    }

    /**
     * do the alert setting update
     *
     * @param   $text
     * @return  Mixed string or false for failed
    */
    public function updateAlert($data)
    {
        return $this->_do_request(
            '/alert/setting/update', is_array($data) ? json_encode($data) : $data
        );
    }

}
