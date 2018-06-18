#! /bin/bash

sudo yum update -y
sudo yum install nginx -y

/etc/init.d/nginx restart
