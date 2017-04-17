#!/bin/bash

yum update -y

yum groupinstall -y "Development Tools"
# Xshell 文件传输
yum install -y lrzsz
yum install -y nmap
yum install -y vim
yum install -y net-tools
yum install -y iw
yum install -y wget
yum install -y libnl-devel
yum install -y openssl-devel

