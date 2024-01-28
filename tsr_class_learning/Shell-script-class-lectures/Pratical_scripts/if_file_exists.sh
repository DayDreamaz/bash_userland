#!/bin/bash
# Author: Louis Benagha
# Role:   Instructor

echo '***** This script checks if a file exists *****'
echo '#***************************************************#'

echo 'Enter file Name: '
read FILE

if [ ! -f "$FILE" ];
then
   echo "This Filename called: $FILE , doesn't exist in this directory"
   exit 1
else
   echo "Filename $FILE exists"
fi

