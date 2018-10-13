#!/bin/bash
if [ $(uname -s) != 'Linux' ]; then printf "only meant to run on Linux!\n"; exit 1; fi

if [ ! -f /etc/lsb-release ]; then
  printf "scripts are only meant for Ubuntu 18.04\n\n"
  exit 2;
fi

if [ -e "/usr/bin/code" ]; then
    printf "Visual Studio Code is already installed. Moving on...\n"
    exit 0
fi

printf "installing Visual Studio Code...\n"

echo deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main > /etc/apt/sources.list.d/vscode.list
sudo curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo apt-get update > /dev/null
sudo apt-get install code -y
sudo apt-get clean

printf "\nfinished installing Visual Studio Code!\n"