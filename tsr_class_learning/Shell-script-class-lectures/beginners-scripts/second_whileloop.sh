#!/bin/bash
echo 'Enter a value: '
read a

while [ $a -gt 300 ]
do
    echo $a
    a=`expr $a + 1`
done
