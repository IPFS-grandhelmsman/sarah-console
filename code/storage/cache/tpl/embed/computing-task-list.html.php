<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>任务面板</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .task-header{background-color: #fff;height: 60px;padding: 12px 20px;}
    </style>
</head>
<body>
    <div class="task-header float-clear">
        <button class="float-right btn btn-blue btn-xs" id="add_task"><i class="iconfont iconiconjia btn-icon-md"></i> 新建任务</button>
    </div>
    <div class="container">
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow">#ID</th>
                <th class="padding-left text-overflow table-row-v6">任务名称</th>
                <th class="padding-left text-overflow table-row-v5">创建时间</th>
                <th class="padding-left text-overflow table-row-v3">分发节点数</th>
                <th class="padding-left text-overflow table-row-v3">完成节点数</th>
                <th class="padding-left text-overflow table-row-v3">状态</th>
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
                        <td class="padding-left text-overflow"><?php echo $val["Id"]?></td>
                        <td class="padding-left text-overflow task-name"><?php echo $val["name"]?></td>
                        <td class="padding-left text-overflow"><?php echo $val["created_time"]?></td>
                        <td class="padding-left text-overflow"><?php echo $val["distribute_num"]?></td>
                        <td class="padding-left text-overflow"><?php echo $val["completed_num"]?></td>
                        <td class="padding-left text-overflow">
                            <?php if($val["status"]==0){?>
                                就绪
                            <?php }elseif($val["status"]==1){?>
                                运行中
                            <?php }else{?>
                                <em class="state-grey">已完成</em>
                            <?php }?>
                        </td>
                        <td class="padding-left" data-intro="<?php echo $val["intro"]?>">
                            <div class="select">
                                <div class="title state-blue more-option">更多操作 <i class="iconfont iconxiala icon"></i></div>
                                <div class="option">
                                    <div class="item <?php echo ($val["status"]==0)? 'edit-task' : 'forbid'?>" data-vqstr="<?php echo $val["v_qstr"]?>">编辑</div>
                                    <a class="item task-coding" href="/computing/task/coding?<?php echo $val["v_qstr"]?>&__skin=emebd">代码</a>
                                    <?php if($val["status"]==0){?>
                                        <div class="item start-task" data-vqstr="<?php echo $val["v_qstr"]?>&__skin=emebd">运行</div>
                                    <?php }else{?>
                                        <a class="item" href="/computing/task/view?<?php echo $val["v_qstr"]?>&__skin=emebd">查看</a>
                                    <?php }?>
                                </div>
                            </div>
                        </td>
                    </tr>
            <?php }}?>
            </tbody>
        </table>
        <?php include $this->getIncludeFile('default/blade/paging-simple.blade.html')?>
    </div>

    <div class="node-select-dialog" id="define_node_dialog">
        <?php include $this->getIncludeFile('common/node_select_list.html')?>
    </div>

    <?php include $this->getIncludeFile('common/task_dialog.html')?>
    <?php include $this->getIncludeFile('common/dialog.html')?>
    <script src="/script/task/list?v=20190412"></script>
    <script>
        var config = {
            add_task: "#add_task",
            edit_task: ".edit-task",
            start_task: ".start-task"
        };
        window.task.init(config);
        window.node_select_list.init();
    </script>
</body>
</html>
