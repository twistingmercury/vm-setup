#!/bin/bash
printf "installing prereqisite packages ...\n"

if [ $(dpkg-query -W -f='${Status}' linux-headers-$(uname -r) 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    if [ $($(uname -a) 2>/dev/null | grep -c "SMP Debian") -eq 1 ]; then
        sudo echo "deb http://ftp.debian.org/debian stretch-backports main contrib" >> /etc/apt/sources.list
    fi
    sudo apt-get install -y linux-headers-$(uname -r)
else
    echo linux-headers-$(uname -r) already installed. Moving on...
fi

if [ $(dpkg-query -W -f='${Status}' build-essential 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    sudo apt-get install -y build-essential
else
    echo build-essential already installed. Moving on...
fi

if [ $(dpkg-query -W -f='${Status}' dkms 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    sudo apt-get install -y dkms
else
    echo dkms already installed. Moving on...
fi

if [ $(dpkg-query -W -f='${Status}' apt-transport-https 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    sudo apt-get install -y apt-transport-https
else
    echo apt-transport-https already installed. Moving on...
fi

if [ $(dpkg-query -W -f='${Status}' ca-certificates 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    sudo apt-get install -y ca-certificates
else
    echo ca-certificates already installed. Moving on...
fi

if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    sudo apt-get install -y curl
else
    echo curl already installed. Moving on...
fi

if [ $(dpkg-query -W -f='${Status}' gnupg2 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  sudo apt-get install -y gnupg2
else
    echo gnupg2 already installed. Moving on...
fi

if [ $(dpkg-query -W -f='${Status}' software-properties-common 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    sudo apt-get install -y software-properties-common
else
    echo software-properties-common already installed. Moving on...
fi

if [ $(dpkg-query -W -f='${Status}' openssh-server 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    sudo apt-get install -y openssh-server
else
   echo openssh-server already installed. Moving on...
fi

if [ ! -d /opt/VBoxGuestAdditions-5.2.14 ]; then
    printf "installing VBoxGuestAdditions...\n"
    wget http://download.virtualbox.org/virtualbox/5.2.14/VBoxGuestAdditions_5.2.14.iso
    sudo mkdir /media/VBoxGuestAdditions
    sudo mount -o loop,ro VBoxGuestAdditions_5.2.14.iso /media/VBoxGuestAdditions
    sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
    sudo umount /media/VBoxGuestAdditions
    rm VBoxGuestAdditions_5.2.14.iso
    sudo rmdir /media/VBoxGuestAdditions

    printf "finished VBoxGuestAdditions ...\n\n"
else
    echo "VBoxGuestAdditions already installed. Moving on..."
fi

if [ $(dpkg-query -W -f='${Status}' lightdm 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    sudo apt-get install -y lightdm
else
   echo lightdm already installed. Moving on...
fi