<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>Linux SDK文档 - 正舵者矿机云监测</title>
    <link href="/static/style/default/prettify.min.css" rel="stylesheet">
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/dark/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <?php include $this->getIncludeFile('dark/blade/header.blader.html')?>
    <?php include $this->getIncludeFile('dark/blade/left.menu.blader.html')?>
    <div class="main-contaim">
        <div class="node-title">
            <img class="node-title-img" src="/static/image/dark/icon-basic-info.png" alt="sdk教程">
            <span>SarahOS Linux SDK下载和安装教程</span>
        </div>
        <div class="contain-sdkL">
            <div class="sdk-title">一，下载SDK</div>
            <div class="sdk-line">请下载Linux SDK，然后参考下面的安装文档进行安装。</div>
            <div class="sdk-line">
                <a href="/sdk/linux/download">点此下载Linux 64Bit SDK安装程序&nbsp;&gt;&gt;</a>
            </div>
            <div class="sdk-title">二，安装SDK</div>
            <div class="sdk-line">1，解压SDK，设解压路径为: {SDK_ROOT}</div>
            <div class="sdk-line">2，终端安装，打开终端（Ctrl + Alt + T），运行如下命令：</div>
            <pre class="code prettyprint lang-js">
  cd {SDK_ROOT}
  sudo ./install.sh
            </pre>
            <div class="sdk-line">例如，假设解压路径在Home的Downloads/SarahOS-Linux-SDK下，看到如下界面表示安装成功。</div>
            <pre class="code prettyprint lang-js">
  sarahos@sarah-desktop:~$ cd ~/Downloads/
  sarahos@sarah-desktop:/home/sarah/Downloads/SarahOS-Linux-SDK/$ sudo ./install.sh
  +-Try to stop the running sarah-collector with pid=7724 ...  --[Ok]
  +-Try to copy the sarah-collector to /usr/local/bin ...  --[Ok]
  |--/etc/sarah/config.json already exists !!!
  +-Try to set the service manager ...  --[Ok]
  +-Try to set the auto boot start ...  --[Ok]
  +-Try to start the sarah service ...  --[Ok]
            </pre>
            <div class="sdk-title">3，卸载</div>
            <pre class="code prettyprint lang-js">
  cd {SDK_ROOT}
  sudo ./uninstall.sh
            </pre>
            <div class="sdk-line">例如，假设解压路径在Home的Downloads/SarahOS-Linux-SDK下，看到如下界面表示卸载成功。</div>
            <pre class="code prettyprint lang-js">
  sarahos@sarah-desktop:~$ cd ~/Downloads/
  sarahos@sarah-desktop:/home/sarah/Downloads/SarahOS-Linux-SDK/$ sudo ./uninstall.sh
  +-Try to stop the running sarah-collector with pid=12251 ...  --[Ok]
  +-Try to remove the /usr/local/bin/sarah-collector ...  --[Ok]
  +-Try to remove the service manager script ...  --[Ok]
  +-Try to remove the boot auto start script ...  --[Ok]
            </pre>
        </div>
    </div>
    <?php include $this->getIncludeFile('dark/blade/footer.blader.html')?>
    <script src="/static/js/common/jquery.1.11.js"></script>
    <script src="/static/js/common/bootstrap.min.js"></script>
    <script language="javascript" src="/static/js/common/prettify.min.js"></script>
    <script type="text/javascript">
        actionNav("sdkL");
        prettyPrint();
        /*子菜单open状态*/
        $(function(){
            var objLink = $("[data-status='sdkL']").parent().siblings(".menu-li-link");
            $(objLink).click();
        })
    </script>
</body>
</html>
