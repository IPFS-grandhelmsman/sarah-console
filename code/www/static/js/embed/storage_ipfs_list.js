;(function(window){
    "use strict";
    var ipfsPageUrl = "";
    var ipfsApiUrl = "";
    var ipfs = "";

    var $delete, initName, $rename, vqstr;

    /**
     * @parame isDownload 当前页面是否处于下载中*/
    var isDownload = false, initFileName;

    // 目录导航
    function saveNavInfo () {
        var fileName, vqstr;
        var path = decodeURIComponent(get_url_params("path"));
        if ( !path ) {
            fileName = "首页";
            vqstr = 0;
        } else {
            fileName = path;
            var id = get_url_params("id");
            var acm = get_url_params("acm");
            var sign = get_url_params("sign");
            vqstr = "id=" + id + "&acm=" + acm + "&sign=" + sign;
        }
        localStorage.setItem(fileName, vqstr);
    }

    function getNavInfo () {
        var fileName="", vqstr, navPath = '',htmls = '',exitRecord = true;
        var path = decodeURIComponent(get_url_params("path"));
        var iframeId = get_url_params("__sara_iframe_id");

        if ( path == "null" ) {
            fileName = "首页";
            vqstr = 0;
            htmls += "<a class='text' href='/storage/ipfs/?__skin=embed&__app=storage&__sara_iframe_id=" + iframeId + "'>" + fileName + "</a>"
        } else {
            htmls += "<a class='text' href='/storage/ipfs/?__skin=embed&__app=storage&__sara_iframe_id=" + iframeId + "'>首页</a>";
            var dirs = path.split("/");
            dirs.shift();
            for ( var i = 0; i < dirs.length; i++ ) {
                fileName += "/" + dirs[i];
                vqstr = localStorage.getItem(fileName);
                if ( vqstr != "null" ) {
                    htmls += "<span class='margin-left-v1 margin-right-v1 split'>/</span>";
                    htmls += "<a class='text' href='?" + vqstr + "&__skin=embed&__app=storage&__sara_iframe_id="+ iframeId +"&path=" + fileName + "'>" + dirs[i] + "</a>";
                } else {
                    exitRecord = false;
                    return false;
                }
            }
            if ( !exitRecord ) {//locastorage不存在路径
                var lastIndex = path.lastIndexOf("/");
                fileName = path.substring(lastIndex, path.length - 1);
                htmls += "<a class='text' href='/storage/ipfs/?__skin=embed&__app=storage&__sara_iframe_id==" + iframeId + "'>首页</a>";
                htmls += "<span class='margin-left-v1 margin-right-v1 split'>/</span>";
                htmls += "<a class='text' href='#'>fileName</a>";
            }
        }
        $("#filesNav").html(htmls);
    }

    //显示或隐藏上传文件框
    function showUploadDialog (event) {
        var e = event || window.event;
        e.stopPropagation();
        if ( $("#upload").is(":hidden") ) {
            $("#upload").removeClass("sarah-hide");
        } else {
            $("#upload").addClass("sarah-hide");
        }
    }
    function hideUploadDialog () {
        $("#upload").addClass("sarah-hide");
    }

    //上传文件
    function uploadFile(event){
        $("#addFiles").off("click").removeClass("btn-blue")
            .addClass("btn-forbid")
            .html("上传中 <i class='iconfont iconshuaxin1 file-loading'></i>");
        $("#uploadFile").prop("disabled","true");
        var e = event || window.event;
        var files = e.target.files;
        var upload_num = 0;
        var len = files.length;
        for ( var i = 0; i < len; i++ ) {
            (function (i) {
                var file = files[i];
                var filename = file.name;
                var fileReader = new FileReader();
                fileReader.readAsArrayBuffer(file);
                fileReader.onload = function () {
                    var unit8_res = new Uint8Array(fileReader.result);
                    var buffer_res = new Buffer(unit8_res);
                    var data = {
                        path: filename,
                        content: buffer_res
                    };
                    ipfs.add(data, function (err, res) {
                        if ( !err ) {
                            var vqstr = "";
                            var id = get_url_params("id");
                            var acm = get_url_params("acm");
                            var sign = get_url_params("sign");

                            if ( !id ) {
                                vqstr = "";
                            } else {
                                vqstr = "id=" + id + "&acm=" + acm + "&sign=" +sign;
                            }

                            var data = [];
                            var entry = {
                                file: file.name,
                                size: file.size,
                                hash: res[0].hash,
                                mimeType: file.type
                            };
                            data.push(entry);
                            http_post("/api/storage/ipfs/add?" + vqstr, JSON.stringify(data), function (msg) {
                                if ( msg.errno == 0 ) {
                                    upload_num ++;
                                    if ( upload_num == len ) {
                                        alertMsg("#toast_success", "上传成功！");
                                        setTimeout(function () {
                                            window.location.reload();
                                        }, 1000);
                                    }
                                } else {
                                    alertMsg("#toast_error", msg.message);
                                    setTimeout(function () {
                                        window.location.reload();
                                    }, 1000);
                                }
                            });
                        } else {
                            console.error(err);
                        }
                    });
                };
            })(i);
        }
    }

    //上传目录
    function uploadFileDirectory (event) {
        var e = event || window.event;
        var allFiles = e.target.files;
        var stream = [], ipfsAddRes = {};
        var len = allFiles.length, addNum = 0;

        $("#addFiles").addClass("btn-forbid").html("上传中");
        $("#uploadFile").prop("disabled","true");

        for ( var i = 0; i < allFiles.length; i++ ) {
            var webkitRelativePath = allFiles[i].webkitRelativePath;
            var fileReader = new FileReader();
            fileReader.readAsArrayBuffer(allFiles[i]);
            (function (webkitRelativePath) {
                fileReader.onload = function () {
                    var unit8_res = new Uint8Array(this.result);
                    var buffer_res = new Buffer(unit8_res);
                    var data = {
                        path: webkitRelativePath,
                        content: buffer_res,
                    };
                    addNum ++;
                    stream.push(data);
                    if (addNum == len) {
                        ipfs.add (stream, function (err, res) {
                            console.log(err);
                            for ( var i = 0; i < res.length; i++ ) {
                                ipfsAddRes[res[i].path] = res[i].hash;
                            }
                            var files = getFiles(allFiles);
                            getHash(files, ipfsAddRes);
                        })
                    }
                }
            })(webkitRelativePath);
        }
    }

    var inputFiles;
    function getHash (files, ipfsAddRes) {
        var path = "", len = files.length, num = 0;
        var dirPath = decodeURIComponent(get_url_params("path"));
        var  vqstr;
        if ( dirPath == "null") {
            vqstr = "";
        } else {
            var id = get_url_params("id");
            var acm = get_url_params("acm");
            var sign = get_url_params("sign");
            vqstr = "id=" + id + "&acm=" + acm + "&sign=" + sign;
        }
        for (var i = 0; i < files.length; i++) {
            var nowFiles = files[i];
            var isDir = nowFiles.name.indexOf(".");
            if ( isDir == -1 ) { // 目录
                path = nowFiles.file.path;
                nowFiles.hash = ipfsAddRes[path];
                num ++;
            } else { // 文件
                path = nowFiles.file.path;
                nowFiles.hash = ipfsAddRes[path];
                num ++;
                if (num == len) {
                    inputFiles = files;
                    var list = getTree(0, inputFiles, 0, inputFiles[0].name);
                    http_post("/api/storage/ipfs/add?" + vqstr, JSON.stringify(list), function (msg) {
                        if ( msg.errno == 0 ) {
                                alertMsg ("#toast_success", "上传成功！");
                                setTimeout(function () {
                                window.location.reload();
                            }, 1000);
                        } else {
                            alertMsg ("#toast_error", msg.message);
                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);
                        }
                    })
                }
            }
        }
    }

    /**
     * @method getTree 通过上传的目录返回树形结构
     * @params index
     * @params files 上传的所有文件
     * @params filesIndex 当前目录所在的层级，从0开始
     * @params name 当前目录的文件名
     * */
    function getTree (index, files, filesIndex, name) {
        var list = [],file = [];
        var childFiles = getChildArray (index, inputFiles, name);
        if (childFiles.length > 0) {//长度大于0，说明存在下一级目录或文件，则当前为目录
            for (var i in childFiles) {
                if (childFiles[i].file) {
                    var child = getTree(childFiles[i].zIndex, childFiles, i, childFiles[i].file.name);
                    if (child.length > 0) {
                        file.push(child[0])
                    }
                }

            }
            var entry = new Entry(files[filesIndex], files[filesIndex].hash, file);
            list.push(entry);
        } else { //长度等于0，说明为文件
            var entry = new Entry(files[filesIndex],files[filesIndex].hash, file);
            list.push(entry);
        }
        return list;
    }

    function getChildArray (index, files, parent) {
        var newFiles = [];
        for (var i in files) {
            if ((files[i].zIndex - 1) == index && files[i].parent == parent) {
                newFiles.push(files[i]);
            }
        }
        return newFiles;
    }

    function getFiles (files) {
        var file, size, type, hash = 0, parent, zIndex, all_files = [];
        for (var i = 0; i < files.length; i++) {
            var webkitRelativePath = files[i].webkitRelativePath;
            var arr = webkitRelativePath.split("/");
            for (var j = 0; j < arr.length; j++) {
                if (j == 0) {
                    parent = 0;
                } else {
                    parent = arr[j-1];
                }
                if (j == arr.length - 1) {
                    file = {name: files[i].name, path: files[i].webkitRelativePath};
                    type = files[i].type;
                    size = files[i].size;
                } else {
                    var index = webkitRelativePath.indexOf(arr[j]);
                    var dPath = webkitRelativePath.substring(0, index) + arr[j];
                    file = {name: arr[j], path: dPath};
                    type = "file/dir";
                    size = 0;
                }
                zIndex = j;
                var fileStructure = new FileStructure(arr[j], size, type, file, hash, parent, zIndex);
                if ( JSON.stringify(all_files).indexOf(JSON.stringify(fileStructure)) == -1) {
                    all_files.push(fileStructure);
                }
            }
        }
        return all_files;
    }

    function FileStructure (name, size, type, file, hash, parent, zIndex)  {
        /**
         * @params z_index: number 当前目录或文件的层级,从0开始
         * */
        var obj = {
            name: name,
            size: size,
            type: type,
            file: file,
            parent: parent,
            zIndex: zIndex
        };
        return obj;
    }

    function Entry (file, hash, child) {
        var obj = {
            file: file.file.name,
            size: file.size,
            hash: hash,
            mimeType: file.type
        };
        if (child.length > 0) {
            obj.files = child;
        }
        return obj;
    }

    // 下载文件
    function downloadFile () {
        isDownload = true;
        var downloadUrl, downloadName,progressHtmls = "", $this = $(this);

        window.parent.focus();

        var hash = $this.parent().attr("data-hash");
        var name = $this.parent().attr("data-name");
        var mimeType = $this.parent().attr("data-type");
        if ( mimeType == 'file/dir' ) {
            downloadUrl = ipfsApiUrl + "/api/v0/get?arg=" + hash + "&archive=true&compress=true";
            downloadName = name + ".tar.gz";
            progressHtmls = $("#dirsDownloadProgress").html();
        } else {
            downloadUrl = ipfsPageUrl + "/ipfs/" + hash;
            downloadName = name;
            progressHtmls += $("#filesDownloadProgress").html();
        }

        var $progress = $this.parent().siblings(".progress");
        $progress.html(progressHtmls);
        var progressWidth = $progress.find(".progress-bg").width();
        $this.addClass("sarah-hide");
        $this.siblings(".download-animation").removeClass("sarah-hide");

        var xhrOnProgress=function(fun) {
            xhrOnProgress.onprogress = fun; //绑定监听
            //使用闭包实现监听绑
            return function() {
                //通过$.ajaxSettings.xhr();获得XMLHttpRequest对象
                var xhr = $.ajaxSettings.xhr();
                //判断监听函数是否为函数
                if (typeof xhrOnProgress.onprogress !== 'function')
                    return xhr;
                //如果有监听函数并且xhr对象支持绑定时就把监听函数绑定上去
                if (xhrOnProgress.onprogress && xhr.upload) {
                    xhr.onprogress = xhrOnProgress.onprogress;
                }
                return xhr;
            }
        };

        $.ajax({
            url: downloadUrl,
            xhrFields: {
                responseType: "blob"
            },
            xhr: xhrOnProgress(function(e){
                if (mimeType != "file/dir") {
                    var percent = (e.loaded / e.total) * 100;
                    $progress.find(".download-progress").html(percent.toFixed(2) + "%");
                    $progress.find(".progress-width").width(progressWidth * (e.loaded / e.total));
                }
            }),
            success: function (res) {
                console.log(res);
                $progress.empty();
                $this.removeClass("sarah-hide");
                $this.siblings(".download-animation").addClass("sarah-hide");
                isDownload = false;

                var blob = new window.Blob([res]);
                var url = window.URL.createObjectURL(blob);
                var tagA = document.createElement("a");
                tagA.style = "display: none";
                tagA.href = url;
                tagA.download = downloadName;
                document.body.appendChild(tagA);
                tagA.click();
                window.URL.revokeObjectURL(url);
            },
            error: function (err) {
                console.log(err);
            }
        });
        return false;
    }

    function forbidOpenDirs () {
        return false;
    }

    // 预览
    function preview () {
        var hash = $(this).parent().attr("data-hash");
        var name = $(this).parent().attr("data-name");
        var mimeType = $(this).parent().attr("data-type");
        $("#previewName").html(name);
        if( /(image\/gif)|(image\/png)|(image\/jpeg)|(image\/x-icon)/.test(mimeType) ) {
            var src = ipfsPageUrl + "/ipfs/" + hash;
            $("#previewImg").attr("src", src).show();
            $("#previewBg").show();
            $("#previewDialog").show();
            return;
        }
        if ( /(application\/x-javascript)|(application\/sql)|(application\/json)|(^text\/)/.test(mimeType)) {
            var src = ipfsPageUrl + "/ipfs/" + hash;
            $.ajax({
                url: src,
                xhrFields: { responseType: "text" },
                success: function (res) {
                    $("#previewText").text(res);
                    $("#previewText").show();
                },
                error: function (err) {
                    console.log(err);
                }
            });
            $("#previewBg").show();
            $("#previewDialog").show();
            return;
        }

        if (/(application\/pdf)/.test(mimeType)) {
            var src = ipfsPageUrl + "/ipfs/" + hash;
            $("#previewPdf").attr("src", src).show();
            $("#previewBg").show();
            $("#previewDialog").show();
            return;
        }


        alertMsg("#toast_error","暂不支持该类型的文件预览！", 1500);
        return false;
    }

    // 关闭预览
    function closePreview () {
        $("#previewBg").hide();
        $("#previewDialog").hide();
        $(".preview-content").hide();
    }

    // 删除文件
    function showDelete () {
        $("#previewBg").show();
        $("#deleteDialog").show();
        var mimeType = $(this).parent().attr("data-type");
        if ( mimeType == "file/dir" ) {
            $("#deleteOption").html("删除一个文件夹");
        } else {
            $("#deleteOption").html("删除一个文件");
        }
        $delete = $(this);
        return false;
    }

    function closeDelete () {
        $("#previewBg").hide();
        $("#deleteDialog").hide();
        $delete = "";
    }

    function deleteFiles () {
        var vqstr = $delete.attr("data-vqstr");
        var mimeType = $delete.parent().attr("data-type");
        var path = decodeURIComponent(get_url_params("path"));
        var name = $delete.parent().attr("data-name");
        var deletePath = "";
        if( path != "null" ) {
            deletePath = path + "/" + name;
        } else {
            deletePath = "/" + name;
        }
        var option = {};
        if ( mimeType == "file/dir" ) {
            option.recursive = true;
        }
        var $this = $delete;
        (function ($this) {
            ipfs.files.rm(deletePath, option, function (err) {
                console.log(err);
                http_get("/api/storage/ipfs/delete?" + vqstr, true, function (msg) {
                    if (msg.errno == 0 ) {
                        alertMsg("#toast_success", "删除成功！");
                        setTimeout(function () {
                            closeDelete();
                            $this.parents(".item").remove();
                        },1000);
                    } else {
                        alertMsg("#toast_error", msg.message);
                    }
                });
            });
        })($this);
        return false;
    }

    function share () {
        var hash = $(this).parent().attr("data-hash");
        var link = "https://ipfs.io/ipfs/" + hash;
        $("#shareLink").val(link);
        $("#previewBg").show();
        $("#shareDialog").show();
        return false;
    }

    function closeShare () {
        $("#shareLink").val("");
        $("#previewBg").hide();
        $("#shareDialog").hide();
    }

    function copyShare () {
        var node = $("#shareLink").get(0);
        copy(node);
        setTimeout(function () {
            closeShare();
        },1000);
    }

    function showReanmeDialog () {
        vqstr = $(this).parent().attr("data-vqstr");
        var type = $(this).parent().attr("data-type");
        $rename = $(this).siblings(".file-title");
        initName = $rename.html();
        var title = "";
        if (type == "file/dir") {
            title = "重命名此文件夹";
        } else {
            title = "重命名此文件";
        }
        $("#renameDialog").find(".option-title").html(title);
        $("#renameDialog").find(".option-desc").html(title);
        $("#rename").val(initName);

        $("#saveName").attr("data-edit", "false")
            .removeClass("btn-blue")
            .addClass("btn-forbid");
        $("#previewBg").show();
        $("#renameDialog").show();
        return false;
    }

    function closeRenameDialog () {
        $("#previewBg").hide();
        $("#renameDialog").hide();
        $rename = "";
        vqstr = "";
    }

    function saveName () {
        var isEdit = $("#saveName").attr("data-edit");
        if ( isEdit == "false" ) {
            return false;
        }

        var name = $("#rename").val();
        var len = name.length;
        if ( !name ) {
            alertMsg("#toast_error", "文件名不能为空！", 1500);
            return false;
        }
        if ( len > 255 ) {
            alertMsg("#toast_error", "文件名称长度必须小于255个字符！", 1800);
            return false;
        }
        if ( /(\^)|(\/)|(\`)|(,)/.test(name) ) {
            alertMsg("#toast_error", "文件名称不能包含^\ /`,", 1800);
            return false;
        }

        http_post("/api/storage/ipfs/edit?" + vqstr, {file: name}, function (msg) {
            if ( msg.errno == 0 ) {
                alertMsg("#toast_success", "修改成功！");
                $rename.html(name);
                closeRenameDialog();
            } else {
                alertMsg("#toast_success", msg.message);
            }
        });
    }

    function  allowRenmeSave () {
        var nowName = $("#rename").val();
        if ( nowName == initName ) {
            $("#saveName").attr("data-edit", "false")
                .removeClass("btn-blue")
                .addClass("btn-forbid");
        } else {
            $("#saveName").attr("data-edit", "true")
                .removeClass("btn-forbid")
                .addClass("btn-blue");
        }
    }

    function copy_hash(){
        var copy_text = $(this).siblings(".hash-text").eq(0).get(0);
        copy(copy_text);
        return false;
    }

    function copy (node) {
        var range = document.createRange();
        range.selectNode(node);
        var selection = window.getSelection();
        if ( selection.rangeCount > 0 ) {
            selection.removeAllRanges();
        }
        selection.addRange(range);
        /*window.getSelection ? window.getSelection().removeAllRanges() : document.selection.empty();*/
        document.execCommand('copy');
        window.getSelection().removeAllRanges();
        alertMsg("#toast_success", "复制成功");
    }

    // 页面初始化时判断是否该显示预览图标
    function showPreviewIcon () {
        var pattern = /(image\/gif)|(image\/png)|(image\/jpeg)|(image\/x-icon)|(^text\/)|(application\/x-javascript)|(application\/sql)|(application\/json)|(application\/pdf)/;
        $(".preview").each(function () {
            var mimeType = $(this).parent().attr("data-type");
            if ( pattern.test(mimeType) ) {
                $(this).removeClass("sarah-hide");
            }
        });
    }

    // 文件下载时禁止页面刷新，禁用f5. ctrl + r, ctrl + f5, f3键
    function forbidRefresh () {
        window.onkeydown = function (e) {
            if ( isDownload ) {
                var k = e.keyCode;
                if ( ( e.ctrlKey == true && k == 82 ) || ( k == 116 ) || ( e.ctrlKey == true && k == 116 ) || ( k == 114 ) ) {
                    window.parent.focus();
                    e.returnValue = false;
                    e.cancelBubble = true;
                    return false;
                }
            }
        };
        window.parent.document.onkeydown = function (e) {
            if ( isDownload ) {
                var k = e.keyCode;
                if ( ( e.ctrlKey == true && k == 82 ) || ( k == 116 ) || ( e.ctrlKey == true && k == 116 ) || ( k == 114 ) ) {
                    alertMsg("#toast_error", "资源加载中，请勿刷新", 1800);
                    e.returnValue = false;
                    e.cancelBubble = true;
                    return false;
                }
            }


        }
    }


    function _init(config){
        if (config) {
            ipfsApiUrl = "http://" + config.host + ":" + config.read_port;
            ipfsPageUrl = "http://" + config.host + ":" + config.write_port;
            ipfs = window.IpfsApi(config.host, config.read_port);

            showPreviewIcon();
            saveNavInfo();
            getNavInfo();
        }
        $("#addFiles").on("click",showUploadDialog);
        $("#uploadFile").on("change", uploadFile);
        $("#uploadFileDirectory").on("change", uploadFileDirectory);
        $(".copy-hash").on("click",copy_hash);
        $(".download").on("click",downloadFile);
        $(".preview").on("click",preview);
        $("#closePreview").on("click",closePreview);
        $(".delete").on("click",showDelete);
        $("#cancelDelete, #closeDelete").on("click",closeDelete);
        $("#sureDelete").on("click",deleteFiles);
        $(".share").on("click",share);
        $("#copyShare").on("click",copyShare);
        $("#closeShare, #cancelShare").on("click",closeShare);
        $(".edit-title").on("click",showReanmeDialog);
        $("#closeRename, #cancelRename").on("click", closeRenameDialog);
        $("#saveName").on("click", saveName);
        $("#rename").on("input propertychange", allowRenmeSave);

        $(".download-animation").on("click",forbidOpenDirs);
        $(document).on("click", hideUploadDialog);

        forbidRefresh();
    }

    window.ipfs = {
        init: _init
    }
})(window);
