<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>任务：<?php echo $this->_symbol["task"]["name"]?> - 查看</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .mark-option{left: -8px;top: 51px;min-width: 130px;width: auto;padding: 4px 15px;}
    </style>
</head>
<body>

    <div class="container">
        <div class="float-clear">
            <div class="float-left task-block">
                <div class="title">任务分发</div>
                <div class="tip">
                    分发方式：
                    <?php if($this->_symbol["task"]["dist_type"] == 1) {?>
                        全部节点
                    <?php }else if($this->_symbol["task"]["dist_type"] == 4){?>
                        全部非故障节点
                    <?php }else if($this->_symbol["task"]["dist_type"] == 5){?>
                        随机一个非故障节点
                    <?php }else if($this->_symbol["task"]["dist_type"] == 6){?>
                        第一个非故障节点
                    <?php }else if($this->_symbol["task"]["dist_type"] == 7){?>
                        最新一个非故障节点
                    <?php }?>
                </div>
                <div class="bottom">
                    <div class="float-left">
                        <div class="num"><?php echo $this->_symbol["task"]["distribute_num"]?></div>
                        <div class="desc">分发节点</div>
                    </div>
                    <div class="float-right">
                        <div class="state-green num"><?php echo $this->_symbol["task"]["completed_num"]?></div>
                        <div class="desc">已完成数</div>
                    </div>
                </div>
            </div>
            <div class="float-left task-block block-margin">
                <div class="title">运行状态</div>
                <div class="run-status">
                    <?php if($this->_symbol["task"]["status"]==0){?>
                        就绪
                    <?php }else if($this->_symbol["task"]["status"]==1){?>
                        运行中
                    <?php }else{?>
                        已完成
                    <?php }?>
                </div>
            </div>
            <div class="float-right task-block">
                <div class="title">任务进度</div>
                <div class="process" id="progress">
                    <div class="active" id="progress_complete"><?php echo $this->_symbol["task"]["complete_percent"]*100?>%</div>
                </div>
            </div>
        </div>
        <table class="sarah-table">
            <tr class="table-title">
                <th class="padding-left text-overflow">节点UID</th>
                <th class="padding-left text-overflow table-row-v6">节点名称</th>
                <th class="padding-left text-overflow table-row-v4">节点状态</th>
                <th class="padding-left text-overflow table-row-v4">任务状态</th>
                <th class="padding-left text-overflow table-row-v4">进度</th>
                <th class="padding-left text-overflow table-row-v4">操作</th>
            </tr>
            <?php if(empty($this->_symbol["dist"])){?>
                <tr class="table-row">
                    <td class="text-center" colspan="5">暂无节点</td>
                </tr>
            <?php }else{?>
                <?php foreach($this->_symbol["dist"] as $val){?>
                    <tr class="table-row">
                        <td class="padding-left text-overflow" title="<?php echo $val["node"]["node_uid"]?>">
                            <a class="node-uid" href="/node/monitor?<?php echo $val["node"]["v_qstr"]?>&__skin=embed&node_uid=<?php echo $val["node"]["node_uid"]?>"><?php echo $val["node"]["node_uid"]?></a>
                        </td>
                        <td class="padding-left text-overflow" title="<?php echo $val["node"]["name"]?>">
                            <?php echo $val["node"]["name"]?>
                        </td>
                        <td class="padding-left">
                            <?php if($val["node"]["status"]==1) {?>
                                <em class="state-normal">正常</em>
                            <?php }else if($val["node"]["status"]==2){?>
                                <em class="state-warning">重启中</em>
                            <?php }else{?>
                                <em data-toggle="tooltip" class="state-urgent float-left">故障</em>
                                <div class="float-left fault-mark margin-left-v1">
                                    <i class="iconfont iconWarning node-error mark"></i>
                                    <div class="mark-option">节点未响应</div>
                                </div>
                            <?php }?>
                        </td>
                        <td class="padding-left text-overflow">
                            <?php if($val["status"]==0){?>
                                就绪
                            <?php }else if($val["status"]==1){?>
                                运行中
                            <?php }else{?>
                                已完成
                            <?php }?>
                        </td>
                        <td class="padding-left text-overflow">
                            <?php echo ($val["progress"])*100?>%
                        </td>
                        <td class="padding-left">
                            <div class="select">
                                <div class="title state-blue manage_node">更多操作 <i class="iconfont iconxiala icon"></i></div>
                                <div class="option">
                                    <a class="item reboot" href="/node/command/view?cmd_id=<?php echo $val["cmd_id"]?>&<?php echo $val["node"]["v_qstr"]?>&__skin=embed">
                                       查看
                                    </a>
                                    <div class="item <?php echo $val["status"] != 2 ? 'forbid' : ''?>" data-status="<?php echo $val["status"]?>">重新运行</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                <?php }}?>
        </table>
        <?php include $this->getIncludeFile('default/blade/paging-simple.blade.html')?>
    </div>
    <?php include $this->getIncludeFile('common/dialog.html')?>
    <script src="/script/task/view?v=20190412"></script>
    <script>
        var config = {
            reboot: "#reboot",
            progress: "#progress",
            progress_complete: "#progress_complete",
            task_complete_percent: "<?php echo $this->_symbol["task"]["complete_percent"]?>",

        };
        window.task_view.init(config)
    </script>

</body>
</html>
