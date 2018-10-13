#!/bin/bash
if [ $(uname -s) != 'Linux' ]; then printf "only meant to run on Linux!\n"; exit 1; fi

if [ ! -f /etc/lsb-release ]; then
  printf "scripts are only meant for Ubuntu 18.04\n\n"
  exit 2;
fi

nusr=$USER

if  [ ${nusr} = "root" ]; then
    printf "do NOT run as sudo\n\n"
    exit 3
fi