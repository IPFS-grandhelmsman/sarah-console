function http_post(url,data,successfn,errorfn){
    if(typeof successfn != "function"){
        successfn = function(){};
    }
    if(typeof errorfn != "function"){
        errorfn = function (){};
    }
    $.ajax({
        url: url,
        type: "POST",
        async: true,
        dataType: "json",
        data: data,
        success: successfn,
        error: errorfn
    });
}
function http_get(url,async,successfn,errorfn){
    $.ajax({
        url: url,
        type: "GET",
        async: async,
        dataType: "json",
        success: successfn,
        error: errorfn
    });
}

function http_html(url,successfn,errorfn){
    $.ajax({
        type : "GET",
        url : url,
        async: true,
        dataType : "html",
        success:successfn,
        error : errorfn
    });
}


function get_url_params(name){
    var reg=new RegExp('[?&]'+name+'=([^&#]+)');
    var query=window.location.href.match(reg);
    return query?query[1]:null;
}

function get_hash_params(str,name){
    var reg=new RegExp('[#&]'+name+'=([^&#]+)');
    var query=str.match(reg);
    return query?query[1]:null;
}
function get_str_params(str,name){
    var reg=new RegExp('[?&]'+name+'=([^&#]+)');
    var query=str.match(reg);
    return query?query[1]:null;
}

/*浮点数计算*/
function float_add(arg1,arg2){
    var r1,r2,m;
    try{
        r1=arg1.toString().split(".")[1].length
    }catch(e){
        r1=0
    }
    try{
        r2=arg2.toString().split(".")[1].length
    }catch(e){
        r2=0
    }
    m=Math.pow(10,Math.max(r1,r2));
    return (arg1*m+arg2*m)/m;
}
function float_reduce(arg1,arg2){
    var r1,r2,m;
    try{
        r1=arg1.toString().split(".")[1].length
    }catch(e){
        r1=0
    }
    try{
        r2=arg2.toString().split(".")[1].length
    }catch(e){
        r2=0
    }
    m=Math.pow(10,Math.max(r1,r2));
    return (arg1*m - arg2*m)/m;
}

/*toast*/
function alertMsg(obj, content, time){
    var time = time || 1000;
    $(obj).addClass("toast-show");
    $(obj).find(".content").html(content);
    setTimeout(function(){
        $(obj).removeClass("toast-show");
    },time);
}
/*confirm show*/
function confirmShow(content,tips,btnText){
    $("#dialog_bg").show();
    $("#sarah_confirm").fadeIn();
    $("#sarah_confirm .content").html(content);
    $("#sarah_confirm .tips").html(tips);
    $("#sarah_confirm #confirm").html(btnText);
}
/*confirm hide*/
function confirmHide(){
    $("#dialog_bg").hide();
    $("#sarah_confirm").fadeOut();
}

/*全选*/
function allCheck(event){
    var e = event || window.event;
    var $allnode = $(e.data.allnode);
    var $singlenode = $(e.data.singlenode);
    var ifcheck = $allnode.prop("checked");
    if(!ifcheck){
        $singlenode.prop("checked",false);
    }else{
        $singlenode.prop("checked",true);
    }
}

function singleCheck(event){
    var e = event || window.event;
    var $allnode = $(e.data.allnode);
    var $singlenode = $(e.data.singlenode);
    var isAllCheck = true;
    $singlenode.each(function(){
        var isCheck = $(this).prop("checked");
        if(!isCheck){
            isAllCheck = false;
            return;
        }
    });
    if(isAllCheck){
        $allnode.prop("checked",true);
    }else{
        $allnode.prop("checked",false);
    }
}

function pagingLimit(obj,pages,oldPage){
    $(obj).val($(obj).val().replace(/\D/g,""));
    var nowPage = $(obj).val();
    if((nowPage && nowPage > pages) || (nowPage && !(/(^[1-9]\d*$)/.test(nowPage)))){
        var valArr = nowPage.split("");
        valArr.splice(valArr.length-1,1);
        var newValue = valArr.join("");
        $(obj).val(newValue);
        return 0;
    }
}
function pagingLink(obj){
    var link = $(obj).attr("data-link");
    var value = $("#input-pageno").val();
    if(!value){
        alertMsg("#toast_error","页码不能为空！");
        return;
    }
    window.location.href = link + value;


}

function time_format (time, symbol) {
    var year = time.getFullYear();
    var month = (time.getMonth() + 1) > 10 ? (time.getMonth() + 1) : "0" + (time.getMonth() + 1);
    var day = time.getDay();
    var house = time.getHours() > 10 ? time.getHours() : "0" + time.getHours();
    var minute = time.getMinutes() > 10 ? time.getMinutes() : "0" + time.getMinutes();
    var second = time.getSeconds() > 10 ? time.getSeconds() : "0" + time.getSeconds();
    return year + symbol + month + symbol + day + " " + house + ":" + minute + ":" + second;
}
