#!/bin/bash

URL="https://www.tsrlearning.io"
RESPONSE=$(curl -Is "$URL" | head -1 | awk '{print $2}')

if [ "$RESPONSE" -eq "200" ]; then
   echo "URL is reachable with a (200 ok status)"
else
   echo "URL is not reachable with a Repsonse code: $RESPONSE"
   exit 1
fi

