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
    </style>
</head>
<body>
    <nav class="nav">
        <a class="link" href="/node/monitor?<?php echo $this->_symbol["node"]["v_qstr"]?>&__skin=embed&node_uid=<?php echo $this->_symbol["node"]["node_uid"]?>">节点监测</a>
        <a class="link active" href="/node/view?<?php echo $this->_symbol["node"]["v_qstr"]?>&__skin=embed&node_uid=<?php echo $this->_symbol["node"]["node_uid"]?>">硬件信息</a>
        <a class="link" href="/node/manage?<?php echo $this->_symbol["node"]["v_qstr"]?>&__skin=embed&node_uid=<?php echo $this->_symbol["node"]["node_uid"]?>">节点管理</a>
        <div class="float-right">
            <button class="btn btn-orange btn-xs margin-right-v6" id="node_reboot" data-vqstr="<?php echo $this->_symbol["node"]["v_qstr"]?>">重启</button>
            <button class="btn btn-green btn-xs margin-right-v6" id="node_terminal" data-vqstr="<?php echo $this->_symbol["node"]["v_qstr"]?>" data-nodeuid="<?php echo $this->_symbol["node"]["node_uid"]?>">简易终端</button>
        </div>
    </nav>
    <div class="container">
        <div class="node-title">基础信息</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v6">CPU核数</th>
                <th class="padding-left text-overflow table-row-v6">内存</th>
                <th class="padding-left text-overflow table-row-v6">存储空间</th>
                <th class="padding-left text-overflow table-row-v6">网卡数量</th>
                <th class="padding-left text-overflow table-row-v6">网络地址</th>
            </tr>
            </thead>
            <tbody>
            <tr class="table-row">
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["cpu_cores"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["ram_str"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["disk_str"]?></td>
                <td class="padding-left text-overflow"><?php echo count($this->_symbol["node"]["_network_list"])?>块</td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["ipaddr_str"]?></td>
            </tr>
            </tbody>
        </table>

        <div class="margin-top-v4 node-title">BIOS信息</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v8">供应商</th>
                <th class="padding-left text-overflow table-row-v3">版本</th>
                <th class="padding-left text-overflow table-row-v6">发布时间</th>
                <th class="padding-left text-overflow table-row-v6">运行空间</th>
                <th class="padding-left text-overflow table-row-v6">ROM空间</th>
            </tr>
            </thead>
            <tbody>
            <tr class="table-row">
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["_hd_bios"]["vendor"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["_hd_bios"]["version"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["_hd_bios"]["r_date"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["_hd_bios"]["run_size_str"]?></td>
                <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["_hd_bios"]["rom_size_str"]?></td>
            </tr>
            </tbody>
        </table>

        <div class="margin-top-v4 node-title">硬件系统</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v7">制造商</th>
                <th class="padding-left text-overflow table-row-v5">产品名称</th>
                <th class="padding-left text-overflow table-row-v4">版本</th>
                <th class="padding-left text-overflow table-row-v6">序列号</th>
                <th class="padding-left text-overflow">UUID</th>
            </tr>
            </thead>
            <tbody>
            <tr class="table-row">
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["_hd_sys"]["manufacturer"]?>"><?php echo $this->_symbol["node"]["_hd_sys"]["manufacturer"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["_hd_sys"]["pro_name"]?>"><?php echo $this->_symbol["node"]["_hd_sys"]["pro_name"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["_hd_sys"]["version"]?>"><?php echo $this->_symbol["node"]["_hd_sys"]["version"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["_hd_sys"]["serial_no"]?>"><?php echo $this->_symbol["node"]["_hd_sys"]["serial_no"]?></td>
                <td class="padding-left text-overflow" title="<?php echo $this->_symbol["node"]["_hd_sys"]["uuid"]?>"><?php echo $this->_symbol["node"]["_hd_sys"]["uuid"]?></td>
            </tr>
            </tbody>
        </table>

        <?php if(!empty($this->_symbol["node"]["_hd_board"])){?>
            <div class="margin-top-v4 node-title">主板信息</div>
            <table class="sarah-table">
                <thead>
                <tr class="table-title">
                    <th class="padding-left text-overflow">制造商</th>
                    <th class="padding-left text-overflow">产品名称</th>
                    <th class="padding-left text-overflow">版本</th>
                    <th class="padding-left text-overflow">序列号</th>
                </tr>
                </thead>
                <tbody>
                <tr class="table-row">
                    <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["_hd_board"]["manufacturer"]?></td>
                    <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["_hd_board"]["pro_name"]?></td>
                    <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["_hd_board"]["version"]?></td>
                    <td class="padding-left text-overflow"><?php echo $this->_symbol["node"]["_hd_board"]["serial_no"]?></td>
                </tr>
                </tbody>
            </table>
        <?php }?>

        <div class="margin-top-v4 node-title">CPU详情</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v6">core_id</th>
                <th class="padding-left text-overflow">型号</th>
                <th class="padding-left text-overflow table-row-v6">主频率</th>
                <th class="padding-left text-overflow table-row-v6">缓存</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($this->_symbol["node"]["_cpu_list"] as $cpu) {?>
                <tr class="table-row">
                    <td class="padding-left text-overflow"><?php echo $cpu["core_id"]?></td>
                    <td class="padding-left text-overflow"><?php echo $cpu["model_name"]?></td>
                    <td class="padding-left text-overflow"><?php echo $cpu["mhz"]?></td>
                    <td class="padding-left text-overflow"><?php echo $cpu["cache"]?>&nbsp;KB</td>
                </tr>
            <?php }?>
            </tbody>
        </table>

        <div class="margin-top-v4 node-title">磁盘详情</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v1">序号</th>
                <th class="padding-left text-overflow table-row-v5">唯一标识</th>
                <th class="padding-left text-overflow table-row-v4">序列号</th>
                <th class="padding-left text-overflow table-row-v2">磁盘空间</th>
                <th class="padding-left text-overflow table-row-v15">分区名称</th>
                <th class="padding-left text-overflow table-row-v16">分区格式</th>
                <th class="padding-left text-overflow table-row-v17">挂载路径</th>
                <th class="padding-left text-overflow table-row-v16">分区大小</th>
                <th class="padding-left text-overflow table-row-v16">已用空间</th>
                <th class="padding-left text-overflow table-row-v16">使用率</th>
            </tr>
            </thead>
            <tbody>
            <?php $i=1;?>
            <?php foreach ($this->_symbol["node"]["_disk_list"] as $disk) {?>
                <?php if($disk["part_num"] == 0){?>
                    <tr class="table-row">
                        <td class="padding-left text-overflow"><?php echo $i++?></td>
                        <td class="padding-left text-overflow"><?php echo $disk["wwn"]?></td>
                        <td class="padding-left text-overflow"><?php echo $disk["serial_no"]?></td>
                        <td class="padding-left text-overflow"><?php echo $disk["p_size_str"]?></td>
                        <td class=" text-center" colspan="6">暂无分区</td>
                    </tr>
                <?php }else{?>
                    <tr class="table-line table-row">
                        <td class="padding-left text-overflow"><?php echo $i++?></td>
                        <td class="padding-left text-overflow" title="<?php echo $disk["model"]?>"><?php echo $disk["wwn"]?></td>
                        <td class="padding-left text-overflow" title="<?php echo $disk["serial_no"]?>"><?php echo $disk["serial_no"]?></td>
                        <td class="padding-left text-overflow" title="<?php echo $disk["p_size"]?>Bytes≈<?php echo $disk["p_size_str"]?>"><?php echo $disk["p_size_str"]?></td>
                        <td class="text-overflow" colspan="6">
                            <?php foreach($disk["partitions"] as $part){?>
                                <div class="float-clear table-row">
                                    <?php if(strlen($part["mount"]) != 0){?>
                                        <span class="float-left padding-left table-row-v5 text-overflow"><?php echo $part["name"]?></span>
                                        <span class="float-left padding-left table-row-v3 text-overflow"><?php echo strlen($part["mount"])==0 ? "格式化" : $part["format"]?></span>
                                        <span class="float-left padding-left table-row-v11 text-overflow" title="<?php echo $part["mount"]?>"><?php echo $part["mount"]?></span>
                                        <span class="float-left padding-left table-row-v3 text-overflow" title="<?php echo $part["size"]?>Bytes≈<?php echo $part["size_str"]?>"><?php echo $part["size_str"]?></span>
                                        <span class="float-left padding-left table-row-v3 text-overflow" title="<?php echo $part["used"]?>Bytes≈<?php echo $part["used_str"]?>"><?php echo $part["used_str"]?></span>
                                        <span class="float-left padding-left table-row-v3 text-overflow" title="<?php echo $part["used_percent"]?>%"><?php echo $part["used_percent"]?>%</span>
                                    <?php }else{?>
                                        <span class="float-left padding-left table-row-v5 text-overflow"><?php echo $part["name"]?></span>
                                        <div class="float-left table-row-v18 text-center">未挂载</div>
                                    <?php }?>
                                </div>
                            <?php }?>
                        </td>
                    </tr>
                <?php }?>
            <?php }?>
            </tbody>
        </table>

        <div class="margin-top-v4 node-title">网络详情</div>
        <table class="sarah-table">
            <thead>
            <tr class="table-title">
                <th class="padding-left text-overflow table-row-v3">设备</th>
                <th class="padding-left text-overflow table-row-v6">硬件地址</th>
                <th class="padding-left text-overflow table-row-v7">接收数据</th>
                <th class="padding-left text-overflow table-row-v3">接收数据包</th>
                <th class="padding-left text-overflow table-row-v7">发送数据</th>
                <th class="padding-left text-overflow table-row-v3">发送数据包</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($this->_symbol["node"]["_network_list"] as $network) {?>
            <tr class="table-row">
                <td class="padding-left text-overflow"><?php echo $network["name"]?></td>
                <td class="padding-left text-overflow"><?php echo $network["hd_addr"]?></td>
                <td class="padding-left text-overflow"><?php echo $network["receive"]?>Bytes&nbsp;≈&nbsp;<?php echo $network["receive_str"]?></td>
                <td class="padding-left text-overflow"><?php echo $network["r_packets"]?></td>
                <td class="padding-left text-overflow"><?php echo $network["transmit"]?>Bytes&nbsp;≈&nbsp;<?php echo $network["transmit_str"]?></td>
                <td class="padding-left text-overflow"><?php echo $network["t_packets"]?></td>
            </tr>
            <?php }?>
            </tbody>
        </table>
    </div>
    <?php include $this->getIncludeFile('common/dialog.html')?>
    <?php include $this->getIncludeFile('common/terminal_dialog.html')?>
    <script src="/script/node/view?v=20190412"></script>
    <script>
        window.nodeOperation.init({
            reboot: "#node_reboot",
            terminal: "#node_terminal",
            app_key: "<?php echo $this->_symbol["session"]["app_key"]?>"
        });
    </script>
</body>
</html>
