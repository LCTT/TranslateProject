[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Check the Available Network Interfaces, Associated IP Addresses, MAC Addresses, and Interface Speed on Linux)
[#]: via: (https://www.2daygeek.com/linux-unix-check-network-interfaces-names-nic-speed-ip-mac-address/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Check the Available Network Interfaces, Associated IP Addresses, MAC Addresses, and Interface Speed on Linux
======

By default when you set up the server you will configure the primary network interface.

This is part of the build work that everyone does.

Sometimes you may need to configure an additional network interface for several reasons.

This could be a network bonding/teaming or high availability or a separate interface for application requirements or backups.

To do so, you need to know how many interfaces your computer has and their speed to configure it.

There are many commands to check for available network interfaces, but we only use the IP command.

Later we will write a separate article with all these tools.

In this tutorial, we will show you the Available Network Interface Card (NIC) information, such as the interface name, associated IP address, MAC address, and interface speed.

### What’s IP Command

**[IP command][1]** is similar to ifconfig, which is used to for assigning Static IP Address, Route &amp; Default Gateway, etc.,

```
# ip a

1: lo: mtu 65536 qdisc noqueue state UNKNOWN
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether fa:16:3e:a0:7d:5a brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.101/24 brd 192.168.1.101 scope global eth0
    inet6 fe80::f816:3eff:fea0:7d5a/64 scope link
       valid_lft forever preferred_lft forever
```

### What’s ethtool Command

The ethtool is used to query or control network driver and hardware settings.

```
# ethtool eth0
```

### 1) How to Check the Available Network Interfaces on Linux Using the IP Command

When you run the IP command without any arguments, it gives you plenty of information, but if you only need the available network interfaces, use the following customized IP command.

```
# ip a |awk '/state UP/{print $2}'

eth0:
eth1:
```

### 2) How to Check the IP Address of a Network Interface on Linux Using the IP Command

If you only want to see which IP address is assigned to which interface, use the following customized IP command.

```
# ip -o a show | cut -d ' ' -f 2,7
or
ip a |grep -i inet | awk '{print $7, $2}'

lo 127.0.0.1/8
192.168.1.101/24
192.168.1.102/24
```

### 3) How to Check the Network Interface Card MAC Address on Linux Using the IP Command

If you only want to see the network interface name and the corresponding MAC address, use the following format.

To check a specific network interface MAC address.

```
# ip link show dev eth0 |awk '/link/{print $2}'
00:00:00:55:43:5c
```

To check MAC address for all network interface.

```
# vi /opt/scripts/mac-addresses.sh

#!/bin/sh
ip a |awk '/state UP/{print $2}' | sed 's/://' | while read output;
do
echo $output:
ethtool -P $output
done
```

Run the below shell script to get the MAC address for multiple network interfaces.

```
# sh /opt/scripts/mac-addresses.sh

eth0:
Permanent address: 00:00:00:55:43:5c
eth1:
Permanent address: 00:00:00:55:43:5d
```

### 4) How to Check the Network Interface Port Speed on Linux Using the ethtool Command

If you want to check the network interface port speed on Linux, use the ethtool command.

To check the speed of a particular network interface port.

```
# ethtool eth0 |grep "Speed:"

Speed: 10000Mb/s
```

To check the port speed for all network interfaces.

```
# vi /opt/scripts/port-speed.sh

#!/bin/sh
ip a |awk '/state UP/{print $2}' | sed 's/://' | while read output;
do
echo $output:
ethtool $output |grep "Speed:"
done
```

Run the below shell script to get the port speed for multiple network interfaces.

```
# sh /opt/scripts/port-speed.sh

eth0:
Speed: 10000Mb/s
eth1:
Speed: 10000Mb/s
```

### 5) Shell Script to Verify Network Interface Card Information

This **[shell script][2]** allows you to gather all of the above information, such as network interface names, IP addresses of network interfaces, MAC addresses of network interfaces, and the speed of a network interface port.

```
# vi /opt/scripts/nic-info.sh

#!/bin/sh
hostname
echo "-------------"
for iname in $(ip a |awk '/state UP/{print $2}')
do
echo "$iname"
ip a | grep -A2 $iname | awk '/inet/{print $2}'
ip a | grep -A2 $iname | awk '/link/{print $2}'
ethtool $iname |grep "Speed:"
done
```

Run the below shell script to check network card information.

```
# sh /opt/scripts/nic-info.sh

vps.2daygeek.com
----------------
eth0:
192.168.1.101/24
00:00:00:55:43:5c
Speed: 10000Mb/s
eth1:
192.168.1.102/24
00:00:00:55:43:5d
Speed: 10000Mb/s
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-unix-check-network-interfaces-names-nic-speed-ip-mac-address/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/ip-command-configure-network-interface-usage-linux/
[2]: https://www.2daygeek.com/category/shell-script/
