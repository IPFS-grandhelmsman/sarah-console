<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点硬件信息 - 正舵者矿机云监测</title>
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
            <a class="node-link" href="#">硬件信息</a>
            <a class="btn-manage-node" href="/node/manage?<?php echo $this->_symbol["node"]["v_qstr"]?>">管理节点</a>
        </div>

        <div class="clearfix content-yjxx">
            <div class="pull-left contain-yjxx-header">基础信息</div>
            <div style="padding-left: 90px;">
                <table class="yjxx-table">
                    <thead>
                        <tr class="yjxx-table-col">
                            <th class="text-center">CPU核数</th>
                            <th class="text-center">内存</th>
                            <th class="text-center">存储空间</th>
                            <th class="text-center">网卡数量</th>
                            <th class="text-center">网络地址</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center"><?php echo $this->_symbol["node"]["cpu_cores"]?></td>
                            <td class="text-center"><?php echo $this->_symbol["node"]["ram_str"]?></td>
                            <td class="text-center"><?php echo $this->_symbol["node"]["disk_str"]?></td>
                            <td class="text-center"><?php echo count($this->_symbol["node"]["_network_list"])?>块</td>
                            <td class="text-center"><?php echo $this->_symbol["node"]["ipaddr_str"]?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div>
            <div class="content-yjxx clearfix" id="CPU_detail">
                 <div class="pull-left contain-yjxx-header">CPU详情</div>
                 <div style="padding-left: 90px;">
                     <div class="pull-left content-yjxx-detail" >
                         <?php foreach ($this->_symbol["node"]["_cpu_list"] as $cpu) {?>
                         <ul class="yjxx-cup-list">
                             <li class="yjxx-cup-detail yjxx-detail-top clearfix">
                                 <div class="pull-left yjxx-cup-title"><b>core_id</b></div>
                                 <div class="pull-left"><b><?php echo $cpu["core_id"]?></b></div>
                             </li>
                             <li class="yjxx-cup-detail clearfix">
                                 <div class="pull-left yjxx-cup-title">型号</div>
                                 <div class="pull-left"><?php echo $cpu["model_name"]?></div>
                             </li>
                             <li class="yjxx-cup-detail clearfix">
                                 <div class="pull-left yjxx-cup-title">主频率</div>
                                 <div class="pull-left"><?php echo $cpu["mhz"]?></div>
                             </li>
                             <li class="yjxx-cup-detail clearfix">
                                 <div class="pull-left yjxx-cup-title">缓存</div>
                                 <div class="pull-left"><?php echo $cpu["cache"]?>&nbsp;KB</div>
                             </li>
                         </ul>
                         <?php }?>
                     </div>
                 </div>
             </div>
            <div class="content-yjxx clearfix" id="CP_detail">
                <div class="pull-left contain-yjxx-header">磁盘详情</div>
                <div style="padding-left: 90px;">
                    <div class="pull-left content-yjxx-detail">
                        <?php foreach ($this->_symbol["node"]["_disk_list"] as $disk) {?>
                        <ul class="yjxx-cup-list">
                            <li class="yjxx-cup-detail yjxx-detail-top clearfix">
                                <div class="pull-left yjxx-cup-title"><b>分区</b></div>
                                <div class="pull-left"><b><?php echo $disk["name"]?></b></div>
                            </li>
                            <li class="yjxx-cup-detail clearfix">
                                <div class="pull-left yjxx-cup-title">磁盘类型</div>
                                <div class="pull-left"><?php echo $disk["type"]?></div>
                            </li>
                            <li class="yjxx-cup-detail clearfix">
                                <div class="pull-left yjxx-cup-title">磁盘空间</div>
                                <div class="pull-left"><?php echo $disk["size"]?>KB&nbsp;≈&nbsp;<?php echo $disk["size_str"]?></div>
                            </li>
                            <li class="yjxx-cup-detail clearfix">
                                <div class="pull-left yjxx-cup-title">已用空间</div>
                                <div class="pull-left"><?php echo $disk["used"]?>KB&nbsp;≈&nbsp;<?php echo $disk["used_str"]?></div>
                            </li>
                        </ul>
                        <?php }?>
                    </div>
                </div>
            </div>
            <div class="content-yjxx clearfix" id="WL_detail">
                <div class="pull-left contain-yjxx-header">网络详情</div>
                <div style="padding-left: 90px;">
                    <div class="pull-left content-yjxx-detail">
                        <?php foreach ($this->_symbol["node"]["_network_list"] as $network) {?>
                        <ul class="yjxx-cup-list">
                            <li class="yjxx-cup-detail yjxx-detail-top clearfix">
                                <div class="pull-left yjxx-cup-title"><b>设备</b></div>
                                <div class="pull-left"><b><?php echo $network["name"]?></b></div>
                            </li>
                            <li class="yjxx-cup-detail clearfix">
                                <div class="pull-left yjxx-cup-title">硬件地址</div>
                                <div class="pull-left"><?php echo $network["hd_addr"]?></div>
                            </li>
                            <li class="yjxx-cup-detail clearfix">
                                <div class="pull-left yjxx-cup-title">接收数据</div>
                                <div class="pull-left"><?php echo $network["receive"]?>Bytes&nbsp;≈&nbsp;<?php echo $network["receive_str"]?></div>
                            </li>
                            <li class="yjxx-cup-detail clearfix">
                                <div class="pull-left yjxx-cup-title">接收数据包</div>
                                <div class="pull-left"><?php echo $network["r_packets"]?></div>
                            </li>
                            <li class="yjxx-cup-detail clearfix">
                                <div class="pull-left yjxx-cup-title">发送数据</div>
                                <div class="pull-left"><?php echo $network["transmit"]?>Bytes&nbsp;≈&nbsp;<?php echo $network["transmit_str"]?></div>
                            </li>
                            <li class="yjxx-cup-detail clearfix">
                                <div class="pull-left yjxx-cup-title">发送数据包</div>
                                <div class="pull-left"><?php echo $network["t_packets"]?></div>
                            </li>
                        </ul>
                        <?php }?>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="rightNav">
        <img class="yjxx-nav-img" src="/static/image/dark/icon-open.png" alt="打开" onclick="openMenu()">
        <div>
            <a class="yjxx-nav-content" href="#CPU_detail">CPU详情</a>
            <a class="yjxx-nav-content" href="#CP_detail">磁盘详情</a>
            <a class="yjxx-nav-content" href="#WL_detail">网络详情</a>
            <div class="yjxx-nav-content">
                <img src="/static/image/dark/icon-close.png" alt="关闭" style="width: 25px;cursor: pointer;" onclick="closeMenu()">
            </div>
        </div>
    </div>
    <?php include $this->getIncludeFile('dark/blade/footer.blader.html')?>
    <script src="/static/js/common/jquery.1.11.js"></script>
    <script src="/static/js/common/bootstrap.min.js"></script>
    <script type="text/javascript">
        actionNav("node");
        function openMenu(){
            $(".yjxx-nav-img").hide();
            $(".rightNav").animate({right:"20px"});
        }
        function closeMenu(){
            $(".rightNav").animate({right:"-130px"},function(){
                $(".yjxx-nav-img").show();
            });
        }
    </script>
</body>
</html>
