#!bin/bash

## Declare a function
SAMPLE(){
  echo Welcome to SAMPLE function
  return 10
  echo value of cloud =$CLOUD
  SERVER=NGINX
  echo  First argument =$1
}

## Access the function in both ways
CLOUD=aws
SAMPLE ll
SAMPLE $1
Exit satus of sample function = $?
echo value for the server =$SERVER
