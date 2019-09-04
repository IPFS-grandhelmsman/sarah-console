<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点警报 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/default/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php include $this->getIncludeFile('default/blade/header.blade.html')?>
<div class="main">
<div class="container">
    <div class="widget-header">
        <h4 class="sub-header"><em class="glyphicon glyphicon-facetime-video"></em>&nbsp;节点警报</h4>
    </div>
    <div class="widget-container">
        <div class="vertical-5"></div>
        <ul class="nav nav-tabs">
          <li role="presentation" class="active"><a href="/alert/list">警报列表</a></li>
          <li role="presentation"><a href="/alert/setting">设置</a></li>
          <li role="presentation"><a href="/alert/people">接收人管理</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
		</div>
	</div>
        <div class="vertical-20"></div>
    </div>
</div>
</div>
<script src="/static/js/common/jquery.1.11.js"></script>
<script src="/static/js/common/bootstrap.min.js"></script>
</body>
</html>
