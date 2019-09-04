(function(){
    "use strict";

    function mark_dealed(){
        var id = $(this).attr("data-id");
        http_get("/api/alert/admin/markRead?id="+id, true,function(msg){
            if(msg.errno == 0){
                alertMsg("#toast_success","标记成功！");
                setTimeout(function(){
                    window.location.reload();
                },1000);
            }
        },function(error){
            console.log(error);
        })
    }

    function reload(){
        window.location.reload();
    }

    function _init(config){
        if(config && config.mark_dealed){
            $(config.mark_dealed).on("click",mark_dealed);
        }
        if(config && config.mark_undeal){
            $(config.mark_undeal).on("click",mark_undeal);
        }
        $(".all-check").on("click",{allnode: ".all-check",singlenode: ".single-check"},allCheck);
        $(".single-check").on("click",{allnode: ".all-check",singlenode: ".single-check"},singleCheck);
        $("#reload").on("click",reload);
        $(".node-uid").on("click",window.link.open_new_iframe);
    }
    window.alert_list = {
        init: _init
    }
})(window);
