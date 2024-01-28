#!/bin/bash

echo "Please guess the number of cars: "
read x
if [ "$x" -le "100" ];
then
echo "Sorry, not correct"
else
echo "You entered the magic number!"
fi
