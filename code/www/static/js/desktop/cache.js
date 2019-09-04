;(function(window){
    "use strict";
    /**
     * @params cache.data 保存页面的链接和内容
     * @params url: data中的数据是无序的，用hash_url来保存一组有序的数据.
     * @params cache.ttl 每个ttl秒检测一次
     * @params cache.max_num cache.data中保存的最大数量
     * @params loading: 页面加载状态
     * @params cache.data = {url: md5加密后的路径
     *     url: {
     *         content: 页面内容
     *         timestamp : 当前数据存储到data里的时间戳
     *     }
     * }
     * */
    var cache = {
        data: {},
        url: new LinkerList(),
        ttl: 120 * 1000,//2分钟
        max_num: 100
    };

    /**
     * 每次加载页面时判断cache.data中是否缓存了请求页面的内容，是：加载cache中的内容，否：通过ajax请求页面内容,然后保存到cache.data中
     * */
    function open_url(obj,url, is_cache, callback,iframeId){
        if(is_cache == "false"){
            return false;
        }
        var href = url.replace(/(^\?|&)__sara_iframe_id=[^&]*(&)?/g, function(p0, p1, p2) {
            return p1 === '?' || p2 ? p1 : '';
        });
        var hash =hex_md5(href);

        var url_pool = cache.url;
        var cache_pool = cache.data;
        if(url_pool.size() > cache.max_num){//删除最后一项
            var len = url_pool.size() - 1;
            var last_key = url_pool.search(len);
            delete cache_pool[last_key];
            url_pool.removeAt(len);
        }
        if(cache_pool[hash] != undefined || cache_pool[hash] != null){
            var content = cache_pool[hash].content;
            var timestamp  = cache_pool[hash].timestamp ;
            var now_timestamp = (new Date()).getTime();
            if(now_timestamp - timestamp < cache.ttl){
                callback(content,iframeId);
                cache_pool[hash].timestamp = now_timestamp;
                url_pool.remove(hash);
                url_pool.insert(0,hash);//头部添加
                return true;
            }
        }
        var $obj = obj;
        $obj.attr("data-src","###__iframecache=true");
        $("#" + iframeId).load(function(){
           var href = document.getElementById(iframeId).contentWindow.location.href;

           var $html = $("#" + iframeId).contents().find("html");
           var timestamp = (new Date()).getTime();
           cache_pool[hash] = {
               content: $html,
               timestamp: timestamp
           };
           url_pool.insert(0,hash);

        });


        /*http_html(url,function(html){
            var timestamp = (new Date()).getTime();
            cache_pool[hash] = {
                content: html,
                timestamp: timestamp
            };
            url_pool.insert(0,hash);
            url_pool.print();
            callback(html);

        },function(error){
            console.log(error);
        })*/

    }

    function fill_html(html,iframeId){
        var newDoc;
        if(iframeId){
            var iframe = $("#"+iframeId).get(0);
            var iframeDocuemnt = iframe.contentWindow.document;
            newDoc = iframeDocuemnt.open("text/html","replace");
        }else{
            newDoc = document.open("text/html","replace");
        }
        newDoc.write(html);
        newDoc.close();
    }

    /**js链表*/
   function LinkerList(){
       var Node = function (element) {
           this.element = element;
           this.next = null;
       };
       var length = 0; //初始化链表长度
       var head = null; //初始化头结点

       this.append = function (element) {//在尾部添加节点
           var node = new Node(element);
           var current;
           if (head == null) {
               head = node;
           } else {
              current = head;
              while (current.next) {
                  current = current.next;
              }
              //找到最后一项元素后，将它的next属性指向新元素node,建立连接
              current.next = node;
           }
           length ++;
       };

       this.insert = function (position,element) {//插入节点
           if (position >= 0 && position <= length) {
               var node = new Node(element),
                   current = head,
                   previous,
                   index = 0;
               if (position === 0) {
                   node.next = current;
                   head = node;
               } else {
                   while (index++ < position) {
                       previous = current;
                       current = current.next;
                   }
                   node.next = current;
                   previous.next = node;
               }
               length++;
               return true;
           } else {
               return false;
           }
       };

       this.removeAt = function (position) {
           if(position > -1 && position < length){
               let current = head,
                   previous = 0,
                   index = 0;
               if (position === 0) {
                   head = current.next;
               } else {
                   while (index++ < position) {
                       previous = current;
                       current = current.next;
                   }
                   previous.next = current.next;
               }
               length --;
               return current.element;
           } else {
               return null;
           }
       };

       this.indexOf = function (element) {
           let current = head,
               index = 0;
           while (current) {
               if (element === current.element) {
                   return index;
               }
               index++;
               current = current.next;
           }
           return -1;
       };

       this.search = function (position) {
           if (position >= 0 && position <= length) {
               var current = head,
                   index = 0;
               if (position != 0) {
                   while (index++ < position) {
                       current = current.next;
                   }
               }
               return current.element;
           }
       };

       this.remove = function (element) {
           let index = this.indexOf(element);
           return this.removeAt(index);
       };

       this.isEmpty = function () {
           return length === 0;
       };

       this.size = function () {
           return length;
       };

       this.getHead = function () {
           return head;
       };

       this.toString = function () {
           let current = head,
               string = "";
           while (current) {
               string += current.element + (current.next ? "," : "");
                current = current.next;
           }
           return string;
       };

       this.print = function () {
           console.log(this.toString());
       }

    }


    function open_iframe($obj,dialogId,src,cachesrc){
        var app = $obj.attr("data-app");
        var pageIframeId = "iframe" + dialogId;
        var iframesrc = src;

        var htmls = '<div class="win-page" data-dialogId="'+dialogId+'">';
        htmls += '<div class="win-page-title clearfix">';
        htmls += '<div class="win-title-name"></div>';
        htmls += '<div class="float-right">';
        htmls += '<span class="iconfont iconsuoxiao win-title-img win-title-min"></span>';
        htmls += '<span class="iconfont iconquanping win-title-img win-title-max" data-winsize="0"></span>';
        htmls += '<span class="iconfont iconguanbi win-title-img win-title-close"></span>';
        htmls += '</div>';
        htmls += '</div>';
        htmls += '<div class="win-page-content">';
        htmls += '<iframe class="win-page-src" id="'+pageIframeId+'" name="'+pageIframeId+'" src="' + iframesrc + '" data-src="' + cachesrc + '" frameborder="0" name="main" data-touchload="2" data-app="'+app+'"></iframe>';
        htmls += '<div class="cover-iframe"></div>';
        htmls += '</div>';
        htmls += '<div class="resize-left"></div>';
        htmls += '<div class="resize-top"></div>';
        htmls += '<div class="resize-right"></div>';
        htmls += '<div class="resize-bottom"></div>';
        htmls += '</div>';
        $(".win-body").append(htmls);

        /*var params = {
            hash: hex_md5(iframesrc),
            url: iframesrc
        };
        var is_cache = $obj.attr("data-cache");
        console.log(cache.data)
        open_url($obj,cachesrc,is_cache,function(content){
            $("#" + pageIframeId).load(function(){
                console.log(123)
                var __iframecache = get_hash_params(iframesrc,"__iframecache");
                console.log(__iframecache)
                if (__iframecache == "true") {
                    console.log(content.html())
                    $("#" + pageIframeId).contents().find("html").replaceWith(content);
                }
            });
        },pageIframeId);*/
    }



    window.cache = {
        cache: cache,
        open_url: open_url,
        fill_html: fill_html,
        open_iframe: open_iframe
    }
})(window);
