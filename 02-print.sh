#!bin/bash

# echo  and printf command can be used to print some message on the screen

# However we use echo command here, because it is simple and yet effective to all the needs.

# syntax: echo Input message

echo Tommy

# echo to print multiple lines(/n is the new line sequence)
# syntax: echo -e "line1/nline2"

echo -e "Hello,\n welcome to my world"

echo -e "\nHello,\n\nWelcome"

#syntax: \t to print a tab space
echo -e "\tpassion is not a job, a sport or hobby. It is the full force of your attention,
         an energy you give to whatever is right in front of you. -Terri."

## print in colours
#syntax:echo -e "\e[COLORmMessage"

# COLORS  CODE
# RED      31
# Green    32
# Yellow   33
# Blue     34
# Magenta  35
# Cyan     36


echo -e "\e[31mVenkata Pradeep\e[0m"
echo -e normal text in no color
echo -e "\e[33mSurendra babu\e[0m"

#synatx: echo -e "\e[COLORmMessage\e[0m"
# 0 is color disable
# You will find extra colour codes in Internet