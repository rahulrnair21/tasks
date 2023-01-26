#!/bin/bash

if [ "$#" -eq  "0" ];
  then
    echo "No arguments supplied, Script usage $0 blue or $0 green "
    exit 1
fi

if [[ "$1"  == "green" ]];
   then
     sed -i "s/blue/$1/g" istio.yml
     kubectl apply -f istio.yml
elif [[ "$1" == "blue" ]];
   then
     sed -i "s/green/$1/g" istio.yml
     kubectl apply -f istio.yml
else
     echo "Wrong usage.Script usage $0 blue or $0 green "
fi

