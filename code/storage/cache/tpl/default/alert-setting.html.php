<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点警报设置 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/default/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php include $this->getIncludeFile('default/blade/header.blade.html')?>
<div class="main">
<div class="container">
    <div class="widget-header">
        <h4 class="sub-header"><em class="glyphicon glyphicon-facetime-video"></em>&nbsp;警报设置</h4>
    </div>
    <div class="widget-container">
        <div class="vertical-5"></div>
        <ul class="nav nav-tabs">
          <li role="presentation"><a href="/alert/list">警报列表</a></li>
          <li role="presentation" class="active"><a href="/alert/setting">警报设置</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
        </div>
        <div class="vertical-20"></div>
        <div>
            <div class="informe-way">一、警报设置</div>
            <div class="column-right">
                <input id="openAutoAlert" type="checkbox" checked>
                <label for="openAutoAlert" style="margin-top: 15px;">开启自动警报</label>
            </div>
            <div class="column-right" id="alert_option">
                <table style="margin-left: 80px;">
                    <tr>
                        <td class="alert-title" style="padding-left: 18px;">警报项</td>
                        <td>警报值</td>
                    </tr>
                    <tr>
                        <td class="alert-title">
                            <input id="system_load" type="checkbox" name="alertOption">
                            <label for="system_load">系统负载</label>
                        </td>
                        <td><input class="alert-value" type="text" placeholder="默认值为0~1"></td>
                    </tr>
                    <tr>
                        <td class="alert-title">
                            <input id="memory_usage" type="checkbox" name="alertOption">
                            <label for="memory_usage">内存使用率</label>
                        </td>
                        <td><input class="alert-value" type="text" placeholder="请输入0~100的数值">%</td>
                    </tr>
                    <tr>
                        <td class="alert-title">
                            <input id="disk_usage" type="checkbox" name="alertOption">
                            <label for="disk_usage">磁盘使用率</label>
                        </td>
                        <td><input class="alert-value" type="text" placeholder="请输入0~100的数值">%</td>
                    </tr>
                    <tr>
                        <td class="alert-title">
                            <input id="upload_bandwidt" type="checkbox" name="alertOption">
                            <label for="upload_bandwidt">上传带宽</label>
                        </td>
                        <td><input class="alert-value" type="text" placeholder="请输入上传贷款报警数值">byte/s</td>
                    </tr>
                    <tr>
                        <td class="alert-title">
                            <input id="download_bandwidth" type="checkbox" name="alertOption">
                            <label for="download_bandwidth">下载带宽</label>
                        </td>
                        <td><input class="alert-value" type="text" placeholder="请输入下载带宽报警数值">byte/s</td>
                    </tr>
                </table>
            </div>
            <div class="column-right">
                <div class="informe-way">通知方式</div>
                <div>
                    <input id="sms" type="checkbox" name="alertOption">
                    <label for="sms" class="informe-way1">手机短信</label>
                    <input id="email" type="checkbox" name="alertOption">
                    <label for="email" class="informe-way1">电子邮件</label>
                </div>
            </div>
            <div><button class="save-alert-btn">保存修改</button></div>
        </div>
        <div>
            <div class="clearfix">
                <div class="informe-way pull-left">二、接收人管理</div>
                <div class="add-receiver"><span class="glyphicon glyphicon-plus"></span> 添加接收人</div>
            </div>
            <div class="column-right">
                <table class="receiver-table">
                    <tr class="receiver-row">
                        <td>姓名</td>
                        <td>手机号码</td>
                        <td>电子邮箱</td>
                        <td>添加时间</td>
                        <td>操作</td>
                    </tr>
                    <tr>
                        <td>aaa</td>
                        <td>12345678912</td>
                        <td>123456@qq.com</td>
                        <td>2018/12/24</td>
                        <td>
                            <button class="btn-receiver-modify">修改</button>
                            <button class="btn-receiver-del">删除</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="vertical-40"></div>
</div>
</div>

<?php include $this->getIncludeFile('common/dialog_tops.html')?>
<script src="/static/js/common/jquery.1.11.js"></script>
<script src="/static/js/common/bootstrap.min.js"></script>
<script src="/static/js/common/alert-setting.js"></script>
<script>
    window.alertset.init();
</script>
</body>
</html>
