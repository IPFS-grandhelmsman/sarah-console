<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点统计</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .node-map{width: 100%;height: 1000px;margin-top: 15px;border: 1px solid #eee;}
    </style>
</head>
<body>
    <div class="container">
        <div class="node-title">硬件资源</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v4">节点总数</th>
                <th class="padding-left text-overflow table-row-v4">总vCPU</th>
                <th class="padding-left text-overflow table-row-v4">平均vCPU</th>
                <th class="padding-left text-overflow">总内存</th>
                <th class="padding-left text-overflow">总磁盘空间</th>
                <th class="padding-left text-overflow">更新时间</th>
            </tr>
            <tbody>
            <tr class="table-row">
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["total"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["cpu_cores"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["avg_cpu_cores"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["ram_kb"]?>KB&nbsp;≈&nbsp;<?php echo $this->_symbol["stat"]["ram_str"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["disk_kb"]?>KB&nbsp;≈&nbsp;<?php echo $this->_symbol["stat"]["disk_str"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["updated_time"]?></td>
            </tr>
            </tbody>
            </thead>
        </table>

        <div class="margin-top-v4 node-title">基础监测</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v5">平均系统负载</th>
                <th class="padding-left text-overflow">内存使用</th>
                <th class="padding-left text-overflow">磁盘使用</th>
                <th class="padding-left text-overflow">下载带宽</th>
                <th class="padding-left text-overflow">上传带宽</th>
            </tr>
            </thead>
            <tbody>
            <tr class="table-row">
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["avg_loadavg"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["ram_used_kb"]?>KB&nbsp;≈&nbsp;<?php echo $this->_symbol["stat"]["ram_used_str"]?>, <?php echo $this->_symbol["stat"]["ram_used_percent"] * 100?>%</td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["disk_used_kb"]?>KB&nbsp;≈&nbsp;<?php echo $this->_symbol["stat"]["disk_used_str"]?>, <?php echo $this->_symbol["stat"]["disk_used_percent"] * 100?>%</td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["incoming_db"]?>B/s&nbsp;≈&nbsp;<?php echo $this->_symbol["stat"]["incoming_db_str"]?>/s</td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["stat"]["outgoing_bd"]?>B/s&nbsp;≈&nbsp;<?php echo $this->_symbol["stat"]["outgoing_bd_str"]?>/s</td>
            </tr>
            </tbody>
        </table>

        <div class="margin-top-v4 node-title">节点分布</div>
        <div class="node-map" id="widget_map"></div>
    </div>
    <script src="/script/statistics/?v=20190412"></script>
    <script type="text/javascript">
        var iframeId = window.link.get_link_string("__sara_iframe_id");
        var nodeData = [
            {name:"China",value:"1538",coordinate:[102.947956, 33.759559]},
            {name:"United States",value:"586",coordinate: [-102.560794, 39.830238]},
            {name:"Canada",value:"264",coordinate: [-118.493369, 60.197298]},
            {name:"Australia",value:"582",coordinate: [132.740687, -25.042580]},
            {name:"Japan",value:"465",coordinate: [138.265336, 36.196679]},
            {name:"United Kingdom",value:"256",coordinate: [-2.946899, 54.710688]},
        ];
        var skin = {
            bgColor: "#fff",
            textColor:"#84b1ff",
            tooltipBgColor: "",
            tooltipBdColor: "",
            geoBgColor: "rgba(199,210,220,0.1)",
            geoBdColor: "#84b1ff",
            geoHoverBgColor:"rgba(132,177,255,0.3)",
            legendColor: ["#84b1ff"]
        };
        window.NodeMap.init({
            map_dom: document.getElementById('widget_map'),
            data: nodeData,
            skin: skin,
            iframe_id: iframeId
        });
    </script>
</body>
</html>
