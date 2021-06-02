#!bin/bash

COMPONENT=$1
## This First argument is storing in a standard variable which is component

if [ -z "${COMPONENT}" ]; then
  echo "Component input is needed"
  exit 1
fi

LID=lt-0e325cdb1fd0c644e
LVER=1

aws ec2 run-instances --launch-template LaunchTemplateId=lt-${LID},Version=${LVER} --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$COMPONENT}]" | jq
