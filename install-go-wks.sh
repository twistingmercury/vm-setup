#!/bin/bash
nusr=$1
if  [ ${nusr} == "root" ]; then
    printf "do NOT run as sudo! Example:\n    $ sh ./install-go.wks.sh\n\n"
    exit 1
fi

if[ -s home/${nusr}/go/src ]; then
    echo the user ${nusr}\'s go workspace already exists.  Moving on...
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

printf 'installing dep  ...\n'
sudo curl https://raw.githubnusrcontent.com/golang/dep/master/install.sh | sh
printf 'finished installing dep!\n'
printf 'finished installing Go!\n'