<style>
    .node-select-container{margin-top: 60px;padding: 20px;}
    .mark-option{left: -8px;top: 51px;min-width: 130px;width: auto;padding: 4px 15px;}
    #all_node_list{position: fixed;left: 20px;right: 20px;top: 190px;bottom: 50px;background-color: #fff;overflow: auto;}
    .btn-option{position: fixed;bottom:10px;right: 20px;}
</style>

<nav class="nav">
    <div class="search">
        <input class="search-content" type="text" placeholder="搜索关键词…">
        <i class="iconfont iconsousuo icon"></i>
    </div>
</nav>

<div class="node-select-container">
    <div class="sec float-clear">
        <div class="sec-title">条件筛选</div>
        <div class="filter-condition sarah-hide">
               <span class="">
                   <span>硬件配置</span>
                   <input class="input-frame" type="text">CPU
                   <input class="input-frame" type="text">GB
                   <input class="input-frame" type="text">TB
               </span>
            <span class="condition">
                   <span>状态</span>
                   <div class="condition-select">
                       <div class="title">
                           <span class="text">正常</span>
                           <i class="iconfont iconxiala icon"></i>
                       </div>
                        <ul class="option">
                            <li class="item">全部</li>
                            <li class="item">正常</li>
                            <li class="item">重启中</li>
                            <li class="item">故障</li>
                        </ul>
                   </div>
               </span>
            <span class="condition">
                   <span>系统负荷</span>
                   <input class="input-frame" type="text"> ~
                   <input class="input-frame" type="text">
               </span>
            <span class="condition">
                   <span>内存</span>
                   <input class="input-frame" type="text"> ~
                   <input class="input-frame" type="text">
               </span>
            <span class="condition">
                   <span>磁盘</span>
                   <input class="input-frame" type="text"> ~
                   <input class="input-frame" type="text">
               </span>
            <span class="condition">
                   <span>所在地</span>
                      <div class="condition-select">
                       <div class="title">
                           <span class="text">深圳</span>
                           <i class="iconfont iconxiala icon"></i>
                       </div>
                        <ul class="option">
                            <li class="item">深圳</li>
                            <li class="item">香港</li>
                            <li class="item">美国</li>
                            <li class="item">日本</li>
                        </ul>
                   </div>
               </span>
            <span class="state-blue">清空输入内容</span>
            <button class="float-right btn btn-blue btn-xs margin-top-v8">查找结果</button>
        </div>

        <table class="sarah-table">
            <tr class="table-title">
                <td class="padding-left text-overflow table-row-v1">
                    <div class="check-pos table-check">
                        <input class="check-box all-select-check" type="checkbox">
                        <label class="check-label"></label>
                    </div>
                </td>
                <td class="padding-left text-overflow">节点UID</td>
                <td class="padding-left text-overflow table-row-v5">节点名称</td>
                <td class="padding-left text-overflow table-row-v2">状态</td>
                <td class="padding-left text-overflow table-row-v5">硬件配置</td>
                <td class="padding-left text-overflow table-row-v3">系统负载</td>
                <td class="padding-left text-overflow table-row-v2">内存</td>
                <td class="padding-left text-overflow table-row-v2">磁盘</td>
            </tr>
        </table>
        <div id="all_node_list">

        </div>
        <div class="btn-option">
            <button class="btn btn-cancel btn-xs margin-right-v2" id="choose_custom_close">取消</button>
            <button class="btn btn-blue btn-xs" id="choose_node_btn">确定</button>
        </div>
    </div>


</div>

<script type="text/tamplate" id="node_list_tpl">
        <table class=sarah-table>
            <%for (var i = 0; i< {node}.length; i++) {%>
                <tr class="table-row" data-nodeid="<%={node[i]}.Id%>">
                    <td class="padding-left text-overflow table-row-v1">
                         <div class="check-pos table-check">
                              <input class="check-box single-select-check" type="checkbox" name="custom_node">
                              <label class="check-label"></label>
                         </div>
                    </td>
                    <td class="padding-left text-overflow" title="<%={node[i]}.node_uid%>"><%={node[i]}.node_uid%></td>
                    <td class="padding-left text-overflow table-row-v5" title="<%={node[i]}.name%>"><%={node[i]}.name%></td>
                    <td class="padding-left table-row-v2">
                        <%if ({node[i]}.status == 1) {%>
                            正常
                        <%} else if ({node[i]}.status == 2) {%>
                            <em class="state-warning">重启中</em>
                        <%} else {%>
                            <em class="float-left state-error" data-toggle="tooltip">故障</em>
                            <div class="float-left fault-mark margin-left-v1">
                                <i class="iconfont iconWarning node-error mark"></i>
                                <div class="mark-option" >节点未响应</div>
                            </div>
                        <%}%>
                    <td class="padding-left text-overflow table-row-v5" title="<%={node[i]}.cpu_cores%>CPU <%={node[i]}.rem_str%> <%={node[i]}.disk_str%>">
                        <em><%={node[i]}.cpu_cores%>CPU</em>&nbsp;
                        <em><%={node[i]}.rem_str%></em>&nbsp;
                        <em><%={node[i]}.disk_str%></em>
                    </td>
                    <td class="padding-left text-overflow table-row-v3" title="<%={node[i]}.load_avg%>"><%={node[i]}.load_avg%></td>
                    <td class="padding-left text-overflow table-row-v2" title="<%={node[i]}.ram_percent%>%"><%={node[i]}.ram_percent%>%</td>
                    <td class="padding-left text-overflow table-row-v2" title="<%={node[i]}.disk_percent%>%"><%={node[i]}.disk_percent%>%</td>
                </tr>
            <%}%>
        </table>
    </script>
