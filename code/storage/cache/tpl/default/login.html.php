<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="/static/style/common/bootstrap.min.css">
    <style>
        .bgContent{
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            height: 100%;
            width: 100%;
            font-size: 12px;
        }
        .form{
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%,-50%);
               -moz-transform: translate(-50%,-50%);
                -ms-transform: translate(-50%,-50%);
                 -o-transform: translate(-50%,-50%);
                    transform: translate(-50%,-50%);
            background: rgba(4, 4, 4, 0.22);
            border-radius: 5px;
            box-shadow: #20262b 0 0 15px;
            padding: 10px 0 20px 0;
        }
        .form-input{
            padding: 15px 50px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-btn{
            padding: 15px 50px;
        }
        .bg_main{
            width: 100%;
            height: 100%;
            background-image: url("/static/image/bg4.jpg");
            background-repeat: no-repeat;
            background-size: cover;
           /* -webkit-filter: blur(12px);
               -moz-filter: blur(12px);
                 -o-filter: blur(12px);
                -ms-filter: blur(12px);
                    filter: blur(12px);*/
        }
        .input-label{
            background-color: rgba(44, 55, 70, 0.59);
            color: #fff;
            width: 50px;
            height: 35px;
            display: inline-block;
            text-align: center;
            line-height: 35px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }
        .input-name, .input-password{
            height: 35px;
            margin-left: 0;
            outline: none;
            border-top: 1px solid #667a92;
            border-bottom: 1px solid #667a92;
            border-right: 1px solid #667a92;
            border-left: none;
            width: 260px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            padding-left: 5px;
        }
        .input-vertify{
            width: 230px;
            height: 35px;
            margin-left: 0;
            outline: none;
            margin-top: 1px;
            border-bottom: 1px solid #667a92;
            border-left: 1px solid #667a92;
            border-top: 1px solid #667a92;
            border-right: none;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            padding-left: 10px;
        }
        .vertify-img{
            width: 80px;
            height: 33px;
        }
        .input-label-img1{
            height:25px;
        }
        .input-label-img2{
            height:35px;
            margin-top: 1px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-bottom: 1px solid #667a92;
            border-right: 1px solid #667a92;
            border-top: 1px solid #667a92;
            border-left: none;
            overflow: hidden;
            cursor: pointer;
        }
        .login-btn{
            width: 110px;
            height: 32px;
            background-color: rgba(44, 55, 70, 0.59);
            color: #fff;
            border: none;
            outline: none;
            border-radius: 2px;
            letter-spacing: 5px;
            font-size: 15px;
        }
        .login-btn:hover{
            background-color: rgba(65, 74, 86, 0.59);
        }
        .remember-input{
            color: #fff;
            height: 32px;
            line-height: 32px;
        }
        .remember-password{
            vertical-align: text-bottom;
        }
        .form-title{
            color: #fff;
            font-size: 18px;
            margin: 10px 30px;
            letter-spacing: 1px;
        }
        .tips-bg{
            position: fixed;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.3);
            z-index: 8;
            display: none;
        }
        .login-tips{
            position: fixed;
            left: 50%;
            top: 50%;
            z-index: 9;
            background: #fff;
            width: 400px;
            border-radius: 5px;
            box-shadow: #524e4e 0 0 10px;
            overflow-x: hidden;
            -webkit-transform: translate(-50%,-50%) scale(0);
            -moz-transform: translate(-50%,-50%) scale(0);
            -ms-transform: translate(-50%,-50%) scale(0);
            -o-transform: translate(-50%,-50%) scale(0);
            transform: translate(-50%,-50%) scale(0);
            -webkit-transition: all 0.3s ease;
            -moz-transition: all 0.3s ease;
            -o-transition: all 0.3s ease;
            transition: all 0.3s ease;
        }
        .tips-show{
            -webkit-transform: translate(-50%,-50%) scale(1);
            -moz-transform: translate(-50%,-50%) scale(1);
            -ms-transform: translate(-50%,-50%) scale(1);
            -o-transform: translate(-50%,-50%) scale(1);
            transform: translate(-50%,-50%) scale(1);
        }
        .tips-title{
            background-color: rgba(65, 74, 86, 0.59);
            color: #fff;
            padding: 10px 15px;
        }
        .tips-content{
            padding:15px;
            color:#777;
            text-align: center;
        }
        .tips-btn{
            padding: 10px 15px;
            text-align: center;
            border-top: 1px solid #eee;
            letter-spacing: 1px;
            cursor: pointer;
        }
        .tips-title-img{
            width: 20px;
            margin-right: 5px;
        }
    </style>
