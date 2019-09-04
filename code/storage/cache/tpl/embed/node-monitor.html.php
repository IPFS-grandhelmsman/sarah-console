<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点：<?php echo $this->_symbol["node"]["node_uid"]?></title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .container{margin-top: 60px;}
    </style>
</head>
<body>
    <nav class="nav">
        <a class="link active" href="/node/monitor?<?php echo $this->_symbol["node"]["v_qstr"]?>&__skin=embed&node_uid=<?php echo $this->_symbol["node"]["node_uid"]?>">节点监测</a>
        <a class="link" href="/node/view?<?php echo $this->_symbol["node"]["v_qstr"]?>&__skin=embed&node_uid=<?php echo $this->_symbol["node"]["node_uid"]?>">硬件信息</a>
        <a class="link" href="/node/manage?<?php echo $this->_symbol["node"]["v_qstr"]?>&__skin=embed&node_uid=<?php echo $this->_symbol["node"]["node_uid"]?>">节点管理</a>
        <div class="float-right">
            <button class="btn btn-orange btn-xs margin-right-v6" id="node_reboot" data-vqstr="<?php echo $this->_symbol["node"]["v_qstr"]?>">重启</button>
            <button class="btn btn-green btn-xs margin-right-v6" id="node_terminal" data-vqstr="<?php echo $this->_symbol["node"]["v_qstr"]?>" data-nodeuid="<?php echo $this->_symbol["node"]["node_uid"]?>">简易终端</button>
        </div>
    </nav>
    <div class="container">
        <div class="node-title">节点信息</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v1">状态</th>
                <th class="padding-left text-overflow">UID</th>
                <th class="padding-left text-overflow table-row-v2">版本号</th>
                <th class="padding-left text-overflow table-row-v3">更新周期(S)</th>
                <th class="padding-left text-overflow table-row-v4">网络地址</th>
                <th class="padding-left text-overflow table-row-v4">创建时间</th>
                <th class="padding-left text-overflow table-row-v4">启动时间</th>
                <th class="padding-left text-overflow table-row-v4">更新时间</th>
            </tr>
            </thead>
            <tbody>
            <tr class="table-row">
                <td class="padding-left text-overflow" id="node_id">
                    <?php if ($this->_symbol["node"]["status"] == 1) {?><em class="state-normal">正常</em><?php }?>
                    <?php if ($this->_symbol["node"]["status"] == 2) {?><em class="state-warning">重启中</em><?php }?>
                    <?php if ($this->_symbol["node"]["status"] == 0) {?><em class="state-errort" data-toggle="tooltip" title="最近硬件统计信息上于：<?php echo $this->_symbol["node"]["updated_time"]?>，超过了两倍interval时间">故障</em><?php }?>
                </td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["node_uid"]?>"><?php echo $this->_symbol["node"]["node_uid"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["sarah_ver"]?>"><?php echo $this->_symbol["node"]["sarah_ver"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["sarah_interval"]?>"><?php echo $this->_symbol["node"]["sarah_interval"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["ipaddr_str"]?>"><?php echo $this->_symbol["node"]["ipaddr_str"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["created_time"]?>"><?php echo $this->_symbol["node"]["created_time"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["bootat_time"]?>"><?php echo $this->_symbol["node"]["bootat_time"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["s_updated_time"]?>"><?php echo $this->_symbol["node"]["s_updated_time"]?></td>
            </tr>
            </tbody>
        </table>
        <div class="margin-top-v4 node-title">监测信息</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v5">系统负载</th>
                <th class="padding-left text-overflow table-row-v5">内存使用</th>
                <th class="padding-left text-overflow table-row-v6">磁盘使用</th>
                <th class="padding-left text-overflow table-row-v5">下载带宽</th>
                <th class="padding-left text-overflow table-row-v5">上传带宽</th>
                <th class="padding-left text-overflow table-row-v6">更新时间</th>
            </tr>
            </thead>
            <tbody>
            <tr class="table-row">
                <td class="padding-left text-overflow"><em class="state-<?php echo $this->_symbol["node"]["load_state"]?>" id="loadavg_box"><?php echo $this->_symbol["node"]["load_avg_str"]?></em></td>
                <td class="padding-left text-overflow"><em class="state-<?php echo $this->_symbol["node"]["ram_state"]?>" id="ram_box"><?php echo $this->_symbol["node"]["ram_used_str"]?>, <?php echo $this->_symbol["node"]["ram_percent"]?>%</em></td>
                <td class="padding-left text-overflow"><em class="state-<?php echo $this->_symbol["node"]["disk_state"]?>" id="disk_box"><?php echo $this->_symbol["node"]["disk_used_str"]?>, <?php echo $this->_symbol["node"]["disk_percent"]?>%</em></td>
                <td class="padding-left text-overflow" id="incoming_bd_box"><?php echo $this->_symbol["node"]["incoming_bd_str"]?>/s</td>
                <td class="padding-left text-overflow" id="outgoing_bd_box"><?php echo $this->_symbol["node"]["outgoing_bd_str"]?>/s</td>
                <td class="padding-left text-overflow" id="updated_time_box"><?php echo $this->_symbol["node"]["updated_time"]?></td>
            </tr>
            </tbody>
        </table>

        <div class="margin-top-v4 node-title">实时监测</div>
        <div class="node-charts" id="userate_line" ></div>
        <div class="node-charts" id="bandwidth_line"></div>
    </div>

    <?php include $this->getIncludeFile('common/dialog.html')?>
    <?php include $this->getIncludeFile('common/terminal_dialog.html')?>
    <script src="/script/node/monitor?v=20190412"></script>
    <script type="text/javascript">
        var status_params = {
            target_id: "#node_id",
            v_qstr: '<?php echo $this->_symbol["node"]["v_qstr"]?>'
        };
        window.node_status.init(status_params);
        window.NodeLine.init({
            skin: 'default',
            userate_line_dom: document.getElementById('userate_line'),
            bandwidth_line_dom: document.getElementById('bandwidth_line'),
            v_qstr: '<?php echo $this->_symbol["node"]["v_qstr"]?>',
            stat: {
                loadavg: document.getElementById('loadavg_box'),
                ram: document.getElementById('ram_box'),
                disk: document.getElementById('disk_box'),
                incoming_bd: document.getElementById('incoming_bd_box'),
                outgoing_bd: document.getElementById('outgoing_bd_box'),
                updated_time: document.getElementById('updated_time_box')
            }
        });
        window.nodeOperation.init({
            reboot: "#node_reboot",
            terminal: "#node_terminal",
            app_key: "<?php echo $this->_symbol["session"]["app_key"]?>"
        })
    </script>
</body>
</html>
