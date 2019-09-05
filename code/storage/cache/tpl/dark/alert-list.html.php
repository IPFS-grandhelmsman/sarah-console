<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control"   CONTENT="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>警报列表 - 正舵者矿机云监测</title>
    <link href="/static/style/common/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/style/dark/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <?php include $this->getIncludeFile('dark/blade/header.blader.html')?>
    <?php include $this->getIncludeFile('dark/blade/left.menu.blader.html')?>
    <div class="main-contaim">
        <div class="node-title">
            <img class="node-title-img" src="/static/image/dark/icon-jd-black.png" alt="节点">
            <span>警报列表</span>
        </div>
        <div class="shadow-box">
            <table class="alert-list-table">
                <tr class="alert-table-row">
                    <th>UID</th>
                    <th>类型</th>
                    <th>预警值</th>
                    <th>发布时间</th>
                    <th>操作</th>
                </tr>
                <tr class="alert-table-row1">
                    <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                    <td>内存使用率</td>
                    <td>80%</td>
                    <td>2018/12/24</td>
                    <td><button class="btn-alert-list">删除</button></td>
                </tr>
                <tr class="alert-table-row1">
                    <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                    <td>系统负载</td>
                    <td>0.8</td>
                    <td>2018/12/24</td>
                    <td><button class="btn-alert-list">删除</button></td>
                </tr>
                <tr class="alert-table-row1">
                    <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                    <td>磁盘使用率</td>
                    <td>75%</td>
                    <td>2018/12/24</td>
                    <td><button class="btn-alert-list">删除</button></td>
                </tr>
                <tr class="alert-table-row1">
                    <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                    <td>下载带宽</td>
                    <td>500b/s</td>
                    <td>2018/12/24</td>
                    <td><button class="btn-alert-list">删除</button></td>
                </tr>
                <tr class="alert-table-row1">
                    <td>5bffbb2b-aa737dc0-623e-9001-4cedfbbd1eb9</td>
                    <td>上传带宽</td>
                    <td>500b/s</td>
                    <td>2018/12/24</td>
                    <td><button class="btn-alert-list">删除</button></td>
                </tr>
            </table>
            <?php include $this->getIncludeFile('default/blade/paging-bootstrap.blade.html')?>
        </div>
    </div>
    <?php include $this->getIncludeFile('dark/blade/footer.blader.html')?>
    <script src="/static/js/common/jquery.1.11.js"></script>
    <script src="/static/js/common/bootstrap.min.js"></script>
    <script type="text/javascript">
        actionNav("jblist");
        $(function(){
            var objLink = $("[data-status='jblist']").parent().siblings(".menu-li-link");
            $(objLink).click();
        });
    </script>
</body>
</html>
