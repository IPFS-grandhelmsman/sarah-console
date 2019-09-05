<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>警报设置 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/dark/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <?php include $this->getIncludeFile('dark/blade/header.blader.html')?>
    <?php include $this->getIncludeFile('dark/blade/left.menu.blader.html')?>
    <div class="main-contaim">
            <div>
                <div class="informe-way">一、警报设置</div>
                <div class="column-right">
                    <input id="openAutoAlert" name="open_alert" type="checkbox" value="1" <?php if ($this->_symbol["setting"]["open_alert"] > 0) {?>checked<?php }?>>
                    <label for="openAutoAlert" style="margin-top: 15px;">开启自动警报</label>
                </div>
                <div class="column-right" id="alert_option">
                    <table style="margin-left: 20px;">
                        <tr>
                            <td class="alert-title">警报项</td>
                            <td>警报值</td>
                        </tr>
                        <tr>
                            <td class="alert-title">系统负载</td>
                            <td><input class="alert-value" id="loadavg" name="loadavg" type="text" value="<?php echo $this->_symbol["setting"]["itemConfig"]["loadavg"]?>" placeholder="默认值为0~1"></td>
                        </tr>
                        <tr>
                            <td class="alert-title">内存使用率</td>
                            <td><input class="alert-value" id="ram_percent" type="text" name="ram_percent" value="<?php echo $this->_symbol["setting"]["itemConfig"]["ram_percent"]?>" placeholder="请输入0~1的数值"></td>
                        </tr>
                        <tr>
                            <td class="alert-title">磁盘使用率</td>
                            <td><input class="alert-value" id="disk_percent" type="text" name="disk_percent" value="<?php echo $this->_symbol["setting"]["itemConfig"]["disk_percent"]?>" placeholder="请输入0~1的数值"></td>
                        </tr>
                        <tr>
                            <td class="alert-title">上传带宽</td>
                            <td><input class="alert-value" id="incoming_bd" type="text" name="incoming_bd" value="<?php echo $this->_symbol["setting"]["itemConfig"]["incoming_bd"]?>" placeholder="请输入上传带宽报警数值">Kb/s</td>
                        </tr>
                        <tr>
                            <td class="alert-title">下载带宽</td>
                            <td><input class="alert-value" id="outgoing_bd" name="outgoing_bd" type="text" value="<?php echo $this->_symbol["setting"]["itemConfig"]["outgoing_bd"]?>" placeholder="请输入下载带宽报警数值">Kb/s</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <button class="save-alert-btn" id="save_alert_btn">保存修改</button>
                </div>
            </div>
        <div>
            <div class="informe-way">二、通知方式</div>
            <div>
                <input id="mobile_alert" type="checkbox" name="mobile_alert" <?php if ($this->_symbol["setting"]["mobile_alert"] > 0) {?>checked<?php }?>>
                <label for="mobile_alert" class="informe-way1">手机短信</label>
                <input id="email_alert" type="checkbox" name="email_alert" <?php if ($this->_symbol["setting"]["email_alert"] > 0) {?>checked<?php }?>>
                <label for="email_alert" class="informe-way1">电子邮件</label>
                <input id="wechat_alert" type="checkbox" name="wechat_alert" <?php if ($this->_symbol["setting"]["wechat_alert"] > 0) {?>checked<?php }?>>
                <label for="wechat_alert" class="informe-way1">微信</label>
            </div>
        </div>
        <div>
            <button class="save-alert-btn" id="save_inform_btn">保存修改</button>
        </div>
        <div id="alert_setting">
            <div class="clearfix">
                <div class="informe-way pull-left">三、接收人管理</div>
                <div class="add-receiver" v-on:click="add_receiver"><span class="glyphicon glyphicon-plus"></span> 添加接收人</div>
            </div>
            <div class="column-right">
                <table class="receiver-table">
                    <tr class="receiver-row">
                        <td>姓名</td>
                        <td>手机号码</td>
                        <td>电子邮箱</td>
                        <td>微信openid</td>
                        <td>添加时间</td>
                        <td>更新时间</td>
                        <td>操作</td>
                    </tr>
                    <tr v-for="receiver in receivers" data-receiverid="{{receiver.Id}}">
                        <td class="receiver-name">{{receiver.name}}</td>
                        <td class="receiver-mobile">{{receiver.mobile}}</td>
                        <td class="receiver-email">{{receiver.email}}</td>
                        <td class="receiver-openid">{{receiver.wx_openid}}</td>
                        <td class="receiver-created">{{receiver.created_time}}</td>
                        <td class="receiver-updated">{{receiver.updated_time}}</td>
                        <td class="receiver">
                            <button class="btn-receiver-modify" v-on:click="modify_receiver(receiver)">修改</button>
                            <button class="btn-receiver-del" v-on:click="delete_receiver_tip(receiver.Id)">删除</button>
                        </td>
                    </tr>
                </table>
            </div>
            <?php include $this->getIncludeFile('dark/blade/footer.blader.html')?>
        </div>
    </div>
    <?php include $this->getIncludeFile('common/dialog_tops.html')?>
    <script src="/static/js/common/jquery.1.11.js"></script>
    <script src="/static/js/common/vue.min.js"></script>
    <script src="/static/js/common/util.js"></script>
    <script src="/static/js/common/bootstrap.min.js"></script>
    <script src="/static/js/common/alert-setting.js"></script>
    <script type="text/javascript">
        actionNav("jbset");
        $(function(){
            var objLink = $("[data-status='jbset']").parent().siblings(".menu-li-link");
            $(objLink).click();
        });
        var config = {
            saveAlertBtn: "#save_alert_btn",
            saveInformBtn: "#save_inform_btn"
        };
        window.alertset.init(config);
    </script>
</body>
</html>
