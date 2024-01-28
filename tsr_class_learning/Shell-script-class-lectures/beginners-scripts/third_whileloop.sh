#!/bin/bash

echo 'please enter to exit the program'
read input

while true
#  read input
do
  if [ "$input" = "exit" ]
then
     echo "Leaving the loop" 
     break
  fi
  echo "You entered: $input"
done

 
