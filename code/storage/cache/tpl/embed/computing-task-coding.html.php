<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>任务：<?php echo $this->_symbol["data"]["name"]?> -- 拆解</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .editor_par{position: absolute;top: 55px;right: 20px;bottom: 20px;left: 20px;background-color:#272822;}
        .editor, .ace_editor{position: absolute;top: 0px;right: 0px;bottom: 0px;left: 0px;font-size:14px;line-height: 1.2;}
        #editor_lua{display: none;}
        #editor_bash{display: none;}
        #editor_php{display: none;}
        .lua-doc{color: #0B1013;margin-left: 20px;line-height: 22px;}
    </style>
</head>
<body>
    <div class="container">
        <div class="float-left select-btn margin-right-v3" id="editor_lang">
            <div class="title choose-lang" data-check="">
                <span class="select-title-text"></span>
                <i class="float-right iconfont iconxiala icon"></i>
            </div>
            <ul class="option">
                <li class="forbid">语言</li>
                <li class="item" id="switch_lua" data-option="lua" data-engine="lua" >lua</li>
                <li class="item" id="switch_bash" data-option="powershell" data-engine="bash" >bash</li>
            </ul>
        </div>
        <div class="float-left font-btn-green margin-right-v3">
            <span class="font-reduce" id="reduce_font_size"><i class="iconfont iconiconjian icon"></i></span>
            <span id="editor_font_size">14</span>px
            <span class="font-add" id="add_font_size"><i class="iconfont iconiconjia icon"></i></span>
        </div>
        <div class="float-left font-btn-blue">
            <span class="font-reduce" id="reduce_line_height"><i class="iconfont iconiconjian icon"></i></span>
            <span id="editor_line_height">1.2</span>
            <span class="font-add" id="add_line_height"><i class="iconfont iconiconjia icon"></i></span>
        </div>
        <a class="lua-doc sarah-hide" id="lua_doc" href="http://doc.april.grandhelmsman.com/" target="_blank" data-link="normal">lua文档</a>
        <?php if($this->_symbol["data"]["editable"]){?>
            <button class="float-right btn btn-blue btn-xs" id="save_code">保存</button>
        <?php }else{?>
            <button class="float-right btn btn-forbid btn-xs">保存</button>
        <?php }?>
        <div class="editor_par">
            <div id="editor_lua"><textarea class="editor" ><?php if($this->_symbol["data"]["engine"] == "lua" && strlen($this->_symbol["data"]["logic_code"]) > 0){?><?php echo $this->_symbol["data"]["logic_code"]?><?php }else{?>--请使用lua语言<?php }?></textarea></div>
            <div id="editor_bash"><textarea class="editor" ><?php if($this->_symbol["data"]["engine"] == "bash" && strlen($this->_symbol["data"]["logic_code"]) != 0){?><?php echo $this->_symbol["data"]["logic_code"]?><?php }else{?>#请使用bash语言<?php }?></textarea></div>
        </div>
    </div>

    <?php include $this->getIncludeFile('common/dialog.html')?>
    <script src="/static/js/common/ace/ace.js"></script>
    <script src="/script/task/code?v=20190412"></script>
    <script>
        var link_id = window.link.get_link_string("id");
        var link_acm = window.link.get_link_string("acm");
        var link_sign = window.link.get_link_string("sign");
        var v_qstr = "id=" + link_id + "&acm=" + link_acm + "&sign=" + link_sign;
        var config = {
            editor_lang: "#editor_lang",
            save_code: "#save_code",
            v_qstr: v_qstr,
            engine: "<?php echo $this->_symbol["data"]["engine"]?>",
            editable: "<?php echo $this->_symbol["data"]["editable"]?>",
            add_font_size: "#add_font_size",
            reduce_font_size: "#reduce_font_size",
            add_line_height: "#add_line_height",
            reduce_line_height: "#reduce_line_height"
        };
        window.taskcode.init(config);
    </script>
</body>
</html>
