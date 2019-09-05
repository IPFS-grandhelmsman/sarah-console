<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点警报列表 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/default/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php include $this->getIncludeFile('default/blade/header.blade.html')?>
<div class="main">
<div class="container">
    <div class="widget-header">
        <h4 class="sub-header"><em class="glyphicon glyphicon-facetime-video"></em>&nbsp;警报列表</h4>
    </div>
    <div class="widget-container">
        <div class="vertical-5"></div>
        <ul class="nav nav-tabs">
          <li role="presentation" class="active"><a href="/alert/list">警报列表</a></li>
          <li role="presentation"><a href="/alert/setting">警报设置</a></li>
        </ul>
        <div id="myTabContent" class="tab-content"></div>
        <div class="vertical-20"></div>
        <table class="table table-hover">
            <tr>
                <th>UID</th>
                <th>类型</th>
                <th>预警值</th>
                <th>发布时间</th>
                <th>操作</th>
            </tr>
            <tr>
                <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                <td>内存使用率</td>
                <td>80%</td>
                <td>2018/12/24</td>
                <td class="opt-td">
                    <a href="#"><em class="glyphicon glyphicon-trash"></em>&nbsp;删除</a>
                </td>
            </tr>
            <tr>
                <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                <td>系统负载</td>
                <td>0.8</td>
                <td>2018/12/24</td>
                <td class="opt-td">
                    <a href="#"><em class="glyphicon glyphicon-trash"></em>&nbsp;删除</a>
                </td>
            </tr>
            <tr>
                <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                <td>磁盘使用率</td>
                <td>75%</td>
                <td>2018/12/24</td>
                <td class="opt-td">
                    <a href="#"><em class="glyphicon glyphicon-trash"></em>&nbsp;删除</a>
                </td>
            </tr>
            <tr>
                <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                <td>下载带宽</td>
                <td>500b/s</td>
                <td>2018/12/24</td>
                <td class="opt-td">
                    <a href="#"><em class="glyphicon glyphicon-trash"></em>&nbsp;删除</a>
                </td>
            </tr>
            <tr>
                <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                <td>上传带宽</td>
                <td>500b/s</td>
                <td>2018/12/24</td>
                <td class="opt-td">
                    <a href="#"><em class="glyphicon glyphicon-trash"></em>&nbsp;删除</a>
                </td>
            </tr>

        </table>
    </div>
</div>
</div>
<script src="/static/js/common/jquery.1.11.js"></script>
<script src="/static/js/common/bootstrap.min.js"></script>
</body>
</html>
