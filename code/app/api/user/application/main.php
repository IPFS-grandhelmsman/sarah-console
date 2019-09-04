<?php
/**
 * user application API controller
 * 
 * 
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class ApplicationController extends Session_Controller
{    

    public function actionEdit($input)
    {
        assert_std_tias($input, 'app.list', $app_id);

        $config_json = $input->post('config_json');
        if ( $config_json == false || strlen($config_json) < 10 ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        if ( ($json = json_decode($config_json, true)) == null ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        import('Filter');

        # Basic attributes checking and these must be needed
        $_fields = array(
            'exe_file'  => array('string',   9, '/^[a-zA-Z0-9-_]{2,32}$/'),
            'bootup'    => array('boolean', 10), 
            'monitor'   => array('boolean', 11), 
            'dynamic'   => array('boolean', 12), 
            'base_dir'  => array('string',  13, '/^\/[a-zA-Z0-9-_\/]{2,32}$/'),
            'log_dir'   => array('string',  14, '/^\/[a-zA-Z0-9-_\/]{2,32}$/'), 
            'data_dir'  => array('string',  15, '/^\/[a-zA-Z0-9-_\/]{2,32}$/'),

            'uninstall_rm_file' => array('boolean', 20),
            'uninstall_rm_log'  => array('boolean', 21),
            'uninstall_rm_data' => array('boolean', 22),

            'app_init_cmd' => array('string', 30, '/^[a-z0-9A-Z-_\/\{\}\$\.\s:=]{2,256}$/'),
            'app_boot_cmd' => array('string', 31, '/^[a-z0-9A-Z-_\/\{\}\$\.\s:=]{2,256}$/')
        );

        $json_pack = array();
        foreach ( $_fields as $K => $V ) {
            # field contain checking
            if ( ! isset($json[$K]) ) {
                return json_view($V[1], "Missing config field `{$K}`");
            }

            $item = $json[$K];
            if ( ! isset($item['value']) 
                || ! isset($item['desc']) ) {
                return json_view($V[1], "Invalid field `{$K}`, missing value and desc");
            }

            $value = $json[$K]['value'];
            $desc  = Filter::sanitizeHtml($json[$K]['desc']);
            if ( strlen($desc) < 1 || strlen($desc) > 60 ) {
                return json_view($V[1], "Desc for field `{$K}` is missing or too long");
            }

            # field type checking
            switch ( $V[0] ) {
            case 'boolean':
                if ( ! is_bool($value) ) {
                    return json_view(
                        $V[1], 
                        "Invalid type of field {$K} `boolean` needed"
                    );
                }
                break;
            case 'string':
                if ( ! is_string($value) ) {
                    return json_view(
                        $V[1], 
                        "Invalid type of field {$K} `string` needed"
                    );
                }

                $value = Filter::sanitizeHtml($value);
                if ( isset($V[2]) ) {
                    if ( preg_match($V[2], $value) != 1 ) {
                        return json_view($V[1], "Invalid field value `{$value}`");
                    }
                } else if ( strlen($value) > 256 ) {
                    return json_view($V[1], "Too long for field value `{$value}`");
                }
                break;
            case 'float':
                if ( ! is_float($value) ) {
                    return json_view(
                        $V[1], 
                        "Invalid type of field {$K} `float` needed"
                    );
                }
                break;
            case 'integer':
                if ( ! is_integer($value) ) {
                    return json_view(
                        $V[1], 
                        "Invalid type of field {$K} `integer` needed"
                    );
                }
                break;
            default:
                return json_view(
                    $V[1], 
                    "Invalid type of field {$K} option values `boolean,integer,float,string`"
                );
                break;
            }

            $json_pack[$K] = array(
                'value' => $value,
                'desc'  => $desc
            );
            unset($json[$K]);
        }

        # check the rest of the fields in JSON
        foreach ( $json as $K => $V ) {
            if ( ! isset($V['value']) || ! isset($V['desc']) ) {
                return json_view($V[1], "Invalid field `{$K}`, missing value and desc");
            }

            if ( preg_match('/^[a-zA-Z0-9_]{4,24}$/', $K) != 1 ) {
                return json_view(50, "Invalid field name `{$K}` 4 <= [a-z0-9A-Z_] <= 24");
            }

            $value = Filter::sanitizeHtml($V['value']);
            $desc  = Filter::sanitizeHtml($V['desc']);
            if ( strlen($desc) < 1 || strlen($desc) > 60 ) {
                return json_view(51, "Desc for field `{$K}` is missing or too long");
            }

            if ( strlen($value) > 256 ) {
                return json_view(52, "Too long for field value `{$K}`");
            }

            $json_pack[$K] = array(
                'value' => $value,
                'desc'  => $desc,
                'added' => true
            );
        }

        # now save the config
        $data = array(
            'config_json' => json_encode($json_pack),
            'updated_at'  => time()
        );

        $where = array(
            'user_id' => "={$this->user_id}",
            'app_id'  => "={$app_id}"
        );

        if ( model('UserApplicationSharding')->update($data, $where) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, array(
            'app_id'     => $app_id,
            'updated_at' => $data['updated_at']
        ));
    }

}
