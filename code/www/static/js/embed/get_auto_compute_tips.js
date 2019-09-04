;(function (window) {
    "use strict";
    var codeTips = [
        {meta: "(...)", caption: "print", value: "print()", score:1000000},
        {meta: "(...)", caption: "echo", value: "echo()", score:1000000},
        {meta: "(string pacakge)", caption: "import", value: "import()", score:1000000},
        {meta: "(table obj, bool pretty)", caption: "json_encode", value: "json_encode()", score:1000000},
        {meta: "(string str)", caption: "json_decode", value: "json_decode()", score:1000000},
        {meta: "(string api_url,table header_map)", caption: "http_get", value: "http_get()", score:1000000},
        {meta: "(string api_url,table args_map,tabel header_map)", caption: "http_post", value: "http_post()", score:1000000},
        {meta: "(string api_url,string file,boolean override)", caption: "http_download", value: "http_download()", score:1000000},
        {meta: "(string file_path,string file_content,int flag)", caption: "file_put_contents", value: "file_put_contents()", score:1000000},
        {meta: "(string file_path)", caption: "file_get_contents", value: "file_get_contents()", score:1000000},
        {meta: "(string file_path)", caption: "file_exists", value: "file_exists()", score:1000000},
        {meta: "(string dir_path,int mask)", caption: "mkdir", value: "mkdir()", score:1000000},
        {meta: "(string file_path,string mode)", caption: "fopen", value: "fopen()", score:1000000},
        {meta: "(userdata file_handler)", caption: "fclose", value: "fclose()", score:1000000},
        {meta: "(userdata file_handler,int lock_type)", caption: "flock", value: "flock()", score:1000000},
        {meta: "(userdata fp,int length)", caption: "fgets", value: "fgets()", score:1000000},
        {meta: "(userdata fp,int offset,int whence)", caption: "fseek", value: "fseek()", score:1000000},
        {meta: "(userdata fp)", caption: "ftell", value: "ftell()", score:1000000},
        {meta: "(userdata fp)", caption: "rewind", value: "rewind()", score:1000000},
        {meta: "(userdata fp,int length)", caption: "fread", value: "fread()", score:1000000},
        {meta: "(userdata fp,string str,int length)", caption: "fwrite", value: "fwrite()", score:1000000},
        {meta: "(string file_path)", caption: "is_dir", value: "is_dir()", score:1000000},
        {meta: "(string file_path)", caption: "opendir", value: "opendir()", score:1000000},
        {meta: "(userdata fp)", caption: "readdir", value: "readdir()", score:1000000},
        {meta: "(userdata fp)", caption: "closedir", value: "closedir()", score:1000000},
    ];
    window.codeTips = {
        data: codeTips
    }
})(window);