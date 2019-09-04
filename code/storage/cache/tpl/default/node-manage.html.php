<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点管理 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/default/style.css?v=2018122401" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php include $this->getIncludeFile('default/blade/header.blade.html')?>
<div class="main">
<div class="container">
    <div class="widget-header">
        <h4 class="sub-header"><em class="glyphicon glyphicon-wrench"></em>&nbsp;节点&nbsp;-&nbsp;管理</h4>
    </div>
    <div class="widget-container">
        <h4 class="sub-header sys-header">
            <div class="title"><em class="glyphicon glyphicon-bookmark"></em>&nbsp;系统信息</div>
            <div class="quick-control">
                <!--<button class="btn btn-danger shutdown disabled" id="node-shutdown">关机</button>-->
                <button class="btn btn-info" id="node-dev">开发者管理中心</button>
                <button class="btn btn-primary shutdown" id="node-terminal">简易终端</button>
                <button class="btn btn-warning reboot" id="node-reboot">重启</button>
            </div>
        </h4>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>状态</th>
                <th>系统</th>
                <th>节点名称</th>
                <th>内核版本</th>
                <th>发型版本</th>
                <th>架构体系</th>
            </tr>
            </thead>
            <tbody>
              <tr>
                <td><em class="state-<?php echo $this->_symbol["node"]["node_state"]?>"><?php echo $this->_symbol["node"]["node_state"]=='normal'?'正常':'故障'?></em></td>
                <td><?php echo $this->_symbol["node"]["system"]["sys_name"]?></td>
                <td><?php echo $this->_symbol["node"]["system"]["node_name"]?></td>
                <td><?php echo $this->_symbol["node"]["system"]["release"]?></td>
                <td><?php echo $this->_symbol["node"]["system"]["version"]?></td>
                <td><?php echo $this->_symbol["node"]["system"]["machine"]?></td>
              </tr>
            </tbody>
        </table>
        <div class="vertical-5"></div>
        <h4 class="sub-header"><em class="glyphicon glyphicon-tasks"></em>&nbsp;进程列表</h4>
        <div class="ps-container">
            <ul class="ps-item header">
                <li class="user">USER</li>
                <li class="pid">PID</li>
                <li class="cpu">%CPU</li>
                <li class="mem">%MEM</li>
                <li class="vsz">VSZ(KB)</li>
                <li class="rss">RSS(KB)</li>
                <li class="tty">TTY</li>
                <li class="stat">STAT</li>
                <li class="start">START</li>
                <li class="time">TIME</li>
                <li class="command">COMMAND</li>
            </ul>
            <div class="ps-list" id="ps-list">
            <?php foreach( $this->_symbol["node"]["process"] as $ps ){?>
            <ul class="ps-item content">
              <li class="user"><?php echo $ps["user"]?></li>
              <li class="pid"><?php echo $ps["pid"]?></li>
              <li class="cpu"><?php echo $ps["cpu"]?></li>
              <li class="mem"><?php echo $ps["mem"]?></li>
              <li class="vsz"><?php echo $ps["vsz"]?></li>
              <li class="rss"><?php echo $ps["rss"]?></li>
              <li class="tty"><?php echo $ps["tty"]?></li>
              <li class="stat"><?php echo $ps["stat"]?></li>
              <li class="start"><?php echo $ps["start"]?></li>
              <li class="time"><?php echo $ps["time"]?></li>
              <li class="command" title="<?php echo $ps["cmd"]?>"><?php echo $ps["cmd"]?></li>
            </ul>
            <?php }?>
            </div>
        </div>
        <div class="vertical-20"></div>
    </div>
</div>
</div>
<script type="text/template" id="ps-list-tpl">
<%for( var i=0; i < {process}.length; i++ ){%>
<ul class="ps-item content">
  <li class="user"><%={process[i]}.user%></li>
  <li class="pid"><%={process[i]}.pid%></li>
  <li class="cpu"><%={process[i]}.cpu%></li>
  <li class="mem"><%={process[i]}.mem%></li>
  <li class="vsz"><%={process[i]}.vsz%></li>
  <li class="rss"><%={process[i]}.rss%></li>
  <li class="tty"><%={process[i]}.tty%></li>
  <li class="stat"><%={process[i]}.stat%></li>
  <li class="start"><%={process[i]}.start%></li>
  <li class="time"><%={process[i]}.time%></li>
  <li class="command" title="<%={process[i]}.cmd%>"><%={process[i]}.cmd%></li>
  <li class="control"><a href="javascript:;" title="结束进程" data-pid="<%={process[i]}.pid%>"><em class="glyphicon glyphicon-remove"></em></a></li>
</ul>
<%}%>
</script>
<?php include $this->getIncludeFile('common/terminal_dialog.html')?>
<script language="javascript" src="/static/js/common/jquery.1.11.js"></script>
<script language="javascript" src="/static/js/common/bootstrap.min.js"></script>
<script language="javascript" src="/static/js/common/JTE.js"></script>
<script language="javascript" src="/static/js/default/node-manage.js"></script>
<script language="javascript">
window.manage.init({
    ps_container: document.getElementById('ps-list'),
    ps_list_tpl: document.getElementById('ps-list-tpl').innerHTML,
    v_qstr: '<?php echo $this->_symbol["v_qstr"]?>',
    last_created_at: '<?php echo $this->_symbol["node"]["created_at"]?>',
    _event: {
        shutdown: document.getElementById('node-shutdown'),
        reboot: document.getElementById('node-reboot'),
        developer: document.getElementById('node-dev'),
        terminal: document.getElementById('node-terminal'),
        closeTerm: document.getElementById('node-close-term')
    }
});
</script>
</body>
</html>
