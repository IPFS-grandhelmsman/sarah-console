<?php
/**
 * User Profile Api Controller
 *
 *
*/

import('core.Session_Controller', false);

// --------------------------------------------

class ProfileController extends Session_Controller
{

    public function actionUpdate($input)
    {
        $product_name = $input->post('product_name', array('/^[^`]{1,}$/'));
        $skin_name = $input->post('skin_name', array('/^[0-9a-zA-Z_-]{2,}$/'));
        if ( $product_name == false || $skin_name == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        if ( in_array($skin_name, array('default', 'dark', 'embed')) == false ) {
            return json_view(7, 'Invalid skin name define');
        }

        $c_time = time();
        $data = array(
            'product_name' => $product_name,
            'skin_name'    => $skin_name,
            '_updated_at'  => $c_time
        );

        if ( model('UserProfile')->updateById($data, $this->user_id) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, array(
            'user_id'    => $this->user_id,
            'updated_at' => $c_time
        ));
    }

}
