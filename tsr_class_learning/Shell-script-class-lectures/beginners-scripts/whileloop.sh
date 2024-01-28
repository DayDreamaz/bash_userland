#!/bin/bash

echo 'Please enter a value: '
read FILENAME

if [ -f "$FILENAME" ];then
   echo "$FILENAME exists"
else
   while [ ! -f "$FILENAME" ]; do
  	echo "Waiting for $FILENAME to be created..."
	sleep 5
   done
fi

