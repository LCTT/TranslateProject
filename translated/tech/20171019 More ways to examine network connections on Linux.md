检查 linux 上网络连接的更多方法
======
ifconfig 和 netstat 命令当然非常有用，但还有很多其他命令能帮你查看 linux 系统上的网络状况。本文探索了一些检查网络连接的非常简便的命令。 

### ip 命令

**ip** 命令显示了许多与你使用 **ifconfig** 命令时的一样信息。其中一些信息以不同的格式呈现，比如使用“192.168.0.6/24”，而不是“inet addr:192.168.0.6 Bcast:192.168.0.255”，尽管 ifconfig 更适合数据包计数，但 ip 命令有许多有用的选项。

首先，这里是 **ip a** 命令列出的所有网络接口的信息。
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

如果你只想看到简单的网络接口列表，你可以用 **grep** 限制它的输出。
```
$ ip a | grep inet
 inet 127.0.0.1/8 scope host lo
 inet6 ::1/128 scope host
 inet 192.168.0.6/24 brd 192.168.0.255 scope global eth0
 inet6 fe80::21e:4fff:fec8:43fc/64 scope link

```

使用如下面的命令，你可以看到你的默认路由：
```
$ ip route show
default via 192.168.0.1 dev eth0
192.168.0.0/24 dev eth0 proto kernel scope link src 192.168.0.6

```

在这个输出中，你可以看到通过 eth0 的默认网关是 192.168.0.1，并且本地网络是相当标准的 192.168.0.0/24。

你也可以使用 **ip** 命令来启用和禁用网络接口。
```
$ sudo ip link set eth1 up
$ sudo ip link set eth1 down

```

### ethtool 命令

另一个检查网络非常有用的工具是 **ethtool**。这个命令提供了网络接口上的许多描述性的数据。
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

你也可以使用 **ethtool** 命令来检查以太网驱动设置。
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

自动协商的详细信息可以用这样的命令来显示：
```
$ ethtool -a eth0
Pause parameters for eth0:
Autonegotiate: on
RX: on
TX: on

```

### traceroute 命令


**traceroute** 命令显示路由路径。它通过在一系列数据包中设置数据包头的TTL（生存时间）字段来捕获数据包所经过的路径，以及数据包从一跳到下一跳需要的时间。Traceroute 的输出有助于评估网络连接的健康状况，因为某些路由可能需要花费更长的时间才能到达最终的目的地。
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

### tcptraceroute 命令

**tcptraceroute** 命令与 traceroute 基本上是一样的，只是它能够绕过最常见的防火墙的过滤。正如该命令的手册页所述，tcptraceroute 发送 TCP SYN 数据包而不是 UDP 或 ICMP ECHO 数据包，所以其不易被阻塞。

### tcpdump 命令

**tcpdump** 命令允许你捕获网络数据包来进一步分析。使用 -D 选项列出可用的网络接口。
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

-v（verbose）选项控制你看到的细节程度--越多的 v,越详细，但超过 3 个 v 不会有更多意义。
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

当你运行像这样的命令时，会看到非常多的输出。

这个命令捕获来自特定主机和 eth0 上的 11 个数据包。-w 选项标识保存捕获包的文件。在这个示例命令中，我们只要求捕获 11 个数据包。

```
$ sudo tcpdump -c 11 -i eth0 src 192.168.0.32 -w packets.pcap
tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes
11 packets captured
11 packets received by filter
0 packets dropped by kernel

```

### arp 命令

arp 命令将 IPv4 地址映射到硬件地址。它所提供的信息也可以在一定程度上用于识别系统，因为网络适配器可以告诉你使用它们的系统的一些信息。下面的第二个MAC 地址，从 f8：8e：85 开始，很容易被识别为 Comtrend 路由器。

```
$ arp -a
? (192.168.0.12) at b0:c0:90:3f:10:15 [ether] on eth0
? (192.168.0.1) at f8:8e:85:35:7f:b9 [ether] on eth0

```

上面的第一行显示了系统本身的网络适配器的 MAC 地址。该网络适配器似乎已由台湾 Chicony 电子公司制造。你可以很容易地在网上查找 MAC 地址关联，例如来自 Wireshark 的这个工具 -- https://www.wireshark.org/tools/oui-lookup.html

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3233306/linux/more-ways-to-examine-network-connections-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[kimii](https://github.com/kimii)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
