#!/bin/bash


i=5
while [ $i -gt 0 ]; do
  echo $i
  i=$(($i-1))
done


for Language in Java Python Go ; do
  echo Language name =$Languages
  sleep 1
done