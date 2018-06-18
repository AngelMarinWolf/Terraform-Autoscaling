#! /bin/bash

sudo yum update -y
sudo yum install nginx -y

sed -i -e 's/listen       80/listen       8080/g' /etc/nginx/nginx.conf
/etc/init.d/nginx restart
