;(function(window){
    "use strict";
    var v_qstr,app_name;
    var task_status,opt_type,node_id_set,intro,chekced_node_num;

    function showMoreOption(event){
        event.stopPropagation();
        $("#transform_bg").show();
        $(this).parents("tr").addClass("row-active");
        var $option = $(this).siblings(".option");
        $(".sarah-table .option").not($option).hide();
        var status = $(this).parents("tr")
                            .find(".app-status")
                            .attr("data-status");
        var nodeStatus = $(this).parents("tr").find(".node-status").attr("data-status");
        if($option.is(":hidden")){
            if(nodeStatus == "0"){
                $(".stop").addClass("forbid").removeClass("stop-app");
                $(".unistall").addClass("forbid").removeClass("uninstall-app");
                $(".config").addClass("forbid").removeClass("edit-config");
            }else{
                if(status == 4){
                    $(".stop").addClass("stop-app").removeClass("forbid");
                    $(".unistall").addClass("forbid").removeClass("uninstall-app");
                    $(".config").addClass("edit-config").removeClass("forbid");
                }else if(status == 2){
                    $(".stop").addClass("forbid").removeClass("stop-app");
                    $(".unistall").addClass("uninstall-app").removeClass("forbid");
                    $(".config").addClass("edit-config").removeClass("forbid");
                }else{
                    $(".unistall").addClass("forbid").removeClass("uninstall-app");
                    $(".stop").addClass("forbid").removeClass("stop-app");
                    $(".config").addClass("edit-config").removeClass("forbid");
                }
            }
            $option.show();
        }else{
            $option.hide();
        }
    }
    function hideMoreOption(){
        $("#transform_bg").hide();
        $(".sarah-table .option").hide();
        $(".row-active").removeClass("row-active");
    }

    function show_all_node(){
        $(".dialog-bg").show();
        $("#choose_node").fadeIn();
        $("#choose_node .app-node-header").html("请选择节点");
        $("#choose_node .app-remarks").val("一键安装"+app_name+"应用");
        $("#app_node").attr("data-check","8");
        $("#app_node").find(".text").html("全部未安装节点");
        $("#save_node").html("安装");
    }

    function save_choose_node(){
        var data = {};
        data.opt_type = "1";
        data.dist_type = $("#app_node").attr("data-check");
        data.node_id_sets = $("#app_node").attr("data-nodeid");
        data.autostart = true;
        data.intro = $(".app-remarks").val();
        http_post("/api/application/task/add?" + v_qstr,data,function(msg){
            if(msg.errno == "0"){
                window.application.dialog_hide.apply($("#dialog_hide"));
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

    function load_node_statistic_info(){
        http_get("/api/application/node/stat?" + v_qstr, true,function(msg){
            if(msg.errno == "0"){
                var all_node = msg.data.all_count;
                var no_install_node = msg.data.all_count - msg.data.ins_count;
                $("#all_node").html(all_node);
                $("#no_install_node").html(no_install_node);
                if(no_install_node != 0){
                    $("#install_all").removeClass("sarah-hide");
                }
            }
        },function(error){console.log(error);})
    }

    //单个操作
    function show_app_confirm(event){
        opt_type = event.data.opt_type;
        var opt_value = event.data.opt_value;
        $(".tips-bg").show();
        $("#app_config_confirm").addClass("confirm-show");
        node_id_set = $(this).parents("tr").find(".node-uid").attr("data-id");
        var content = "确定" + opt_value + "该节点的" + app_name + "应用？";
        window.confirmShow(content,"",opt_value);
        intro = "快捷" + opt_value;
    }

    //批量操作
    function show_app_config_batch(event){
        task_status = "";
        var num = $(".single-check:checked").length;
        if(num == 0){
            alertMsg("#toast_error","你还没有选择任何节点，请先选择节点!");
            return;
        }
        opt_type = event.data.opt_type;
        var opt_value = event.data.opt_value;
        $(".tips-bg").show();
        $("#app_config_confirm").addClass("confirm-show");
        var nodes = [],task_value;
        if(opt_type == 2){
            //启动
            task_status = 2;
            task_value = "运行中";
        }else if(opt_type == 3){
            task_status = 4;
            task_value= "未启动"
        }else if(opt_type == 4){
            task_status = 2;
            task_value = "运行中"
        }
        $(".single-check:checked").each(function(){
            var $parent = $(this).parents("tr");
            var status = $parent.find(".app-st").find(".app-status").attr("data-status");
            if(status == task_status){
                var uid = $(this).parents("tr").find(".node-uid").attr("data-id");
                nodes.push(uid);
            }
        });
        chekced_node_num = nodes.length;
        node_id_set = nodes.join(",");
        var tip = "",content="";
        if(num != chekced_node_num){
            tip = "应用"+task_value+"的节点不可"+$(this).html()+"，已剔除";
        }
        if(chekced_node_num == 0){
            content = "未选中节点，请重新选择";
        }else{
            content = "已选中" + chekced_node_num + "个节点，确定" + opt_value + "这些节点的" + app_name + "应用？";
        }

        window.confirmShow(content,tip,opt_value);
        intro = "批量" + opt_value;
    }

    function exec_task(){
        if(chekced_node_num == 0){
            confirmHide();
            return;
        }
        var data = {};
        data.opt_type = opt_type;
        data.dist_type = 2;
        data.node_id_sets = node_id_set;
        data.autostart = true;
        data.intro = intro;
        $(".single-check:checked").each(function(){
            var $this = $(this);
            var status = $this.parents("tr").find(".app-st .app-status").attr("data-status");
            if(status != task_status){
                $this.prop("checked",false);
            }
        });
        http_post("/api/application/task/add?" + v_qstr,data,function(msg){
            if(msg.errno == "0"){
                confirmHide();
                alertMsg("#toast_success","操作成功！");
                var node_ids = node_id_set.split(",");
                node_ids.forEach(function(value){
                    var status = $("td[id='"+value+"']").siblings(".app-st").find(".app-status").attr("data-status");
                    $("td[id='"+value+"']").siblings(".app-pid").html("...");
                    $("td[id='"+value+"']").siblings(".app-st").attr("data-option",status).html("...");
                    $("td[id='"+value+"']").siblings(".app-cpu").html("...");
                    $("td[id='"+value+"']").siblings(".app-mem").html("...");
                });
                node_id_set = "";
                task_status = "";
                opt_type = "";
            }else if(msg.errno == "1"){
                alertMsg("#toast_error","参数错误！");
            }else if(msg.errno == "4"){
                alertMsg("#toast_error","操作失败！");
            }else if(msg.errno == "8"){
                alertMsg("#toast_error","操作过于频繁！");
            }
        },function(error){
            console.log(error);
        })
    }

    //加载应用状态
    function load_application_status(){
        var app_uid = [];
        $(".node-uid").each(function(){
            var node_id = $(this).attr("data-id");
            app_uid.push(node_id);
        });
        var id_str = app_uid.join(",");
        var all_nodes = [];
        $(".node-uid").each(function(){
            all_nodes.push($(this).attr("data-id"));
        });
        http_post("/api/application/node/statRef?"+v_qstr,{id_str: id_str},function(msg){
            if(msg.errno == 0){
                var res = msg.data;
                var ifUninstall = (res.length < all_nodes.length);
                for(var i=0;i<res.length;i++){
                    if(ifUninstall){
                        var index = all_nodes.indexOf(res[i].node_id);
                        if(index>-1){
                            all_nodes.splice(index,1);
                        }
                        if(i == res.length-1){
                            for(var j = 0;j<all_nodes.length;j++){
                                $("[id='"+all_nodes[j]+"']").parent().remove();
                            }
                        }
                    }
                    var $td = $("[id='"+res[i].node_id+"']");
                    $td.siblings(".app-pid").html(res[i].pid);
                    $td.siblings(".app-cpu").html("<div class='float-left cpu-data'>"+res[i].stat_json.cpu + "%</div>");
                    $td.siblings(".app-mem").html("<div class='float-left mem-data'>"+res[i].stat_json.mem + "%</div>");
                    var node_status = $td.siblings(".node-status").attr("data-status");
                    var status = res[i].status;
                    var $app_status = $td.siblings(".app-st");
                    var app_status = $app_status.attr("data-option");
                    if($app_status == status){
                        return;
                    }
                    $app_status.attr("data-option","");
                    switch (status){
                        case "0":
                            $app_status.html("<em class='state-urgent app-status' data-status='0'>待安装</em>");break;
                        case "1":
                            $app_status.html("<em class='state-blue app-status' data-status='1'>安装中&nbsp; 0%</em>");break;
                        case "2":
                            if(node_status == "0"){
                                $app_status.html("<em class='state-grey app-status' data-status='2'>未启动&nbsp;<i class='iconfont iconqidong state-gray' title='点击启动'></i></em>");
                            }else{
                                $app_status.html("<em class='state-grey app-status' data-status='2'>未启动&nbsp;<i class='iconfont iconqidong state-blue start-app' title='点击启动'></i></em>");
                            }
                            break;
                        case "3":
                            $app_status.html(" <em class='state-blue app-status' data-status='3'>启动中&nbsp;0%</em>");break;
                        case "4":
                            $app_status.html("<em class='state-normal app-status' data-status='4'>运行中 </em>");break;
                        case "5":
                            $app_status.html(" <em class='state-blue app-status' data-status='5'>停止中&nbsp;0%</em>");break;
                        case "6":
                            $app_status.html("<em class='state-blue app-status' data-status='6'>卸载中&nbsp;0%</em>");break;
                        case "7":
                            if(node_status == "0"){
                                $app_status.html("<em class='state-grey app-status' data-status='7'>已卸载 <i class='iconfont iconshanchu state-gray' title='点击删除'></i></em>");
                            }else{
                                $app_status.html("<em class='state-grey app-status' data-status='7'>已卸载 <i class='iconfont iconshanchu state-blue' title='点击删除'></i></em>");
                            }
                            break;
                        default:$app_status.html(status);
                    }
                }
            }else{
                //alertMsg("#toast_error","应用状态加载失败！")
            }
        },function(error){
            console.log(error);
        });
    }
    function timing_load_application_status(){
        setInterval(function(){
            load_application_status();
        },7000);
    }

    // 显示配置弹框
    function show_process_dialog(event){
        event.stopPropagation();
        var $parent = $(this).parent();
        var data = $parent.siblings(".menu").find(".process-data").html();
        var jData = JSON.parse(data);
        var jProcess = [];
        jProcess[0] = {desc: "用户", value: jData.user};
        jProcess[1] = {desc: "进程ID", value: jData.pid};
        jProcess[2] = {desc: "%CPU", value: jData.cpu};
        jProcess[3] = {desc: "%内存", value: jData.mem};
        jProcess[4] = {desc: "虚拟内存", value: jData.vsz};
        jProcess[5] = {desc: "状态", value: jData.stat};
        jProcess[6] = {desc: "启动时间", value: jData.start};
        jProcess[7] = {desc: "运行时长", value: jData.time};
        jProcess[8] = {desc: "进程指令", value: jData.cmd};
        var tpl = $("#app_process_tpl").html();
        var html = JTE.clear().assign('process', jProcess)
            .execute(tpl, 'ps_list');
        $("#app_process").html(html);
        $("#process").show();
        var left = $parent.offset().left;
        var top = $parent.offset().top;
        var scrollTop = $(window).scrollTop();
        var dialogHeight = $("#app_process").height();
        var iframeId = window.link.get_link_string("__sara_iframe_id");
        var pageHeight = $("#"+iframeId,parent.document).parent().height();
        var mouseBottom = pageHeight - top;
        $("#sign").css({
            left: (left - 10 + 0.5) + "px",
            top: (top-scrollTop + 20) + "px"
        });
        if(dialogHeight <= mouseBottom){//如果弹框的高度小于当前td距离页面底部的高度
            $("#process").css({
                left: (left - 305) + "px",
                top: (top - scrollTop - 20) + "px"
            });
        }else if(dialogHeight < top){//如果弹框的高度小于当前td距离页面顶部的高度
            $("#process").css({
                left: (left - 305) + "px",
                top: (top + 34 - scrollTop - dialogHeight) + "px"
            });
        }else{
            $("#process").css({
                left: (left -305) + "px",
                top: (pageHeight - scrollTop - dialogHeight -20) + "px"
            });
        }

    }
    function hide_process_dialog(event){
        var e = event || window.event;
        e.stopPropagation();
        var x1 = $("#process").position().left;
        var y1 = $("#process").position().top;
        var x2 = x1 + $("#process").width();
        var y2 = y1 + $("#app_process").outerHeight();
        var mouseX = e.clientX;
        var mouseY = e.clientY;
        if((mouseX >= x1 && mouseX <= x2) && (mouseY >= y1 && mouseY <= y2)){
            return false;
        }
        $("#app_process").empty();
        $("#process").hide();
    }

    //修改配置
    function show_config(){
        var $tr = $(this).parents("tr");
        var header = $tr.find(".node-uid").html();
        $("#config_header").html("节点id：" + header);
        var data = JSON.parse($tr.find(".node-config-data").html());
        var vqstr = $(this).attr("data-vqstr");
        var config = {
            url: "/api/application/node/config/edit?" + vqstr,
            data: data,
            config_obj: $tr.find(".node-config-data")
        };
        window.application_config.init(config);
        $("#node_config").fadeIn();
    }
    function close_config(){
        $("#node_config").fadeOut();
        $("#de_config").remove();
    }

    function _init(config){
        if(config && config.app_name){
            app_name = config.app_name;
        }
        if(config && config.v_qstr){
            v_qstr = config.v_qstr;
            load_node_statistic_info();
            $("#save_node").on("click",save_choose_node);
        }
        $("body").on("click",".start-app",{opt_type: 2,opt_value: "启动"},show_app_confirm);
        $("body").on("click",".stop-app",{opt_type: 3,opt_value: "停止"},show_app_confirm);
        $("body").on("click",".uninstall-app",{opt_type: 4,opt_value: "卸载"},show_app_confirm);
        $(".batch-start-app").on("click",{opt_type: 2,opt_value: "启动"},show_app_config_batch);
        $(".batch-stop-app").on("click",{opt_type: 3,opt_value: "停止"},show_app_config_batch);
        $(".batch-uninstall-app").on("click",{opt_type: 4,opt_value: "卸载"},show_app_config_batch);
        $("#save_confirm").on("click",exec_task);
        $("#install_all").on("click",show_all_node);
        $("#app_node").on("click",window.application.show_select_option);
        $("#custom_node").on("click",window.application.show_custom_option);
        $("#choose_node_btn").on("click",window.application.choo_custom_option);
        $("#unselect_node").on("click",window.application.choose_all);
        $("#choose_custom_close").on("click",window.application.hide_custom_option);
        $("#choose_node_close").on("click",window.application.dialog_hide);

        $(".all-check").on("click",{allnode: ".all-check",singlenode: ".single-check"},allCheck);
        $(".single-check").on("click",{allnode: ".all-check",singlenode: ".single-check"},singleCheck);

        $(".more-option").on("click",showMoreOption);
        $(".option").on("mouseleave",hideMoreOption);
        $(document).on("click",hideMoreOption);
        $(document).on("mouseenter",".mem-data,.cpu-data",show_process_dialog);
        $(document).on("mouseout",".mem-data,.cpu-data,#process",hide_process_dialog);

        $(".node-uid").on("click",window.link.open_new_iframe);

        $(".config").on("click",show_config);
        $("#close_config").on("click",close_config);

        timing_load_application_status();
    }

    window.app_preview = {
        init: _init
    }
})(window);
