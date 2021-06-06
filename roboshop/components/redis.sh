#!bin/bash

source components/common.sh
## Deleting the previous log content before executing
rm -f /tmp/roboshop.log
set-hostname redis

HEAD "SetUp Redis Repos"
yum install epel-release yum-utils install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>/tmp/roboshop.log yum-config-manager --enable remi &>>/tmp/roboshop.log
STAT $?
# yum install redis -y
