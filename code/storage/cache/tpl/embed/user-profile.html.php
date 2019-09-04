<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户设置</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .user-bg{background-color: #fff;padding: 20px;}
    </style>
</head>
<body>
    <div class="container">
        <div class="user-bg">
            <div class="node-title">基本信息</div>
            <div class="margin-left-v8">
                <div class="form-line float-clear">
                    <label class="form-title">项目名称：</label>
                    <input class="form-input" type="text" id="product_name" value="<?php echo $this->_symbol["profile"]["product_name"]?>" readonly>
                    <span class="form-tips">(项目名称为不包含`的任意字符)</span>
                </div>
                <div class="margin-top-v3 margin-left-v10">
                    <button class="btn btn-blue btn-md" id="save_Basic_info">保存修改</button>
                </div>
            </div>

            <div class="node-title margin-top-v4">登录密码修改</div>
            <div class="margin-left-v8">
                <div class="form-line float-clear">
                    <label class="form-title">原始密码：</label>
                    <input class="form-input" type="password" id="old_password" placeholder="请输入原始密码" autocomplete="false" readonly>
                </div>
                <div class="form-line float-clear">
                    <label class="form-title">新密码：</label>
                    <input class="form-input" type="password" id="new_password" placeholder="请输入新密码" autocomplete="false" readonly>
                    <span class="form-tips">(长度必须大于等于8)</span>
                </div>
                <div class="form-line float-clear">
                    <label class="form-title">确认密码：</label>
                    <input class="form-input" type="password" id="rep_password" placeholder="请再次输入新密码" autocomplete="false" readonly>
                </div>
                <div class="margin-top-v3 margin-left-v10">
                    <button class="btn btn-blue btn-md" id="save_modify">保存修改</button>
                </div>
            </div>

            <div class="node-title margin-top-v4">服务密码修改</div>
            <div class="margin-left-v8">
                <div class="form-line float-clear">
                    <label class="form-title">登录密码：</label>
                    <input class="form-input" id="login_password" type="password" placeholder="请输入登录密码" autocomplete="false" readonly>
                </div>
                <div class="form-line float-clear">
                    <label class="form-title">服务密码：</label>
                    <input class="form-input" id="service_password" type="password" placeholder="请输入服务密码" autocomplete="false" readonly>
                    <span class="form-tips">(6~8个数字、字母、标点等字符)</span>
                </div>
                <div class="form-line float-clear">
                    <label class="form-title">确认密码：</label>
                    <input class="form-input" id="rep_service_password" type="password" placeholder="请再次输入服务密码" autocomplete="false" readonly>
                </div>
                <div class="margin-top-v3 margin-left-v10">
                    <button class="btn btn-blue btn-md" id="set_service_pwd">保存修改</button>
                </div>
            </div>
        </div>
    </div>


    <?php include $this->getIncludeFile('common/dialog.html')?>
    <script src="/script/user/profile?v=20190412"></script>
</body>
</html>
