#!bin/bash

## Declare a function
SAMPLE(){
  echo Welcome to SAMPLE function
  echo value of cloud =$CLOUD
  SERVER=NGINX
  echo of First argument =$1
}

## Access the function
CLOUD=aws
SAMPLE
echo value for the server =$SERVER
