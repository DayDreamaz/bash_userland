#!/bin/bash

echo "Enter the value of A : "
read a

echo "Enter the value of B : "
read b

if [ "$a" -eq "$b" ]; then
    echo "A is equal to B"
elif [ "$a" -gt "$b" ]; then
    echo "A is greater than B"
elif [ "$a" -lt "$b" ]; then
    echo "A is less than B"
else
   echo 'Please enter the right value for a or b'
fi
