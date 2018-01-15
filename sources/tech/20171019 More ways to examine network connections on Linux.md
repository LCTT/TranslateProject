translating by kimii
More ways to examine network connections on Linux
======
The ifconfig and netstat commands are incredibly useful, but there are many other commands that can help you see what's up with you network on Linux systems. Today's post explores some very handy commands for examining network connections.

### ip command

The **ip** command shows a lot of the same kind of information that you'll get when you use **ifconfig**. Some of the information is in a different format  - e.g., "192.168.0.6/24" instead of "inet addr:192.168.0.6 Bcast:192.168.0.255" and ifconfig is better for packet counts, but the ip command has many useful options.

First, here's the **ip a** command listing information on all network interfaces.
```
$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 inet 127.0.0.1/8 scope host lo
 valid_lft forever preferred_lft forever
 inet6 ::1/128 scope host
 valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 link/ether 00:1e:4f:c8:43:fc brd ff:ff:ff:ff:ff:ff
 inet 192.168.0.6/24 brd 192.168.0.255 scope global eth0
 valid_lft forever preferred_lft forever
 inet6 fe80::21e:4fff:fec8:43fc/64 scope link
 valid_lft forever preferred_lft forever

```

If you want only to see a simple list of network interfaces, you can limit its output with **grep**.
```
$ ip a | grep inet
 inet 127.0.0.1/8 scope host lo
 inet6 ::1/128 scope host
 inet 192.168.0.6/24 brd 192.168.0.255 scope global eth0
 inet6 fe80::21e:4fff:fec8:43fc/64 scope link

```

You can get a glimpse of your default route using a command like this:
```
$ ip route show
default via 192.168.0.1 dev eth0
192.168.0.0/24 dev eth0 proto kernel scope link src 192.168.0.6

```

In this output, you can see that the default gateway is 192.168.0.1 through eth0 and that the local network is the fairly standard 192.168.0.0/24.

You can also use the **ip** command to bring network interfaces up and shut them down.
```
$ sudo ip link set eth1 up
$ sudo ip link set eth1 down

```

### ethtool command

Another very useful tool for examining networks is **ethtool**. This command provides a lot of descriptive data on network interfaces.
```
$ ethtool eth0
Settings for eth0:
 Supported ports: [ TP ]
 Supported link modes: 10baseT/Half 10baseT/Full
 100baseT/Half 100baseT/Full
 1000baseT/Full
 Supported pause frame use: No
 Supports auto-negotiation: Yes
 Advertised link modes: 10baseT/Half 10baseT/Full
 100baseT/Half 100baseT/Full
 1000baseT/Full
 Advertised pause frame use: No
 Advertised auto-negotiation: Yes
 Speed: 100Mb/s
 Duplex: Full
 Port: Twisted Pair
 PHYAD: 1
 Transceiver: internal
 Auto-negotiation: on
 MDI-X: on (auto)
Cannot get wake-on-lan settings: Operation not permitted
 Current message level: 0x00000007 (7)
 drv probe link
 Link detected: yes

```

You can also use the **ethtool** command to examine ethernet driver settings.
```
$ ethtool -i eth0
driver: e1000e
version: 3.2.6-k
firmware-version: 1.4-0
expansion-rom-version:
bus-info: 0000:00:19.0
supports-statistics: yes
supports-test: yes
supports-eeprom-access: yes
supports-register-dump: yes
supports-priv-flags: no

```

The autonegotiation details can be displayed with a command like this:
```
$ ethtool -a eth0
Pause parameters for eth0:
Autonegotiate: on
RX: on
TX: on

```

### traceroute command

