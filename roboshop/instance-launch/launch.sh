#!bin/bash

COMPONENT=$1
## This First argument is storing in a standard variable which is component

if [ -z "${COMPONENT}" ]; then
  echo "Component input is needed"
  exit 1
fi

LID=lt-0e325cdb1fd0c644e
LVER=1

## Validate if instance is already there
INSTANCE_STATE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${COMPONENT}" | jq .Reservations[].Instances[].State.Name | xargs -n1)

if [ "${INSTANCE_STATE}" = "running" ]; then
   echo "Instance is already exist!"
   exit 0
fi

if [ "${INSTANCE_STATE}" = "stopped" ]; then
   echo "Instance is already exist!"
   exit 0
fi

## To Launch an instance from launch template
aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER} --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq
