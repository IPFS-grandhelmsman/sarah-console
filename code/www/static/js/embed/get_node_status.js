;(function(){
    function get_node_status(target_id,data){
        http_get("/api/node/status?"+data, true,function(msg){
            if(msg.errno == 0){
                if(msg.data.status == 0){
                    $(target_id).html("<em class='state-urgent' data-toggle='tooltip' title='最近硬件统计信息上于：" + format_time(msg.data.updated_at)+ "，超过了两倍interval时间'>故障</em>");
                }else if(msg.data.status == 1){
                    $(target_id).html("<em class='state-normal'>正常</em>");
                }else if(msg.data.status ==2){
                    $(target_id).html("<em class='state-warning'>重启中</em>");
                }
            }
        })
    }
    function format_time(time){
        var date = new Date(time*1000);
        var Y = date.getFullYear();
        var M = date.getMonth() + 1;
        var D = date.getDate();
        var h = date.getHours();
        var m = date.getMinutes();
        var s = date.getSeconds();
        return Y + "/" + M + "/" + D + "&nbsp;&nbsp;" + h + ":" + m + ":" + s;
    }
    function _init(config){
        if(config.target_id && config.v_qstr){
            get_node_status(config.target_id,config.v_qstr);
            setInterval(function(){
                get_node_status(config.target_id,config.v_qstr);
            },7000);
        }
    }
    window.node_status = {
        init: _init
    }
})(window);
