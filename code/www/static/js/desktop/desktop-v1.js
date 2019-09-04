(function(window){
    "use strict";
    /**
      * @params hash_arr 记录浏览器hash值
      * @params hash_pointer 记录当前页面的hash在hash_arr中的位置
      * @params win_page_top,win_page_left:记录上一个弹框的位置,用来确定打开下一个弹框时弹框的显示位置
     *  @params endLeft,endTop: 移动弹框，鼠标松开时弹框的位置left和投票
      */

    var dialogId = 0,MAX_ZINDEX = 1000,iframesOffsetDis = 0;
    var arr = {},pointer = {};
    var win_page_top,win_page_left;

    var endLeft,endTop;
    var hash_arr = [],hash_pointer = -1;

    var hash = window.location.hash;
    var tracker = decodeURIComponent(get_hash_params(hash, "__tracker"));
    if(tracker){
        var app = get_hash_params(tracker,"__app");
        if(app){
            create_page.call($(".win_list[data-app="+ app +"]"),tracker);
        }
    }

    function create_page(reurl){
        var iframesrc,cachesrc;
        if(typeof reurl == "string"){//传递路径
            var href = decodeURIComponent(reurl);
            href = href.replace(/(^\?|&)__sara_iframe_id=[^&]*(&)?/g, function(p0, p1, p2) {
                return p1 === '?' || p2 ? p1 : '';
            });
            var is_exit_hash = href.indexOf("#");
            if(is_exit_hash < 0){
                iframesrc = href + "&__sara_iframe_id=iframe" + dialogId;
            }else{
                var href_start = href.substring(0,is_exit_hash);
                var href_end = href.substring(is_exit_hash);
                iframesrc = href_start + "&__sara_iframe_id=iframe" + dialogId + href_end;
            }
            cachesrc = iframesrc;
        }else{
            iframesrc = $(this).attr("data-src")+'&__sara_iframe_id=iframe'+dialogId;
            cachesrc = $(this).attr("data-cachesrc")+'&__sara_iframe_id=iframe'+dialogId;
        }

        //创建弹窗
        window.cache.open_iframe($(this),dialogId,iframesrc,cachesrc);

        //创建底部菜单栏
        var title = $(this).find(".win-name").html();
        var icon = $(this).attr("data-icon");
        var footer_html =  '<li class="win-footer-li win-footer-li-active" title="'+title+'" data-footerId="'+dialogId+'">';
        if(icon == "img"){
            var imgurl = $(this).find(".win-icon-v2").attr("src");
            footer_html += '<img class="win-footer-img-v2" src="'+imgurl+'"/>';
        }else{
            var pos = $(this).find(".win-icon").css("background-position");
            footer_html += '<div class="win-footer-img box-footer'+dialogId+'"></div>';
        }
        $(".win-footer-li-active").removeClass("win-footer-li-active");
        footer_html += '<div class="win-footer-line"></div>';
        footer_html += '</li>';
        $(".win-footer-list").append(footer_html);
        if(icon != "img"){
            $(".box-footer"+dialogId).css("background-position",pos);
        }

        /**
         * @desc
         * 1、指针永远指向当前页，通过data-touchload来标记触发方式：后退：-1，前进：1，刷新：0；其他：2
         * 2、通过前进后退方式触发onload方法，指针位置变化，但无需在数组中插入元素
         * 3、通过刷新方式触发onload方法，指针位置不变化，且无需再数组中插入元素
         * 4、通过其他方式触发onload方法，在当前指针后插入元素，指针后移，同时删除数组中从当前指针位置开始至数组末尾的元素。
         * @params top_url：记录iframe内上一个路径
         * */
        var iframe_arr = [], top_url = '';
        $("#iframe"+dialogId).load(function(){
            var iframeId = $(this).get(0);
            var href = iframeId.contentWindow.window.location.href;
            arr[$(this).attr("id")] = iframe_arr;
            var touch_load_way = $(this).attr("data-touchload");
            if(touch_load_way == -1){//后退时
                $(this).attr("data-touchload",2);
            }else if(touch_load_way == 0){//刷新，不做任何操作
                $(this).attr("data-touchload",2);
            }else if(touch_load_way == 1){//前进
                $(this).attr("data-touchload",2);
            }else{
                /**
                 * @desc
                 * 其他方式触发时，有两种方式不计入
                 * 1、重新加载
                 * 2、子页面内通过导航栏切换页面，其链接上有__not_record字段
                 */
                var not_record = get_str_params(href,"__not_record");
                if(href != top_url && not_record == null){
                    if(pointer[$(this).attr("id")] == undefined){
                        iframe_arr.push(href);
                        pointer[$(this).attr("id")] = iframe_arr.length - 1;
                    }else{
                        pointer[$(this).attr("id")]++;
                        var len = pointer[$(this).attr("id")];
                        iframe_arr[len] = href;
                        iframe_arr.length = len+1;
                    }
                }
            }
            top_url = href;
            change_desktp_nav($(this).attr("id"));
        });


        //初始化弹框位置
        var win_top = win_page_top || '50%';
        var win_left = win_page_left || '50%';
        var initWinPageW = $(window).width()*0.8;
        var initWinPageH = $(window).height()*0.8;
        $("[data-dialogId="+dialogId+"]").css({
            "top": win_top + 'px',
            "left": win_left + 'px',
            "width": initWinPageW + "px",
            "height": initWinPageH + "px",
            "margin-left":(-initWinPageW/2+iframesOffsetDis) + "px",
            "margin-top":(-initWinPageH/2+iframesOffsetDis) + "px",
            "z-index":MAX_ZINDEX
        });
        //每次创建弹窗后偏移上一个iframe的距离
        if(iframesOffsetDis<(initWinPageH-50)){
            iframesOffsetDis += 40;
        }else{
            iframesOffsetDis = 0;
        }
        dialogId++;
        MAX_ZINDEX++;
        return "iframe"+dialogId;
    }

    function close_win(){
        var href = window.location.href;
        var index = href.indexOf("#");
        if(index > -1){
            var iframe_id = $(this).parents(".win-page").find(".win-page-src").attr("id");
            (function () {
                var i = hash_arr.length;
                while(i--){
                    var sara_iframe_id = get_hash_params(decodeURIComponent(hash_arr[i]),"__sara_iframe_id");
                    if(sara_iframe_id == iframe_id){
                        hash_arr.splice(i,1);
                    }
                }
            })();
            hash_pointer = hash_arr.length - 1;
            if(hash_arr.length > 0 && hash_arr[hash_pointer]){
                window.location.href = href.substring(0,index) + hash_arr[hash_pointer];
            }else{
                window.location.href = href.substring(0,index) + "#";
            }
        }
        var parentObj = $(this).parents(".win-page");
        var dialogId1 = $(parentObj).attr("data-dialogid");
        $(parentObj).remove();
        $(".win-footer-li[data-footerid="+dialogId1+"]").remove();
        if($(".win-page").length == 0){
            dialogId = 0;
        }
        delete arr['iframe'+dialogId1];
        delete pointer['iframe'+dialogId1];
    }

    //窗口最大化
    function max_win(){
        var $self = ($(this).attr("class").indexOf("win-title-max") > -1) ? $(this) : $(this).find(".win-title-max");
        var size = $self.attr("data-winsize");
        if(size == 0){
            var winH = $(window).height()-50;
            var winW = $(window).width();
            $self.css("background-position","-152px -78px");
            $self.parents(".win-page").css({
                "top":0,
                "left":0,
                "width": winW+"px",
                "height": winH+"px",
                "margin-left":0,
                "margin-top":0
            });
            $self.attr("data-winsize",1).removeClass("iconquanping").addClass("iconsuofang");
        }else{
            var winPageW = $(window).width()*0.8,winPageH = $(window).height()*0.8;
            $self.css("background-position","-127px -78px");
            $self.parents(".win-page").css({
                "top":"50%",
                "left":"50%",
                "width": winPageW+"px",
                "height": winPageH+"px",
                "margin-left":(-winPageW/2)+"px",
                "margin-top":(-winPageH/2)+"px"
            });
            $self.attr("data-winsize",0).removeClass("iconsuofang").addClass("iconquanping");
        }
    }

    function min_win(){
        event.stopPropagation();
        var parentObj = $(this).parents(".win-page");
        var footerId = $(parentObj).attr("data-dialogid");
        $(parentObj).hide();
        $(".win-footer-li[data-footerid="+footerId+"]").removeClass("win-footer-li-active");
    }

    //打开最小化的窗口
    function open_page(){
        var dialogId1 = $(this).attr("data-footerid");
        set_max_zIndex.call($(".win-page[data-dialogid="+dialogId1+"]"));
        $(".win-page[data-dialogid="+dialogId1+"]").show();
        $(".win-footer-li-active").removeClass("win-footer-li-active");
        $(this).addClass("win-footer-li-active");
        MAX_ZINDEX++;
    }

    function set_max_zIndex(){
        if($(this).css("z-index") == MAX_ZINDEX){
            return false;
        }
        MAX_ZINDEX++;
        $(this).css("z-index",MAX_ZINDEX);
        var iframeId = $(this).find(".win-page-src").attr("id");
        set_window_hash(iframeId);
    }

    //页面有多个iframe弹框，点击iframe切换MAX_INDEX时同时将window.location.hash设为当前iframe弹框的路径
    function set_window_hash(iframeId){
        var iframe = document.getElementById(iframeId);
        if(iframe){
            var href = encodeURIComponent(iframe.contentWindow.window.location.href);
            var hash = "#__tracker="+href;
            var index = hash_arr.indexOf(hash);
            if(index > -1){
                hash_arr.splice(index,1);
                hash_arr.push(hash);
                hash_pointer = hash_arr.length - 1;
                var href = window.location.href;
                var start_index = href.indexOf("#");
                window.location.href = href.substring(0,start_index) + hash_arr[hash_pointer];
            }
        }
    }

    /**
     * @desc 移动弹框方法
     * @method mousedown_move: 鼠标按下时的方法
     * @method mouseup_move: 鼠标松开时的方法
     * */
    function mousedown_move(event){
        var e = event || window.event;
        e.stopPropagation();
        var $moveObj = $(this).parents(".win-page");
        $moveObj.css("z-index",MAX_ZINDEX);
        MAX_ZINDEX++;
        var limitTop = $moveObj.css("margin-top").slice(0,-2);
        var limitLeft = $moveObj.css("margin-left").slice(0,-2);
        var startX = e.pageX;
        var startY = e.pageY;
        var initTop = $moveObj.position().top;
        var initLeft = $moveObj.position().left;
        $(".cover-iframe").show();
        $(document).mousemove(function(e) {
            e.stopPropagation();
            endTop = initTop + e.pageY - startY;
            endLeft = initLeft + e.pageX - startX;
            limit_iframe_move($moveObj,limitTop,limitLeft);
            $moveObj.css({
                'top'  : endTop + 'px',
                'left' : endLeft + 'px'
            });
            //清除拖动鼠标的时候选择文本
            window.getSelection ? window.getSelection().removeAllRanges():document.selection.empty();
        });
    }
    function mouseup_move(){
        var $moveObj = $(this).parents(".win-page");
        win_page_left = $moveObj.position().left;
        win_page_top = $moveObj.position().top;
        $(document).unbind('mousemove');
        $(".cover-iframe").hide();
    }
    //limit dialog move distant
    function limit_iframe_move($obj,limitTop,limitLeft){
        if(endLeft<=Math.abs(limitLeft) - $obj.width() + 50){
            endLeft = Math.abs(limitLeft) - $obj.width() + 50;
        }
        if(limitTop <0){
            if(endTop <= Math.abs(limitTop)){
                endTop = Math.abs(limitTop);
            }
        }else{
            if(-endTop >= limitTop){
                endTop = -limitTop;
            }
        }

        if(endLeft >= ($(window).width() + Math.abs(limitLeft) - 50)){
            endLeft = $(window).width() -50 + Math.abs(limitLeft);
        }
        if(endTop >= ($(window).height() -limitTop -50)){
            endTop = $(window).height() - 50 -limitTop;
        }
    }

    //scale dialog
    function scale_dialog(obj,parentObj,proxyObj,direction){
        $(proxyObj).on("mousedown",obj,function(e){
            var moveObj = $(this).parents(parentObj);
            $(moveObj).css("z-index",MAX_ZINDEX);
            MAX_ZINDEX++;
            var offsetLeft = e.pageX - $(moveObj).position().left;
            var offsetTop = e.pageY - $(moveObj).position().top;
            var initHeight = $(moveObj).height();
            var initWidth = $(moveObj).width();
            var startY = e.pageY;
            var startX = e.pageX;
            var windowW = $(window).width();
            var windowH = $(window).height();
            $(".cover-iframe").show();
            $(document).mousemove(function(e) {
                //清除拖动鼠标的时候选择文本
                window.getSelection ? window.getSelection().removeAllRanges():document.selection.empty();
                if(direction=="left"){
                    var pageX = e.pageX;
                    if(e.pageX<=1){
                        pageX = 1;
                        $(document).unbind('mousemove');
                        $(".cover-iframe").hide();
                    }
                    $(moveObj).css({
                        'left'  : pageX-offsetLeft + 'px',
                        'width' : initWidth-e.pageX+startX + 'px'
                    });
                    return false;
                }
                if(direction=="right"){
                    var pageX = e.pageX;
                    if(e.pageX>=(windowW-1)){
                        pageX = windowW-1;
                        $(document).unbind('mousemove');
                        $(".cover-iframe").hide();
                    }
                    $(moveObj).css({
                        'width' : pageX-startX+initWidth+ 'px'
                    });
                    return false;
                }
                if(direction=="top"){
                    var pageY = e.pageY;
                    if(e.pageY<=1){
                        pageY = 1;
                        $(document).unbind('mousemove');
                        $(".cover-iframe").hide();
                    }
                    $(moveObj).css({
                        'top'  : pageY-offsetTop + 'px',
                        'height' : initHeight-e.pageY+startY + 'px'
                    });
                    return false;
                }
                if(direction=="bottom"){
                    var pageY = e.pageY;
                    if(e.pageY>=(windowH-46)){
                        pageY = windowH-46;
                        $(document).unbind('mousemove');
                        $(".cover-iframe").hide();
                    }
                    $(moveObj).css('height',initHeight+pageY-startY + 'px');
                    return false;
                }
            });
            $(document).on("mouseup",obj,function(e){
                $(document).unbind('mousemove');
                $(".cover-iframe").hide();
            });
        });
    }

    //full screen
    function fullScreen(){
        var desktop = document.getElementById("desktop");
        if(!isFullScreen()){
            $("#full_screen").find(".win-name").html('退出全屏');
            if(desktop.requestFullscreen){
                return desktop.requestFullscreen();
            }else if(desktop.webkitRequestFullScreen){
                return desktop.webkitRequestFullScreen();
            }else if(desktop.mozRequestFullScreen){
                return desktop.mozRequestFullScreen();
            }else{
                return desktop.msRequestFullscreen();
            }
        }else{
            $("#full_screen").find(".win-name").html('全屏显示');
            if (document.exitFullscreen) {
                return document.exitFullscreen();
            }
            else if (document.mozCancelFullScreen) {
                return document.mozCancelFullScreen();
            }
            else if (document.webkitCancelFullScreen) {
                return document.webkitCancelFullScreen();
            }
            else if (document.msExitFullscreen) {
                return document.msExitFullscreen();
            }
        }
    }

    function isFullScreen(){
        return document.fullscreenElement || document.webkitFullscreenElement || document.msFullscreenElement || document.mozFullScreenElement;
    }

    function  toggle_start_dialog(event){
        event.stopPropagation();
        if(event.data.params){
            var params = event.data.params;
            if($(params).is(":visible")){
                $(params).fadeOut();
            }else{
                $(params).fadeIn();
            }
        }
    }

    //判断前进后退按钮颜色
    function change_desktp_nav(iframeId){
        if(pointer[iframeId] <= 0 || pointer[iframeId] == undefined){
            $("#"+iframeId).parents(".win-page").find(".desktop-iframe-back").css("color","#C7D2DC");
        }
        if(pointer[iframeId] >= arr[iframeId].length-1 || pointer[iframeId] == undefined){
            $("#"+iframeId).parents(".win-page").find(".desktop-iframe-forward").css("color","#C7D2DC");
        }
    }

    //移动桌面图标
    /*
    * target_desktop_icon: 鼠标点击的当前win_list元素
    * create_icon: 鼠标移动过程中创建图标，用来标记只创建一次
    * start_icon_left：初始图标的left
    * start_icon_top：初始图标的top
    * start_mouse_x：鼠标点击的初始x位置
    * start_mouse_y：鼠标点击的初始y位置
    * */
    function move_desktop_icon(){
        var target_desktop_icon,start_icon_left,start_icon_top,start_mouse_x,start_mouse_y,create_icon;
        $(".win_list,.win_list_2").on("mousedown",function(e){
            target_desktop_icon = this;
            create_icon = false;
            var win_icon_offset = $(target_desktop_icon).find(".move-icon").offset();
            start_icon_left = win_icon_offset.left;
            start_icon_top = win_icon_offset.top;
            start_mouse_x =e.pageX;
            start_mouse_y =e.pageY;
            $(document).on("mousemove",function(e){
                window.getSelection ? window.getSelection().removeAllRanges():document.selection.empty();
                var move_mouse_x = e.pageX;
                var move_mouse_y = e.pageY;
                var mouse_distance_x = move_mouse_x - start_mouse_x;
                var mouse_distance_y = move_mouse_y - start_mouse_y;
                var move_icon_left = start_icon_left + mouse_distance_x;
                var move_icon_top = start_icon_top + mouse_distance_y;
                //鼠标移动时添加图标,移动距离大于10像素的时候才创建鼠标图标
                if(!create_icon && (mouse_distance_x > 20 || mouse_distance_y > 20)){
                    $(target_desktop_icon).find(".win-list-div").css({"background-color": "rgba(255,255,255,0.1)","border": "1px solid rgba(255, 255, 255, 0.3)"});
                    var html = $(target_desktop_icon).find(".win-list-div").html();
                    $("body").append("<div class='temporary-desktop-icon'></div>");
                    $(".temporary-desktop-icon").html(html);
                    $(".temporary-desktop-icon").css({"top": start_icon_top+"px", "left": start_icon_left+"px"});
                    create_icon = true;
                }
                //创建的图标跟随鼠标移动
                $(".temporary-desktop-icon").css({"left": move_icon_left+"px", "top": move_icon_top+"px"});
            }).on("mouseup",function(e){
                var end_mouse_x = e.pageX;
                var end_mouse_y = e.pageY;
                var move_distance_x = Math.abs(e.pageX - start_mouse_x);
                var move_distance_y = Math.abs(e.pageY - start_mouse_y);
                if(move_distance_x > 10 && move_distance_y > 10){
                    drop_desktop_icon(target_desktop_icon,end_mouse_x,end_mouse_y);
                }
                $(target_desktop_icon).find(".win-list-div").css({"background-color": "transparent","border": "1px solid rgba(0,0,0,0)"});
                $(".temporary-desktop-icon").remove();
                $(document).unbind('mousemove');
                target_desktop_icon = null;
                create_icon = null;
                start_icon_left = null;
                start_icon_top = null;
                start_mouse_x = null;
                start_mouse_y = null;
            })
        });
    }

    function drop_desktop_icon(target,coordinate_x,coordinate_y){
        var grid_num_x = Math.floor(coordinate_x/100);
        var grid_num_y = Math.floor(coordinate_y/100);
        var target_left = grid_num_x * 100 + 10;
        var target_top = grid_num_y * 100 + 10;
        var drop = false;
        //判断当前位置是否已经存在桌面图标
        $(".win_list").each(function(){
           var icon_left = $(this).offset().left;
           var icon_top = $(this).offset().top;
           if(icon_left == target_left && icon_top == target_top){
               drop = true;
           }
        });
        if(!drop){
            $(target).css({
                "position": "fixed",
                "left": target_left + "px",
                "top": target_top + "px"
            });
        }

    }

    //阻止默认双击事件
    function prevent_dblclick(event){
        return false;
    }

    function _init_event(){
        //点击用户名
        $("#user_info").on("click",function(){
            return $(".win-start-dialog").hide();
        });
        //开始菜单出用户设置点击事件
        $("#user_profile").on("click",function(){
            $(".win-start-dialog").hide();
            return $(".win_list[data-app='user']").dblclick();
        });
        //iframe页面后退前进，刷新
        //刷新按钮
        $(".win-body").on("click",".desktop-iframe-refresh",function(){
            var iframeId = $(this).parents(".win-page").find(".win-page-src").attr("id");
            document.getElementById(iframeId).contentWindow.window.location.reload();
            $("#"+iframeId).attr("data-touchload",0);

        });
        //后退按钮
        $(".win-body").on("click",".desktop-iframe-back",function(){
            var iframeId = $(this).parents(".win-page").find(".win-page-src").attr("id");
            if(pointer[iframeId] <= 0){return false;}
            pointer[iframeId]--;
            var len = pointer[iframeId];
            var src = arr[iframeId][len];
            $("#"+iframeId).attr({
                "src": src,
                "data-touchload":-1
            });
        });
        //前进按钮
        $(".win-body").on("click",".desktop-iframe-forward",function(){
            var iframeId = $(this).parents(".win-page").find(".win-page-src").attr("id");
            if(pointer[iframeId] >= arr[iframeId].length-1){
                return false;
            }
            pointer[iframeId]++;
            var len = pointer[iframeId];
            var src = arr[iframeId][len];
            $("#"+iframeId).attr({
                "src": src,
                "data-touchload":1
            });
        });

        //监听桌面是否刷新
        $(window).on("load",function(){
            var href = window.location.href;
            var hash = get_hash_params(href,"__tracker");
            if(hash){
                var str = "#__tracker="+hash;
                hash_arr.push(str);
                hash_pointer = hash_arr.length - 1;
            };
        });

        //干掉原生的拖拽事件,避免onmouseup不触发
        document.ondragstart = function(ev) {
            ev.preventDefault();
        };
        document.ondragend = function(ev) {
            ev.preventDefault();
        };

        /*记录hash变化*/
        window.onhashchange=function () {/*hash值改变事件*/
            var hash = window.location.hash;
            var index = hash_arr.indexOf(hash);
            if(index < 0){
                hash_arr.push(hash);
                hash_pointer++;
            }else{
                hash_pointer = index;
            }
        };
    }

    function _init(){
        $(".win-body").unbind().on("dblclick",".win_list",create_page);
        $("#full_screen").on("dblclick",fullScreen);
        $(".win-body").on("click",".win-title-close",close_win);
        $(".win-body").on("click",".win-title-max",max_win);
        $(".win-body").on("dblclick",".win-page-title",max_win);
        $(".win-body").on("click",".win-title-min",min_win);
        $(".win-body").on("click",".win-page",set_max_zIndex);
        $(".win-body").on("click",function(){
            $(".win-start-dialog").fadeOut();
        });
        $("#win_start").on("click",{params: ".win-start-dialog"},toggle_start_dialog);
        $(".win-footer-list").on("click",".win-footer-li",open_page);
        $(".win-body").on("mousedown",".win-page-title",mousedown_move);
        $(".win-body").on("mouseup",".win-page-title",mouseup_move);
        _init_event();

        scale_dialog(".resize-top",".win-page",".win-body","top");
        scale_dialog(".resize-left",".win-page",".win-body","left");
        scale_dialog(".resize-right",".win-page",".win-body","right");
        scale_dialog(".resize-bottom",".win-page",".win-body","bottom");
        $(".win-body").on("dblclick",".win-title-name,.win-title-img",prevent_dblclick);

        move_desktop_icon();
    }

    window.sarahWin = {
        init: _init,
        hash_arr: hash_arr,
        create_page:create_page,
        setMaxZindex:set_max_zIndex
    }
})(window);
