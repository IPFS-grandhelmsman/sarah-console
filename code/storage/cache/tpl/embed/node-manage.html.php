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
        .process-pos{position: fixed;left: 20px;right: 20px;top: 334px;bottom: 15px;overflow-x: hidden;overflow-y: auto;}
    </style>
</head>
<body>
    <nav class="nav">
        <a class="link" href="/node/monitor?<?php echo $this->_symbol["v_qstr"]?>&__skin=embed&node_uid=<?php echo $this->_symbol["node"]["node_uid"]?>">节点监测</a>
        <a class="link" href="/node/view?<?php echo $this->_symbol["v_qstr"]?>&__skin=embed&node_uid=<?php echo $this->_symbol["node"]["node_uid"]?>">硬件信息</a>
        <a class="link active" href="/node/manage?<?php echo $this->_symbol["v_qstr"]?>&__skin=embed&node_uid=<?php echo $this->_symbol["node"]["node_uid"]?>">节点管理</a>
        <div class="float-right">
            <button class="btn btn-orange btn-xs margin-right-v6" id="node_reboot" data-vqstr="<?php echo $this->_symbol["v_qstr"]?>">重启</button>
            <button class="btn btn-green btn-xs margin-right-v6" id="node_terminal" data-vqstr="<?php echo $this->_symbol["v_qstr"]?>" data-nodeuid="<?php echo $this->_symbol["node"]["node_uid"]?>">简易终端</button>
        </div>
    </nav>
    <div class="container">
        <div class="node-title">系统信息</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v3">状态</th>
                <th class="padding-left text-overflow table-row-v3">系统</th>
                <th class="padding-left text-overflow table-row-v5">节点名称</th>
                <th class="padding-left text-overflow table-row-v5">内核版本</th>
                <th class="padding-left text-overflow">发行版本</th>
                <th class="padding-left text-overflow table-row-v4">架构体系</th>
            </tr>
            </thead>
            <tbody>
            <tr class="table-row">
            <?php if(isset($this->_symbol["node"])){?>
                <td class="padding-left text-overflow" id="node_id">...</td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["system"]["sys_name"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["system"]["node_name"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["system"]["release"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["system"]["version"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["system"]["machine"]?></td>
             <?php }?>
            </tr>
            </tbody>
        </table>

        <div class="margin-top-v4 node-title">进程列表</div>
        <table class="sarah-table">
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v2" title="用户">用户</th>
                <th class="padding-left text-overflow table-row-v2" title="进程ID">进程ID</th>
                <th class="padding-left text-overflow table-row-v1" title="%CPU">%CPU</th>
                <th class="padding-left text-overflow table-row-v1" title="%内存">%内存</th>
                <th class="padding-left text-overflow table-row-v2" title="虚拟内存">虚拟内存</th>
                <th class="padding-left text-overflow table-row-v2" title="物理内存">物理内存</th>
                <th class="padding-left text-overflow table-row-v2" title="终端">终端</th>
                <th class="padding-left text-overflow table-row-v1" title="状态">状态</th>
                <th class="padding-left text-overflow table-row-v2" title="启动时间">启动时间</th>
                <th class="padding-left text-overflow table-row-v2" title="运行时长">运行时长</th>
                <th class="padding-left text-overflow" title="进程指令">进程指令</th>
            </tr>
        </table>
        <div class="process-pos">
            <table class="sarah-table" id="ps-list">
                <?php foreach( $this->_symbol["node"]["process"] as $ps ){?>
                    <tr class="table-row">
                        <th class="padding-left text-overflow table-row-v2" title="<?php echo $ps["user"]?>"><?php echo $ps["user"]?></th>
                        <th class="padding-left text-overflow table-row-v2" title="<?php echo $ps["pid"]?>"><?php echo $ps["pid"]?></th>
                        <th class="padding-left text-overflow table-row-v1" title="<?php echo $ps["cpu"]?>"><?php echo $ps["cpu"]?></th>
                        <th class="padding-left text-overflow table-row-v1" title="<?php echo $ps["mem"]?>"><?php echo $ps["mem"]?></th>
                        <th class="padding-left text-overflow table-row-v2" title="<?php echo $ps["vsz"]?>"><?php echo $ps["vsz"]?></th>
                        <th class="padding-left text-overflow table-row-v2" title="<?php echo $ps["rss"]?>"><?php echo $ps["rss"]?></th>
                        <th class="padding-left text-overflow table-row-v2" title="<?php echo $ps["tty"]?>"><?php echo $ps["tty"]?></th>
                        <th class="padding-left text-overflow table-row-v1" title="<?php echo $ps["stat"]?>"><?php echo $ps["stat"]?></th>
                        <th class="padding-left text-overflow table-row-v2" title="<?php echo $ps["start"]?>"><?php echo $ps["start"]?></th>
                        <th class="padding-left text-overflow table-row-v2" title="<?php echo $ps["time"]?>"><?php echo $ps["time"]?></th>
                        <th class="padding-left text-overflow" title="<?php echo $ps["cmd"]?>"><?php echo $ps["cmd"]?></th>
                    </tr>
                <?php }?>
            </table>
        </div>
    </div>
   <script type="text/template" id="ps-list-tpl">
       <%for( var i=0; i < {process}.length; i++ ){%>
            <tr class="table-row">
                <th class="padding-left text-overflow table-row-v2" title="<%={process[i]}.user%>"><%={process[i]}.user%></th>
                <th class="padding-left text-overflow table-row-v2" title="<%={process[i]}.pid%>"><%={process[i]}.pid%></th>
                <th class="padding-left text-overflow table-row-v1" title="<%={process[i]}.cpu%>"><%={process[i]}.cpu%></th>
                <th class="padding-left text-overflow table-row-v1" title="<%={process[i]}.mem%>"><%={process[i]}.mem%></th>
                <th class="padding-left text-overflow table-row-v2" title="<%={process[i]}.vsz%>"><%={process[i]}.vsz%></th>
                <th class="padding-left text-overflow table-row-v2" title="<%={process[i]}.rss%>"><%={process[i]}.rss%></th>
                <th class="padding-left text-overflow table-row-v2" title="<%={process[i]}.tty%>"><%={process[i]}.tty%></th>
                <th class="padding-left text-overflow table-row-v1" title="<%={process[i]}.stat%>"><%={process[i]}.stat%></th>
                <th class="padding-left text-overflow table-row-v2" title="<%={process[i]}.start%>"><%={process[i]}.start%></th>
                <th class="padding-left text-overflow table-row-v2" title="<%={process[i]}.time%>"><%={process[i]}.time%></th>
                <th class="padding-left text-overflow" title="<%={process[i]}.cmd%>"><%={process[i]}.cmd%></th>
            </tr>
       <%}%>
   </script>
   <?php include $this->getIncludeFile('common/terminal_dialog.html')?>
   <?php include $this->getIncludeFile('common/dialog.html')?>
   <script src="/script/node/manager?v=20190412"></script>
   <script type="text/javascript">
       var status_params = {
           target_id: "#node_id",
           v_qstr: '<?php echo $this->_symbol["v_qstr"]?>'
       };
       window.node_status.init(status_params);
       window.manage.init({
           ps_container: document.getElementById('ps-list'),
           ps_list_tpl: document.getElementById('ps-list-tpl').innerHTML,
           v_qstr: '<?php echo $this->_symbol["v_qstr"]?>',
           app_key: '<?php echo $this->_symbol["app_key"]?>',
           node_uid: '<?php echo $this->_symbol["node"]["node_uid"]?>',
           last_created_at: '<?php echo $this->_symbol["node"]["created_at"]?>',
           _event: {
               shutdown: document.getElementById('node-shutdown'),
               reboot: document.getElementById('node-reboot'),
               terminal: document.getElementById('node-terminal'),
               closeTerm: document.getElementById('node-close-term')
           }
       });
       window.nodeOperation.init({
           reboot: "#node_reboot",
           terminal: "#node_terminal",
           app_key: "<?php echo $this->_symbol["app_key"]?>"
       })
   </script>
</body>
</html>
