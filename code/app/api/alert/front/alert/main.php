<?php
/**
 * Alarm api
 * 
 *
*/

import('core.Session_Controller', false);
class AlertController extends C_Controller
{
    static $alertTypeStr = array(
        ALERT_TYPE_LOADAVG => "系统负载",
        ALERT_TYPE_RAM => "内存",
        ALERT_TYPE_DISK => "磁盘",
        ALERT_TYPE_INCOMING_BD => "上传带宽",
        ALERT_TYPE_OUTGOING_BD => "下载带宽",
        ALERT_TYPE_CPU_TEMP => "CPU 温度"
    );

    static $alertTypeIndex = array(
        ALERT_TYPE_LOADAVG => "系统负载",
        ALERT_TYPE_RAM => "内存使用量",
        ALERT_TYPE_DISK => "磁盘使用量",
        ALERT_TYPE_INCOMING_BD => "上传带宽",
        ALERT_TYPE_OUTGOING_BD => "下载带宽",
        ALERT_TYPE_CPU_TEMP => "CPU 温度"
    );

    /**
     * Receiving alarm message, and saving to database
     * @param Input $input
     * @return string
     */
    public function actionPost(Input $input)
    {

        $data['user_id'] = intval($input->post('userId'));
        $data['node_id'] = intval($input->post('nodeId'));
        $data['alert_type'] = intval($input->post('alertType'));
        $alertValue = explode("|", $input->post('alertValue'));
        $data['alert_value_json'] = json_encode($alertValue);
        $data['created_at'] = $input->post('createTime', null, time());
        if ($data['user_id'] == 0 || $data['node_id'] == 0) {
            return json_view(STATUS_INVALID_ARGS, "Invalid arguments");
        }
        /**
         * The same type and nodeId of alert information only keep one.
         * 同一个类型的报错只接收一条
         */
        $item = model('AlertSharding')->get(array('Id'), array(
            'user_id' => "={$data['user_id']}",
            'node_id' => "={$data['node_id']}",
            'alert_type' => "={$data['alert_type']}"
        ));

        if ($item != false && $item['readed_at'] == 0) {
            return json_view(STATUS_OK, "Success");
        }
        // 如果阅读时间超过报警间隔时间，则继续报警，否则跳过本次报警
        $setting = service('alert.setting.row', array(
            'user_id'     => $data['user_id'],
            'json_decode' => true,
        ));
        if ($setting['alert_interval'] <= 0) {
            $setting['alert_interval'] = 60;
        }
        $alertInterval = $setting['alert_interval'] * 60;
        if ($item['readed_at'] > 0 && time() - $alertInterval <= $item['readed_at']) {
            return json_view(STATUS_OK, "Success");
        }
        if (!model('AlertSharding')->add($data)) {
            return json_view(STATUS_FAILED, "Faild");
        } else {
            // TODO send message to user
            // get all of reciver
            $recivers = service("alert.receiver.paging", array(
                'user_id' => $data['user_id'],
                'pageno' => 1,
                'pagesize' => 40
            ));
            import("msg.MessageService", false);

            $messageService = new MessageService();
            foreach($recivers as $value) {
                $message['name'] = self::$alertTypeStr[$data['alert_type']];
                $message['time'] = date('m')."月".date('d')."日".date('H')."时".date('i')."分";
                $message['nodeId'] = $data['node_id'];
                $message['index'] = self::$alertTypeIndex[$data['alert_type']];
                switch($data['alert_type']) {
                    case ALERT_TYPE_LOADAVG:
                        $message['value'] = $alertValue[1];
                        break;
                    case ALERT_TYPE_RAM:
                    case ALERT_TYPE_DISK:
                        $message['value'] = (floatval($alertValue[1]) * 100).'%';
                        break;
                    case ALERT_TYPE_INCOMING_BD:
                    case ALERT_TYPE_OUTGOING_BD:
                        $message['value'] = bytes_to_string($alertValue[1], 2).'/s';
                        break;
                    case ALERT_TYPE_CPU_TEMP:
                        $message['value'] = $alertValue[1].'℃';
                        break;
                    case ALERT_TYPE_FAULT:
                        $message['value'] = "Fault";
                        break;

                }
                // 没有报警指标的不发短信，比如风扇转速
                if (empty($message['value'])) {
                    continue;
                }
                $message['mobile'] = $value['mobile'];
                if ($data['alert_type'] == ALERT_TYPE_FAULT) {
                    $_message['mobile'] = $message['mobile'];
                    $_message['nodeId'] = $message['nodeId'];
                    $_message['time'] = $message['time'];
                    $_message['cause'] = "未知";
                    $messageService->sendFault($_message);
                } else {
                    $messageService->sendAlert($message);
                }
            }
            return json_view(STATUS_OK, "Success");
        }
    }

}
