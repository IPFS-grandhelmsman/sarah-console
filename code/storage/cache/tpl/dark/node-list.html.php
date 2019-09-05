<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点列表 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/dark/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <?php include $this->getIncludeFile('dark/blade/header.blader.html')?>
    <?php include $this->getIncludeFile('dark/blade/left.menu.blader.html')?>
    <div class="main-contaim">
        <div class="node-title">
            <img class="node-title-img" src="/static/image/dark/icon-jd-black.png" alt="节点">
            <span>节点列表</span>
        </div>
        <div class="node-content">
            <table class="node-table">
                <thead>
                    <tr class="node-table-col node-table-head">
                        <th class="">UID</th>
                        <th class="">版本</th>
                        <th class="">状态</th>
                        <th class="">硬件配置</th>
                        <th class="">系统负载</th>
                        <th class="">内存</th>
                        <th class="">磁盘</th>
                        <th class="">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(empty($this->_symbol["data"])){?>
                        <tr class="node-table-col">
                            <td colspan="8">暂无任何注册节点</td>
                        </tr>
                    <?php }else{?>
                        <?php foreach($this->_symbol["data"] as $val){?>
                    <tr class="node-table-col">
                        <td class="td-length-lg"><?php echo $val["node_uid"]?></td>
                        <td class="td-length-sm"><?php echo $val["sarah_ver"]?></td>
                        <td class="td-length-sm">
                            <?php if($val["node_state"]=='normal'){?>
                              <em class="state-normal">正常</em>
                            <?php }else{?>
                              <em data-toggle="tooltip" title="最近硬件统计信息上于：<?php echo $val["updated_time"]?>，超过了两倍interval时间" class="state-urgent">故障</em>
                            <?php }?>
                        </td>
                        <td class="td-length-md">
                            <em><?php echo $val["cpu_cores"]?>CPU</em>&nbsp;
                            <em><?php echo $val["ram_str"]?></em>&nbsp;
                            <em><?php echo $val["disk_str"]?></em>
                        </td>
                        <td class="td-length-sm"><em class="state-<?php echo $val["load_state"]?>"><?php echo $val["load_avg"]?></em></td>
                        <td class="td-length-sm"><em class="state-<?php echo $val["ram_state"]?>"><?php echo $val["ram_percent"]?>%</em></td>
                        <td class="td-length-sm"><em class="state-<?php echo $val["disk_state"]?>"><?php echo $val["disk_percent"]?>%</em></td>
                        <td class="td-length-lg">
                            <a class="node-btn btn-info" href="/node/monitor?<?php echo $val["v_qstr"]?>"><em class="glyphicon glyphicon-stats"></em>&nbsp;监测</a>
                            <a class="node-btn btn-warning" href="/node/view?<?php echo $val["v_qstr"]?>"><em class="glyphicon glyphicon-list-alt"></em>&nbsp;硬件信息</a>
                            <a class="node-btn btn-mana" href="/node/manage?<?php echo $val["v_qstr"]?>"><em class="glyphicon glyphicon-wrench"></em>&nbsp;管理</a>
                        </td>
                    </tr>
                    <?php }}?>
                </tbody>
            </table>
            <?php include $this->getIncludeFile('default/blade/paging-bootstrap.blade.html')?>
        </div>
    </div>
    <?php include $this->getIncludeFile('dark/blade/footer.blader.html')?>
    <script src="/static/js/common/jquery.1.11.js"></script>
    <script src="/static/js/common/bootstrap.min.js"></script>
    <script type="text/javascript">
        actionNav("node")
    </script>
</body>
</html>
