#!/bin/bash


i=5
while [ $i -gt 0 ]; do
  echo $i
  i=$(($i-1))
done



for Language in Java Python Go ; do
  echo Language name = $Language
  sleep 1
done


for i in frontend mongodb catalogue redis user cart mysql shipping rabbitmq payment ; do echo -e "[$(echo $i | tr [a-z [A-Z]])]\n$i.roboshop.internal" ;done
