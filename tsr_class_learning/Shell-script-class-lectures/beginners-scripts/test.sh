#!/bin/bash

if [ -z $1 ];then
   echo 'No command passed, exiting now'
   exit 1
fi 




if [ $1 ];then
   echo $1
   sudo apt update -y
   echo 'installed succesfully'
else
   exit 1
   echo 'please provide an argument'
fi


