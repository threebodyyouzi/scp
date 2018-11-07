#!/bin/bash
while :
do
   clear
   line=$(sed -n '$=' /a.txt)
   num=$[RANDOM%line+1]
   sed -n "${num}p" /a.txt
   sleep 1
done
