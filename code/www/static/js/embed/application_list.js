;(function(window){
    "use strict";
    function operateApp(){
        var $this = $(this);
        var status = $this.attr("data-status");
        var vqstr = $this.parent().attr("data-vqstr");
        var appName = $this.siblings(".name").html();
        var imgUrl = $this.siblings(".img").attr("src");
        if(status == "0"){//添加
            http_get("/api/application/add?" + vqstr, true,function(msg){
                if(msg.errno == '0'){
                    var appVqstr = msg.data.data.v_qstr;
                    var htmls = "";
                    htmls = ' <li class="win_list custom-app" data-src="/application/node/?'+appVqstr+'&__skin=embed&__app='+appName+'" title="双击打开'+appName+'" data-app="'+appName+'" data-icon="img">';
                    htmls += ' <div class="win-list-div">';
                    htmls += '<img class="win-icon-v2 move-icon" src="'+imgUrl+'" alt="'+appName+'">';
                    htmls += ' <div class="win-name">'+appName+'</div>';
                    htmls += '</div></li>';
                    $(".custom-app",parent.document).last().after(htmls);
                    $this.attr("data-status","1").html("打开");
                    alertMsg("#toast_success","添加成功！");
                }else{
                    alertMsg("#toast_error",msg.data);
                }
            },function(error){
                console.log(error);
            });
        }else if(status == "1"){//打开
            var $obj = $(".custom-app[data-app='"+appName+"']",parent.document);
            parent.sarahWin.create_page.call($obj);
            return false;//阻止点击打开按钮触发让当前页z-index最大
        }
    }
    function _init(){
        $(".operate-app").on("click",operateApp);
    }
    _init();
})(window);
