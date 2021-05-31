#!bin/bash

## Declare a function
SAMPLE(){
  echo Welcome to SAMPLE function
  echo value of cloud =$CLOUD
  SERVER=NGINX
  echo  First argument =$1
}

## Access the function in both ways
CLOUD=aws
SAMPLE ll
SAMPLE $1
echo value for the server =$SERVER
