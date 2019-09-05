<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $this->_symbol["app"]["name"]?> - 任务</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .container{margin-top: 60px;}
        .iconiconjia{font-size: 13px;}
        .choo-task-type{display: inline-block;color: #327BFA;font-size: 12px;-webkit-transform: scale(0.8);-moz-transform: scale(0.8);-ms-transform: scale(0.8);-o-transform: scale(0.8);transform: scale(0.8);}
        .check-label{margin-right: 25px;height: 30px;}
        .sarah-table .check-label{margin-right: 0;height: 0;}
        .input-line{height: 55px;font-size: 14px;}
        #find_task{width: 650px;max-height: 450px}
        #find_task .task-node{width: 650px;max-height: 344px;margin-left: -20px;padding: 0 20px;overflow: auto;}
        .find-task{cursor:pointer;}
    </style>
</head>
<body>
    <nav class="nav">
        <a class="link" href="/application/node/?<?php echo $this->_symbol["app"]["v_qstr"]?>&__skin=embed">预览</a>
        <a class="link active" href="/application/task/?<?php echo $this->_symbol["app"]["v_qstr"]?>&__skin=embed">任务</a>
        <a class="link" href="/user/application/view?<?php echo $this->_symbol["app"]["v_qstr"]?>&__skin=embed">配置</a>
        <div class="float-right">
            <button class="btn btn-blue btn-xs margin-right-v3 batch-start-app" id="add_task"><i class="iconfont iconiconjia"></i> 新建任务</button>
        </div>
    </nav>
    <div class="container">
        <table class="sarah-table">
            <thead>
                <tr class="table-title">
                    <th class="padding-left text-overflow table-row-v6">ID</th>
                    <th class="padding-left table-row-v4">
                        <div class="select">
                            <div class="title" id="choose_task_type">任务类型 &nbsp;<i class="iconfont iconxiala choo-task-type"></i></div>
                            <ul class="option">
                                <li class="item active">全部</li>
                                <li class="item">安装</li>
                                <li class="item">启动</li>
                                <li class="item">停止</li>
                                <li class="item">卸载</li>
                            </ul>
                        </div>

                    </th>
                    <th class="padding-left text-overflow table-row-v5">创建时间</th>
                    <th class="padding-left text-overflow table-row-v2">分发节点</th>
                    <th class="padding-left text-overflow table-row-v2">完成节点</th>
                    <th class="padding-left text-overflow table-row-v3">任务进度</th>
                    <th class="padding-left text-overflow">备注</th>
                    <th class="padding-left text-overflow table-row-v4">操作</th>
                </tr>
            </thead>
            <tbody>
            <?php if(empty($this->_symbol["data"])){?>
            <tr class="table-row">
                <td class="text-center" colspan="7">暂无数据</td>
            </tr>
            <?php }else{?>
                <?php foreach($this->_symbol["data"] as $val){?>
                    <tr class="table-row">
                        <td class="padding-left text-overflow" title=""><?php echo $val["Id"]?></td>
                        <td class="padding-left text-overflow">
                            <?php if($val["opt_type"] == 1){?>
                                安装
                            <?php }else if($val["opt_type"] == 2){?>
                                启动
                            <?php }else if($val["opt_type"] == 3){?>
                                停止
                            <?php }else if($val["opt_type"] == 4){?>
                                卸载
                            <?php }?>
                        <td class="padding-left text-overflowtext" title=""><?php echo $val["created_time"]?></td>
                        <td class="padding-left text-overflow"><?php echo $val["distribute_num"]?></td>
                        <td class="padding-left text-overflow"><?php echo $val["completed_num"]?></td>
                        <td class="padding-left text-overflow">
                            <?php if($val["complete_percent"] == 1){?>
                                <em class="state-grey">已完成</em>
                            <?php }else{?>
                                <em class="state-blue"><?php echo ($val["complete_percent"])*100?>%</em>
                            <?php }?>
                        </td>
                        <td class="padding-left check-pos">
                            <div class="float-left text-overflow mark"><?php echo $val["intro"]?></div>
                            <div class="mark-option"><?php echo $val["intro"]?></div>
                        </td>
                        <td class="padding-left text-overflow state-blue find-task" data-name="<?php echo $val["name"]?>" data-vqstr="<?php echo $val["v_qstr"]?>">查看节点</td>
                    </tr>
            <?php }}?>
            </tbody>
        </table>
        <?php include $this->getIncludeFile('default/blade/paging-simple.blade.html')?>
    </div>

    <div class="dialog dialog-width-v1 app-task" id="choose_type">
        <div class="header">
            请选择<?php echo $this->_symbol["app"]["name"]?>应用的任务类型
            <i class="iconfont iconguanbi1 float-right dialog-close" id="choose_type_close"></i>
        </div>
        <div class="margin-top-v7 input-line float-clear">
            <div class="check-pos float-left">
                <input class="check-box" type="radio" name="app_task_type" data-type="1" value="安装<?php echo $this->_symbol["app"]["name"]?>">
                <label class="check-label"></label><span class="state-grey-v2">安装<?php echo $this->_symbol["app"]["name"]?></span>
            </div>
            <div class="check-pos float-right">
                <input class="check-box" type="radio" name="app_task_type" data-type="2" value="启动<?php echo $this->_symbol["app"]["name"]?>">
                <label class="check-label"></label><span class="state-grey-v2">启动<?php echo $this->_symbol["app"]["name"]?></span>
            </div>
        </div>
        <div class="input-line float-clear">
            <div class="check-pos float-left">
                <input class="check-box" type="radio" name="app_task_type" data-type="3" value="停止<?php echo $this->_symbol["app"]["name"]?>">
                <label class="check-label"></label><span class="state-grey-v2">停止<?php echo $this->_symbol["app"]["name"]?></span>
            </div>
            <div class="check-pos float-right">
                <input class="check-box" type="radio" name="app_task_type" data-type="4" value="卸载<?php echo $this->_symbol["app"]["name"]?>">
                <label class="check-label"></label><span class="state-grey-v2">卸载<?php echo $this->_symbol["app"]["name"]?></span>
            </div>
        </div>
        <div>
            <button class="btn btn-blue btn-max" id="go_step">下一步</button>
        </div>
    </div>
    <div class="dialog" id="find_task">
        <div class="header">
            <span id="find_task_header">分发方式：全部未启动节点</span>
            <i class="iconfont iconguanbi1 float-right dialog-close" id="close_task_node"></i>
        </div>
        <div>
            <table class="sarah-table">
                <tr class="table-title">
                    <td class="padding-left text-overflow table-row-v14">节点UID</td>
                    <td class="padding-left text-overflow table-row-v7">节点名称</td>
                    <td class="padding-left text-overflow table-row-v5">节点状态</td>
                </tr>
            </table>
        </div>
        <div class="task-node">
            <table class="sarah-table" id="task_relate_node"></table>
        </div>
    </div>
    <?php include $this->getIncludeFile('common/task_dialog.html')?>
    <?php include $this->getIncludeFile('common/dialog.html')?>

    <div class="node-select-dialog" id="define_node_dialog">
        <?php include $this->getIncludeFile('common/node_select_list.html')?>
    </div>

    <script type="text/template" id="task_node_tpl">
        <%for(var i=0;i <{nodes}.length;i++){%>
            <tr class="table-row">
                <td class="padding-left text-overflow table-row-v14" title="<%={nodes[i]}.node_uid%>"><%={nodes[i]}.node_uid%></td>
                <td class="padding-left text-overflow table-row-v7" title="<%={nodes[i]}.name%>"><%={nodes[i]}.name%></td>
                <td class="padding-left text-overflow table-row-v5">
                    <%if({nodes[i]}.status == 1){%>
                        <em>正常</em>
                    <%}else if({nodes[i]}.status == 2){%>
                        <em class="state-warning">重启中</em>
                    <%}else{%>
                        <em class="state-error">故障</em>
                    <%}%>

                </td>
            </tr>
        <%}%>
    </script>
    <script src="/script/application/taskList?v=20190412"></script>
    <script>
        var config = {
            v_qstr: "<?php echo $this->_symbol["app"]["v_qstr"]?>"
        };
        window.app_task.init(config);
        window.node_select_list.init();
    </script>
</body>
</html>
