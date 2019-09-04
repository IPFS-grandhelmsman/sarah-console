<?php
/**
 * @author: grandhelmsman
 * @since: 19-1-22 下午6:02
 */
import('msg.SignatureHelper', false);
class MessageService {

    const ACCESS_KEY_ID = "LTAIkt1kbHyPPa3L";
    const ACCESS_KEY_SECRET = "phdeOX4hx5EWBklr0mzLKjP5bv5vva";
    const SIGN_NAME = "正舵者";

    /**
     * send an alarm message to user
     * 【{name}预警】您好，{time}，您的节点,UID：{nodeId}，{index}超过{value}，请登录 SarahOS 及时处理。
     * @param $data
     * @return bool
     */
    public function sendAlert($data) {

        $params["SignName"] = self::SIGN_NAME;
        $params["PhoneNumbers"] = $data['mobile'];
        $params["TemplateCode"] = "SMS_156901193";
        $params['TemplateParam'] = array(
            'name' => $data['name'],
            'time' => $data['time'],
            'nodeId' => $data['nodeId'],
            'index' => $data['index'],
            'value' => $data['value'],
        );

        if(!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }
        return $this->request($params);
    }

    /**
     * 发送节点故障预警
     * @param $data
     * @return bool
     */
    public function sendFault($data) {

        $params["SignName"] = self::SIGN_NAME;
        $params["PhoneNumbers"] = $data['mobile'];
        $params["TemplateCode"] = "SMS_157065462";
        $params['TemplateParam'] = array(
            'time' => $data['time'],
            'nodeId' => $data['nodeId'],
            'cause' => $data['cause'],
        );

        if(!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }
        return $this->request($params);
    }

    /**
     * send a request to message server
     * @param $params
     * @return bool
     */
    public function request($params) {

        // sign the parameters
        $helper = new SignatureHelper();

        // An exception may throw here, pay attension to catch
        $content = $helper->request(
            self::ACCESS_KEY_ID,
            self::ACCESS_KEY_SECRET,
            "dysmsapi.aliyuncs.com",
            array_merge($params, array(
                "RegionId" => "cn-hangzhou",
                "Action" => "SendSms",
                "Version" => "2017-05-25",
            ))
        );
        $content = json_decode(json_encode($content),TRUE);
        return $content['Code'] == 'OK';
    }
}
