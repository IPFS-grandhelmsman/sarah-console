<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>命令详情</title>
    <link href="/static/style/common/prettify.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .container{background-color: #fff;margin: 20px;}
        pre.prettyprint{max-height: 500px;white-space: pre-wrap;}
        .check-label{margin-right: 30px;}
    </style>
</head>
<body onload="prettyPrint()">
    <div class="container">
        <div class="node-command">
            <div class="title">所属节点：</div>
            <div class="content"><?php echo $this->_symbol["data"]["node"]["node_uid"]?></div>
        </div>
        <div class="node-command">
            <div class="title">同步属性：</div>
            <div class="content float-clear">
                <div class="float-left check-pos">
                    <input class="check-box" type="checkbox" disabled <?php if($this->_symbol["data"]["sync_start"]){?> checked="true" <?php }?>>
                    <label class="check-label"></label>上报开始运行
                </div>
                <div class="float-left check-pos margin-left-v6">
                    <input class="check-box" type="checkbox" disabled  <?php if($this->_symbol["data"]["sync_ing"]){?> checked="true" <?php }?>>
                    <label class="check-label"></label>上报运行中
                </div>
                <div class="float-left check-pos margin-left-v6">
                    <input class="check-box" type="checkbox" disabled  <?php if($this->_symbol["data"]["sync_done"]){?> checked="true" <?php }?>>
                    <label class="check-label"></label>上报完成
                </div>
                <div class="float-left check-pos margin-left-v6">
                    <input class="check-box" type="checkbox" disabled  <?php if($this->_symbol["data"]["sync_err"]){?> checked="true" <?php }?>>
                    <label class="check-label"></label>上报错误
                </div>
            </div>
        </div>
        <div class="node-command">
            <div class="title">运行状态：</div>
            <div class="content">
                <?php if($this->_symbol["data"]["status"] == 0){?>
                    待执行
                <?php }else if($this->_symbol["data"]["status"] == 1){?>
                    执行中
                <?php }else{?>
                    执行完成
                <?php }?>
            </div>
        </div>
        <div class="node-command">
            <div class="title">执行进度：</div>
            <div class="content">
                <?php echo $this->_symbol["data"]["progress"]*100?>%
            </div>
        </div>
        <div class="node-command">
            <div class="title">生命周期：</div>
            <div class="content" style="height: 60px;">
                <div class="time-line"></div>
                <div class="point-line">
                    <div class="point point-pos-v1">
                        <div class="text-top">创建时间：<?php echo $this->_symbol["data"]["created_time"]?></div>
                        <div class="point-fill"></div>
                        <div class="text-bottom"></div>
                    </div>
                    <div class="point point-pos-v2">
                        <div class="text-top">拉取时间：<?php echo $this->_symbol["data"]["pull_time"]?></div>
                        <div class="point-fill"></div>
                    </div>
                    <div class="point point-pos-v3">
                        <div class="text-top">执行时间：<?php echo $this->_symbol["data"]["exec_time"]?></div>
                        <div class="point-fill"></div>
                    </div>
                    <div class="point point-pos-v4">
                        <div class="text-top">完成时间：<?php echo $this->_symbol["data"]["done_time"]?></div>
                        <div class="point-fill"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="node-command">
            <div class="title">脚本引擎：</div>
            <div class="content">
                <?php echo $this->_symbol["data"]["engine"]?>
            </div>
        </div>
        <div class="node-command">
            <div class="title">任务代码：</div>
            <div class="content">
                <pre class="prettyprint lang-<?php echo $this->_symbol["data"]["engine"]?>"><?php echo $this->_symbol["data"]["cmd_text"]?></pre>
            </div>
        </div>
        <div class="node-command">
            <div class="title">执行结果：</div>
            <div class="content">
                <textarea class="textarea" id="exec_result" readonly="readonly"><?php echo $this->_symbol["data"]["res_data"]?></textarea>
            </div>
        </div>
    </div>
    <script src="/script/task/command?v=20190412"></script>
    <script language="javascript" src="/static/js/common/prettify.min.js"></script>
</body>
</html>
