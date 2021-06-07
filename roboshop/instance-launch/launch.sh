#!/bin/bash

COMPONENT=$1

## -z validates the variable empty , true if it is empty.
if [ -z "${COMPONENT}" ]; then
  echo "Component Input is Needed"
  exit 1
fi

LID=lt-0c95879a21fb6edbf
LVER=2

DNS_UPDATE() {
  PRIVATEIP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${COMPONENT}"  | jq .Reservations[].Instances[].PrivateIpAddress | xargs -n1)
  sed -e "s/COMPONENT/${COMPONENT}/" -e "s/IPADDRESS/${PRIVATEIP}/" record.json >/tmp/record.json
  aws route53 change-resource-record-sets --hosted-zone-id Z00392432B47AFBZ92BGI --change-batch file:///tmp/record.json | jq
}

INSTANCE_CREATE() {
  ## Validate If Instance is already there
INSTANCE_STATE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${COMPONENT}"  | jq .Reservations[].Instances[].State.Name | xargs -n1)

if [ "${INSTANCE_STATE}" = "running" ]; then
  echo "Instance already exists!!"
  DNS_UPDATE
  return 0
fi

if [ "${INSTANCE_STATE}" = "stopped" ]; then
  echo "Instance already exists!!"
  return 0
fi

echo -n Instance ${COMPONENT} created - IPADDRESS is
aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq | grep  PrivateIpAddress | awk '{print $NF}'  |xargs -n1
  sleep 10
  DNS_UPDATE
}



if [ "${1}" == "all" ]; then
  for component in frontend mongodb catalogue redis user cart mysql shipping rabbitmq payment ; do
    COMPONENT=$component
    INSTANCE_CREATE
  done
else
    COMPONENT=$1
    INSTANCE_CREATE
fi

## To Execute all instances at a time
## for component in frontend mongodb catalogue redis user cart mysql shipping rabbitmq payment ; do
#	ssh $component.roboshop.internal "git clone https://github.com/venkatapradeep36/shell-scripting ; cd shell-scripting/roboshop ; sudo make $component"
#done