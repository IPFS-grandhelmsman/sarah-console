;(function(window){
    "use strict";

    function update_node_name () {
        var isreadonly = $(".table-name-input").attr("readonly");
        if(isreadonly){
            //设置仅当前行可以操作的样式
            var $rows = $(this).parents(".table-row");
            $rows.addClass("table-row-focus");
            $(".table-row").not($rows).addClass("table-row-blur");

            var $input = $(this).siblings(".table-name-input");
            var val = $input.val();
            $input.removeAttr("readonly").addClass("input-can-edit");
            $input.val("").focus().val(val);//设置input框中光标在文字后面
            $(this).hide();
        }
    }

    function save_node_name () {
        var $this = $(this);
        var name = $this.val();
        var pre_name = $this.attr("data-value");
        if (pre_name == name) {
            set_input_readable($this);
        } else {
            var vqstr = $this.parents(".table-node-name").attr("data-vqstr");
            http_post("/api/node/edit?" + vqstr,{name: name}, function (msg) {
                if (msg.errno == "0") {
                    alertMsg("#toast_success", "修改成功！");
                    $this.attr("data-value",name);
                    set_input_readable($this);
                } else {
                    alertMsg("#toast_error", msg.data);
                }
            }, function (error) {
                console.log(error);
            });
        }
        var $rows = $(this).parents(".table-row");
        $rows.removeClass("table-row-focus");
        $(".table-row").not($rows).removeClass("table-row-blur");
    }

    function set_input_readable (obj) {
        var $obj = obj;
        $obj.attr("readonly", "true").removeClass("input-can-edit");

        var ishover = $obj.parents(".table-row").is(":hover");
        if (ishover) {
            $obj.siblings(".table-name-edit").show();
        } else {
            $obj.siblings(".table-name-edit").hide();
        }
    }


    function show_edit_btn () {
        var isreadonly = $(this).find(".table-name-input").attr("readonly");
        if (isreadonly) {
            $(this).find(".table-name-edit").show();
        }
    }

    function hide_edit_btn () {
        $(this).find(".table-name-edit").hide()
    }

    //回车键
    function watch_enter_key (event) {
        var e = event || window.event;


        if (e.keyCode == 13 && $("#term_dialog").is(":hidden")) {
            save_node_name.apply($(document.activeElement));
        }
    }

    function _init(){
        $(".node-uid").on("click", window.link.open_new_iframe);
        $(".more-option").on("click", window.table_select.showMoreOption);
        $(".option").on("mouseleave", window.table_select.hideMoreOption);
        $(document).on("click", window.table_select.hideMoreOption);

        $(".table-name-edit").on("click", update_node_name);
        $(".table-name-input").on("blur", save_node_name);
        $(".table-node-name").hover(show_edit_btn,hide_edit_btn);
        $(document).on("keydown",watch_enter_key);
    }
    window.nodeList = {
        init: _init
    }
})(window);
