#!/bin/bash
if [ -d "/usr/local/go" ]; then
    printf "Go language is alread installed. Moving on...\n"
    exit 0
fi

printf "installing Go 1.10.3 ...\n"
wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz
sudo rm go1.10.3.linux-amd64.tar.gz
printf "finished installing Go!\n\n"
