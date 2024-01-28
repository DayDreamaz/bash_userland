#!/bin/bash

filename="somefile.txt"
while [ ! -f "$filename" ]
do
    echo "Waiting for $filename to be created..."
    sleep 2
    break
done
echo "$filename exists!"
