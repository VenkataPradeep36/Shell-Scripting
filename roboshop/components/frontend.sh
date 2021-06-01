#!bin/bash

source components/common.sh

## Deleting the previous log content before executing
rm -f tmp/roboshop.log
HEAD  "Installing Nginx"
yum install nginx -y &>>/tmp/roboshop.log
STAT $?


##echo -e "\e[32mdone\e[0m"
