检查 Linux 系统上的网络连接
============================================================

> Linux 系统提供了许多有用的命令来检查网络配置和连接。下面来看几个，包括 `ifquery`、`ifup`、`ifdown` 和 `ifconfig`。

Linux 上有许多可用于查看网络设置和连接的命令。在今天的文章中，我们将会通过一些非常方便的命令来看看它们是如何工作的。

### ifquery 命令

一个非常有用的命令是 `ifquery`。这个命令应该会显示一个网络接口列表。但是，你可能只会看到类似这样的内容 - 仅显示回环接口：

```
$ ifquery --list
lo
```

如果是这种情况，那说明你的 `/etc/network/interfaces` 不包括除了回环接口之外的网络接口信息。在下面的例子中，假设你使用 DHCP 来分配地址，且如果你希望它更有用的话，你可以添加例子最后的两行。

```
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet dhcp
```

### ifup 和 ifdown 命令

可以使用相关的 `ifup` 和 `ifdown` 命令来打开网络连接并根据需要将其关闭，只要该文件具有所需的描述性数据即可。请记住，“if” 在这里意思是<ruby>接口<rt>interface</rt></ruby>，这与 `ifconfig` 命令中的一样，而不是<ruby>如果我只有一个大脑<rt>if I only had a brain</rt></ruby> 中的 “if”。

### ifconfig 命令

另外，`ifconfig` 命令完全不读取 `/etc/network/interfaces`，但是仍然提供了网络接口相当多的有用信息 —— 配置数据以及可以告诉你每个接口有多忙的数据包计数。`ifconfig` 命令也可用于关闭和重新启动网络接口（例如：`ifconfig eth0 down`）。

```
$ ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:1e:4f:c8:43:fc
          inet addr:192.168.0.6  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::b44b:bdb6:2527:6ae9/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:60474 errors:0 dropped:0 overruns:0 frame:0
          TX packets:33463 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:43922053 (43.9 MB)  TX bytes:4000460 (4.0 MB)
          Interrupt:21 Memory:fe9e0000-fea00000
```

输出中的 RX 和 TX 数据包计数很低。此外，没有报告错误或数据包冲突。或许可以用 `uptime` 命令确认此系统最近才重新启动。

上面显示的广播 （Bcast） 和网络掩码 （Mask） 地址表明系统运行在 C 类等效网络（默认）上，所以本地地址范围从 `192.168.0.1` 到 `192.168.0.254`。

### netstat 命令

`netstat` 命令提供有关路由和网络连接的信息。`netstat -rn` 命令显示系统的路由表。192.168.0.1 是本地网关 （Flags=UG)。

```
$ netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.0.1     0.0.0.0         UG        0 0          0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 eth0
192.168.0.0     0.0.0.0         255.255.255.0   U         0 0          0 eth0
```

上面输出中的 `169.254.0.0` 条目仅在你正在使用或计划使用本地链路通信时才有必要。如果不是这样的话，你可以在 `/etc/network/if-up.d/avahi-autoipd` 中注释掉相关的行：

```
$ tail -12 /etc/network/if-up.d/avahi-autoipd
#if [ -x /bin/ip ]; then
#       # route already present?
#       ip route show | grep -q '^169.254.0.0/16[[:space:]]' && exit 0
#
#       /bin/ip route add 169.254.0.0/16 dev $IFACE metric 1000 scope link
#elif [ -x /sbin/route ]; then
#       # route already present?
#       /sbin/route -n | egrep -q "^169.254.0.0[[:space:]]" && exit 0
#
#       /sbin/route add -net 169.254.0.0 netmask 255.255.0.0 dev $IFACE metric 1000
#fi
```

### netstat -a 命令

`netstat -a` 命令将显示“所有”网络连接。为了将其限制为显示正在监听和已建立的连接（通常更有用），请改用 `netstat -at` 命令。

```
$ netstat -at
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 *:ssh                   *:*                     LISTEN
tcp        0      0 localhost:ipp           *:*                     LISTEN
tcp        0      0 localhost:smtp          *:*                     LISTEN
tcp        0    256 192.168.0.6:ssh         192.168.0.32:53550      ESTABLISHED
tcp6       0      0 [::]:http               [::]:*                  LISTEN
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN
tcp6       0      0 ip6-localhost:ipp       [::]:*                  LISTEN
tcp6       0      0 ip6-localhost:smtp      [::]:*                  LISTEN
```

### host 命令

`host` 命令就像 `nslookup` 一样，用来查询远程系统的 IP 地址，但是还提供系统的邮箱处理地址。

```
$ host world.std.com
world.std.com has address 192.74.137.5
world.std.com mail is handled by 10 smtp.theworld.com.
```

