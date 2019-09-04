(function(window){
    var isAdd,$config_obj="";

    function load_app_config_data(data){
        var app_config_tpl = document.getElementById("app_config_tpl").innerText;
        var app_config_data = document.getElementById("app_config_data");
        var html = JTE.clear().assign('config',data).execute(app_config_tpl,"ps_list2");
        app_config_data.innerHTML = html;
    }

    function edit_config(){
        $(".edit-input").each(function(){
           if($(this).attr("data-added") == "1"){
               $(this).addClass("input-edit").removeAttr("readonly");
           }
        });
        $("#edit_config").attr("data-edit","1");
        $("#edit_btn").removeClass("sarah-hide");
        $(".del-custom-config").removeClass("sarah-hide");
    }

    function show_add_config(){
        $(".dialog-bg").show();
        $("#add_config_dialog").fadeIn();
        $("#option_desc").val("");
        $("#option_value").val("");
        $("#option_name").val("");
        isAdd = true;
    }
    function cancel_add_config(){
        $(".dialog-bg").hide();
        $("#add_config_dialog").fadeOut();
        isAdd = false;
    }

    function cancel_edit(){
        $(".edit-input").removeClass("input-edit").attr("readonly",true);
        $("#edit_btn").addClass("sarah-hide");
        $("#edit_config").attr("data-edit","0");
        $(".del-custom-config").addClass("sarah-hide");
    }

    function toggle_switch(event){
        var e = event || window.event;
        e.stopPropagation();
        var canEdit = $("#edit_config").attr("data-edit");
        if(canEdit == "1"){
            var isActive = $(this).hasClass("switch-active");
            if(isActive){
                $(this).removeClass("switch-active");
            }else{
                $(this).addClass("switch-active");
            }
        }
    }

    function save_config(event){
        event.stopPropagation();
        var url = event.data.url;
        var data = {};
        var error_msg = "";
        $(".all-config").each(function(){
            try{
                var $key = $(this).find(".config-name");
                var key = $key.val();
                data[key] = {};
                var $content = $(this).find(".config-value");
                var value = get_config_value($content);
                var $desc = $(this).find(".config-desc");
                var desc = $desc.val();
                data[key].value = value;
                data[key].desc = desc;
                error_msg = validator(key,value,desc);
                if(error_msg){
                    throw new Error(error_msg);
                }
            }catch(e){}
        });
        if(isAdd){
            var key = $("#option_name").val();
            var value = $("#option_value").val();
            var desc = $("#option_desc").val();
            var error_msg2 = validator(key,value,desc);
            if(error_msg2){
                alertMsg("#toast_error",error_msg2);
                return;
            }
            data[key] = {};
            data[key].value = value;
            data[key].desc = desc;
        }
        if(error_msg){
            alertMsg("#toast_error",error_msg);
            return;
        }
        http_post(url,{config_json: JSON.stringify(data)},function(msg){
            if(msg.errno == "0"){
                alertMsg("#toast_success","修改成功！");
                if($config_obj != ""){
                    $config_obj.html(JSON.stringify(msg.data.config_json));
                }
                if(isAdd){
                    cancel_add_config.call($("#close_dialog"));
                    var htmls = "";
                    htmls += '<tr class="table-row all-config"  title="'+desc+'">';
                    htmls += '<td class="padding-left text-overflow">';
                    htmls += '<input class="input edit-input config-desc" type="text" value="'+desc+'" data-added="1"  readonly></td>';
                    htmls += '<td class="padding-left text-overflow" title="'+value+'">';
                    htmls += '<input class="input edit-input config-value" type="text" value="'+value+'" data-added="1" readonly></td>';
                    htmls += '<td class="padding-left text-overflow" title="'+key+'" >';
                    htmls += '<input class="input edit-input config-name" type="text" value="'+key+'" data-added="1" readonly>';
                    htmls += '<button class="btn btn-text btn-gray-v1 sarah-hide del-custom-config"><i class="iconfont iconshanchu float-left"></i>&nbsp;删除</button>';
                    htmls += '</td></tr>';
                    $(".all_config").append(htmls);
                }else{
                    cancel_edit.call($("#cancel_edit"));
                }
            }else if(msg.errno == "4"){
                alertMsg("#toast_error","修改失败！");
            }else{
                alertMsg("#toast_error","参数错误！");
            }
        },function(error){
            console.log(error);
        });
    }

    function del_custom_config(){
        $(this).parents(".all-config").remove();
    }
    function void_repeat_title(){
        var _this = this;
        var custom_title = $(_this).val();
        $(".config-name").not(_this).each(function(){
            var title = get_config_value($(this));
            if(custom_title == title){
                alertMsg("当前配置名称已存在，请重新输入！");
                $(_this).val("");
                return;
            }
        });
    }
    function get_config_value(params){
        var value;
        var $params = params;
        var type = $params.attr("type");
        if(type == "text"){
            value = $params.val();
        }else{
            if($params.hasClass("switch-active")){
                value = true;
            }else{
                value = false;
            }
        }
        return value;
    }

    function validator(key,value,desc){
        var validator = new window.Validator();
        validator.add(desc,[{
            pattern: "is_not_empty",
            error_msg: "选项不能为空"
        },{
            pattern: "max_length:20",
            error_msg: "选项长度不超过20个中文字符",
        }]);
        validator.add(value,[{
            pattern: "is_not_empty",
            error_msg: "选项值不能为空"
        },{
            pattern: "max_length:256",
            error_msg: "选项值长度不超过256个字符"
        }]);
        validator.add(key,[{
            pattern: "is_not_empty",
            error_msg: "配置变量名不能为空"
        },{
            pattern: "min_length:4",
            error_msg: "配置变量名长度最少需要4个字符"
        },{
            pattern: "max_length:24",
            error_msg: "配置变量名长度不超过24个字符"
        }]);
        var error_msg = validator.start();
        return error_msg;
    }

    function _init(config){
        if(config && config.data){
            load_app_config_data(JSON.parse(config.data));
        }
        if(config && config.config_obj){
            $config_obj = config.config_obj;
        }
        $(document).off().on("click","#edit_config",edit_config);
        $(document).on("click","#add_config",show_add_config);
        $(document).on("click","#close_dialog",cancel_add_config);

        $(document).on("click",".del-custom-config",del_custom_config);
        $(document).on("click","#cancel_edit",cancel_edit);
        $(document).on("click",".switch",toggle_switch);
        $(document).on("input propertychange",".config-name",void_repeat_title);

        if(config && config.url){
            $(document).on("click","#save_config,#save_config_v2",{url: config.url},save_config);
        }
    }
    window.application_config = {
        init: _init
    }
})(window);
