#!/bin/bash

read -p "Enter a value: " me
if [ $me -lt 4 ]
then
    echo $me
else
    echo "you added a value greater than 4"
fi
