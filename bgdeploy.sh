#!/bin/bash

if [ "$#" -eq  "0" ];
  then
    echo "No arguments supplied, Script usage $0 blue or $0 green "
    exit 1
fi
if [[ "$1"  == "green" ]];
   then
     helm upgrade --install   green-deploy  ./bluegreen --set green.enabled=true
elif [[ "$1" == "blue" ]];
   then
     helm upgrade --install   blue-deploy  ./bluegreen --set blue.enabled=true
else
     echo "Wrong usage.Script usage $0 blue or $0 green "
fi
