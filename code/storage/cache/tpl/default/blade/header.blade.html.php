<!-- Static navbar -->
<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/node/">正舵者矿机云监测</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li<?php echo $this->_symbol["module_type"]=='statistics'?' class="active"':''?>><a href="/statistics/">统计</a></li>
                <li<?php echo $this->_symbol["module_type"]=='node'?' class="active"':''?>><a href="/node/">节点</a></li>
                <li<?php echo $this->_symbol["module_type"]=='alert'?' class="active"':''?>><a href="/alert/">警报</a></li>
                <li<?php echo $this->_symbol["module_type"]=='setting'?' class="active"':''?>><a href="/user/">设置</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">OS SDK<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/sdk/linux/" target="_blank"><em class="glyphicon glyphicon-book"></em>&nbsp;Linux SDK</a></li>
                        <li><a title="开发中，敬请期待！" target="_blank"><em class="glyphicon glyphicon-book"></em>&nbsp;Windows SDK</a></li>
                        <li><a title="开发中，敬请期待！" target="_blank"><em class="glyphicon glyphicon-book"></em>&nbsp;Android SDK</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav pull-right" id="dropdown-nav">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><em class="glyphicon glyphicon-user"></em>&nbsp;<?php echo session('uname')?><span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li class="dropdown-header">系统样式</li>
                            <li><a href="/admin/setting/skin?name=default">默认风格</a></li>
                            <li><a href="/admin/setting/skin?name=dark">黑色风格</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">通用管理</li>
                            <li><a href="/user/"><em class="glyphicon glyphicon-cog"></em>&nbsp;用户设置</a></li>
                            <li><a href="/admin/logOut"><em class="glyphicon glyphicon-log-out"></em>&nbsp;安全退出</a></li>
                        </ul>
                    </li>
                </ul>
            </ul>
        </div>
    </div>
</nav>
