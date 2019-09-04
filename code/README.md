# sarah console project

## 项目结构
* app - 接口及输出
* config - 配置文件
* resource - 资源（模型，工具，服务）
* www - 网站根目录 
* www/index.php - web访问入口

## 主要配置文件
* config/app.conf.php - 系统公共配置
* config/cache.conf.php - 缓存配置
* config/database.conf.php - 数据库配置
* server.php - 常量及项目总入口
* www/.htaccess - url重写

## 依赖syrian框架
在 server.php 指定syrian 目录
```php
define('BASEPATH',          dirname(__DIR__).'/syrian/syrian/');
define('SR_CLUSTER_NAME',   'cloud.grandhelmsman.com');              // cluster name
```

## 需要创建的目录
* /storage/cache - 模板缓存
* /storage/tmp - 临时目录
* cache - 数据缓存 在config/cache.conf.php中指定NFile路径


## 基本环境要求
nginx + php5 + fpm + mysql5.5 + syrian

所需扩展：
* curl.ini   
* gd.ini       
* json.ini    
* mysql.ini   
* opcache.ini  
* gearman.ini  
* mcrypt.ini  
* memcached.ini  
* mysqli.ini  
* pdo.ini      
* readline.ini

## 服务器配置 
nginx: 
    server {
        listen	80;	## listen for ipv4

        root /path/to/web/app/www;
        index index.php index.html index.htm;
        server_name www.mybot.ai;

        location / {
            try_files $uri $uri/ =404;
        }

        error_page 404 = /404.html;

        access_log /path/to/log/nginx/app_access.log main;
        error_log /path/to/log/nginx/app_error.log;
        
        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        location ~ \.php$ {
            try_files $uri = /404.html;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;

            # With php5-fpm:
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            fastcgi_index index.php;
            include fastcgi_params;
        }
        
        # 包含路径重写规则
        include /path/to/web/app/www/.htaccess;
        
        
        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        location ~ /\.(htaccess|git|gitignore) {
            deny all;
        }
    }

php.ini:
* 开发环境:

        error_reporting=E_ALL
        display_errors=On
    
* 生产环境： 

        display_errors=Off
