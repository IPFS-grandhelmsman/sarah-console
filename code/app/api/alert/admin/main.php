<?php
/**
 * Alert for user
 *
 *
*/

import('core.Session_Controller', false);

//------------------------------------------------------

class AdminController extends Session_Controller
{

    /**
     * 标记已读
     * @param Input $input
     * @return string
     */
    public function actionMarkRead(Input $input)
    {
        $id = $input->getInt("id");
        if ($id == false) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }
        $where = array("Id" => "={$id}", "user_id" => "={$this->user_id}");
        if (model('AlertSharding')->set('readed_at', time(), $where) === false) {
            return json_view(STATUS_FAILED, 'Failed');
        } else {
            return json_view(STATUS_OK, 'Ok');
        }
    }

    /**
     * 标记未读
     * @param Input $input
     * @return string
     */
    public function actionMarkUnread(Input $input)
    {
        $id = $input->getInt("id");
        if ($id == false) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }
        $where = array("id" => "={$id}", "user_id" => "={$this->user_id}");
        if (model('AlertSharding')->set('readed_at', 0, $where) == false) {
            return json_view(STATUS_FAILED, 'Failed');
        } else {
            return json_view(STATUS_OK, 'Ok');
        }
    }

}
