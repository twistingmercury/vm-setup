#!/bin/bash
if [ -e "/usr/bin/kubectl" ]; then
    printf "kubectl is already installed. Moving on...\n"
    exit 0
fi

printf "installing kubectl...\n"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
sudo apt-get clean

printf "\nfinished installing kubectl!\n\n"