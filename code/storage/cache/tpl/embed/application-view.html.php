<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $this->_symbol["app"]["name"]?>--详情</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .app-title{line-height: 28px;}
        .app-content{padding: 20px;background-color: #fff;}
    </style>
</head>
<body>
    <div class="container">
        <div class="app-content">
            <div>
                <img class="app-logo" id="app_logo" src="<?php echo $this->_symbol["app"]["icon_url"]?>" alt="logo">
            </div>
            <div class="margin-left-v3">
                <div class="app-title float-clear">
                    <span class="float-left margin-right-v3" id="app_name" data-vqstr="<?php echo $this->_symbol["app"]["v_qstr"]?>"><?php echo $this->_symbol["app"]["name"]?></span>
                    <div class="float-right">
                        <button class="btn btn-blue-air btn-size-v1 margin-right-v1">
                            <?php echo $this->_symbol["app"]["installed"] == 1 ? "<span id='open_app'>打开应用</span>" : "<span id='add_app'>添加应用</span>"?>
                        </button>
                       <!-- <?php echo $this->_symbol["app"]["installed"] == 1 ? "<button class='btn btn-gray-air btn-size-v1' id='remove_app'>移除应用</button>" : ""?>-->
                    </div>
                </div>
                <div class="app-desc margin-top-v4"><?php echo $this->_symbol["app"]["intro"]?></div>
            </div>
        </div>
        <div class="app-version-history">

        </div>
    </div>
    <?php include $this->getIncludeFile('common/dialog.html')?>
    <script src="/script/application/view?v=20190412"></script>
</body>
</html>
