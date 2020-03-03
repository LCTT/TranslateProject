[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11953-1.html)
[#]: subject: (Troubleshooting hardware problems in Linux)
[#]: via: (https://opensource.com/article/18/12/troubleshooting-hardware-problems-linux)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

Linux 硬件故障排除指南
======

> 了解是什么原因导致你的 Linux 硬件发生故障，以便你可以将其恢复并快速运行。

![](https://img.linux.net.cn/data/attachment/album/202003/03/101312zcazy02wl2g8uhy1.jpg)

[Linux 服务器][1]在物理机、虚拟化、私有云、公共云和混合云等许多不同种类的基础设施中运行着关键的业务应用程序。对于 Linux 系统管理员来说，了解如何管理 Linux 硬件基础设施（包括与 [网络][2]、存储、Linux 容器相关的软件定义功能）和 Linux 服务器上的多种工具非常重要。

在 Linux 上进行排除和解决与硬件相关的问题可能需要一些时间。即使是经验丰富的系统管理员，有时也会花费数小时来解决神秘的硬件和软件差异。

以下提示可以使你更快、更轻松地对 Linux 中的硬件进行故障排除。许多不同的事情都可能导致 Linux 硬件出现问题。在开始诊断它们之前，明智的做法是了解最常见的问题以及最有可能找到问题的地方。

### 快速诊断设备、模块和驱动程序

故障排除的第一步通常是显示 Linux 服务器上安装的硬件的列表。你可以使用诸如 [lspci][3]、[lsblk][4]、[lscpu][5] 和 [lsscsi][6] 之类的列出命令获取有关硬件的详细信息。例如，这是 `lsblk` 命令的输出：

```
# lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  50G  0 disk
├─xvda1 202:1    0   1M  0 part
└─xvda2 202:2    0  50G  0 part /
xvdb    202:16   0  20G  0 disk
└─xvdb1 202:17   0  20G  0 part
```

如果这些列出命令没有显示任何错误，请使用初始化系统（例如 systemd）查看 Linux 服务器的工作方式。 systemd 是最流行的初始化系统，用于启动用户空间并控制多个系统进程。例如，这是 `systemctl status` 命令的输出：

```
# systemctl status
● bastion.f347.internal
    State: running
     Jobs: 0 queued
   Failed: 0 units
    Since: Wed 2018-11-28 01:29:05 UTC; 2 days ago
   CGroup: /
           ├─1 /usr/lib/systemd/systemd --switched-root --system --deserialize 21
           ├─kubepods.slice
           │ ├─kubepods-pod3881728a_f2af_11e8_af77_06af52f87498.slice
           │ │ ├─docker-88b27385f4bae77bba834fbd60a61d19026bae13d18eb147783ae27819c34967.scope
           │ │ │ └─23860 /opt/bridge/bin/bridge --public-dir=/opt/bridge/static --config=/var/console-config/console-c
           │ │ └─docker-a4433f0d523c7e5bc772ee4db1861e4fa56c4e63a2d48f6bc831458c2ce9fd2d.scope
           │ │   └─23639 /usr/bin/pod
....
```

### 深入到各个日志当中

使用 `dmesg` 可以找出内核最新消息中的错误和警告。例如，这是 `dmesg | more`  命令的输出：

```
# dmesg | more
....
[ 1539.027419] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[ 1539.042726] IPv6: ADDRCONF(NETDEV_UP): veth61f37018: link is not ready
[ 1539.048706] IPv6: ADDRCONF(NETDEV_CHANGE): veth61f37018: link becomes ready
[ 1539.055034] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[ 1539.098550] device veth61f37018 entered promiscuous mode
[ 1541.450207] device veth61f37018 left promiscuous mode
[ 1542.493266] SELinux: mount invalid.  Same superblock, different security settings for (dev mqueue, type mqueue)
[ 9965.292788] SELinux: mount invalid.  Same superblock, different security settings for (dev mqueue, type mqueue)
[ 9965.449401] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[ 9965.462738] IPv6: ADDRCONF(NETDEV_UP): vetheacc333c: link is not ready
[ 9965.468942] IPv6: ADDRCONF(NETDEV_CHANGE): vetheacc333c: link becomes ready
....
```

你还可以在 `/var/log/messages` 文件中查看所有 Linux 系统日志，在该文件中你可以找到与特定问题相关的错误。当你对硬件进行修改（例如安装额外的磁盘或添加以太网网卡）时，通过 `tail` 命令实时监视消息是值得的。例如，这是 `tail -f /var/log/messages` 命令的输出：

```
# tail -f /var/log/messages
Dec  1 13:20:33 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain in-addr.arpa
Dec  1 13:20:33 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain cluster.local
Dec  1 13:21:03 bastion dnsmasq[30201]: setting upstream servers from DBus
Dec  1 13:21:03 bastion dnsmasq[30201]: using nameserver 192.199.0.2#53
Dec  1 13:21:03 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain in-addr.arpa
Dec  1 13:21:03 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain cluster.local
Dec  1 13:21:33 bastion dnsmasq[30201]: setting upstream servers from DBus
Dec  1 13:21:33 bastion dnsmasq[30201]: using nameserver 192.199.0.2#53
Dec  1 13:21:33 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain in-addr.arpa
Dec  1 13:21:33 bastion dnsmasq[30201]: using nameserver 127.0.0.1#53 for domain cluster.local
```

### 分析网络功能

你可能有成千上万的云原生应用程序在一个复杂的网络环境中为业务提供服务，其中可能包括虚拟化、多云和混合云。这意味着，作为故障排除的一部分，你应该分析网络连接是否正常工作。弄清 Linux 服务器中网络功能的有用命令包括：`ip addr`、`traceroute`、`nslookup`、`dig` 和 `ping` 等。例如，这是 `ip addr show` 命令的输出：

```
# ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 06:af:52:f8:74:98 brd ff:ff:ff:ff:ff:ff
    inet 192.199.0.169/24 brd 192.199.0.255 scope global noprefixroute dynamic eth0
       valid_lft 3096sec preferred_lft 3096sec
    inet6 fe80::4af:52ff:fef8:7498/64 scope link
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:67:fb:1a:a2 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:67ff:fefb:1aa2/64 scope link
       valid_lft forever preferred_lft forever
....
```

### 总结

对 Linux 硬件进行故障排除需要大量的知识，包括如何使用功能强大的命令行工具以及找出系统日志记录。 你还应该知道如何诊断内核空间，在那里你可以找到许多硬件问题的根本原因。请记住，Linux 中的硬件问题可能来自许多不同的来源，包括设备、模块、驱动程序、BIOS、网络，甚至是普通的旧硬件故障。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/troubleshooting-hardware-problems-linux

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/5/what-linux-server
[2]: https://opensource.com/article/18/11/intro-software-defined-networking
[3]: https://linux.die.net/man/8/lspci
[4]: https://linux.die.net/man/8/lsblk
[5]: https://linux.die.net/man/1/lscpu
[6]: https://linux.die.net/man/8/lsscsi
