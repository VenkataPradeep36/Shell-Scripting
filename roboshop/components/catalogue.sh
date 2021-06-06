#!bin/bash

source components/common.sh
## Deleting the previous log content before executing
rm -f /tmp/roboshop.log
set-hostname catalogue

HEAD "Install NodeJs\t\t\t"
yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
STAT $?

HEAD "Add RoboShop App USer\t\t"
id roboshop &>>/tmp/roboshop.log
if [ $? -eq 0 ]; then
  echo User is already there, so not creating user &>>/tmp/roboshop.log
  STAT $?
else
  useradd roboshop &>>/tmp/roboshop.log
  STAT $?
fi


HEAD "Download App From GitHub\t"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

## In this its unzipping the file and moving catalogue-main to catalogue, but catalogue dir is already there if you run for second time so by avoiding this we have to remove the content before executing

HEAD "Extract the Downloaded Archive"
cd /home/roboshop && rm -rf catalogue && unzip /tmp/catalogue.zip &>>/tmp/roboshop.log && mv catalogue-main catalogue
STAT $?

HEAD "Install NodeJs Dependencies\t"
## We need to run this as normal user but to avoiding this we using unsafe perm
cd /home/roboshop/catalogue && npm install --unsafe-perm &>>/tmp/roboshop.log
STAT $?

## We are giving permissions to user by using command chown and -r represents recursively because its a directory and content  inside should change to this one
HEAD "Fix permissions to Appp User\t"
chown roboshop:roboshop /home/roboshop -R
STAT $?

##Inserting mongodb ip address by using -i command and moving the file
HEAD "SetUp the SyetemD service file"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service  && mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
STAT $?

HEAD "Start the catalogue service\t"
systemctl daemon-reload && systemctl start catalogue &>>/tmp/roboshop.log && systemctl enable catalogue &>>/tmp/roboshop.log
STAT $?

