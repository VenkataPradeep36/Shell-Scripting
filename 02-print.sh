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
echo -e "\tA news anchor's attempt to report on Cyclone Yaas and its
        impact in Odisha quickly devolved into a comedy segment of sorts
        when the man he stopped for an interview gave him a brutally honest
        reply to his query. Parts of Odisha have been experiencing
        high-speed windsand heavy rains due to the "very severe cyclonic storm" Yaas.
         In such inclement weather conditions, the reporter for Naxatra News was
         surprised to see people out and about - and questioned one man about why he
          chose to step out in the midst of a cyclone."

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
echo normal text in no color
echo -e "\e[33mSurendra babu\e[0m"

#synatx: echo -e "\e[COLORmMessage\e[0m"
# 0 is color disable