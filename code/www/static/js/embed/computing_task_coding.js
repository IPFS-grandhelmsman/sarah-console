;(function(){
    var v_qstr, engine = "lua", editable,editor_lua,editor_bash;
    function init_edit(editor_id,lang){
        var editor = ace.edit(editor_id);
        editor.setTheme("ace/theme/monokai");
        editor.session.setMode("ace/mode/"+lang);
        editor.setOption("wrap", "free");//自动换行
        //启用提示菜单
        editor.setOptions({
            autoScrollEditorIntoView: true,
            enableBasicAutocompletion: true,
            enableSnippets: true,
            enableLiveAutocompletion: true
        });
        if(!editable){
            editor.setReadOnly(true);
        }
        setCompleteData(window.codeTips.data);

        return editor;
    }

    function setCompleteData (data) {
        var langTools = ace.require("ace/ext/language_tools");
        langTools.addCompleter({
            getCompletions: function(editor, session, pos, prefix, callback) {
                if (prefix.length === 0) {
                    return callback(null, []);
                } else {
                    return callback(null, data);
                }
            }
        });
    }

    function showMoreOption(event){
        event.stopPropagation();
        var $option = $(this).siblings(".option");
        if($option.is(":hidden")){
            $option.show();
        }else{
            $option.hide();
        }
    }

    function hideMoreOption(){
        $(".option").hide();
    }

    function switch_lang(event){
        var $that = $(this);
        var lang = $that.html();
        if(lang == "lua") {
            $("#lua_doc").removeClass("sarah-hide");
        } else {
            $("#lua_doc").addClass("sarah-hide");
        }
        $that.parents(".select-ul").css("max-height","0");
        $that.parents(".select-btn").find(".choose-lang").attr("data-status","hide");
        $that.parents(".select-btn").find(".select-title-text").html(lang);
        setTimeout(function(){
            $(".ace_editor").hide();
            var editor_id = get_editor_id(lang);
            $(editor_id).show();
            engine = $that.attr("data-engine");
        },300);
    }

    function add_font_size(){
        var size = parseInt($("#editor_font_size").text());
        if(size >= 24){
            return;
        }
        size = size + 2;
        $("#editor_font_size").text(size);
        $(".ace_editor").css("font-size",size);
    }

    function reduce_font_size(){
        var size = parseInt($("#editor_font_size").text());
        if(size <= 12){
            return;
        }
        size = size -2;
        $("#editor_font_size").text(size);
        $(".ace_editor").css("font-size",size);
    }

    function add_line_height(){
        var line = parseFloat($("#editor_line_height").text());
        if(line >= 2.0){
            return;
        }
        line = float_add(line,0.2);
        $("#editor_line_height").text(line);
        $(".ace_editor").css("line-height",line);
    }

    function reduce_line_height(){
        var line = parseFloat($("#editor_line_height").text());
        if(line <= 0.8){
            return;
        }
        line = float_reduce(line,0.2);
        $("#editor_line_height").text(line);
        $(".ace_editor").css("line-height",line);
    }

    function saveCode(){
        var data = {};
        data.engine = engine;
        if(engine == "lua"){
            data.logic_code = editor_lua.session.getValue();
        }else if(engine == "bash"){
            data.logic_code = editor_bash.session.getValue();
        }
        http_post("/api/computing/task/edit?" + v_qstr,data,function(msg){
            if(msg.errno==0){
                alertMsg("#toast_success","保存成功");
            }else{
                alertMsg("#toast_error",msg.data);
            }
        },function(error){
            console.log(error)
        });
    }

    function get_editor_id(lang){
        if(lang == "lua"){
            return "#editor_lua";
        }
        if(lang == "bash"){
            return "#editor_bash";
        }
    }

    function _init(config){
        editable = config.editable;
        editor_lua = init_edit("editor_lua","lua");
        editor_bash = init_edit("editor_bash","powershell");
        if(config && config.editor_lang){
            $(config.editor_lang).on("click",".item",switch_lang);
        }
        if(config && config.save_code){
            $(config.save_code).on("click",saveCode);
        }
        if(config && config.v_qstr){
            v_qstr = config.v_qstr;
        }
        if(config && config.engine){
            engine = config.engine;
            $("#switch_"+ engine).click();
        }
        if(config && config.add_font_size){
            $(config.add_font_size).on("click",add_font_size)
        }
        if(config && config.reduce_font_size){
            $(config.reduce_font_size).on("click",reduce_font_size)
        }
        if(config && config.add_line_height){
            $(config.add_line_height).on("click",add_line_height)
        }
        if(config && config.reduce_line_height){
            $(config.reduce_line_height).on("click",reduce_line_height)
        }
        $(".choose-lang").on("click",showMoreOption);
        $(".option").on("mouseleave",hideMoreOption);
        $(document).on("click",hideMoreOption);

    }

    window.taskcode = {
        init: _init
    }
})(window);
