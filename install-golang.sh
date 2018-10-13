#!/bin/bash
nusr=$USER

if  [ ${nusr} = "root" ]; then
    printf "do NOT run as sudo\n\n"
    exit 1
fi

if [ -d "/usr/local/go" ]; then
    printf "Go language is alread installed. Moving on...\n"
else
    printf "installing Go...\n"
    wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.11.1.linux-amd64.tar.gz
    sudo rm go1.11.1.linux-amd64.tar.gz
    printf "finished installing Go!\n\n"
fi

if [ -s "/home/${nusr}/go/src" ]; then
    echo the user ${nusr}\'s go workspace already exists.  Moving on...
    exit 0
fi

printf "setting up Go workspace for ${nusr} ...\n"
echo 'export GOROOT=/usr/local/go' >> /home/${nusr}/.bashrc
echo 'export GOPATH=$HOME/go' >> /home/${nusr}/.bashrc
echo 'export PATH=${PATH}:${GOROOT}/bin' >> /home/${nusr}/.bashrc
echo 'export PATH=${PATH}:${GOPATH}/bin' >> /home/${nusr}/.bashrc

# --> needed for the workspace setup
export GOROOT=/usr/local/go
export GOPATH=/home/${nusr}/go
export GOBIN=$GOPATH/bin
export PATH=${PATH}:${GOROOT}/bin
export PATH=${PATH}:${GOPATH}/bin

printf "creating Go workspace  ...\n"
mkdir -p $GOPATH/src $GOPATH/bin $GOPATH/pkg
chown -R ${nusr}:${nusr} $GOPATH

printf 'finished installing Go!\n'