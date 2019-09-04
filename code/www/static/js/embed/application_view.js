;(function(window){
    function remove_app(){
        var appName = $("#app_name").html();
        var vqstr = $("#app_name").attr("data-vqstr");
        var $app = $(".custom-app[data-app='"+appName+"']",parent.document);
        http_get("/api/application/remove?" + vqstr, true, function(msg){
           if(msg.errno == 0){
               $app.remove();
               alertMsg("#toast_success","移除成功！");
               setTimeout(function(){
                   window.location.reload();
               },1000);
           }
        },function(error){
            console.log(error);
        });
    }

    function add_app(){
        var appName = $("#app_name").html();
        var vqstr = $("#app_name").attr("data-vqstr");
        var imgUrl = $("#app_logo").attr("src");
        http_get("/api/application/add?" + vqstr, true,function(msg){
            if(msg.errno == '0'){
                var appVqstr = msg.data.data.v_qstr;
                var htmls = ' <li class="win_list custom-app" data-src="/application/node/?'+appVqstr+'&__skin=embed&__app='+appName+'" title="双击打开'+appName+'" data-app="'+appName+'" data-icon="img">';
                htmls += ' <div class="win-list-div">';
                htmls += '<img class="win-icon-v2 move-icon" src="'+imgUrl+'" alt="'+appName+'">';
                htmls += ' <div class="win-name">'+appName+'</div>';
                htmls += '</div></li>';
                $(".custom-app",parent.document).last().after(htmls);
                alertMsg("#toast_success","添加成功！");
                setTimeout(function(){
                    window.location.reload();
                },1000);
            }else{
                alertMsg("#toast_error",msg.data);
            }
        },function(error){
            console.log(error);
        });
    }

    function open_app(){
        var appName = $("#app_name").html();
        var $obj = $(".custom-app[data-app='"+appName+"']",parent.document);
        parent.sarahWin.create_page.call($obj);
        return false;//阻止点击打开按钮触发让当前页z-index最大
    }

    function _init(){
        $("#remove_app").on("click",remove_app);
        $("#open_app").on("click",open_app);
        $("#add_app").on("click",add_app);
    }
    _init();
})(window);
