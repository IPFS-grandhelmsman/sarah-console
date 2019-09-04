<?php
/**
 * @author: grandhelmsman
 * @since: 19-1-22 上午10:02
 */

class TestController extends C_Controller {

    public function actionPost(Input $input) {

        import("JNodeApi", false);
        $result = JNodeApi::post("http://localhost:8080/node/data/post", array(
            "name" => "xiaoyang",
            "password" => 123456
        ));
        return json_view(STATUS_OK, $result);
    }

    public function actionIndex(Input $input) {

        $recivers = service("alert.receiver.paging", array(
            'user_id' => 1,
            'pageno' => 1,
            'pagesize' => 40
        ));
        var_dump($recivers);die();
        import("msg.MessageService", false);

        $messageService = new MessageService();
        foreach($recivers as $value) {
            $data['name'] = "磁盘";
            $data['time'] = "01月22日15时31分";
            $data['nodeId'] = "6648889935024095510";
            $data['index'] = "内存使用率";
            $data['value'] = '90%';
            $data['mobile'] = $value['mobile'];
            if ($messageService->sendAlert($data)) {
                $success = 'Success';
            }
        }
        return json_view(STATUS_OK, $success);
    }
}