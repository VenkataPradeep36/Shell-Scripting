#!bin/bash

source components/common.sh
## Deleting the previous log content before executing
rm -f /tmp/roboshop.log

HEAD "Setup MongoDB yum repo file"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT $?

HEAD "Install Mongodb\t"
yum install -y mongodb-org &>>/tmp/roboshop.log
STAT $?


HEAD "Update Listen address in Config File"
sed -e -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT $?

HEAD "Start MongoDB service"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl start mongod &>>/tmp/roboshop.log
STAT $?

HEAD "Download Schema from GITHUB"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>/tmp/roboshop.log
STAT $?


HEAD "Extract the downloaded archive"
cd /tmp
unzip -o mongodb.zip &>>/tmp/roboshop.log
STAT $?

HEAD "Load the Schema"
cd mongodb-main
mongo < catalogue.js &>>/tmp/roboshop.log && mongo < users.js &>>/tmp/roboshop.log
STAT$?