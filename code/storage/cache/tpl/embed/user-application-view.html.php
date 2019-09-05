<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $this->_symbol["app"]["name"]?> - 配置</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .container{margin-top: 60px;}
        .config-name{max-width: 75%;}
        .del-custom-config{font-size: 13px;line-height: 60px;}
        #add_config,#edit_config{font-size: 14px;}
        #add_config .icon,#edit_config .icon{font-size: 20px;}
    </style>
</head>
<body>
    <nav class="nav">
        <a class="link" href="/application/node/?<?php echo $this->_symbol["app"]["v_qstr"]?>&__skin=embed">预览</a>
        <a class="link" href="/application/task/?<?php echo $this->_symbol["app"]["v_qstr"]?>&__skin=embed">任务</a>
        <a class="link active" href="/user/application/view?<?php echo $this->_symbol["app"]["v_qstr"]?>&__skin=embed">配置</a>
    </nav>
    <div class="container">
        <div class="sec float-clear">
            <div class="sec-title">自定义配置：
                <div class="float-right">
                    <button class="btn-text state-blue btn-xs" id="add_config">
                        <i class="iconfont icontianjia float-left icon"></i>
                        &nbsp;添加配置
                    </button>
                    <button class="btn-text state-blue btn-xs" id="edit_config" data-edit="0">
                        <i class="iconfont iconbianji float-left icon"></i>
                        &nbsp;编辑</button>
                </div>
            </div>
            <table class="sarah-table all_config">
                <tr class="table-title">
                    <th class="padding-left text-overflow table-row-v6">选项</th>
                    <th class="padding-left text-overflow table-col-v13">选项值</th>
                    <th class="padding-left text-overflow table-row-v7">配置变量名</th>
                </tr>
                <?php foreach($this->_symbol["config"] as $key => $val){?>
                    <tr class="table-row all-config">
                        <td class="padding-left text-overflow" title="<?php echo $val["desc"]?>">
                            <input class="input edit-input config-desc" type="text" value="<?php echo $val["desc"]?>" data-added="<?php echo empty($val["added"])? '0' : '1'?>"  readonly>
                        </td>
                        <td class="padding-left text-overflow" title="<?php echo $val["value"]?>">
                            <?php if(is_bool($val["value"])){?>
                            <div class="config-value switch margin-top-v4 <?php echo $val["value"] ? 'switch-active' : ''?>">
                                <div class="circle"></div>
                            </div>
                            <?php }else{?>
                                <input class="input edit-input config-value" type="text" value="<?php echo $val["value"]?>" data-added="1" readonly>
                            <?php }?>
                        </td>
                        <td class="padding-left text-overflow" title="<?php echo $key?>">
                            <input class="input edit-input config-name" type="text" value="<?php echo $key?>" data-added="<?php echo empty($val["added"])? '0' : '1'?>" readonly>
                            <?php if(isset($val["added"]) && $val["added"]){?>
                                <button class="btn btn-text btn-gray-v1 sarah-hide del-custom-config"><i class="iconfont iconshanchu float-left"></i>&nbsp;删除</button>
                            <?php }?>
                        </td>
                    </tr>
                <?php }?>
            </table>
            <div class="float-right margin-right-v3 sarah-hide" id="edit_btn">
                <button class="btn btn-cancel btn-xs margin-right-v2" id="cancel_edit">取消</button>
                <button class="btn btn-blue btn-xs" id="save_config">保存</button>
            </div>
        </div>

        <div class="sec margin-top-v4">
            <div class="sec-title">备注</div>
            <p class="sec-line">1、该更改只会影响新安装的节点。</p>
            <p class="sec-line">2、如果对应的路径已经存在，将会覆盖旧的，请谨慎更改！</p>
            <p class="sec-line">3、全部的路径变量值都不要以'/'结尾！</p>
            <p class="sec-line">4、选项名不超过20个字符。</p>
            <p class="sec-line">5、选项值不超过256个字符。</p>
            <p class="sec-line">6、配置变量仅允许输入字母、下划线和数字，且不超过24个字符。</p>
        </div>
    </div>

    <!--添加配置弹窗-->
    <div class="dialog dialog-width-v1" id="add_config_dialog">
        <div class="header">
            <span class="app-node-header">添加配置</span>
            <i class="iconfont iconguanbi1 float-right dialog-close" id="close_dialog"></i>
        </div>
        <div class="margin-top-v3 float-clear">
            <div class="title-v2">选项</div>
            <input class="content-v2" id="option_desc" type="text">
        </div>
        <div class="float-clear margin-top-v3">
            <div class="title-v2">选项值</div>
            <textarea class="textarea" id="option_value"></textarea>
        </div>
        <div class="margin-top-v3 float-clear">
            <div class="title-v2">配置变量名</div>
            <input class="content-v2" id="option_name" type="text">
        </div>
        <div class="margin-top-v4">
            <button class="btn btn-blue btn-max" id="save_config_v2">添加</button>
        </div>
    </div>

    <?php include $this->getIncludeFile('common/dialog.html')?>
    <script src="/script/application/userView?v=20190412"></script>

    <script>
        var config = {
            url: "/api/user/application/edit?<?php echo $this->_symbol["app"]["v_qstr"]?>",
        };
        window.application_config.init(config);
    </script>
</body>
</html>
