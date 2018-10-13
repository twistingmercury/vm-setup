#!/bin/bash

if [ $(uname -s) != 'Linux' ]; then echo "nope"; exit 1; fi

if [ ! -f /etc/lsb-release ]; then
  printf "scripts are only meant for Ubuntu 18.04\n\n"
  exit 2;
fi

echo yeah! All the linux!