#!bin/bash

source components/common.sh

HEAD  "Installing Nginx"
yum install nginx -y &>>/tmp/roboshop.log
STAT $?


##echo -e "\e[32mdone\e[0m"
