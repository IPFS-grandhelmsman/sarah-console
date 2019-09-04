(function(){
    "use strict";
    /*登录*/
    function login(){
        var username = $("#inputName").val();
        var passwd = $("#inputPassWord").val();
        var verifycode = $("#inputVertify").val();
        var validator = new window.Validator();
        validator.add(username,[{
            pattern: "is_not_empty",
            error_msg: "请输入用户名！"
        }]);
        validator.add(passwd,[{
            pattern:"is_not_empty",
            error_msg: "请输入密码！"
        }]);
        validator.add(verifycode,[{
            pattern: "is_not_empty",
            error_msg: "请输入验证码！"
        }]);
        var errorMsg = validator.start();
        if(errorMsg){
            alertMsg("#toast_error",errorMsg);
            return;
        }
        var data = {
            "username":username,
            "passwd":passwd,
            "verifycode":verifycode
        };
        http_post("/api/admin/login",data,function(msg){
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
                var back_url = get_url_params("back_url");
                alertMsg("#toast_success","登录成功！");
                setTimeout(function(){
                    if(back_url){
                        window.location.href= "/desktop/#__tracker="+back_url;
                    }else{
                        window.location.href="/desktop/";
                    }
                },700);
            }else if(msg.errno == 8){
                alertMsg("#toast_error","验证码错误！");
                $("#vertifyImg").val('').attr("src","/admin/verifyCode?"+new Date());
            }else if(msg.errno == 6){
                alertMsg("#toast_error","用户名和密码不匹配！");
                $("#vertifyImg").val('').attr("src","/admin/verifyCode?"+new Date());
            }else if(msg.errno == 1){
                alertMsg("#toast_error","参数错误！");
            }
        });
    }
    /*图片验证码*/
    function changeCode(){
        $("#vertifyImg").attr("src","/admin/verifyCode?"+new Date());
    }

    function _init(){
        $("#inputVertify").focus();

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

        $("#loginIn").on("click",login);
        $("#vertifyImg").on("click",changeCode);
    }
    _init();
})(window);
