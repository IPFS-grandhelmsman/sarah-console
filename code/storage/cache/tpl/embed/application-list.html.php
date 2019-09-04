<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>应用中心</title>
    <link href="/static/font/iconfont.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <link href="/static/style/embed/sarah.css?v=<?php echo $this->_symbol["css_version"]?>" rel="stylesheet" type="text/css"/>
    <style>
        .container{margin: 75px 20px 20px 20px;background-color: #fff;}
    </style>
</head>
<body>
    <nav class="nav">
        <a class="link active" href="/application/list?__skin=embed">全部应用</a>
        <a class="link" href="#">更新</a>
        <div class="float-right search">
            <input class="search-content" type="text" placeholder="搜索关键词…">
            <i class="iconfont iconsousuo icon"></i>
        </div>
    </nav>
    <div class="container float-clear">
        <?php foreach($this->_symbol["data"] as $val){?>
            <a class="float-left app-center" href="/application/view?<?php echo $val["v_qstr"]?>&__skin=embed" data-vqstr="<?php echo $val["v_qstr"]?>">
                <img class="img" src="<?php echo $val["icon_url"]?>" alt="<?php echo $val["name"]?>">
                <div class="name"><?php echo $val["name"]?></div>
                <button class="btn btn-blue-air btn-size operate-app" data-status="<?php echo $val["installed"]?>">
                    <?php if($val["installed"] == 0){?>
                        添加
                    <?php }else if($val["installed"] == 1){?>
                        打开
                    <?php }else{?>
                        一键更新
                    <?php }?>
                </button>
            </a>
        <?php }?>
    </div>
    <?php include $this->getIncludeFile('common/dialog.html')?>
    <script src="/script/application/list?v=20190412"></script>
</body>
</html>
