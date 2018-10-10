#!/bin/bash
#nusr=$1

echo "updating/upgrading existing packages..."
sudo apt-get update && sudo apt-get upgrade -y

sudo sh ./install-prereqs.sh
if [ $? -ne 0 ]; then echo "prerequisites installation failed"; exit 1; fi

sudo sh ./install-docker.sh
if [ $? -ne 0 ]; then echo "docker installation failed"; exit 1; fi

sudo sh ./install-kubectl.sh
if [ $? -ne 0 ]; then echo "kubectl installation failed"; exit 1; fi

sudo sh ./install-go-lng.sh
if [ $? -ne 0 ]; then echo "Go language installation failed"; exit 1; fi

sudo sh ./install-node.sh
if [ $? -ne 0 ]; then echo "Node,js installation failed"; exit 1; fi

sudo sh ./install-vscode.sh
if [ $? -ne 0 ]; then echo "Visual Studio Code installation failed"; exit 1; fi

sudo sh ./install-chrome.sh
if [ $? -ne 0 ]; then echo "Google Chrome installation failed"; exit 1; fi

if [ ! -e /usr/local/sbin/adduser.local ]; then
    sudo cp ./adduser.local /usr/local/sbin/
    sudo chmod +x /usr/local/sbin/adduser.local
    if [  $?  -ne  0  ]; then echo "copy of adduser.local script failed"; exit 1; fi
    echo "adduser.local copied successfully!"
else
    echo "adduser.local already exists. Moving on ..."
fi

# if [ -z "${nusr}" ]; then
#     if [ ! -d /home/${nusr} ]; then  
#         sudo adduser ${nusr}
#         sudo usermod -aG sudo ${nusr}
#         sudo usermod -aG docker ${nusr}
#     fi

#     sudo usermod -aG sudo ${nusr}
#     sudo usermod -aG docker ${nusr}
    
#     if [ $? -ne 0 ]; then 
#         echo "failed to add user ${nusr}"
#         exit 1
#     fi
# fi

echo "setup complete!"
