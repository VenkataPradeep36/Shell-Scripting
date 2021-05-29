#!/bin/bash

## Declare a variable
COURSE=DevOps

##Access a variable
echo Course Name = $COURSE

#DATE=2021-05-29

DATE=$(date +%F)

echo Good Morning, Today date is $DATE

NO_OF_USERS=$(who | wc -l)
echo No of users logged in system =$NO_OF_USERS

ADD=$((2+5))
echo add=$ADD