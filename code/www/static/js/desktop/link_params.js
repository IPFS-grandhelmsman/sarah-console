;(function(){
    "use strict";
    var title = document.title;


    if(top.location != self.location){
        set_parent_maxindex();
        change_parent_hash();
        split_params();
        set_desktop_title(title);
        set_nav_not_record();
    }

    function get_link_string(name){
        var reg=new RegExp('[?&]'+name+'=([^&#]+)');
        var query=window.location.href.match(reg);
        return query?query[1]:null;
    }

    function get_link_hash(name){
        var reg=new RegExp('[#&]'+name+'=([^&#]+)');
        var query=window.location.href.match(reg);
        return query?query[1]:null;
    }

    function get_parent_hash(url,name){
        var reg=new RegExp('[#&]'+name+'=([^&#]+)');
        var query=url.match(reg);
        return query?query[1]:null;
    }
    //替换hash值
    function replace_param(str,paramName,replaceWith) {
        var oUrl = str;
        var re=eval('/('+ paramName+'=)([^&]*)/gi');
        var nUrl = oUrl.replace(re,paramName+'='+replaceWith);
        return nUrl;
    }

    //设置桌面版页面title
    function set_desktop_title(title){
        var iframeId = get_link_string("__sara_iframe_id");
        if(iframeId){
            $("#"+iframeId, parent.document)
                .parents(".win-page")
                .find(".win-title-name")
                .html('<div>\n' +
                    '      <span class="iconfont iconfanhui desktop-iframe-back"></span>\n' +
                    '      <span class="iconfont iconqianjin desktop-iframe-forward"></span>\n' +
                    '      <span class="iconfont iconshuaxin desktop-iframe-refresh"></span>\n' +
                    '      <span>'+title+'</span>\n' +
                    '  </div>');
        }
    }

    //点击iframe让当前窗口显示在最顶部
    function set_parent_maxindex(){
        var iframeId =get_link_string("__sara_iframe_id");
        $(window).on("click",function(){
            var $parent = $("#"+iframeId,parent.document).parents(".win-page");
            parent.sarahWin.setMaxZindex.call($parent);
        })
    }

    //提取子页面所有链接带‘__’参数
    function split_params(){
        var iframeId = get_link_string("__sara_iframe_id");
        if(iframeId){
            var app = $("#"+iframeId,parent.document).attr("data-app");
            $("a").each(function(){
                var link = $(this).attr("data-link");
                if (link == "normal") {
                    return false;
                }
                var href = $(this).attr("href");
                if(href){
                    var start_index = href.indexOf("?");
                    var href_start = href.substring(0,start_index);
                    var end_index = href.indexOf("#");
                    /**
                    * @params 记录href中? - #中的参数
                    * @href_end 记录href中#后的参数
                    * */
                    var params = "",href_end;
                    if(end_index > -1){
                        params = href.substring((start_index + 1),end_index);
                        href_end = href.substring(end_index,href.length)
                    }else{
                        params = href.substring((start_index + 1),href.length);
                        href_end = "";
                    }
                    var params_arr = params.split("&");
                    var params_str1 = "";//拼接带'__'参数
                    var params_str2 = "";//拼接不带'__'参数
                    params_arr.forEach(function(value){
                        if(value.startsWith("__")){
                            params_str1 = params_str1 + "&" + value;
                        }else{
                            if(!params_str2){
                                params_str2 = params_str2 + value;
                            }else{
                                params_str2 = params_str2 + "&" + value;
                            }
                        }
                    });
                    var newurl = href_start + "?" + params_str2 + params_str1 + "&__sara_iframe_id="+ iframeId + "&__app="+ app + href_end;
                    $(this).attr("href",newurl);
                }
            });
        }

    }

    //设置父窗口的hash值为当前子页面的路径，父窗口刷新时通过获取hash值来打开相应的子页面
    function change_parent_hash(){
        var parent_href = window.parent.location.href;
        var iframeId = get_link_string("__sara_iframe_id");
        if(iframeId){
            var __tracker = get_parent_hash(parent_href,"__tracker");
            var tracker = encodeURIComponent(window.location.href);
            if(__tracker){
                window.parent.location.href = replace_param(parent_href,"__tracker",tracker);
            }else if(parent_href.indexOf("#") > -1){
                window.parent.location.href = parent_href + "&__tracker=" + tracker;
            }else{
                window.parent.location.href = parent_href + "#__tracker=" + tracker;
            }
        }
    }

    function set_nav_not_record(){
        $("nav a.link").each(function(){
            var href = $(this).attr("href");
            if(href){
                var index = href.indexOf("#");
                var new_href = "";
                var insert_index = href.indexOf("?");
                if(index < 0){
                    new_href = href + "&__not_record=1";
                }else{
                    var insert_index = href.indexOf("#");
                    var forward_src = href.substring(0,insert_index);
                    var back_src = href.substring(insert_index);
                    new_href = forward_src + "&__not_record=1"+back_src;
                }
                $(this).attr("href",new_href);
            }
        });
    }

    /**
     * @desc 新创建一个iframe窗口来打开子页面中的a链接
     * */
    function open_new_iframe(){
        var openedIframeId = $(this).attr("data-openediframeid");
        var $winPage = $("#"+openedIframeId,parent.document).parents(".win-page");
        if($winPage.length != 0){
            parent.sarahWin.setMaxZindex.call($winPage);
        }else{
            var href = $(this).attr("href");
            var app = window.link.get_parent_hash(href,"__app");
            var $obj = $(".win_list[data-app='"+app+"']",parent.document);
            var newIframeId = parent.sarahWin.create_page.call($obj,decodeURIComponent(href));
            $(this).attr("data-openediframeid",newIframeId);
        }
        return false;
    }


    /**
     * @desc 页面中使用hash值__url来记录当前页面的路径*/
    function cache () {
        $("a").click(function(){
            var href = $(this).attr("href");

            var is_cache = get_str_params(href,"__cache");
            if (is_cache == "true") {
                var iframeId = get_parent_hash(window.location.hash,"__url");
                console.log(window.location.hash);
                return false;
                $(this).attr({
                    "href": "",
                    "data-src": href
                });
                var open_url = window.parent.cache.open_url;
                var fill_html = window.parent.cache.fill_html;
                open_url(href,is_cache,fill_html);
            }
            return;
        });

    }


    window.link = {
        get_link_string: get_link_string,
        split_params: split_params,
        get_parent_hash: get_parent_hash,
        open_new_iframe: open_new_iframe
    }
})(window);
