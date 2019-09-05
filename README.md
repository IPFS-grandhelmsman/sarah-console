# sarah-console

Current we only have tested on debian and ubuntu.

## Get source

```shell
git clone https://github.com/IPFS-grandhelmsman/sarah-console.git
cd sarah-console
export SARAH_ROOT=`pwd` # Set SARAH_ROOT
```

## Install library

```shell
sudo apt-get install nginx default-mysql-server redis-server memcached php-fpm php-mysql php-redis php-memcached php-curl php-gd php-json

mysql can use mysql5.5 or MariaDB10.0.x
```

## Create mysql data
```shell
create database sarah_computing_db charset='utf8';
create database sarah_core_db charset='utf8';
create database sarah_opmt_record_db charset='utf8';
create database sarah_storage_db charset='utf8';

cd ${SARAH_ROOT}/database
mysql sarah_computing_db<sarah_computing_db.sql
mysql sarah_core_db<sarah_core_db.sql
mysql sarah_opmt_record_db<sarah_opmt_record_db.sql
mysql sarah_storage_db<sarah_storage_db.sql
```

## Edit the mysql connection of Sarah.

File in:
```shell
${SARAH_ROOT}/code/config/database.config.php
```

## Run additional services

```shell
./runtask.sh # run the task service of installing app.
./jnode.sh   # run the data service of node map.
```

## Template of nginx.conf

You can find this template in ${SARAH_ROOT}/nginx.conf
```text
server {
    listen 80; 

    root /path/sarah-console/code/www;
    index index.php;
    server_name sarah.grandhelmsman.com;

    location / { 
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ =404;
    }   

    # pass PHP scripts to FastCGI server
    #   
    location ~ .*\.(php|php7.3)?$
	{
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/run/php/php7.3-fpm.sock;
    }   

	include /php/sarah-console/code/www/.htaccess;
    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one 
    #   
    location ~ /\.ht {
        deny all;
    }   
}
```

## Deployment of nginx.conf
```shell
You need to change the root path of the project.
"root /path/sarah-console/code/www;"

Fix php7.3-fpm to your php-fpm version.
"fastcgi_pass unix:/run/php/php7.3-fpm.sock;"

Copy ${SARAH_ROOT}nginx.conf to /etc/nginx/sites-enabled
cp nginx.conf to /etc/nginx/sites-enabled

Restart nginx
sudo systemctl restart nignx

Append domain grandhelmsman.com to /etc/hosts, or chaning domain to yours.
sudo echo "127.0.0.1    sarah.grandhelmsman.com">>/etc/hosts

Visit Sarah on pc brower.
http://sarah.grandhelmsman.com
default account: sarah
default passwd: sarah@321
```

## Changing file mode when unable to write the content to the cache file.
```shell
cd ${SARAH_ROOT}/code/storage/
chmod 0777 cache -R
```

