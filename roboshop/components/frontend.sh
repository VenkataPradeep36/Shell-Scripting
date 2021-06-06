#!/bin/bash

source components/common.sh
## Deleting the previous log content before executing
rm -f /tmp/roboshop.log
set-hostname frontend

HEAD "Installing Nginx\t\t"
yum install nginx -y &>>/tmp/roboshop.log
STAT $?

HEAD "Download the HTDOCS\t\t"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Delete the old HTML Docs\t"
rm -rf /usr/share/nginx/html/*
STAT $?

HEAD "Extract the Downloaded content"
unzip -d /usr/share/nginx/html /tmp/frontend.zip &>>/tmp/roboshop.log
mv /usr/share/nginx/html/frontend-main/* /usr/share/nginx/html/. &>>/tmp/roboshop.log
mv /usr/share/nginx/html/static/* /usr/share/nginx/html/. &>>/tmp/roboshop.log
STAT $?


HEAD "Update Nginx configuration\t"
mv /usr/share/nginx/html/localhost.conf /etc/nginx/default.d/roboshop.conf
STAT $?

HEAD "Update Endpoints in Nginx Config"
for component in catalogue cart user shipping payment ; do
  sed -i -e "/${component}/ s/localhost/${component}.roboshop.internal/" /etc/nginx/default.d/roboshop.conf
done
STAT $?

HEAD "Start Nginx\t\t\t"
systemctl restart nginx &>>/tmp/roboshop.log
systemctl enable nginx &>>/tmp/roboshop.log
STAT $?


## echo -e "\e[32mdone\e[0m"
