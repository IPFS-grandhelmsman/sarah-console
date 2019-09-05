<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录 - SarahOS</title>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1066423_ime0e7w9hcq.css">
    <link rel="stylesheet" href="/static/style/embed/sarah.css">
    <link rel="stylesheet" href="/static/style/embed/login.css">
</head>
<body class="bgContent">
    <div class="bg_main">
        <div class="form">
            <div class="header">登录SarahOS管理终端</div>
            <div class="form-line float-clear">
                <label class="title"><i class="iconfont iconzhanghao input-icon"></i></label>
                <input class="content" id="inputName" type="text" placeholder="请输入用户名">
            </div>
            <div class="form-line float-clear">
                <label class="title"><i class="iconfont iconmima input-icon"></i></label>
                <input class="content" id="inputPassWord" type="password" placeholder="请输入密码">
            </div>
            <div class="form-line float-clear">
                <input class="content vertify-content" id="inputVertify" type="text" placeholder="请输入验证码">
                <img class="vertify-img" id="vertifyImg" src="/admin/verifyCode" alt="验证码" onclick="changeCode()">
            </div>
            <div class="check-line">
                <input class="check-box" type="checkbox" id="rememberPassword" name="remember">
                <label class="check-label"></label>记住密码
            </div>
            <button class="login-btn" id="loginIn">登录</button>
        </div>
    </div>
    <?php include $this->getIncludeFile('common/dialog.html')?>
    <script src="/static/js/common/jquery.1.11.js"></script>
    <script src="/static/js/common/util.js"></script>
    <script src="/static/js/common/validator.js"></script>
    <script src="/static/js/desktop/login.js"></script>

</body>
</html>
