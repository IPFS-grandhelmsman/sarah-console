<style>
    .term{display: none;position: fixed;top: 50%;left: 50%;background: #000;width:800px;height: 500px;margin-left: -400px;margin-top: -250px;font-size: 14px;border-radius: 5px;z-index: 99;box-shadow: rgba(0,0,0,0.2) 0 0 30px;}
    .term-header{width: 100%;height: 30px;background-color: #f5f5f5;cursor: move;}
    .btn-term{float: right;width: 40px;height: 30px;font-size: 20px !important;margin-top: -1px;border: none;outline: none;background-color: #f5f5f5;color: #333;}
    .btn-term:hover{background: #ddd;}
    #node-close-term{font-size: 14px !important;}
    .term-demo{position: absolute;color: #06ef74;line-height: 1.8;padding: 0 10px;word-break: break-all;overflow: auto;left: 0;right: 0;bottom: 0;top: 30px;}
    .term-edit, .expired-edit{display: flex;justify-content: left;color: #fff;}
    .term-edit-content{width: 100%;outline: none;}
    .expired-edit-err{color: red;}
    .term-edit-title{white-space: nowrap;}
    .team-header-title{display: inline-block;height: 30px;line-height: 30px;margin-left: 10px;font-size: 13px;}
    .command-help-header{color: #fff;font-weight:600;}
    .command-help-title{display: inline-block;color: #06ef74;font-size: 12px;min-width: 70px;margin-right: 20px;}
    .command-help-content{color: #fff;font-size: 12px;}
    .command-result{background-color: #000;border: none;color: #eee;margin: 0;padding: 3px 0 0 0;overflow: hidden;}
</style>
<div class="term" id="term_dialog">
    <div class="term-header" id="term_header">
        <span class="team-header-title">远程终端</span>

        <button class="iconfont iconguanbi1 btn-term" id="node-close-term"></button>
        <button class="iconfont iconquanping btn-term " id="node-max-term" data-scale="0"></button>
    </div>
    <div id="term_content" class="term-demo">
        <div class="term-tips">Type `help` to learn how to use this terminal.</div>
        <div class="term-edit">
            <div class="term-edit-title">~$：&nbsp;</div>
            <div class="term-edit-content" id="term_edit_content" contenteditable="true" spellcheck="false"></div>
        </div>
    </div>
    <?php include $this->getIncludeFile('common/load_animate.html')?>
</div>

