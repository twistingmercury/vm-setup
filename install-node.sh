#!/bin/bash
if [ -e "/usr/bin/nodejs" ]; then
    echo "nodejs is already installed. Moving on..."
    exit 0
fi

printf "installing Node.js 8.3, Typescript, and Mocha globally ..."
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt install -y nodejs
sudo npm install -g typescript ts-node ts-node-dev mocha

if [ -e "/usr/bin/yarn" ]; then
    echo "installing yarn ..."
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn
    echo "finished installing yarn!"
fi

echo "finished installing Node.js 8.3, Typescript, and Mocha!"