### nslookup 命令

`nslookup` 还提供系统中（本例中是本地系统）提供 DNS 查询服务的信息。

```
$ nslookup world.std.com
Server:         127.0.1.1
Address:        127.0.1.1#53

Non-authoritative answer:
Name:   world.std.com
Address: 192.74.137.5
```

### dig 命令

`dig` 命令提供了很多有关连接到远程系统的信息 - 包括与我们通信的名称服务器以及查询需要多长时间进行响应，并经常用于故障排除。

```
$ dig world.std.com

; <<>> DiG 9.10.3-P4-Ubuntu <<>> world.std.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28679
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;world.std.com.                 IN      A

;; ANSWER SECTION:
world.std.com.          78146   IN      A       192.74.137.5

;; Query time: 37 msec
;; SERVER: 127.0.1.1#53(127.0.1.1)
;; WHEN: Mon Oct 09 13:26:46 EDT 2017
;; MSG SIZE  rcvd: 58
```

### nmap 命令

`nmap` 经常用于探查远程系统，但是同样也用于报告本地系统提供的服务。在下面的输出中，我们可以看到登录可以使用 ssh、smtp 用于电子邮箱、web 站点也是启用的，并且 ipp 打印服务正在运行。

```
$ nmap localhost

Starting Nmap 7.01 ( https://nmap.org ) at 2017-10-09 15:01 EDT
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00016s latency).
Not shown: 996 closed ports
PORT    STATE SERVICE
22/tcp  open  ssh
25/tcp  open  smtp
80/tcp  open  http
631/tcp open  ipp

Nmap done: 1 IP address (1 host up) scanned in 0.09 seconds
```

Linux 系统提供了很多有用的命令用于查看网络配置和连接。如果你都探索完了，请记住 `apropos network` 或许会让你了解更多。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3230519/linux/examining-network-connections-on-linux-systems.html

作者：[Sandra Henry-Stocker][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.networkworld.com/article/3221393/linux/review-considering-oracle-linux-is-a-no-brainer-if-you-re-an-oracle-shop.html
[2]:https://www.networkworld.com/article/3221393/linux/review-considering-oracle-linux-is-a-no-brainer-if-you-re-an-oracle-shop.html#tk.nww_nsdr_ndxprmomod
[3]:https://www.networkworld.com/article/3221423/linux/review-suse-linux-enterprise-server-12-sp2-scales-well-supports-3rd-party-virtualization.html
[4]:https://www.networkworld.com/article/3221423/linux/review-suse-linux-enterprise-server-12-sp2-scales-well-supports-3rd-party-virtualization.html#tk.nww_nsdr_ndxprmomod
[5]:https://www.networkworld.com/article/3221476/linux/review-free-linux-fedora-server-offers-upgrades-as-they-become-available-no-wait.html
[6]:https://www.networkworld.com/article/3221476/linux/review-free-linux-fedora-server-offers-upgrades-as-they-become-available-no-wait.html#tk.nww_nsdr_ndxprmomod
[7]:https://www.networkworld.com/article/3227929/linux/making-good-use-of-the-files-in-proc.html
[8]:https://www.networkworld.com/article/3221415/linux/linux-commands-for-managing-partitioning-troubleshooting.html
[9]:https://www.networkworld.com/article/2225768/cisco-subnet/dual-protocol-routing-with-raspberry-pi.html
[10]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[11]:https://www.networkworld.com/insider
[12]:https://www.networkworld.com/article/3227929/linux/making-good-use-of-the-files-in-proc.html
[13]:https://www.networkworld.com/article/3221415/linux/linux-commands-for-managing-partitioning-troubleshooting.html
[14]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[15]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[16]:https://www.flickr.com/photos/cogdog/4317096083/in/photolist-7zufg6-8JS2ym-bmDGsu-cnYW2C-mnrvP-a1s6VU-4ThA5-33B4ME-7GHEod-ERKLhX-5iPi6m-dTZAW6-UC6wyi-dRCJAZ-dq4wxW-peQyWU-8AGfjw-8wGAqs-4oLjd2-4T6pXM-dQua38-UKngxR-5kQwHN-ejjXMo-q4YvvL-7AUF3h-39ya27-7HiWfp-TosWda-6L3BZn-uST4Hi-TkRW8U-H7zBu-oDkNvU-6T2pZg-dQEbs9-39hxfS-5pBhQL-eR6iKT-7dgDwk-W15qVn-nVQHN3-mdRj8-75tqVh-RajJsC-7gympc-7dwxjt-9EadYN-p1qH1G-6rZhh6
[17]:https://creativecommons.org/licenses/by/2.0/legalcode
