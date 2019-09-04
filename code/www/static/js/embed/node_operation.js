;(function (window){
    var vqstr,keyarr=[],key_point,app_key,node_uid,exec_time=0;
    function showRebootDialog(){
        var content = "此操作会使当前任务中断，确定重启？";
        var btnText = "重启";
        window.confirmShow(content,"",btnText);
        vqstr = $(this).attr("data-vqstr");
    }

    function sureConfrim(){
        http_get("/api/node/command/reboot?"+vqstr, true,function(msg){
            console.log(msg);
            if(msg.errno == 0){
                window.confirmHide();
                alertMsg("#toast_success","正在重启，请稍后...");
                setTimeout(function(){
                    window.location.reload();
                },1000)
            }
        },function (error){
            console.log(error);
        });
    }

    function show_terminal(){
        $(".term").fadeIn();
        vqstr = $(this).attr("data-vqstr");
        node_uid = $(this).attr("data-nodeuid");
    }
    function closeTerm(){
        $(".term").fadeOut();
        $(".expired-edit").remove();
        $(".term-result").remove();
        $("#term_edit_content").html("");
        keyarr = [];
        key_point = 0;
    }
    function moveTerm(){
        var termheader = document.getElementById("term_header");
        termheader.onmousedown = function(e){
            var startX = e.pageX;
            var startY = e.pageY;
            var startDisX = $(".term").offset().left;
            var startDIsY = $(".term").offset().top - $(document).scrollTop();
            document.onmousemove = function(e){
                var mouseX = e.pageX;
                var mouseY = e.pageY;
                endX = startDisX + mouseX - startX;
                endY= startDIsY + mouseY - startY;
                moveLimit(endX,endY);
                $(".term").css({
                    "left": endX + "px",
                    "top": endY + "px",
                    "margin-left": 0,
                    "margin-top": 0
                });
            };
            document.onmouseup = function(){
                document.onmousemove = null;
                startX = null;
                startY = null;
                startDisX = null;
                startDIsY = null;
                endX = null;
                endY = null;
            }
        };
    }
    function moveLimit(endx,endy){
        var winW = $(window).width();
        var winH = $(window).height();
        var targetW = $(".term").width();
        var targetH = $(".term").height();
        var limitL = 0, limitT = 0, limitR = winW - targetW, limitB = winH - targetH;

        if(endx <= limitL){
            endX = 1
        }
        if(endx >= limitR){
            endX = limitR-1;
        }
        if(endy <= limitT){
            endY = 1;
        }
        if(endy >= limitB){
            endY = limitB-1;
        }
    }
    function command(){
        var editContent = $(".term-edit-content").html();
        if(editContent == ''){
            return false;
        }
        if(editContent == "clear"){
            $(".expired-edit").remove();
            $(".term-result").remove();
            $("#term_edit_content").html("");
            return false;
        }
        if(editContent == "exit"){
            $(".term").hide();
            $(".expired-edit").remove();
            $(".term-result").remove();
            $("#term_edit_content").html("");
            keyarr = [];
            key_point = 0;
            return false;
        }
        keyarr.push(editContent);
        key_point = keyarr.length-1;
        if(editContent == 'help'){
            http_post("/api/node/command/help",{command: editContent},function(msg){
                var comdInfo = msg.data;
                $(".term-edit").before('<div class="expired-edit clearfix">' +
                    '                                   <span class="expired-edit-title">~$：&nbsp;</span>' +
                    '                                   <div class="expired-edit-content">'+editContent+'</div>' +
                    '                            </div>' +
                    '                            <div class="expired-edit command-help-header">Internal Commands:</div>');
                for(var i=0;i<comdInfo.length;i++){
                    $(".term-edit").before('<div class="expired-edit">\n' +
                        '                <span class="command-help-title">'+comdInfo[i].cmd+':</span>\n' +
                        '                <span class="command-help-content">'+comdInfo[i].desc+'</span>\n' +
                        '            </div>');
                    $(".term-edit-content").html("");
                }
                scrollBottom();
            });
        }else{
            $(".load-bg, .load-animate").show();
            http_post("/api/node/command/push?"+vqstr, {command: editContent}, function(msg){
                if(msg.errno == 0){
                    exec_command(msg.data.id_str,editContent);
                }else if(msg.errno == 1){
                    $(".load-bg, .load-animate").hide();
                    $(".term-edit").before('<div class="expired-edit clearfix">' +
                        '                               <span class="expired-edit-title">~$：&nbsp;</span>' +
                        '                               <div class="expired-edit-content">'+editContent+'</div>' +
                        '                           </div>' +
                        '                           <div class="expired-edit">\n' +
                        '                               <span class="expired-edit-err">不支持该命令</span>\n' +
                        '                           </div>');
                    $(".term-edit-content").html("");
                    scrollBottom();
                }
            },function(errno){
                alertMsg("#toast_error","请求超时");
                $(".load-bg, .load-animate").hide();
            });
        }
    }
    function exec_command(command_id,editContent){
        http_get("/api/node/command/export/status?node_uid="+node_uid+"&app_key="+app_key+"&cmd_id="+command_id, true,function(res){
            if(res.data.status == 2){
                $(".term-edit").before('<div class="expired-edit clearfix">' +
                    '                               <span class="expired-edit-title">~$：&nbsp;</span>' +
                    '                               <div class="expired-edit-content">'+editContent+'</div>' +
                    '                           </div>' +
                    '                           <div class="expired-edit">\n' +
                    '                               <pre class="command-result">' + res.data.res_data + '</pre>\n' +
                    '                           </div>');
                $(".term-edit-content").html("");
                $(".load-bg, .load-animate").hide();
                scrollBottom();
                exec_time = 0;
                return false;
            }else{
                if(exec_time<15){
                    setTimeout(function(){
                        exec_command(command_id,editContent);
                    },1000);
                    exec_time++;
                }else{
                    alertMsg("#toast_error","请求超时！");
                    $(".term-edit").before('<div class="expired-edit clearfix">' +
                        '                               <span class="expired-edit-title">~$：&nbsp;</span>' +
                        '                               <div class="expired-edit-content">'+editContent+'</div>' +
                        '                           </div>' +
                        '                           <div class="expired-edit">\n' +
                        '                               <span class="expired-edit-err">请求超时，具体原因请查看链接:</span>' +
                        '                               <a class="state-error" href="/node/command/view?cmd_id='+command_id+'&'+vqstr+'&__skin=embed">  点我查看</a>\n' +
                        '                           </div>');
                    window.link.split_params();
                    $(".term-edit-content").html("");
                    exec_time = 0;
                    $(".load-bg, .load-animate").hide();

                }
            }
        },function(error){
            console.log(error);
        });
    }
    function topMouseClick(){
        $("#term_dialog").keydown(function(event){
            var e = event || window.event;
            if (e.keyCode == 38) {
                var content = keyarr[key_point];
                key_point -= 1;
                $("#term_edit_content").html(content);
                set_focus($("#term_edit_content"));
                if(key_point<0){
                    key_point = 0;
                    return false;
                }
                return false;
            }
        });
    }
    function bottomMouseClick(){
        $("#term_dialog").keydown(function(event){
            var e = event || window.event;
            if (e.keyCode == 40) {
                key_point += 1;
                var content = keyarr[key_point];
                $("#term_edit_content").html(content);
                set_focus($("#term_edit_content"));
                if(key_point>keyarr.length-2){
                    key_point = keyarr.length-2;
                    return false;
                }
                return false;
            }
        });
    }
    function enterClick(){
        $(document).keydown(function(event){
            var e = event || window.event;
            if (e.keyCode == 13) {
                e.stopPropagation();
                command();
                scrollBottom();
                return false;
            }
        });
    }
    function forbidKey(){
        setTimeout(function() {
            $("#term_edit_content").focus();
        }, 0);
        $("body").on("click",function(){
            $("#term_edit_content").focus();
        });
        /*禁用鼠标左右键*/
        document.getElementById("term_dialog").oncontextmenu=new Function("event.returnValue=false;");
        //document.getElementById("term_dialog").onselectstart=new Function("event.returnValue=false;");
        /*禁用tab键*/
        document.onkeydown=function(e){
            var isie = (document.all) ? true:false;
            var key;
            var ev;
            if(isie){
                //IE浏览器
                key = window.event.keyCode;
                ev = window.event;
            }else{
                //火狐浏览器
                key = e.which;
                ev = e;
            }
            if(key==9){//IE浏览
                if(isie){
                    ev.keyCode=0;
                    ev.returnValue=false;
                }else{
                    //火狐浏览器
                    ev.which=0;
                    ev.preventDefault();
                }
            }
        };
    }
    function set_focus(el) {//光标移动到文本后面
        el=el[0];  // jquery 对象转dom对象
        el.focus();
        if(/msie/.test(navigator.userAgent.toLowerCase())) {
            var rng;
            el.focus();
            rng = document.selection.createRange();
            rng.moveStart('character', -el.innerText.length);
            var text = rng.text;
            for (var i = 0; i < el.innerText.length; i++) {
                if (el.innerText.substring(0, i + 1) == text.substring(text.length - i - 1, text.length)) {
                    result = i + 1;
                }
            }
        }else{
            var range = document.createRange();
            range.selectNodeContents(el);
            range.collapse(false);
            var sel = window.getSelection();
            sel.removeAllRanges();
            sel.addRange(range);
        }
    }
    function scaleTerm(){
        var scale = $(this).attr("data-scale");
        if(scale==0){
            var winW = $(window).width();
            var winH = $(window).height();
            $("#term_dialog").css({
                "width":winW+"px",
                "height":winH+"px",
                "top":0,
                "left":0,
                "margin-left":0,
                "margin-top":0
            });
            $("#node-max-term").removeClass("iconquanping").addClass("iconsuofang");
            $(this).attr("data-scale",1);
        }else{
            $("#term_dialog").css({
                "width":"800px",
                "height":"500px",
                "top":"50%",
                "left":"50%",
                "margin-left":"-400px",
                "margin-top":"-250px"
            });
            $("#node-max-term").removeClass("iconsuofang").addClass("iconquanping");
            $(this).attr("data-scale",0);
        }
    }


    function scrollBottom(){
        var sHeight = $('#term_content')[0].scrollHeight;
        $("#term_content").scrollTop(sHeight);
    }

    function _init(config){
        if(config && config.app_key){
            app_key = config.app_key;
        }
        if(config && config.reboot){
            $(config.reboot).on("click",showRebootDialog);
        }
        if(config && config.terminal){
            $(config.terminal).on("click",show_terminal);
        }
        $("#save_confirm").on("click",sureConfrim);
        $("#node-close-term").on("click",closeTerm);
        $("#node-max-term").on("click",scaleTerm);
        document.getElementById("term_dialog").onvisibilitychange=new Function("event.returnValue=false;");
        moveTerm();
        topMouseClick();
        bottomMouseClick();
        enterClick();
        forbidKey();
    }

    window.nodeOperation = {
        init: _init,
        set_focus: set_focus
    }


})(window);
