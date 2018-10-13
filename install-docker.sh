#!/bin/bash
nusr=$USER

if  [ ${nusr} = "root" ]; then
    printf "do NOT run as sudo\n\n"
    exit 1
fi

if [ -e "/usr/bin/docker" ]; then
    printf "Docker-CE is already installed. Moving on...\n"
    exit 0
fi

printf "installing Docker-CE & Docker Compose...\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
sudo apt-get update > /dev/null
sudo apt-get install -y docker-ce docker-compose
sudo apt-get clean

sudo usermod -aG docker ${nusr}

printf "\nfinished installing Docker-CE & Docker Compose!\n\n"
