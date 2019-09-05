#!/bin/sh

cd ./code
sudo php server.php /cli/pm/start?monitor=true:taskFile=./config/script/std_task.json
cd ../