</head>
<body class="bgContent">
    <div class="bg_main"></div>
    <div class="form">
        <div class="text-center form-title">
            正舵者矿机云监测系统
        </div>
        <div class="form-input">
            <span class="input-label"><img class="input-label-img1" src="/static/image/icon-lxr.png" alt="用户名"></span><input class="input-name" id="inputName" type="text" placeholder="请输入用户名">
        </div>
        <div class="form-input">
            <span class="input-label"><img class="input-label-img1" src="/static/image/icon-password.png" alt="密码"></span><input class="input-password" id="inputPassWord" type="password" placeholder="请输入用户名">
        </div>

        <div class="form-input">
            <input class="input-vertify" id="inputVertify" type="text" placeholder="请输入验证码"><span class="input-label-img2"><img class="vertify-img" id="vertifyImg" src="/admin/verifyCode" alt="验证码" onclick="changeCode()"></span>
        </div>
        <div class="form-btn">
            <div class="pull-left remember-input">
                <input class="remember-password" id="rememberPassword" type="checkbox" name="remember">&nbsp;记住密码
            </div>
            <button class="login-btn pull-right" onclick="login()">登录</button>
        </div>
    </div>
    <!--提示信息-->
    <div class="tips-bg"></div>
    <div class="login-tips">
        <div class="tips-title"><img class="tips-title-img" src="/static/image/icon-tips.png" alt="提示">提示信息</div>
        <div class="tips-content"></div>
        <div class="tips-btn" style="display:none;">确定</div>
    </div>
    <script src="/static/js/common/jquery.1.11.js"></script>
    <script>
        $(function(){
            /*从localstorage中获取用户名和密码*/
            var username = localStorage.getItem("username");
            if(username == "" || username == null){
                $("#inputName").val('');
                $("#inputPassWord").val('');
                $("#rememberPassword").removeAttr("checked");
            }else{
                $("#inputName").val(username);
                $("#inputPassWord").val(localStorage.getItem("password"));
                $("#rememberPassword").attr("checked","true");
            }
            /*键盘监听事件*/
            $(document).keydown(function(event){
                var e = event || window.event;
                if (e.keyCode == 13) {
                    login();
                }
            });
        });
        /*登录*/
        function login(){
            var username = $("#inputName").val();
            var passwd = $("#inputPassWord").val();
            var verifycode = $("#inputVertify").val();
            var reg = new RegExp(/^[A-Za-z0-9]+$/);
            if(username==''){
                alertMsg("请输入用户名！");
                return;
            }
            if(passwd==''){
                alertMsg("请输入密码！");
                return;
            }
            if(verifycode==''){
                alertMsg("请输入验证码！");
                return;
            }
            if(username!=''&&(!(reg.test(username)))){
                alertMsg("请输入正确格式的用户名！");
                return;
            }
            if(verifycode.length != 4){
                alertMsg("验证码只能是4位");
                return;
            }
            if(!reg.test(verifycode)){
                alertMsg("验证码错误！");
            }
            var data = {
                "username":username,
                "passwd":passwd,
                "verifycode":verifycode
            };
            $.ajax({
                url:"/api/admin/login",
                type:"POST",
                async:false,
                dataType:"json",
                data:data,
                success: function(msg){
                    if(msg.errno == 0){
                        var username = $("#inputName").val();
                        var password = $("#inputPassWord").val();
                        if($("#rememberPassword").is(":checked") && password != ''){
                            localStorage.setItem("username",username);
                            localStorage.setItem("password",password);
                        }else{
                            localStorage.removeItem("username");
                            localStorage.removeItem("password");
                        }
                        window.location.href="/node/list";
                    }else if(msg.errno == 8){
                        alertMsg("验证码错误！");
                        $("#vertifyImg").val('').attr("src","/admin/verifyCode?"+new Date());

                    }else if(msg.errno == 6){
                        alertMsg("用户名和密码不匹配!");
                        $("#vertifyImg").val('').attr("src","/admin/verifyCode?"+new Date());
                    }else if(msg.errno == 1){
                        alertMsg("参数错误！")
                    }
                }
            });
        }
        /*弹框*/
        function alertMsg(msg){
            $(".tips-content").text(msg);
            $(".tips-bg").show();
            $(".login-tips").addClass("tips-show");
            setTimeout(function(){
                $(".login-tips").removeClass("tips-show");
                $(".tips-bg").hide();
            },1000);
        }
        /*图片验证码*/
        function changeCode(){
            $("#vertifyImg").attr("src","/admin/verifyCode?"+new Date());
        }
    </script>

</body>
</html>
