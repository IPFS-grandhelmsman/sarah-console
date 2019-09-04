<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户设置 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/default/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<?php include $this->getIncludeFile('default/blade/header.blade.html')?>
<div class="main">
<div class="container">
    <div class="widget-header">
        <h4 class="sub-header"><em class="glyphicon glyphicon-user"></em>&nbsp;用户设置</h4>
    </div>
    <div class="widget-container">
        <div style="margin-left: 50px;">
            <div class="vertical-5"></div>
            <div class="sub-header">
                <img class="sub-header-img" src="/static/image/dark/icon-basic-info.png" alt="基本信息">
                <span>基本信息</span>
            </div>
            <div class="vertical-5"></div>
            <div class="widget-container clearfix">
                <div class="clearfix">
                    <label class="set-input-title" for="product_name">项目名称：</label>
                    <input class="set-input-content" type="text" id="product_name" value="<?php echo $this->_symbol["profile"]["product_name"]?>">
                    <span class="set-input-tips">(项目名称为不包含`的任意字符)</span>
                </div>
                <label class="set-input-title">皮肤：</label>
                <div class="dropdown clearfix">
                    <a href="#" class="dropdown-toggle set-select" data-toggle="dropdown">
                        <span id="checked_skin" data-value="<?php echo $this->_symbol["profile"]["skin_name"]?>">
                            <?php if($this->_symbol["profile"]["skin_name"]=='default'){?>
                            默认皮肤
                            <?php }else{?>
                            黑色皮肤
                            <?php }?>
                        </span>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu set-select-menu" aria-labelledby="dropdownMenu1">
                        <li data-value="default" onclick="chooseSkin(this)">默认皮肤</li>
                        <li data-value="dark" onclick="chooseSkin(this)">黑色皮肤</li>
                    </ul>
                </div>
                <div>
                    <button class="btn-save-basic" id="save_Basic_info" onclick="modify_basic_info()" style="margin-top: 11px">保存修改</button>
                </div>
            </div>
        </div>

        <div style="margin: 30px 0 30px 50px">
            <div class="sub-header">
                <img class="sub-header-img" src="/static/image/dark/icon-pwd.png" alt="密码">
                <span>密码修改</span>
            </div>
            <div class="vertical-5"></div>
            <div class="widget-container clearfix">
                <div class="clearfix">
                    <label class="set-input-title" for="old_password">原始密码：</label>
                    <input class="set-input-content" type="password" id="old_password">
                </div>
                <div class="clearfix">
                    <label class="set-input-title" for="new_password">新密码：</label>
                    <input class="set-input-content" type="password" id="new_password">
                    <span class="set-input-tips">(长度必须>=8)</span>
                </div>
                <div class="clearfix">
                    <label class="set-input-title" for="rep_password">确认密码：</label>
                    <input class="set-input-content" type="password" id="rep_password">
                </div>
                <div>
                    <button class="btn-save-basic" onclick="modify_pwd()">保存修改</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<?php include $this->getIncludeFile('common/dialog_tops.html')?>
<script src="/static/js/common/jquery.1.11.js"></script>
<script src="/static/js/common/bootstrap.min.js"></script>
<script src="/static/js/common/user-profile.js"></script>
</body>
</html>
