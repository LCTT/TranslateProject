translating by Flowsnow

How to check your network connections on Linux
======

![](https://images.idgesg.net/images/article/2018/03/network-connections-100751906-large.jpg)
The **ip** command has a lot to tell you about the configuration and state of your network connections, but what do all those words and numbers mean? Let’s take a deep dive in and see what all the displayed values are trying to tell you.

When you use the **ip a** (or **ip addr** ) command to get information on all the network interfaces on your system, you're going to see something like this:
```
$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 inet 127.0.0.1/8 scope host lo
 valid_lft forever preferred_lft forever
 inet6 ::1/128 scope host
 valid_lft forever preferred_lft forever
2: enp0s25: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 link/ether 00:1e:4f:c8:43:fc brd ff:ff:ff:ff:ff:ff
 inet 192.168.0.24/24 brd 192.168.0.255 scope global dynamic enp0s25
 valid_lft 57295sec preferred_lft 57295sec
 inet6 fe80::2c8e:1de0:a862:14fd/64 scope link
 valid_lft forever preferred_lft forever

```

The two interfaces on this system — the loopback (lo) and network (enp0s25) — are displayed along with a lot of stats. The "lo" interface is clearly the loopback. We can see the loopback IPv4 address (127.0.0.1) and the loopback IPv6 ( **::1** ) in the listing. The normal network interface is more interesting.

### Why enp0s25 and not eth0

If you're wondering why it's called **enp0s25** on this system instead of the likely more familiar **eth0** , a little explanation is in order.

The new naming scheme is referred to as the “Predictable Network Interface” naming. It’s been used on systemd-based Linux systems for some time. The interface name depends on the physical location of the hardware. The " **en** " simply means "ethernet" just like "eth" does for eth0. The " **p** " is the bus number of the ethernet card and the " **s** " is the slot number. So "enp0s25" tells us a lot about the hardware we're working with.

The <BROADCAST,MULTICAST,UP,LOWER_UP> string of settings tell us that ...
```
BROADCAST the interface supports broadcasting
MULTICAST the interface supports multicasting
UP the network interface is enabled
LOWER_UP the network cable is plugged in and device connected to network
mtu 1500 the maximum transfer unit (packet size) is 1,500 bytes

```

The other values listed also tell us a lot about the interface, but we need to know what words like "brd" and "qlen" represent. So, here's a translation of the rest of the **ip a** shown above.
```
mtu 1500 maximum transfer unit (packet size)
qdisc pfifo_fast used for packet queueing
state UP network interface is up
group default interface group
qlen 1000 transmission queue length
link/ether 00:1e:4f:c8:43:fc MAC(hardware) address of the interface
brd ff:ff:ff:ff:ff:ff broadcast address
inet 192.168.0.24/24 IPv4 address
brd 192.168.0.255 broadcast address
scope global valid everywhere
dynamic enp0s25 address is dynamically assigned
valid_lft 80866sec valid lifetime for IPv4 address
preferred_lft 80866sec preferred lifetime for IPv4 address
inet6 fe80::2c8e:1de0:a862:14fd/64      IPv6 address
scope link valid only on this device
valid_lft forever valid lifetime for IPv6 address
preferred_lft forever preferred lifetime for IPv6 address

```

You might have noticed that some of the information that the ifconfig command provides is not included in the **ip a** output — such as the stats on transmitted packets. If you want to see a list of the number of packets transmitted and received along with collisions, you can use this ip command:
```
$ ip -s link show enp0s25
2: enp0s25: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
 link/ether 00:1e:4f:c8:43:fc brd ff:ff:ff:ff:ff:ff
 RX: bytes packets errors dropped overrun mcast
 224258568 418718 0 0 0 84376
 TX: bytes packets errors dropped carrier collsns
 6131373 78152 0 0 0 0

```

Another **ip** command provides information on a system's routing table.
```
$ ip route show
default via 192.168.0.1 dev enp0s25 proto static metric 100
169.254.0.0/16 dev enp0s25 scope link metric 1000
192.168.0.0/24 dev enp0s25 proto kernel scope link src 192.168.0.24 metric 100

```

The **ip** command is extremely versatile. You can get a helpful cheat sheet on the **ip** command and its options from [Red Hat][1].

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3262045/linux/checking-your-network-connections-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf
