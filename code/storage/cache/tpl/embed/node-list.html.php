<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>节点管理</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .mark-option{left: -8px;top: 51px;min-width: 130px;width: auto;padding: 4px 15px;}
    </style>
</head>
<body>
    <div class="container">
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow">节点UID</th>
                <th class="text-overflow table-row-v5">节点名称</th>
                <th class="padding-left text-overflow table-row-v1">版本</th>
                <th class="padding-left text-overflow table-row-v2">状态</th>
                <th class="padding-left text-overflow table-row-v5">硬件配置</th>
                <th class="padding-left text-overflow table-row-v2">系统负载</th>
                <th class="padding-left text-overflow table-row-v1">内存</th>
                <th class="padding-left text-overflow table-row-v1">磁盘</th>
                <th class="padding-left text-overflow table-row-v4">操作</th>
            </tr>
            </thead>
            <tbody>
            <?php if(empty($this->_symbol["data"])){?>
            <tr class="table-row">
                <td class="text-center" colspan="9">暂无任何注册节点</td>
            </tr>
            <?php }else{?>
            <?php foreach($this->_symbol["data"] as $val){?>
            <tr class="table-row">
                <td class="padding-left text-overflow" title="<?php echo $val["node_uid"]?>">
                    <a class="node-uid" href="/node/monitor?<?php echo $val["v_qstr"]?>&__skin=embed&node_uid=<?php echo $val["node_uid"]?>"><?php echo $val["node_uid"]?></a>
                </td>
                <td class="text-overflow table-node-name" title="<?php echo $val["name"]?>" data-vqstr="<?php echo $val["v_qstr"]?>">
                    <input class="float-left node-name table-name-input" type="text" value="<?php echo $val["name"]?>" readonly data-value="<?php echo $val["name"]?>">
                    <div class="float-left node-edit table-name-edit"><i class="iconfont iconbianji1"></i></div>
                </td>
                <td class="padding-left text-overflow" title="<?php echo $val["sarah_ver"]?>"><?php echo $val["sarah_ver"]?></td>
                <td class="padding-left">
                    <?php if($val["status"]==1) {?>
                        <em>正常</em>
                    <?php }else if($val["status"]==2){?>
                        <em class="state-warning">重启中</em>
                    <?php }else{?>
                        <em class="float-left state-error" data-toggle="tooltip">故障</em>
                        <div class="float-left fault-mark margin-left-v1">
                            <i class="iconfont iconWarning node-error mark"></i>
                            <div class="mark-option" >节点未响应</div>
                        </div>
                    <?php }?>
                </td>
                <td class="padding-left text-overflow" title="<?php echo $val["cpu_cores"]?>CPU <?php echo $val["ram_str"]?> <?php echo $val["disk_str"]?>">
                    <em><?php echo $val["cpu_cores"]?>CPU</em>&nbsp;
                    <em><?php echo $val["ram_str"]?></em>&nbsp;
                    <em><?php echo $val["disk_str"]?></em>
                </td>
                <td class="padding-left text-overflow" title="<?php echo $val["load_avg"]?>"><em class="state-<?php echo $val["load_state"]?>"><?php echo $val["load_avg"]?></em></td>
                <td class="padding-left text-overflow" title="<?php echo $val["ram_percent"]?>%"><em class="state-<?php echo $val["ram_state"]?>"><?php echo $val["ram_percent"]?>%</em></td>
                <td class="padding-left text-overflow" title="<?php echo $val["disk_percent"]?>%"><em class="state-<?php echo $val["disk_state"]?>"><?php echo $val["disk_percent"]?>%</em></td>
                <td class="padding-left">
                    <div class="select">
                        <div class="title state-blue more-option">更多操作 <i class="iconfont iconxiala icon"></i></div>
                        <ul class="option">
                            <li class="item reboot" data-vqstr="<?php echo $val["v_qstr"]?>">重启</li>
                            <li class="item terminal" data-vqstr="<?php echo $val["v_qstr"]?>" data-nodeuid="<?php echo $val["node_uid"]?>">简易终端</li>
                        </ul>
                    </div>
                </td>
            </tr>
            <?php }}?>
            </tbody>
        </table>
        <?php include $this->getIncludeFile('default/blade/paging-simple.blade.html')?>
    </div>
    <?php include $this->getIncludeFile('common/dialog.html')?>
    <?php include $this->getIncludeFile('common/terminal_dialog.html')?>
    <script src="/script/node/list?v=20190412"></script>
    <script>
        window.nodeList.init();
        window.nodeOperation.init({
            reboot: ".reboot",
            terminal: ".terminal",
            app_key: "<?php echo $this->_symbol["session"]["app_key"]?>"
        });
    </script>
</body>
</html>
