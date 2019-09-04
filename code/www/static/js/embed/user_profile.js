;(function(){
    "user strict";
    function modify_basic_info () {
        var product_name = $("#product_name").val();
        var validator = new window.Validator();
        validator.add(product_name,[{
            pattern: "is_not_empty",
            error_msg: "请填写项目名称！"
        },{
            pattern: "not_include:~",
            error_msg: "项目名称不能包含~！"
        }]);
        var errorMsg = validator.start();
        if(errorMsg){
            alertMsg("#toast_error",errorMsg);
            return;
        }
        var data = {
            product_name:product_name,
            skin_name: "embed"
        };
        http_post("/api/user/profile/update",data,function(msg){
            if(msg.errno == 0){
                alertMsg("#toast_success","修改成功！");
                return false;
            }else if(msg.errno == 1){
                alertMsg("#toast_error","参数错误！");
                return false;
            }else if(msg.errno == 7){
                alertMsg("#toast_error","未定义主题名称！");
                return false;
            }else if(msg.errno ==4){
                alertMsg("#toast_error","修改失败，请稍后再试！");
                return false;
            }
        });
    }

    function set_input_readable () {
        if ($(this).val() == $(this)[0].defaultValue) {
            $(this).val("");
        }
        $(this).removeAttr("readonly");

    }

    function modify_pwd () {
        var old_password = $("#old_password").val();
        var new_password = $("#new_password").val();
        var rep_password = $("#rep_password").val();
        var validator = new window.Validator();
        validator.add(old_password,[{
            pattern: "is_not_empty",
            error_msg: "旧密码不能为空"
        }]);
        validator.add(new_password,[{
            pattern: "is_not_empty",
            error_msg: "新密码不能为空"
        },{
            pattern: "min_length:8",
            error_msg: "新密码长度必须大于8"
        }]);
        validator.add(rep_password,[{
            pattern: "is_not_empty",
            error_msg: "重复密码不能为空！"
        },{
            pattern: "is_equal:"+new_password,
            error_msg: "新密码和重复密码不一致！"
        }]);
        var errorMsg = validator.start();
        if(errorMsg){
            alertMsg("#toast_error",errorMsg);
            return;
        }
        var data = {
            old_passwd:old_password,
            new_passwd:new_password,
            rep_passwd:rep_password
        };
        http_post("/api/user/passwd/update",data,function(msg){
            if (msg.errno == 0) {
                alertMsg("#toast_success","修改密码成功!");
                $("#old_password").val('');
                $("#new_password").val('');
                $("#rep_password").val('');
                return false;
            }else if(msg.errno == 1){
                alertMsg("#toast_error","新密码格式不正确，请重新输入！")
            }else if (msg.errno == 7) {
                alertMsg("#toast_error","原始密码太短了，请重新输入!");
                return false;
            }else if (msg.errno == 10) {
                alertMsg("#toast_error","原始密码不正确，请重新输入!");
                return false;
            } else if (msg.errno == 4) {
                alertMsg("#toast_error","操作失败，请稍后重试!");
                return false;
            }
        });
    }

    function set_service_pwd () {
        var login_pwd = $("#login_password").val();
        var service_pwd = $("#service_password").val();
        var rep_service_pwd = $("#rep_service_password").val();

        var validator = new window.Validator();
        validator.add(login_pwd,[{
            pattern: "is_not_empty",
            error_msg: "登录密码不能为空！"
        }]);
        validator.add(service_pwd,[{
            pattern: "is_not_empty",
            error_msg: "服务密码不能为空"
        },{
            pattern: "min_length:6",
            error_msg: "服务密码长度必须大于6"
        },{
            pattern: "max_length:8",
            error_msg: "服务密码长度必须小于8"
        }]);
        validator.add(rep_service_pwd,[{
            pattern: "is_not_empty",
            error_msg: "确认密码不能为空！"
        },{
            pattern: "is_equal",
            error_msg: "确认密码和服务密码不同！"
        }]);
        var error = validator.start();
        if (error) {
            alertMsg("#toast_error",error);
            return false;
        }
        var data = {
            std_passwd: login_pwd,
            new_spasswd: service_pwd,
            rep_spasswd: rep_service_pwd
        };
        http_post("/api/user/passwd/service/update", data, function (msg) {
            if (msg.errno == "0") {
                alertMsg("#toast_success", "修改成功！");
                $("#login_password").val("");
                $("#service_password").val("");
                $("#rep_service_password").val("");
            } else if (msg.errno == "7") {
                alertMsg("#toast_error", "登录密码长度不够！");
            } else if (msg.errno == "8") {
                alertMsg("#toast_error", "服务密码长度必须是6-8个英文字符！");
            } else if (msg.errno == "9") {
                alertMsg("#toast_error", "服务密码和确认服务密码不一致！");
            } else if (msg.errno == "10") {
                alertMsg("#toast_error", "登录密码错误！");
            } else if (msg.errno == "4") {
                alertMsg("#toast_error", "操作失败！");
            }
        }, function (error) {
            console.log(error);
        })

    }

    function _init(){
        $("#save_Basic_info").on("click", modify_basic_info);
        $("input").on("focus", set_input_readable);
        $("#save_modify").on("click", modify_pwd);
        $("#set_service_pwd").on("click", set_service_pwd);
    }
    _init();

})(window);
