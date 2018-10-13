#!/bin/bash
nusr=$USER

if  [ ${nusr} = "root" ]; then
    printf "do NOT run as sudo!\n"
    exit 1
fi

if [ -e "/usr/bin/kubectl" ]; then
    printf "kubectl is already installed. Moving on...\n"
    exit 0
fi

printf "installing kubectl...\n"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update > /dev/null
sudo apt-get install -y kubectl
sudo apt-get clean

mkdir /home/${nusr}/.kube

printf "\nfinished installing kubectl!\n\n"