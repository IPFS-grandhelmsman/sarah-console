<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>节点监测信息 - 正舵者矿机云监测</title>
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
            <a class="node-link" href="#">节点监测</a>
            <a class="btn-manage-node" href="/node/manage?<?php echo $this->_symbol["node"]["v_qstr"]?>">管理节点</a>
        </div>
        <div class="contain-jdjc-info">
            <div class="contain-jdjc-right">
                <div class="contain-jdxx clearfix">
                    <div class="node-title" style="margin-left: 20px;">
                        <img class="node-title-img" src="/static/image/dark/icon-jd.png" alt="节点">
                        <span>节点信息</span>
                    </div>
                    <ul>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">状态</div>
                            <div class="contain-jdxx-desc">
                                <em class="state-<?php echo $this->_symbol["node"]["node_state"]?>"><?php echo $this->_symbol["node"]["node_state"]=='normal'?'正常':'故障'?></em>
                            </div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">UID</div>
                            <div class="contain-jdxx-desc"><?php echo $this->_symbol["node"]["node_uid"]?></div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">版本号</div>
                            <div class="contain-jdxx-desc"><?php echo $this->_symbol["node"]["sarah_ver"]?></div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">更新周期(S)</div>
                            <div class="contain-jdxx-desc"><?php echo $this->_symbol["node"]["sarah_interval"]?></div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">网络地址</div>
                            <div class="contain-jdxx-desc"><?php echo $this->_symbol["node"]["ipaddr_str"]?></div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">创建时间</div>
                            <div class="contain-jdxx-desc"><?php echo $this->_symbol["node"]["created_time"]?></div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">启动时间</div>
                            <div class="contain-jdxx-desc"><?php echo $this->_symbol["node"]["bootat_time"]?></div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">更新时间</div>
                            <div class="contain-jdxx-desc"><?php echo $this->_symbol["node"]["s_updated_time"]?></div>
                        </li>
                    </ul>
                </div>
                <div class="contain-jdxx clearfix">
                    <div class="node-title" style="margin-left: 20px;">
                        <img class="node-title-img" src="/static/image/dark/icon-jcjc.png" alt="节点">
                        <span>基础监测</span>
                    </div>
                    <ul>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">系统负载</div>
                            <div class="contain-jdxx-desc">
                                <em class="state-<?php echo $this->_symbol["node"]["load_state"]?>" id="loadavg_box"><?php echo $this->_symbol["node"]["load_avg_str"]?></em>
                            </div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">内存使用</div>
                            <div class="contain-jdxx-desc">
                                <em class="state-<?php echo $this->_symbol["node"]["ram_state"]?>" id="ram_box"><?php echo $this->_symbol["node"]["ram_used_str"]?>, <?php echo $this->_symbol["node"]["ram_percent"]?>%</em>
                            </div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">磁盘使用</div>
                            <div class="contain-jdxx-desc"><em class="state-<?php echo $this->_symbol["node"]["disk_state"]?>" id="disk_box"><?php echo $this->_symbol["node"]["disk_used_str"]?>, <?php echo $this->_symbol["node"]["disk_percent"]?>%</em></div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">下载带宽</div>
                            <div class="contain-jdxx-desc" id="incoming_bd_box"><?php echo $this->_symbol["node"]["incoming_bd_str"]?>/sec</div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">上传带宽</div>
                            <div class="contain-jdxx-desc" id="outgoing_bd_box"><?php echo $this->_symbol["node"]["outgoing_bd_str"]?>/sec</div>
                        </li>
                        <li class="contain-jdxx-list clearfix">
                            <div class="contain-jdxx-title">更新时间</div>
                            <div class="contain-jdxx-desc" id="updated_time_box"><?php echo $this->_symbol["node"]["updated_time"]?></div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="contain-dtjc">
                <div class="node-title">
                    <img class="node-title-img" src="/static/image/dark/icon-dtjc.png" alt="动态监测">
                    <span>动态监测</span>
                </div>
                <div class="userate-line" id="userate_line" ></div>
                <div class="bandwidth_line" id="bandwidth_line"></div>
            </div>
        </div>
    </div>
    <?php include $this->getIncludeFile('dark/blade/footer.blader.html')?>
    <script src="/static/js/common/jquery.1.11.js"></script>
    <script src="/static/js/common/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/js/common/echarts.common.min.js"></script>
    <script type="text/javascript" src="/static/js/default/node-line.js?v=20181211"></script>
    <script>
        actionNav("node");
        window.NodeLine.init({
            skin: 'default',
            userate_line_dom: document.getElementById('userate_line'),
            bandwidth_line_dom: document.getElementById('bandwidth_line'),
            v_qstr: '<?php echo $this->_symbol["node"]["v_qstr"]?>',
            stat: {
                loadavg: document.getElementById('loadavg_box'),
                ram: document.getElementById('ram_box'),
                disk: document.getElementById('disk_box'),
                incoming_bd: document.getElementById('incoming_bd_box'),
                outgoing_bd: document.getElementById('outgoing_bd_box'),
                updated_time: document.getElementById('updated_time_box')
            }
        });
    </script>
</body>
</html>
