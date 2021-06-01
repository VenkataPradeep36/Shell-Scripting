#!bin/bash

## String comparison

read -p "Enter your name :" username

if [ $username == "pradeep" ] ; then
  echo  "Hey, user $username is root user"
else
  echo "Hey, user $username is Normal user"
fi

## File comparison

read -p "enter file name :" filename

if [ -f "$filename" ]; then
  echo "file exits"
else
  echo "file not exits"
fi