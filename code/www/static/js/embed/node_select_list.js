;(function(){
    "use strict";
    var cursor = "", pull_data = true;
    function load_define_node(){
        if (pull_data == true) {
            http_get("/api/node/list?cursor=" + cursor, false,function (msg) {
                var html = "";
                if (cursor === msg.data.n_cursor && pull_data) {
                    html = "<div class='text-center state-grey' style='line-height: 54px;'>—— 我是有底线的 ——</div>";
                    pull_data = false;
                } else {
                    var ps_list_tpl = $("#node_list_tpl").html();
                    var html = JTE.clear().assign("node",msg.data.data).execute(ps_list_tpl,"ps_list");
                    cursor = msg.data.n_cursor;
                }
                $("#all_node_list").append(html);
            }, function (error) {
                console.log(error);
            });
        }
    }

    function load_new_data(){
        var $this =$(this),
            viewH =$this.height(),//可见高度
            contentH =$(window).height(),//内容高度
            scrollTop =$this.scrollTop();//滚动高度
        if(viewH - contentH - scrollTop < 5 && pull_data) {

            load_define_node();
        }
    }

    function _init() {
        $(document).on("click", ".all-select-check", {allnode: ".all-select-check",singlenode: ".single-select-check"},allCheck);
        $(document).on("click", ".single-select-check", {allnode: ".all-select-check",singlenode: ".single-select-check"},singleCheck);
        $(document).on("mousewheel DOMMouseScroll",load_new_data);

    }
    window.node_select_list = {
        init: _init,
        load_define_node: load_define_node
    }
})(window);
