#!/bin/bash
if [ $(dpkg-query -W -f='${Status}' openjdk-8-jre-headless 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    printf "installing compatible version of JRE for Cassandra...\n"

    sudo apt install -y openjdk-8-jre-headless

    printf "finished installing JRE!\n\n"
else
    echo openjdk-8-jre-headless already installed. Moving on...
fi

if [ $(dpkg-query -W -f='${Status}' cassandra 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    printf "installing Cassandra...\n"

    echo "deb http://www.apache.org/dist/cassandra/debian 36x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.list
    gpg --keyserver pgp.mit.edu --recv-keys 749D6EEC0353B12C
    gpg --export --armor 749D6EEC0353B12C | sudo apt-key add -
    sudo apt-get update > /dev/null
    sudo apt install -y cassandra
    sudo apt-get clean

    sudo systemctl enable cassandra
    sudo systemctl start cassandra

    printf "\ninstalling python cassandra-driver...\n"
    sudo -H pip install cassandra-driver

    printf "finished installing Cassandra!\n\n"
else
    echo Cassasndra already installed. Moving on...
fi