The **traceroute** command displays routing pathways. It works by using the TTL (time to live) field in the packet header in a series of packets to capture the path that packets take and how long they take to get from one hop to the next. Traceroute's output helps to gauge the health of network connections, since some routes might take much longer to reach the eventual destination.
```
$ sudo traceroute world.std.com
traceroute to world.std.com (192.74.137.5), 30 hops max, 60 byte packets
 1 192.168.0.1 (192.168.0.1) 3.691 ms 3.678 ms 3.665 ms
 2 10.224.64.1 (10.224.64.1) 26.273 ms 27.354 ms 28.574 ms
 3 10.20.0.33 (10.20.0.33) 28.293 ms 30.625 ms 33.959 ms
 4 10.20.0.226 (10.20.0.226) 36.807 ms 37.868 ms 37.857 ms
 5 204.111.0.132 (204.111.0.132) 38.256 ms 39.091 ms 40.429 ms
 6 ash-b1-link.telia.net (80.239.161.69) 41.612 ms 28.214 ms 29.573 ms
 7 xe-1-3-1.er1.iad10.us.zip.zayo.com (64.125.13.157) 30.429 ms 27.915 ms 29.065 ms
 8 ae6.cr1.dca2.us.zip.zayo.com (64.125.20.117) 31.353 ms 32.413 ms 33.821 ms
 9 ae27.cs1.dca2.us.eth.zayo.com (64.125.30.246) 43.474 ms 44.519 ms 46.037 ms
10 ae4.cs1.lga5.us.eth.zayo.com (64.125.29.202) 48.107 ms 48.960 ms 50.024 ms
11 ae8.mpr3.bos2.us.zip.zayo.com (64.125.30.139) 51.626 ms 51.200 ms 39.283 ms
12 64.124.51.229.t495-rtr.towerstream.com (64.124.51.229) 40.233 ms 41.295 ms 39.651 ms
13 69.38.149.18 (69.38.149.18) 44.955 ms 46.210 ms 55.673 ms
14 64.119.137.154 (64.119.137.154) 56.076 ms 56.064 ms 56.052 ms
15 world.std.com (192.74.137.5) 63.440 ms 63.886 ms 63.870 ms

```

### tcptraceroute command

The **tcptraceroute** command does basically the same thing as traceroute except that it is able to bypass the most common firewall filters. As the command's man page explains, tcptraceroute sends out TCP SYN packets instead of UDP or ICMP ECHO packets, thus making it less susceptible to being blocked.

### tcpdump command

The **tcpdump** command allows you to capture network packets for later analysis. With the -D option, it lists available interfaces.
```
$ tcpdump -D
1.eth0 [Up, Running]
2.any (Pseudo-device that captures on all interfaces) [Up, Running]
3.lo [Up, Running, Loopback]
4.nflog (Linux netfilter log (NFLOG) interface)
5.nfqueue (Linux netfilter queue (NFQUEUE) interface)
6.usbmon1 (USB bus number 1)
7.usbmon2 (USB bus number 2)
8.usbmon3 (USB bus number 3)
9.usbmon4 (USB bus number 4)
10.usbmon5 (USB bus number 5)
11.usbmon6 (USB bus number 6)
12.usbmon7 (USB bus number 7)

```

The -v (verbose) option controls how much detail you will see -- more v's, more details, but more than three v's doesn't add anything more.
```
$ sudo tcpdump -vv host 192.168.0.32
tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes
20:26:31.321816 IP (tos 0x10, ttl 64, id 22411, offset 0, flags [DF], proto TCP (6), length 184)
 192.168.0.6.ssh > 192.168.0.32.57294: Flags [P.], cksum 0x8221 (incorrect -> 0x0254), seq 3891093411:3891093555, ack 2388988308, win 329, length 144
20:26:31.321984 IP (tos 0x10, ttl 64, id 22412, offset 0, flags [DF], proto TCP (6), length 200)
 192.168.0.6.ssh > 192.168.0.32.57294: Flags [P.], cksum 0x8231 (incorrect -> 0x3db0), seq 144:304, ack 1, win 329, length 160
20:26:31.323791 IP (tos 0x0, ttl 128, id 20259, offset 0, flags [DF], proto TCP (6), length 40)
 192.168.0.32.57294 > 192.168.0.6.ssh: Flags [.], cksum 0x643d (correct), seq 1, ack 304, win 385, length 0
20:26:31.383954 IP (tos 0x10, ttl 64, id 22413, offset 0, flags [DF], proto TCP (6), length 248)
...

```

Expect to see a _lot_ of output when you run commands like this one.

This command captures 11 packets from a specific host and over eth0. The -w option identifies the file that will contain the capture packets. In this example command, we've only asked to capture 11 packets.
```
$ sudo tcpdump -c 11 -i eth0 src 192.168.0.32 -w packets.pcap
tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes
11 packets captured
11 packets received by filter
0 packets dropped by kernel

```

### arp command

The arp command maps IPv4 addresses to hardware addresses. The information provided can also be used to identify the systems to some extent, since the network adaptors in use can tell you something about the systems using them. The second MAC address below, starting with f8:8e:85, is easily identified as a Comtrend router.
```
$ arp -a
? (192.168.0.12) at b0:c0:90:3f:10:15 [ether] on eth0
? (192.168.0.1) at f8:8e:85:35:7f:b9 [ether] on eth0

```

The first line above shows the MAC address for the network adaptor on the system itself. This network adaptor appears to have been manufactured by Chicony Electronics in Taiwan. You can look up MAC address associations fairly easily on the web with tools such as this one from Wireshark -- https://www.wireshark.org/tools/oui-lookup.html


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3233306/linux/more-ways-to-examine-network-connections-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
