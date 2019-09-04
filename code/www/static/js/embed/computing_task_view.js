;(function(){
    "use strict";
    var progress,progress_complete,task_complete_percent = 0;
    function load_task_process(){
        var progress_length = $(progress).width();
        $(progress_complete).width(progress_length*task_complete_percent);
    }

    function reboot(){
        var status = $(this).attr("data-status");
        if(status != 2){
            return;
        }else{
            //调用api

        }
    }

    function _init(config){
        if(config && config.reboot){
            $(config.reboot).on("click",reboot);
        }
        if(config && config.task_complete_percent && config.progress && config.progress_complete){
            task_complete_percent = config.task_complete_percent;
            progress = config.progress;
            progress_complete = config.progress_complete;
            load_task_process();
        }
        $(".manage_node").on("click",window.table_select.showMoreOption);
        $(".option").on("mouseleave",window.table_select.hideMoreOption);
        $(document).on("click",window.table_select.hideMoreOption);

        $(".node-uid").on("click",window.link.open_new_iframe);
    }
    window.task_view = {
        init: _init
    }
})(window);
