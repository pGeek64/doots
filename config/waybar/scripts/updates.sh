#!/bin/bash

updates=$(checkupdates)

if [ -z "$updates" ]; then
  echo "Updated"
else
  echo "$updates" | wc -l
  echo "$updates" | column -t | tr '\n' '\r'
fi

