#!bin/bash

## String comparison

read -p "Enter your name :" username

if [$username == Pradeep] ; then
  echo  "Hey, user $username is root user"
else
  echo "Hey, user $username is Normal user"
fi

