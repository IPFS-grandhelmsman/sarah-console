;(function(){
    "use strict";
    var v_qstr,dialog_status,choosed_node,node_id_arrs=[],data = {};
    function show_add_task(){
        dialog_status = 0;//添加
        $(".dialog-bg").show();
        $("#name").val("");
        $("#intro").val("");
        $("#create_task_title").html("新建任务");
        $("#create_task_dialog").fadeIn();
    }

    function cancel_add_task(){
        $(".dialog-bg").hide();
        $("#create_task_dialog").fadeOut()
    }

    function edit_task(){
        dialog_status = 1;//编辑
        var name = $(this).parents("tr").find(".task-name").text();
        var intro = $(this).parents("td").attr("data-intro");
        v_qstr = $(this).attr("data-vqstr");
        $("#name").val(name);
        $("#intro").val(intro);
        $("#create_task_title").html("编辑任务");
        $(".dialog-bg").show();
        $("#create_task_dialog").fadeIn();
    }

    function hide_dialog(event){
        if(event.data && event.data.bg){
            $(event.data.bg).hide();
        }
        if(event.data && event.data.main) {
            $(event.data.main).fadeOut();
        }
    }

    function save_task(){
        var data = {};
        data.name = $("#name").val();
        data.intro = $("#intro").val();
        if(dialog_status == 0){
            http_post("/api/computing/task/add", data,function(msg){
                if (msg.errno == 0) {
                    cancel_add_task();
                    alertMsg("#toast_success","操作成功！");
                    setTimeout(function(){
                        window.location.reload();
                    },1000);
                } else {
                    alertMsg("#toast_error", msg.data);
                }
            },function(error){
                console.log(error);
            })
        }else{
            http_post("/api/computing/task/edit?"+v_qstr,data,function(msg){
                if(msg.errno == 0){
                    cancel_add_task();
                    alertMsg("#toast_success","操作成功！");
                    setTimeout(function(){
                        window.location.reload();
                    },1000);

                }else{
                    alertMsg("#toast_error",msg.data);
                }
            },function(error){
                console.log(error);
            })
        }
    }

    function show_service_pwd(){
        var node_id_sets;
        var check = $("#selected_node").attr("data-check");
        if(check == "2"){
            if(node_id_arrs.length == 0){
                alertMsg("#toast_error","请先选择节点！");
                return;
            }
            node_id_sets = node_id_arrs.join(",");
            data.node_id_sets = node_id_sets;
        }
        data.dist_type = check;
        data.sarah_sign = $("#sarah_params").val();

        $("#start_task_dialog").hide();
        $("#service_pwd").fadeIn();
        $(".dialog-bg").show();
    }

    function hide_service_pwd(){
        $("#service_pwd").hide();
        $(".dialog-bg").hide();
    }

    function start_task(){
        var service_pwd = $("#service_password").val();
        if(!service_pwd){
            alertMsg("#toast_error","服务密码不能为空！");
            return false;
        }
        data.service_passwd = service_pwd;
        http_post("/api/computing/task/startup?" + v_qstr,data,function (msg){
            if(msg.errno == 0){
                hide_service_pwd();
                alertMsg("#toast_success","启动成功");
                node_id_arrs = [];
                $("#service_password").val("");
                setTimeout(function(){
                    window.location.reload();
                },1000);
            } else if (msg.errno == "50") {
                alertMsg("#toast_error","服务密码输入格式有误");
                $("#service_password").val("");
            } else if (msg.errno == "51") {
                alertMsg("#toast_error", "服务密码尚未设置，请前往用户设置中设置服务密码！");
                $("#service_password").val("");
            } else if (msg.errno == "52") {
                alertMsg("#toast_error", "服务密码错误！");
                $("#service_password").val("");
            } else {
                alertMsg("#toast_error", msg.data);
                $("#service_password").val("");
            }
        },function(error){
            console.log(error);
        })
    }

    function show_start_dialog(){
        $(".dialog-bg").show();
        $("#start_task_dialog").fadeIn();
        v_qstr = $(this).attr("data-vqstr");
    }

    function showNodeDistribution(event){
        event.stopPropagation();
        if($("#node_distribution_option").is(":hidden")){
            $("#node_distribution_option").show();
        }else{
            $("#node_distribution_option").hide();
        }
    }

    function chooseCurrencyInformway(){
        var value = $(this).html();
        var checked = $(this).attr("data-dist");
        $("#selected_node").attr("data-check",checked);
        $("#selected_node .text").html(value);
    }

    function show_define_node(){
        window.node_select_list.load_define_node();
        $("#define_node_dialog").fadeIn();
    }

    function choose_define_node(){
        //choosed_node记录选择的节点
        node_id_arrs = [];
        $("input[name='custom_node']").each(function(){
            if($(this).is(":checked")){
                node_id_arrs.push($(this).parents(".table-row").attr("data-nodeid"));
            }
        });
        if(node_id_arrs.length == 0){
            alertMsg("#toast_error","请选择节点！");
            return;
        }

        $("#selected_node").attr("data-check",2);
        $("#selected_node .text").html("自定义节点");
        hide_define_node();
    }

    function hide_task_start(){
        $(".dialog-bg").hide();
        $("#start_task_dialog").fadeOut();
    }

    function hide_define_node(){
        $("#define_node_dialog").fadeOut();
    }

    function _init(config){
        if(config && config.add_task){
            $(config.add_task).on("click",show_add_task);
        }
        if(config && config.edit_task){
            $(config.edit_task).on("click",edit_task);
        }
        if(config && config.start_task){
            $(config.start_task).on("click",show_start_dialog);
        }
        $("#cancel_add_task").on("click",cancel_add_task);

        $(".dialog-btn-cancel").on("click",{bg: ".task-bg",main: ".dialog-task"},hide_dialog);
        $("#save_task").on("click",save_task);
        $("#choo_define_node").on("click",show_define_node);
        $("#show_service_pwd").on("click",show_service_pwd);
        $("#hide_service_pwd").on("click",hide_service_pwd);
        $("#start_task_btn").on("click",start_task);

        $("#selected_node").on("click",showNodeDistribution);
        $(".currency-informway").on("click",chooseCurrencyInformway);
        $("#choose_node_btn").on("click",choose_define_node);
        $("#choose_custom_close").on("click",hide_define_node);
        $("#hide_task_start").on("click",hide_task_start);

        $(".more-option").on("click",window.table_select.showMoreOption);
        $(".option").on("mouseleave",window.table_select.hideMoreOption);
        $(document).on("click",window.table_select.hideMoreOption);

        $(".task-coding").on("click",window.link.open_new_iframe);
    }

    window.task = {
        init: _init
    }
})(window);
