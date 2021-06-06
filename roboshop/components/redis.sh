#!/bin/bash

source components/common.sh
## Deleting the previous log content before executing
rm -f /tmp/roboshop.log
set-hostname redis

HEAD "SetUp Redis Repos\t\t\t"
yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>/tmp/roboshop.log && yum-config-manager --enable remi &>>/tmp/roboshop.log
STAT $?

HEAD "Install Redis\t\t\t"
yum install redis -y &>>/tmp/roboshop.log
STAT $?

HEAD "Update Listen Address in Redis Config"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf
STAT $?

HEAD "Start Redis Update\t\t\t"
systemctl enable redis &>>/tmp/roboshop.log && systemctl start redis &>>/tmp/roboshop.log
STAT $?
