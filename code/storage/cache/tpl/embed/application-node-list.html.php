<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $this->_symbol["app"]["name"]?> - 预览</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .container{margin-top: 60px;}
        .sarah-line{color: #707D8A;font-size: 16px;}
        .one-key-install{color: #327BFA;font-size: 16px;background-color: transparent;outline: none;border: 0;text-decoration: underline;cursor: pointer;}
        #define_node_dialog .node_id{margin-left: 40px;}
        .start-app,.unistall-app{cursor: pointer;}
        .app-config-data{position: absolute;left: 20px;top:50px;right: 20px;bottom: 20px;overflow: auto;}
        .mark-option{left: -8px;top: 51px;min-width: 130px;width: auto;padding: 4px 15px;}
    </style>
</head>
<body>
    <nav class="nav">
        <a class="link active" href="/application/node/?<?php echo $this->_symbol["app"]["v_qstr"]?>">预览</a>
        <a class="link" href="/application/task/?<?php echo $this->_symbol["app"]["v_qstr"]?>">任务</a>
        <a class="link" href="/user/application/view?<?php echo $this->_symbol["app"]["v_qstr"]?>">配置</a>
        <div class="float-right">
            <button class="btn btn-green btn-xs margin-right-v3 batch-start-app">启动</button>
            <button class="btn btn-blue btn-xs margin-right-v3 batch-stop-app">停止</button>
            <button class="btn btn-danger btn-xs batch-uninstall-app">卸载</button>
        </div>
    </nav>
    <div class="container">
        <div class="sarah-line" id="node_statistic">
            共有<span id="all_node">&nbsp;&nbsp;</span>个节点，
            目前还有<span class="state-urgent" id="no_install_node">&nbsp;&nbsp;</span>个节点未安装<?php echo $this->_symbol["app"]["name"]?>应用程序。
            <button class="one-key-install sarah-hide" id="install_all">点击一键安装</button>
        </div>
        <table class="sarah-table margin-top-v4">
            <thead>
            <tr class="table-title">
                <th class="padding-left table-row-v1">
                    <div class="check-pos table-check">
                        <input class="check-box all-check" type="checkbox">
                        <label class="check-label"></label>
                    </div>
                </th>
                <th class="padding-left table-text">节点UID</th>
                <th class="padding-left table-text table-row-v5">节点名称</th>
                <th class="padding-left table-text table-row-v2">节点状态</th>
                <th class="padding-left table-text table-row-v2">进程ID</th>
                <th class="padding-left table-text table-row-v2">应用状态</th>
                <th class="padding-left table-text table-row-v3">应用%CPU</th>
                <th class="padding-left table-text table-row-v3">应用%内存</th>
                <th class="padding-left table-row-v3">操作</th>
            </tr>
            </thead>
            <tbody>
            <?php if(empty($this->_symbol["data"])){?>
                <tr class="table-row">
                    <td class="text-center sarah-line" colspan="9">目前暂无任何节点安装了<?php echo $this->_symbol["app"]["name"]?>应用，请到“<a class="one-key-install" href="/application/task/?<?php echo $this->_symbol["app"]["v_qstr"]?>">任务</a>”中去新建安装任务。</td>
                </tr>
            <?php }else{?>
            <?php foreach($this->_symbol["data"] as $val){?>
                <tr class="table-row">
                    <td class="padding-left">
                        <div class="check-pos table-check">
                            <input type="checkbox" <?php echo $val["node"]["status"] == 0 ? "class='check-box check-box-forbid' disabled title='节点故障，不可选中'" : "class='check-box single-check'"?>>
                            <label class="check-label"></label>
                        </div>
                    </td>
                    <td class="padding-left text-overflow" id="<?php echo $val["node"]["Id"]?>" title="<?php echo $val["node"]["node_uid"]?>">
                        <a class="node-uid" href="/node/monitor?<?php echo $val["node"]["v_qstr"]?>&__skin=embed&node_uid=<?php echo $val["node"]["node_uid"]?>" data-id="<?php echo $val["node"]["Id"]?>"><?php echo $val["node"]["node_uid"]?></a>
                    </td>
                    <td class="padding-left text-overflow table-node-name" title="<?php echo $val["node"]["name"]?>">
                        <?php echo $val["node"]["name"]?>
                    </td>
                    <td class="padding-left node-status" data-status="<?php echo $val["node"]["status"]?>">
                        <?php if($val["node"]["status"]==1) {?>
                            <em>正常</em>
                        <?php }else if($val["node"]["status"]==2){?>
                            <em class="state-rebooting">重启中</em>
                        <?php }else if($val["node"]["status"]==0){?>
                            <em class="state-urgent float-left" data-toggle="tooltip">故障</em>
                            <div class="float-left fault-mark margin-left-v1">
                                <i class="iconfont iconWarning node-error mark"></i>
                                <div class="mark-option" >节点未响应</div>
                            </div>
                        <?php }?>
                    </td>
                    <td class="padding-left text-overflow app-pid"><?php echo $val["pid"]?> </td>
                    <td class="padding-left text-overflow app-st">
                        <?php if($val["status"] == 0){?>
                            <em class="state-urgent app-status" data-status="0">待安装</em>
                        <?php }else if($val["status"] == 1){?>
                            <em class="state-blue app-status" data-status="1">安装中&nbsp;<?php echo ($val["progress"] * 100)?>%</em>
                        <?php }else if($val["status"] == 2){?>
                            <em class="state-grey app-status" data-status="2">未启动&nbsp;<i class="iconfont iconqidong <?php echo $val["node"]["status"] == 0 ? 'state-grey' : 'state-blue start-app'?>" title="点击启动"></i></em>
                        <?php }else if($val["status"] == 3){?>
                            <em class="state-blue app-status" data-status="3">启动中&nbsp;<?php echo ($val["progress"] * 100)?>%</em>
                        <?php }else if($val["status"] == 4){?>
                            <em class="state-normal app-status" data-status="4">运行中 </em>
                        <?php }else if($val["status"] == 5){?>
                            <em class="state-blue app-status" data-status="5">停止中&nbsp;<?php echo ($val["progress"] * 100)?>%</em>
                        <?php }else if($val["status"] == 6){?>
                            <em class="state-blue app-status" data-status="6">卸载中&nbsp;<?php echo ($val["progress"] * 100)?>%</em>
                        <?php }else if($val["status"] == 7){?>
                            <em class="state-grey app-status" data-status="7">已卸载 <i class="iconfont iconshanchu <?php echo $val["node"]["status"] == 0 ? 'state-grey' : 'state-blue unistall-app'?>" title="点击卸载"></i></em>
                        <?php }?>
                    </td>
                    <td class="padding-left text-overflow  app-cpu">
                        <div class="float-left cpu-data">
                            <?php if($val["stat_json"]["cpu"]){?>
                            <?php echo $val["stat_json"]["cpu"]?>%
                            <?php }else{?>
                            0%
                            <?php }?>
                        </div>
                    <td class="padding-left text-overflow app-mem">
                        <div class="float-left mem-data">
                            <?php if($val["stat_json"]["mem"]){?>
                                <?php echo $val["stat_json"]["mem"]?>%
                            <?php }else{?>
                                0%
                            <?php }?>
                        </div>
                    <td class="padding-left menu">
                        <div class="select">
                            <div class="title state-blue more-option">更多操作 <i class="iconfont iconxiala icon"></i></div>
                            <ul class="option">
                                <li class="item stop">停止</li>
                                <li class="item unistall">卸载</li>
                                <li class="item config" data-vqstr="<?php echo $val["v_qstr"]?>">修改配置</li>
                            </ul>
                        </div>
                        <div class="sarah-hide process-data"><?php echo json_encode($val["stat_json"])?></div>
                        <div class="sarah-hide node-config-data"><?php echo json_encode($val["config_json"])?></div>
                    </td>
                </tr>
            <?php }}?>
            </tbody>
        </table>
        <?php include $this->getIncludeFile('default/blade/paging-simple.blade.html')?>
    </div>

    <!--配置弹框-->
    <div class="application-process sarah-hide" id="process">
        <div class="sign" id="sign"></div>
        <div class="app-process" id="app_process"></div>
    </div>

    <script type="text/template" id="app_process_tpl">
        <%for(var i=0; i < {process}.length; i++){%>
            <div class="float-clear">
                <div class="float-left title"><%={process[i]}.desc%></div>
                <div class="float-left content"><%={process[i]}.value%></div>
            </div>
        <%}%>
    </script>

    <!--修改配置弹框-->
    <div class="max-dialog" id="node_config">
        <div class="header">
            <span class="app-node-header" id="config_header">节点UID:</span>
            <i class="iconfont iconguanbi1 float-right dialog-close" id="close_config"></i>
        </div>
        <div class="app-config-data" id="app_config_data">

        </div>
    </div>

    <!--自定义节点-->
    <div class="node-select-dialog" id="define_node_dialog">
        <?php include $this->getIncludeFile('common/node_select_list.html')?>
    </div>

    <?php include $this->getIncludeFile('common/task_dialog.html')?>
    <?php include $this->getIncludeFile('common/dialog.html')?>
    <?php include $this->getIncludeFile('common/application_config.html')?>


    <script src="/script/application/nodeList?v=20190412"></script>
    <script>
        var config = {
            v_qstr: "<?php echo $this->_symbol["app"]["v_qstr"]?>",
            app_name: "<?php echo $this->_symbol["app"]["name"]?>"
        };
        window.app_preview.init(config);
        window.node_select_list.init();
    </script>
</body>
</html>
