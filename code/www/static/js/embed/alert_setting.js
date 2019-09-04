;(function(){
    "use strict";
    var alert_container,alert_tpl;
    var isAdd,receiverId;

    function editSettings(){
        $("#alertOption .input").addClass("input-edit").removeAttr("readonly");
        $("#edit_btn").show();
        $("#autoAlert").attr("data-edit","1");
    }
    function cancelEdit(){
        $("#alertOption .input").removeClass("input-edit").attr("readonly",true);
        $("#edit_btn").hide();
        $("#autoAlert").attr("data-edit","0");
    }

    function autoAlert(){
        var canEdit = $(this).attr("data-edit");
        if(canEdit == "1"){
            if($(this).hasClass("switch-active")){
                $(this).removeClass("switch-active");
            }else{
                $(this).addClass("switch-active");
            }
        }
    }

    function saveAlertSettings(){
        var data = {};
        if($("#autoAlert").hasClass("switch-active")){
            data.open_alert = true;
        }else {
            data.open_alert = false;
        }
        data.loadavg = $("#loadavg").val();
        data.ram_percent = $("#ram_percent").val();
        data.disk_percent = $("#disk_percent").val();
        data.incoming_bd = $("#incoming_bd").val();
        data.outgoing_bd = $("#outgoing_bd").val();
        http_post("/api/alert/admin/setting/save",data,function(msg){
            if(msg.errno == 0){
                alertMsg("#toast_success","保存成功！");
                setTimeout(function(){
                    window.location.reload();
                },1000);
            }else{
                alertMsg("#toast_error","保存失败！");
            }
        },function(error){
            console.log(error);
        });
    }

    function saveInformWay(){
        var data = {};
        data.email_alert = $("#email_alert").is(":checked");
        data.mobile_alert = $("#mobile_alert").is(":checked");
        data.wechat_alert = $("#wechat_alert").is(":checked");
        http_post("/api/alert/admin/setting/alertMethod",data,function(msg){
            if(msg.errno == 0){
                alertMsg("#toast_success","保存成功！");
            }else{
                alertMsg("#toast_error","保存失败！");
            }
        },function(error){
            console.log(error);
        });
    }

    function getAllReceivers(){
        http_get("/api/alert/admin/receiver/list", true,function(msg){
            if(msg.errno == 0){
                var html = JTE.clear().assign('receivers',  msg.data.list)
                    .execute(alert_tpl, 'ps_list');
                alert_container.innerHTML = html;
            }
        },function(error){
            console.log(error);
        })
    }

    function addReceiver(){
        $(".dialog-bg").show();
        $("#receiver_dialog").fadeIn();
        $("#name,#mobile,#email,#openid").val("");
        $("#receiver_title").text("添加接收人");
        isAdd = true;
    }
    function updateReceiver(){
        $(".dialog-bg").show();
        $("#receiver_dialog").fadeIn();
        $("#name").val($(this).parents("td").siblings(".receiver-name").text());
        $("#mobile").val($(this).parents("td").siblings(".receiver-mobile").text());
        $("#email").val($(this).parents("td").siblings(".receiver-email").text());
        $("#openid").val($(this).parents("td").siblings(".receiver-openid").text());
        $("#receiver_title").text("修改接收人信息");
        receiverId = $(this).parents("td").attr("data-id");
        isAdd = false;
    }
    function cancelReceiver(){
        $(".dialog-bg").hide();
        $("#receiver_dialog").fadeOut();
    }
    function saveReceiver(){
        var name = $("#name").val();
        var mobile = $("#mobile").val();
        var email = $("#email").val();
        var openid = $("#openid").val();
        var validator = new window.Validator();
        validator.add(name,[{
            pattern: "is_not_empty",
            error_msg: "接收人姓名不能为空！"
        }]);
        validator.add(mobile,[{
            pattern: "is_not_empty",
            error_msg: "接收人手机号不能为空！"
        },{
            pattern: "is_mobile",
            error_msg: "接收人手机号格式错误！"
        },]);
        validator.add(email,[{
            pattern: "is_email",
            error_msg: "接收人邮箱格式错误！"
        },]);
        var errorMsg = validator.start();
        if(errorMsg){
            alertMsg("#toast_error",errorMsg);
            return;
        }
        var data = {
            name: name,
            mobile: mobile,
            email: email,
            wx_openid: openid
        };
        if(isAdd){
            http_post("/api/alert/admin/receiver/add",data,function(msg){
                if(msg.errno == 0){
                    getAllReceivers();
                    cancelReceiver();
                    alertMsg("#toast_success","添加成功！");
                }else{
                    alertMsg("#toast_error",msg.data);
                }
            },function(errno){
                console.log(errno)
            });
        }else{
            data.id = receiverId;
            http_post("/api/alert/admin/receiver/update",data,function(msg){
                if(msg.errno == 0){
                    getAllReceivers();
                    cancelReceiver();
                    alertMsg("#toast_success","修改成功！");
                }else{
                    alertMsg("#toast_error",msg.data);

                }
            },function(error){
                console.log(error);
            });
        }

    }

    function deleteReceiver(){
        receiverId = $(this).parents("td").attr("data-id");
        confirmShow("确定要删除该接收人吗？","","删除");
    }

    function confirmDelete(){
        http_post("/api/alert/admin/receiver/delete",{id: receiverId},function(msg){
            if(msg.errno == 0){
                getAllReceivers();
                confirmHide();
                alertMsg("#toast_success","删除成功！");
            }else{
                alertMsg("#toast_error",msg.data);
            }
        });
    }

    function _init(config){
        $("#autoAlert").on("click",autoAlert);

        if(config.saveAlertBtn){
            $(config.saveAlertBtn).on("click",saveAlertSettings);
        }
        if(config.saveInformBtn){
            $(config.saveInformBtn).on("click",saveInformWay);
        }
        if(config.alert_container && config.alert_tpl){
            alert_container = config.alert_container;
            alert_tpl = config.alert_tpl;
            getAllReceivers();
        }
        $("#add_receiver").on("click",addReceiver);
        $("body").on("click",".updata-receiver",updateReceiver);
        $("body").on("click",".delete-receiver",deleteReceiver);
        $("#cancel_receiver").on("click",cancelReceiver);
        $("#save_receiver").on("click",saveReceiver);
        $("#save_confirm").on("click",confirmDelete);

        $("#editSetting").on("click",editSettings);
        $("#cancelEdit").on("click",cancelEdit);
        $("body").on("click",".more-option",window.table_select.showMoreOption);
        $("body").on("mouseleave",".option",window.table_select.hideMoreOption);
        $(document).on("click",window.table_select.hideMoreOption);

    }
    window.alertset = {
        init: _init
    }
})(window);
