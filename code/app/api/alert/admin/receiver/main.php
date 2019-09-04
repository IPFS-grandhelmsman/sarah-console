<?php
/**
 * receiver controller
 *
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class ReceiverController extends Session_Controller
{
    /**
     * Adding a alert receiver
     * @param Input $input
     * @return string
     */
    public function actionAdd(Input $input)
    {

        $data = $this->_collectData($input);
        if (is_string($data)) {
            return json_view(STATUS_INVALID_ARGS, $data);
        }
        $data['user_id'] = $this->user_id;
        $data['created_at'] = time();
        $data['updated_at'] = $data['created_at'];
        if (($data['Id'] = model("AlertReceiver")->add($data)) == false) {
            return json_view(STATUS_FAILED, "Faild");
        } else {
            return json_view(STATUS_OK, array(
                'receiver' => $data
            ));
        }

    }

    /**
     * @param Input $input
     * @return string
     */
    public function actionUpdate(Input $input)
    {
        $id = $input->post("id", array(OP_NUMERIC));
        $data = $this->_collectData($input);
        if (is_string($data)) {
            return json_view(STATUS_INVALID_ARGS, $data);
        }
        $data['updated_at'] = time();
        if (model("AlertReceiver")->update($data,
                array('id' => "={$id}", 'user_id' => "={$this->user_id}")) == false) {
            return json_view(STATUS_FAILED, "Faild");
        } else {
            $data['Id'] = $id;
            return json_view(STATUS_OK, $data);
        }
    }

    /**
     * colleting the data of request
     * @param Input $input
     * @return array|bool
     */
    private function _collectData(Input $input) {
        $name = $input->post('name', array(OP_STRING, OP_LIMIT(0, 12), OP_SANITIZE_HTML));
        $mobile = $input->post('mobile', array(OP_MOBILE));
        $email = $input->post('email', array(OP_EMAIL));
        $wxOpenId = $input->post('wx_openid', array(OP_STRING, NULL, OP_SANITIZE_HTML));

        if ($name == false) {
            return "姓名填写不合法";
        }
        if ($email == false) {
            return "邮箱填写不合法";
        }
        if ($mobile == false) {
            return "手机填写不合法";
        }

        $data = array(
            'name' => $name,
            'mobile' => $mobile,
            'email' => $email,
            'wx_openid' => $wxOpenId
        );
        return $data;
    }


    /**
     * alert receiver list
     * @param Input $input
     * @return string
     */
    public function actionList(Input $input) {

        // get all receivers
        $receivers = service('alert.receiver.paging', array(
            'user_id'      => $this->user_id,
            'pageno'        => 1,
            'pagesize'      => 10,
            'date_format'    => 'Y-m-d H:i:s',
            'order' => 'Id DESC'
        ));
        if (empty($receivers)) {
            return json_view(STATUS_EMPTY_SETS, "No record.");
        } else {
            return json_view(STATUS_OK, array('list' => $receivers));
        }

    }

    /**
     * delete a receiver
     * @param Input $input
     * @return string
     */
    public function actionDelete(Input $input)
    {
        $id = $input->post("id", array(OP_NUMERIC));
        if ($id == false) {
            return json_view(STATUS_INVALID_ARGS, "Invalid Arguments");
        }
        $where = array('id' => "={$id}", 'user_id' => "={$this->user_id}");
        if (model("AlertReceiver")->delete($where) == false) {
            return json_view(STATUS_FAILED, "Faild");
        } else {
            return json_view(STATUS_OK, "Success");
        }

    }


}
