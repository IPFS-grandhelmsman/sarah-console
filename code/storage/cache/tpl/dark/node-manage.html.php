<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点管理 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/dark/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <?php include $this->getIncludeFile('dark/blade/header.blader.html')?>
    <?php include $this->getIncludeFile('dark/blade/left.menu.blader.html')?>
    <div class="main-contaim">
        <div class="node-title">
            <a class="node-link" href="/node/list">节点</a>
            &gt;
            <a class="node-link" href="#">节点管理</a>
        </div>
        <div>
            <div class="contain-jdtj-block">
                <div class="contain-manage-header">
                    系统信息
                    <div class="pull-right">
                        <button class="btn-manage btn-warning" id="node-reboot">重启</button>
                        <button class="btn-manage btn-info" id="node-terminal">简易终端</button>
                        <button class="btn-manage btn-mana" id="node-shutdown">开发者管理中心</button>
                    </div>
                </div>
                <table class="contain-statistic-table">
                    <thead>
                    <tr class="contain-statistic-col">
                        <th class="text-center">状态</th>
                        <th class="text-center">系统</th>
                        <th class="text-center">节点名称</th>
                        <th class="text-center">内核版本</th>
                        <th class="text-center">发型版本</th>
                        <th class="text-center">架构体系</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center"><em class="state-<?php echo $this->_symbol["node"]["node_state"]?>"><?php echo $this->_symbol["node"]["node_state"]=='normal'?'正常':'故障'?></em></td>
                        <td class="text-center"><?php echo $this->_symbol["node"]["system"]["sys_name"]?></td>
                        <td class="text-center"><?php echo $this->_symbol["node"]["system"]["node_name"]?></td>
                        <td class="text-center"><?php echo $this->_symbol["node"]["system"]["release"]?></td>
                        <td class="text-center"><?php echo $this->_symbol["node"]["system"]["version"]?></td>
                        <td class="text-center"><?php echo $this->_symbol["node"]["system"]["machine"]?></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="contain-jd-manage">
                <div class="contain-manage-header">进程列表</div>
                <ul class="manage-row manage-row-title clearfix">
                    <li class="manage-col">USER</li>
                    <li class="manage-col">PID</li>
                    <li class="manage-col">%CPU</li>
                    <li class="manage-col">%MEM</li>
                    <li class="manage-col">VSZ(KB)</li>
                    <li class="manage-col">RSS(KB)</li>
                    <li class="manage-col">TTY</li>
                    <li class="manage-col">STAT</li>
                    <li class="manage-col">START</li>
                    <li class="manage-col">TIME</li>
                    <li class="manage-col-comm">COMMAND</li>
                </ul>
                <div class="manage-ul" id="ps-list">
                    <?php foreach( $this->_symbol["node"]["process"] as $ps ){?>
                        <ul class="manage-row">
                            <li class="manage-col"><?php echo $ps["user"]?></li>
                            <li class="manage-col"><?php echo $ps["pid"]?></li>
                            <li class="manage-col"><?php echo $ps["cpu"]?></li>
                            <li class="manage-col"><?php echo $ps["mem"]?></li>
                            <li class="manage-col"><?php echo $ps["vsz"]?></li>
                            <li class="manage-col"><?php echo $ps["rss"]?></li>
                            <li class="manage-col"><?php echo $ps["tty"]?></li>
                            <li class="manage-col"><?php echo $ps["stat"]?></li>
                            <li class="manage-col"><?php echo $ps["start"]?></li>
                            <li class="manage-col"><?php echo $ps["time"]?></li>
                            <li class="manage-col-comm" title="<?php echo $ps["cmd"]?>"><?php echo $ps["cmd"]?></li>
                        </ul>
                    <?php }?>
                </div>
            </div>
        </div>
    </div>
    <script type="text/template" id="ps-list-tpl">
        <%for( var i=0; i < {process}.length; i++ ){%>
        <ul class="manage-row">
            <li class="manage-col"><%={process[i]}.user%></li>
            <li class="manage-col"><%={process[i]}.pid%></li>
            <li class="manage-col"><%={process[i]}.cpu%></li>
            <li class="manage-col"><%={process[i]}.mem%></li>
            <li class="manage-col"><%={process[i]}.vsz%></li>
            <li class="manage-col"><%={process[i]}.rss%></li>
            <li class="manage-col"><%={process[i]}.tty%></li>
            <li class="manage-col"><%={process[i]}.stat%></li>
            <li class="manage-col"><%={process[i]}.start%></li>
            <li class="manage-col"><%={process[i]}.time%></li>
            <li class="manage-col-comm" title="<%={process[i]}.cmd%>"><%={process[i]}.cmd%></li>
        </ul>
        <%}%>
    </script>
    <?php include $this->getIncludeFile('common/terminal_dialog.html')?>
    <?php include $this->getIncludeFile('common/dialog_tops.html')?>
    <?php include $this->getIncludeFile('dark/blade/footer.blader.html')?>
    <script src="/static/js/common/jquery.1.11.js"></script>
    <script src="/static/js/common/bootstrap.min.js"></script>
    <script language="javascript" src="/static/js/common/JTE.js"></script>
    <script language="javascript" src="/static/js/default/node-manage.js"></script>
    <script>
        actionNav("node");
        window.manage.init({
            ps_container: document.getElementById('ps-list'),
            ps_list_tpl: document.getElementById('ps-list-tpl').innerHTML,
            v_qstr: '<?php echo $this->_symbol["v_qstr"]?>',
            last_created_at: '<?php echo $this->_symbol["node"]["created_at"]?>',
            _event: {
                shutdown: document.getElementById('node-shutdown'),
                reboot: document.getElementById('node-reboot'),
                terminal: document.getElementById('node-terminal'),
                closeTerm: document.getElementById('node-close-term')
            }
        });
    </script>
</body>
</html>
