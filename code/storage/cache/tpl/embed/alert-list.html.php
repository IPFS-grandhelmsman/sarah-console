<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>警报管理</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .container{margin-top: 60px;}
    </style>
</head>
<body>
    <nav class="nav">
        <a class="link active" href="/alert/list?__skin=embed">警报列表</a>
        <a class="link" href="/alert/setting?__skin=embed">警报设置</a>
        <div class="float-right">
            <button class="btn btn-green btn-xs margin-right-v6" id="reload">刷新</button>
            <button class="btn btn-blue btn-xs margin-right-v6">标记为已处理</button>
        </div>
    </nav>
    <div class="container">
        <table class="sarah-table">
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v1">
                    <div class="check-pos table-check">
                        <input class="check-box all-check" type="checkbox">
                        <label class="check-label"></label>
                    </div>
                </th>
                <th class="padding-left text-overflow">节点UID</th>
                <th class="padding-left text-overflow table-row-v5">节点名称</th>
                <th class="padding-left text-overflow table-row-v3">警报类型</th>
                <th class="padding-left text-overflow table-row-v3">警报值</th>
                <th class="padding-left text-overflow table-row-v4">发布时间</th>
                <th class="padding-left text-overflow table-row-v2">处理状态</th>
                <th class="padding-left text-overflow table-row-v4">操作</th>
            </tr>
            <?php if(empty($this->_symbol["data"])){?>
                <tr class="table-row">
                    <td class="text-center" colspan="8">暂无任何注册节点</td>
                </tr>
            <?php }else{?>
                <?php foreach($this->_symbol["data"] as $val) {?>
                    <tr class="table-row">
                        <td class="padding-left text-overflow">
                            <div class="check-pos table-check">
                                <input class="check-box single-check" type="checkbox">
                                <label class="check-label"></label>
                            </div>
                        </td>
                        <td class="padding-left text-overflow" title="<?php echo $val["node"]["node_uid"]?>">
                            <a class="node-uid" href="/node/monitor?<?php echo $val["node"]["v_qstr"]?>&__skin=embed&node_uid=<?php echo $val["node"]["node_uid"]?>"><?php echo $val["node"]["node_uid"]?></a>
                        </td>
                        <td class="padding-left text-overflow" title="<?php echo $val["node"]["name"]?>">
                            <?php echo $val["node"]["name"]?>
                        </td>
                        <td class="padding-left text-overflow"><?php echo $val["alert_type_str"]?></td>
                        <td class="padding-left text-overflow"><?php echo $val["alert_value_str"]?></td>
                        <td class="padding-left text-overflow"><?php echo $val["created_time"]?></td>
                        <td class="padding-left text-overflow"><?php echo $val["readed_at"]==0 ? '<em class="state-error">未处理</em>' : '<em class="state-normal">已处理</em>'?></td>
                        <td class="padding-left text-overflow">
                            <span class="<?php echo $val["readed_at"] == 0 ? 'mark-dealed' : 'mark-undealed'?>" data-id="<?php echo $val["Id"]?>">标记已处理<i class="iconfont iconbiaoji"></i> </span>
                        </td>
                    </tr>
                <?php }}?>
        </table>
        <?php include $this->getIncludeFile('default/blade/paging-simple.blade.html')?>
    </div>
    <?php include $this->getIncludeFile('common/dialog.html')?>
    <script src="/script/alert/list?v=20190412"></script>
    <script>
        var config = {
            mark_dealed: ".mark-dealed"
        };
        window.alert_list.init(config);
    </script>
</body>
</html>
