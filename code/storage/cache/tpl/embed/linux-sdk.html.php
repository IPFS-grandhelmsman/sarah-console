<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SDK下载</title>
    <link href="/static/style/common/prettify.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .sdk-content{background-color: #fff;padding: 20px;font-size: 14px;line-height: 2.2;}
        .sdk-line{line-height:2.5;}
        pre.prettyprint{border: 1px solid rgba(0,0,0,0.08);padding: 10px 25px;}
    </style>
</head>
<body>
    <div class="container">
        <div class="sdk-content">
            <div class="node-title">一，下载SDK</div>
            <div class="sdk-line">请下载Linux SDK，然后参考下面的安装文档进行安装。</div>
            <div class="sdk-line">
                <a class="node-uid" href="/sdk/linux/download/tar?gz=true&app_key=<?php echo $this->_symbol["app_key"]?>">点此下载Linux 64Bit SDK安装程序(.tar.gz)&nbsp;&gt;&gt;</a>
            </div>
            <div class="sdk-line">
                <a class="node-uid" href="/sdk/linux/download/zip?app_key=<?php echo $this->_symbol["app_key"]?>">点此下载Linux 64Bit SDK安装程序(.zip)&nbsp;&gt;&gt;</a>
            </div>
            <div class="margin-top-v4 node-title">二，安装SDK</div>
            <div class="sdk-line">1，解压SDK，设解压路径为: {SDK_ROOT}</div>
            <div class="sdk-line">2，终端安装，打开终端（Ctrl + Alt + T），运行如下命令：</div>
            <pre class="code prettyprint lang-bash">
cd {SDK_ROOT}
sudo ./install.sh</pre>
            <div class="sdk-line">例如，假设解压路径在Home的Downloads/SarahOS-Linux-SDK下，看到如下类似界面表示安装成功。</div>
            <pre class="code prettyprint lang-bash">
sarahos@sarah-desktop:~$ cd ~/Downloads/
sarahos@sarah-desktop:/home/sarah/Downloads/SarahOS-Linux-SDK/$ sudo bash ./install.sh
+-Try to stop the running sarah-booter with pid=750 ...  --[Ok]
+-Try to copy the sarah-booter to /usr/local/bin ...  --[Ok]
|--/etc/sarah/config.json already exists !!!
+-Try to set the service manager ...  --[Ok]
+-Try to set the auto boot start ...  --[Ok]
+-Try to start the sarah service ...  --[Ok]</pre>
            <div class="margin-top-v4 node-title">三，卸载</div>
            <pre class="code prettyprint lang-bash">
cd {SDK_ROOT}
sudo ./uninstall.sh</pre>
            <div class="sdk-line">例如，假设解压路径在Home的Downloads/SarahOS-Linux-SDK下，看到如下类似界面表示卸载成功。</div>
            <pre class="code prettyprint lang-bash">
sarahos@sarah-desktop:~$ cd ~/Downloads/
sarahos@sarah-desktop:/home/sarah/Downloads/SarahOS-Linux-SDK/$ sudo bash ./uninstall.sh
+-Try to stop the running sarah-booter with pid=31953 ...  --[Ok]
+-Try to remove the /usr/local/bin/sarah-booter ...  --[Ok]
+-Try to remove the service manager script ...  --[Ok]
+-Try to remove the boot auto start script ...  --[Ok]</pre>
        </div>
    </div>
    <script src="/script/sdk/linux"></script>
    <script src="/static/js/common/prettify.min.js"></script>
    <script>
        window.onload = function ()
        {
            // Load Prettify
            prettyPrint();
        }
    </script>
</body>
</html>
