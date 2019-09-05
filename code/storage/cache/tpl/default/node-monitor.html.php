<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点监测信息 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/default/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php include $this->getIncludeFile('default/blade/header.blade.html')?>
<div class="main">
<div class="container">
    <div class="widget-header">
        <h4 class="sub-header"><em class="glyphicon glyphicon-stats"></em>&nbsp;节点&nbsp;-&nbsp;实时监测</h4>
    </div>
    <div class="widget-container">
        <h4 class="sub-header"><em class="glyphicon glyphicon-home"></em>&nbsp;节点信息</h4>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>状态</th>
                <th>UID</th>
                <th>版本号</th>
                <th>更新周期(S)</th>
                <th>网络地址</th>
                <th>创建时间</th>
                <th>启动时间</th>
                <th>更新时间</th>
            </tr>
            </thead>
            <tbody>
              <tr>
                <td><em class="state-<?php echo $this->_symbol["node"]["node_state"]?>"><?php echo $this->_symbol["node"]["node_state"]=='normal'?'正常':'故障'?></em></td>
                <td><?php echo $this->_symbol["node"]["node_uid"]?></td>
                <td><?php echo $this->_symbol["node"]["sarah_ver"]?></td>
                <td><?php echo $this->_symbol["node"]["sarah_interval"]?></td>
                <td><?php echo $this->_symbol["node"]["ipaddr_str"]?></td>
                <td><?php echo $this->_symbol["node"]["created_time"]?></td>
                <td><?php echo $this->_symbol["node"]["bootat_time"]?></td>
                <td><?php echo $this->_symbol["node"]["s_updated_time"]?></td>
              </tr>
            </tbody>
        </table>
        <div class="vertical-5"></div>
        <h4 class="sub-header"><em class="glyphicon glyphicon-headphones"></em>&nbsp;基础监测</h4>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>系统负载</th>
                <th>内存使用</th>
                <th>磁盘使用</th>
                <th>下载带宽</th>
                <th>上传带宽</th>
                <th>更新时间</th>
            </tr>
            </thead>
            <tbody>
              <tr>
                <td><em class="state-<?php echo $this->_symbol["node"]["load_state"]?>" id="loadavg_box"><?php echo $this->_symbol["node"]["load_avg_str"]?></em></td>
                <td><em class="state-<?php echo $this->_symbol["node"]["ram_state"]?>" id="ram_box"><?php echo $this->_symbol["node"]["ram_used_str"]?>, <?php echo $this->_symbol["node"]["ram_percent"]?>%</em></td>
                <td><em class="state-<?php echo $this->_symbol["node"]["disk_state"]?>" id="disk_box"><?php echo $this->_symbol["node"]["disk_used_str"]?>, <?php echo $this->_symbol["node"]["disk_percent"]?>%</em></td>
                <td id="incoming_bd_box"><?php echo $this->_symbol["node"]["incoming_bd_str"]?>/sec</td>
                <td id="outgoing_bd_box"><?php echo $this->_symbol["node"]["outgoing_bd_str"]?>/sec</td>
                <td id="updated_time_box"><?php echo $this->_symbol["node"]["updated_time"]?></td>
              </tr>
            </tbody>
        </table>
        <div class="vertical-5"></div>
        <h4 class="sub-header"><em class="glyphicon glyphicon-equalizer"></em>&nbsp;动态监测</h4>
        <div class="row">
            <div class="col-md-12 col-xs-12"><div class="stat_line" id="userate_line"></div></div>
        </div>
        <div class="vertical-20"></div>
        <div class="row">
            <div class="col-md-12 col-xs-12"><div class="stat_line" id="bandwidth_line"></div></div>
        </div>
        <div class="vertical-20"></div>
    </div>
</div>
</div>
<script src="/static/js/common/jquery.1.11.js"></script>
<script src="/static/js/common/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/common/echarts.common.min.js"></script>
<script type="text/javascript" src="/static/js/default/node-line.js?v=20181211"></script>
<script type="text/javascript">
window.NodeLine.init({
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
</script>
</body>
</html>
