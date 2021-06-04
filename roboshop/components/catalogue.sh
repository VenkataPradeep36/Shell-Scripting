#!bin/bash

source components/common.sh
## Deleting the previous log content before executing
rm -f /tmp/roboshop.log

HEAD "Install NodeJs"
yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
STAT $?

HEAD "Add RoboShop App USer"
useradd roboshop &>>/tmp/roboshop.log
STAT $?

HEAD "Download App From GitHub"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Extract the Downloaded Archive"
cd /home/roboshop && unzip /tmp/catalogue.zip &>>/tmp/roboshop.log && mv catalogue-main catalogue
STAT $?

HEAD " Install NodeJs Dependencies"
cd /home/roboshop/catalogue && npm install &>>/tmp/roboshop.log
STAT $?

