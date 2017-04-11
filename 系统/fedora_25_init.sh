#!/bin/bash

#systemctl start sshd.service
#chmod +x fedora_25_init.sh

systemctl enable sshd.service
systemctl disable firewalld.service
systemctl stop firewalld.service

dnf copr enable librehat/shadowsocks
dnf update -y
dnf install vim -y
dnf install shadowsocks-qt5 -y

dnf install ruby -y
gem install sass

dnf install php -y
dnf install npm -y
npm install http-server -g

cp /run/media/root/'VMware Tools'/VMwareTools-10.1.6-5214329.tar.gz ~
tar -xzv -f VMwareTools-10.1.6-5214329.tar.gz
cd ~
./vmware-tools-distrib/vmware-install.pl
