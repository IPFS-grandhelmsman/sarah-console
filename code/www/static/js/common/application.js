(function(window){
    "use strict";
    function show_select_option(){
        var is_show = $(this).attr("data-show");
        if(is_show == "false"){
            $("#app_node_option").show();
            $(this).attr("data-show","true");
        }else{
            $("#app_node_option").hide();
            $(this).attr("data-show","false");
        }
    }
    function choose_all(){
        var choose_task = $(this).attr("data-task");
        var choose_value = $(this).html();
        $("#app_node").attr({
            "data-check":choose_task,
            "data-nodeid": ""
        });
        $("#app_node .text").html(choose_value);
        show_select_option.apply($("#app_node"));
    }

    function show_custom_option(){
        show_select_option.apply($("#app_node"));
        $("#define_node_dialog").fadeIn();
        $("input[name='custom_node']").prop("checked",false);
        $("#app_node").attr("data-nodeid","");
        window.node_select_list.load_define_node();
    }
    function choo_custom_option(){
        if($("input[name='custom_node']:checked").length <= 0){
            alertMsg("你还没有选择节点");
            return false;
        }
        var node_id_arrs = [];
        var choose_value = $("#custom_node").html();
        var choose_task = $("#custom_node").attr("data-task");
        $("#app_node").attr("data-check",choose_task);
        $("#app_node .text").html("已选择："+choose_value);
        $("input[name='custom_node']").each(function(){
            if($(this).is(":checked")){
                node_id_arrs.push($(this).parents(".table-row").attr("data-nodeid"));
            }
        });
        $("#app_node").attr("data-nodeid",node_id_arrs.join(","));
        hide_custom_option();
    }
    function hide_custom_option(){
        $("#define_node_dialog").fadeOut();
    }

    function dialog_hide(){
        $(".dialog-bg").hide();
        $(this).parents(".dialog").fadeOut();
    }
    window.application = {
        dialog_hide: dialog_hide,
        show_select_option: show_select_option,
        choose_all: choose_all,
        hide_custom_option: hide_custom_option,
        show_custom_option: show_custom_option,
        choo_custom_option: choo_custom_option,
    }
})(window);
