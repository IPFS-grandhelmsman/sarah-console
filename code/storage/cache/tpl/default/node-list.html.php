<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点列表 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/default/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php include $this->getIncludeFile('default/blade/header.blade.html')?>
<div class="main">
<div class="container">
    <div class="widget-header">
        <h4 class="sub-header">&nbsp;<em class="glyphicon glyphicon-wrench"></em>&nbsp;节点列表</h4>
    </div>
    <div class="widget-container">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>UID</th>
                <th>版本</th>
                <th>状态</th>
                <th>硬件配置</th>
                <th>系统负载</th>
                <th>内存</th>
                <th>磁盘</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php if(empty($this->_symbol["data"])){?>
              <tr>
                <td colspan="7">暂无任何注册节点</td>
              </tr>
            <?php }else{?>
            <?php foreach($this->_symbol["data"] as $val){?>
              <tr>
                <td class="id-td"><?php echo $val["node_uid"]?></td>
                <td><?php echo $val["sarah_ver"]?></td>
                <td>
                    <?php if($val["node_state"]=='normal'){?>
                    <em class="state-normal">正常</em>
                    <?php }else{?>
                    <em data-toggle="tooltip" title="最近硬件统计信息上于：<?php echo $val["updated_time"]?>，超过了两倍interval时间" class="state-urgent">故障</em>
                    <?php }?>
                </td>
                <td>
                    <em><?php echo $val["cpu_cores"]?>CPU</em>&nbsp;
                    <em><?php echo $val["ram_str"]?></em>&nbsp;
                    <em><?php echo $val["disk_str"]?></em>
                </td>
                <td><em class="state-<?php echo $val["load_state"]?>"><?php echo $val["load_avg"]?></em></td>
                <td><em class="state-<?php echo $val["ram_state"]?>"><?php echo $val["ram_percent"]?>%</em></td>
                <td><em class="state-<?php echo $val["disk_state"]?>"><?php echo $val["disk_percent"]?>%</em></td>
                <td class="opt-td">
                    <a href="/node/monitor?<?php echo $val["v_qstr"]?>"><em class="glyphicon glyphicon-stats"></em>&nbsp;监测</a>&nbsp;|&nbsp;
                    <a href="/node/view?<?php echo $val["v_qstr"]?>"><em class="glyphicon glyphicon-hdd"></em>&nbsp;硬件信息</a>&nbsp;|&nbsp;
                    <a href="/node/manage?<?php echo $val["v_qstr"]?>"><em class="glyphicon glyphicon-wrench"></em>&nbsp;管理</a>
                </td>
              </tr>
            <?php }}?>
            </tbody>
        </table>
        <?php include $this->getIncludeFile('default/blade/paging-bootstrap.blade.html')?>
    </div>
</div>
</div>
<script src="/static/js/common/jquery.1.11.js"></script>
<script src="/static/js/common/bootstrap.min.js"></script>
</body>
</html>
