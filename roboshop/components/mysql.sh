#!/bin/bash

source components/common.sh
## Deleting the previous log content before executing
rm -f /tmp/roboshop.log
set-hostname mysql

HEAD "SetUp MySQL Server"
echo '[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0' > /etc/yum.repos.d/mysql.repo
STAT $?

HEAD "Install MYSQL Server"
yum remove mariadb-libs -y &>>/tmp/roboshop.log && yum install mysql-community-server -y &>>/tmp/roboshop.log
STAT $?

HEAD "Start MYSQL Service"
systemctl enable mysqld &>>/tmp/roboshop.log && systemctl start mysqld &>>/tmp/roboshop.log
STAT $?

DEAFULT_ROOT=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}')
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';
uninstall plugin validate_password;" >/tmp/db.sql

HEAD "Reset MySQL Password"
mysql -uroot -p"$(DEAFULT_ROOT)" <tmp/db.sql &>>tmp/roboshop.log
STAT $?

