#!/bin/bash
if [ $(uname -s) != 'Linux' ]; then printf "only meant to run on Linux!\n"; exit 1; fi

if [ ! -f /etc/lsb-release ]; then
  printf "scripts are only meant for Ubuntu 18.04\n\n"
  exit 2;
fi

if  [ ${USER} = "root" ]; then printf "do NOT run as sudo!\n"; exit 3; fi

echo "updating/upgrading existing packages..."
sudo apt-get update > /dev/null && sudo apt-get upgrade -y  > /dev/null 

sh ./install-prereqs.sh
if [ $? -ne 0 ]; then echo "prerequisites installation failed"; exit 1; fi

sh ./install-docker.sh
if [ $? -ne 0 ]; then echo "docker installation failed"; exit 1; fi

sh ./install-kubectl.sh
if [ $? -ne 0 ]; then echo "kubectl installation failed"; exit 1; fi

sh ./install-golang.sh
if [ $? -ne 0 ]; then echo "Go language installation failed"; exit 1; fi

sh ./install-node.sh
if [ $? -ne 0 ]; then echo "Node,js installation failed"; exit 1; fi

sh ./install-vscode.sh
if [ $? -ne 0 ]; then echo "Visual Studio Code installation failed"; exit 1; fi

sh ./install-cassandra.sh
if [ $? -ne 0 ]; then echo "Cassandra installation failed"; exit 1; fi

echo "setup complete!"
