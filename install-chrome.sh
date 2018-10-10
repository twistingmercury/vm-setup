#!/bin/bash
if [ -e "/usr/bin/google-chrome-stable" ]; then
    printf "Google Chrome browser is already installed. Moving on...\n"
    exit 0
fi

printf "installing Google Chrome browser...\n"
sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get -y install google-chrome-stable
sudo apt-get clean

printf "\nfinished installing Google Chrome browser!\n\n"