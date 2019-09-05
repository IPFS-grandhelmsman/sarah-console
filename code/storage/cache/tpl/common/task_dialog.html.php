<div class="dialog dialog-width-v1" id="create_task_dialog">
    <div class="header">
        <span id="create_task_title">新建任务</span>
        <i class="iconfont iconguanbi1 float-right dialog-close" id="cancel_add_task"></i>
    </div>
    <div class="margin-top-v3 float-clear">
        <div class="title-v2">任务名称</div>
        <input class="content-v2" id="name" type="text">
    </div>
    <div class="margin-top-v3 float-clear">
        <div class="title-v2">任务描述</div>
        <textarea class="textarea" id="intro"></textarea>
    </div>
    <div class="margin-top-v4">
        <button class="btn btn-blue btn-max" id="save_task">确定</button>
    </div>
</div>

<div class="dialog dialog-width-v1" id="start_task_dialog">
    <div class="header">任务启动
        <i class="iconfont iconguanbi1 float-right dialog-close" id="hide_task_start"></i>
    </div>
    <div class="margin-top-v3">
        <div class="title-v2">节点分发</div>
        <div class="select">
            <div class="title" id="selected_node" data-check="4">
                <span class="text">全部非故障节点</span>
                <i class="iconfont iconxiala icon"></i>
            </div>
            <ul class="option" id="node_distribution_option">
                <li class="item currency-informway"  data-dist="4">全部非故障节点</li>
                <li class="item currency-informway"  data-dist="1">全部节点</li>
                <li class="item currency-informway"  data-dist="5">随机一个非故障节点</li>
                <li class="item currency-informway"  data-dist="6">第一个非故障节点</li>
                <li class="item currency-informway"  data-dist="7">最新一个非故障节点</li>
                <li class="item" id="choo_define_node"  data-dist="2">自定义节点</li>
                <!--<li class="item currency-informway""  data-dist="3">最佳的十个节点</li>-->
            </ul>
        </div>
    </div>
    <div class="margin-top-v3 float-clear">
        <div class="title-v2">编译签名</div>
        <input class="content-v2" id="sarah_params" type="text" value="2edb133362d52423d218f2f814b770da">
    </div>
    <div class="margin-top-v4">
        <button class="btn btn-blue btn-max" id="show_service_pwd">确定</button>
    </div>
</div>

<!--服务密码弹框-->
<div class="dialog dialog-width-v1" id="service_pwd">
    <div class="header">请输入服务密码
        <i class="iconfont iconguanbi1 float-right dialog-close" id="hide_service_pwd"></i>
    </div>
    <div class="margin-top-v3">
        <input class="content-v2" id="service_password" type="password" value="">
    </div>
    <div class="margin-top-v4">
        <button class="btn btn-blue btn-max" id="start_task_btn">确定</button>
    </div>
</div>

<div class="dialog dialog-width-v1" id="choose_node">
    <div class="header">
        <span class="app-node-header">请选择<span class="state-normal" id="app_task_type"></span>的节点</span>
        <i class="iconfont iconguanbi1 float-right dialog-close" id="choose_node_close"></i>
    </div>
    <div class="margin-top-v3">
        <div class="title-v2">节点</div>
        <div class="select">
            <div class="title" id="app_node" data-check="8" data-show="false" data-nodeid="">
                <span class="text">全部未安装节点</span>
                <i class="iconfont iconxiala icon"></i>
            </div>
            <ul class="option" id="app_node_option">
                <li class="item" data-task="8" id="unselect_node">全部未安装节点</li>
                <li class="item" data-task="2" id="custom_node">自定义节点</li>
            </ul>
        </div>
    </div>
    <div class="float-clear margin-top-v3">
        <div class="title-v2">备注</div>
        <textarea class="textarea app-remarks"></textarea>
    </div>
    <div class="margin-top-v4">
        <button class="btn btn-blue btn-max" id="save_node">添加</button>
    </div>
</div>

<!--<div class="dialog dialog-width-v1" id="define_node_dialog">
    <div class="header">添加自定义节点
    </div>
    <ul>
        <li class="check-pos margin-top-v7">
            <input class="check-box" type="checkbox" name="custom_node">
            <label class="check-label"></label>
            <span class="margin-left-v3 node_id">6657691806623334678</span>
            <span class="margin-left-v5">所在地</span>
        </li>
        <li class="check-pos margin-top-v5">
            <input class="check-box" type="checkbox" name="custom_node">
            <label class="check-label"></label>
            <span class="margin-left-v3 node_id">6657691806623334678</span>
            <span class="margin-left-v5">所在地</span>
        </li>
        <li class="check-pos margin-top-v5">
            <input class="check-box" type="checkbox" name="custom_node">
            <label class="check-label"></label>
            <span class="margin-left-v3 node_id">6657691806623334678</span>
            <span class="margin-left-v5">所在地</span>
        </li>
    </ul>
    <div class="margin-top-v6 float-right">
        <button class="btn btn-cancel btn-md" id="choose_custom_close">取消</button>
        <button class="btn btn-blue btn-md" id="choose_node_btn">选择</button>
    </div>
</div>-->



