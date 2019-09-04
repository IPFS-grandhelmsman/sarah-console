<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点硬件信息 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/default/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php include $this->getIncludeFile('default/blade/header.blade.html')?>
<div class="main">
<div class="container">
    <div class="widget-header">
        <h4 class="sub-header"><em class="glyphicon glyphicon-facetime-video"></em>&nbsp;节点&nbsp;-&nbsp;硬件信息</h4>
    </div>
    <div class="widget-container">
        <h4 class="sub-header"><em class="glyphicon glyphicon-home"></em>&nbsp;基础信息</h4>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>CPU核数</th>
                <th>内存</th>
                <th>存储空间</th>
                <th>网络地址</th>
            </tr>
            </thead>
            <tbody>
              <tr>
                <td><?php echo $this->_symbol["node"]["cpu_cores"]?></td>
                <td><?php echo $this->_symbol["node"]["ram_str"]?></td>
                <td><?php echo $this->_symbol["node"]["disk_str"]?></td>
                <td><?php echo $this->_symbol["node"]["ipaddr_str"]?></td>
              </tr>
            </tbody>
        </table>
        <div class="vertical-5"></div>
        <h4 class="sub-header"><em class="glyphicon glyphicon-hdd"></em>&nbsp;详细配置</h4>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>硬件类别</th>
                <th>计数</th>
                <th>硬件详情</th>
            </tr>
            </thead>
            <tbody>
              <tr>
                <td>CPU</td>
                <td><?php echo $this->_symbol["node"]["cpu_cores"]?>核</td>
                <td>
                <?php foreach ($this->_symbol["node"]["_cpu_list"] as $cpu) {?>
                    <div class="item">
                        <div class="line header">
                            <div class="name">core_id: </div>
                            <div class="value"><?php echo $cpu["core_id"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">型号: </div>
                            <div class="value"><?php echo $cpu["model_name"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">主频率: </div>
                            <div class="value"><?php echo $cpu["mhz"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">缓存: </div>
                            <div class="value"><?php echo $cpu["cache"]?>&nbsp;KB</div>
                        </div>
                    </div>
                <?php }?>
                </td>
              </tr>
              <tr>
                <td>内存</td>
                <td colspan="2"><?php echo $this->_symbol["node"]["ram_str"]?></td>
              </tr>
              <tr>
                <td>磁盘</td>
                <td><?php echo $this->_symbol["node"]["disk_str"]?></td>
                <td>
                <?php foreach ($this->_symbol["node"]["_disk_list"] as $disk) {?>
                    <div class="item">
                        <div class="line header">
                            <div class="name">分区: </div>
                            <div class="value"><?php echo $disk["name"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">磁盘类型: </div>
                            <div class="value"><?php echo $disk["type"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">磁盘空间: </div>
                            <div class="value"><?php echo $disk["size"]?>KB&nbsp;≈&nbsp;<?php echo $disk["size_str"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">已用空间: </div>
                            <div class="value"><?php echo $disk["used"]?>KB&nbsp;≈&nbsp;<?php echo $disk["used_str"]?></div>
                        </div>
                    </div>
                <?php }?>
                </td>
              </tr>
              <tr>
                <td>网络</td>
                <td><?php echo count($this->_symbol["node"]["_network_list"])?>块</td>
                <td>
                <?php foreach ($this->_symbol["node"]["_network_list"] as $network) {?>
                    <div class="item">
                        <div class="line header">
                            <div class="name">设备: </div>
                            <div class="value"><?php echo $network["name"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">硬件地址: </div>
                            <div class="value"><?php echo $network["hd_addr"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">接收数据: </div>
                            <div class="value"><?php echo $network["receive"]?>Bytes&nbsp;≈&nbsp;<?php echo $network["receive_str"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">接收数据包: </div>
                            <div class="value"><?php echo $network["r_packets"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">发送数据: </div>
                            <div class="value"><?php echo $network["transmit"]?>Bytes&nbsp;≈&nbsp;<?php echo $network["transmit_str"]?></div>
                        </div>
                        <div class="line">
                            <div class="name">发送数据包: </div>
                            <div class="value"><?php echo $network["t_packets"]?></div>
                        </div>
                    </div>
                <?php }?>
                </td>
              </tr>
            </tbody>
        </table>
        <div class="vertical-20"></div>
    </div>
</div>
</div>
<script src="/static/js/common/jquery.1.11.js"></script>
<script src="/static/js/common/bootstrap.min.js"></script>
</body>
</html>
