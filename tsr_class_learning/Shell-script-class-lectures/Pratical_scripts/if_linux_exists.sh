#!/bin/bash

OS="$(uname -s)"

if [ "$OS" = "Linux" ]
then
   echo "You are using the right OS called $OS"
else
   echo "This OS is not a $OS operating system"
fi

whoami=$(whoami)
if [ "$whoami" = "tsrlearning-lab" ]; then
	echo "$whoami is a correct username"
else
	echo "Please pass the correct username"
fi

