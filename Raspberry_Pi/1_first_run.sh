#!/bin/bash

# automatically resize / partition
/usr/local/bin/rootfs-expand

# For wifi on the rpi3
curl --location https://github.com/RPi-Distro/firmware-nonfree/raw/master/brcm80211/brcm/brcmfmac43430-sdio.bin > /usr/lib/firmware/brcm/brcmfmac43430-sdio.bin
curl --location https://github.com/RPi-Distro/firmware-nonfree/raw/master/brcm80211/brcm/brcmfmac43430-sdio.txt > /usr/lib/firmware/brcm/brcmfmac43430-sdio.txt

# Set time zone
echo "TZ='Asia/Shanghai'; export TZ" >> /etc/profile

systemctl reboot
