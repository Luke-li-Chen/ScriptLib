#!/bin/bash

# 关防火墙
systemctl stop firewalld
systemctl disable firewalld

# 配置 eth0 为 LAN 口
nmcli con del eth0
#nmcli con del "Wired connection 1"
nmcli con add con-name eth0 ifname eth0 autoconnect yes type Ethernet ip4 192.168.12.21/24 ip6 fe80::1/64
# 以 eth1 为 WAN 口，保持自动获取不变

# 设置 NAT
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

# 保存 iptables 规则
iptables-save > /etc/iptables.rules

# 设置开机加载 iptables 规则
echo "#!/bin/bash" > /etc/rc.d/init.d/if-up-iptables
echo "iptables-restore < /etc/iptables.rules" >> /etc/rc.d/init.d/if-up-iptables
chmod +x /etc/rc.d/init.d/if-up-iptables
echo "bash /etc/rc.d/init.d/if-up-iptables" >> /etc/rc.d/rc.local 
chmod +x /etc/rc.d/rc.local

# 开启内核 IP 转发
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf 

reboot
