(function(){
    "use strict";
    var opt_type = "",dist_type = "",v_qstr;
    function show_add_task(){
        $(".dialog-bg").show();
        $("#choose_type").fadeIn();
    }

    function show_choose_node(){
        if(!$("input:radio[name='app_task_type']").is(":checked")){
            alertMsg("#toast_error","请先选择任务类型！");
            return;
        }
        var $checkd = $("input:radio[name='app_task_type']:checked");
        var task_value = $checkd.val();
        opt_type = $checkd.attr("data-type");
        window.application.dialog_hide.apply("#choose_type_close");
        $(".dialog-bg").show();
        $("#choose_node").fadeIn();
        $("#choose_node").find("#app_node").attr("data-check","8");
        $("#choose_node").find("#app_node .text").html("暂未选择任何节点");
        $("#choose_node").find(".app-remarks").val('');
        $("#app_task_type").html(task_value);
        switch (opt_type){
            case "1":
                $("#unselect_node").html("全部未安装的节点");
                $("#app_node .text").html("全部未安装的节点");
                break;
            case "2":
                $("#unselect_node").html("全部未启动的节点");
                $("#app_node .text").html("全部未启动的节点");
                break;
            case "3":
                $("#unselect_node").html("全部运行中的节点");
                $("#app_node .text").html("全部运行中的节点");
                break;
            case "4":
                $("#unselect_node").html("全部待启动的节点");
                $("#app_node .text").html("全部待启动的节点");
                break;
        }
    }

    function save_choose_node(){
        var data = {};
        data.opt_type = opt_type;
        data.dist_type = $("#app_node").attr("data-check");
        data.node_id_sets = $("#app_node").attr("data-nodeid");
        data.autostart = true;
        data.intro = $(".app-remarks").val();
        http_post("/api/application/task/add?" + v_qstr,data,function(msg){
            if(msg.errno == "0"){
                window.application.dialog_hide.apply("#choose_node_close");
                alertMsg("#toast_success","添加成功！");
                setTimeout(function(){
                    window.location.reload();
                },1000);
            }else if(msg.errno == "1"){
                alertMsg("#toast_error","参数错误！");
            }else if(msg.errno == "4"){
                alertMsg("#toast_error","操作失败！");
            }else if(msg.errno == "8"){
                alertMsg("#toast_error","操作过于频繁！");
            }
        },function(error){
            console.log(error);
        });
    }

    function show_task_type(event){
        event.stopPropagation();
        var $option = $(this).siblings(".option");
        if($option.is(":hidden")){
            $option.show();
        }else{
            $option.hide();
        }
    }
    function hide_task_type(){
        $("#choose_task_type").siblings(".option").hide();
    }

    function show_task_node(){
        var name = $(this).attr("data-name");
        var vqstr = $(this).attr("data-vqstr");
        $("#find_task_header").html(name);
        http_get("/api/application/task/node/list?"+vqstr, true,function(msg){
            if(msg.errno == 0){
                var tpl = $("#task_node_tpl").html();
                var html = JTE.clear().assign('nodes', msg.data)
                    .execute(tpl, 'ps_list');
                $("#task_relate_node").html(html);
            }else{
                alertMsg("#toast_error",msg.data);
            }
        },function(error){
            console.log(error);
        });
        $("#find_task").fadeIn();
        $(".dialog-bg").show();
    }
    function close_task_node(){
        $("#find_task").fadeOut();
        $(".dialog-bg").fadeOut();
    }

    function _init(config){
        $("#add_task").on("click",show_add_task);
        $("#choose_type_close,#choose_node_close").on("click",window.application.dialog_hide);
        $("#go_step").on("click",show_choose_node);
        $("#app_node").on("click",window.application.show_select_option);
        $("#unselect_node").on("click",window.application.choose_all);
        $("#custom_node").on("click",window.application.show_custom_option);
        $("#choose_custom_close").on("click",window.application.hide_custom_option);
        $("#choose_node_btn").on("click",window.application.choo_custom_option);
        if(config && config.v_qstr){
            v_qstr = config.v_qstr;
            $("#save_node").on("click",save_choose_node);
        }
        $("#choose_task_type").on("click",show_task_type);
        $(document).on("click",hide_task_type);
        $(".find-task").on("click",show_task_node);
        $("#close_task_node").on("click",close_task_node);

    }

    window.app_task = {
        init: _init
    }
})(window);
