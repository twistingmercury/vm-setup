#!/bin/bash
if [ -e "/usr/bin/docker" ]; then
    printf "Docker-CE is already installed. Moving on...\n"
    exit 0
fi

printf "installing Docker-CE & Docker Compose...\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
sudo apt-get update && apt-get install -y docker-ce docker-compose
sudo apt-get clean

printf "\nfinished installing Docker-CE & Docker Compose!\n\n"
