[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10635-1.html)
[#]: subject: (How To Find Available Network Interfaces On Linux)
[#]: via: (https://www.ostechnix.com/how-to-find-available-network-interfaces-on-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

如何在 Linux 中查看可用的网络接口
======

![](https://www.ostechnix.com/wp-content/uploads/2019/02/network-interface-720x340.jpeg)

在我们安装完一个 Linux 系统后最为常见的任务便是网络配置了。当然，你可以在安装系统时进行网络接口的配置。但是，对于某些人来说，他们更偏爱在安装完系统后再进行网络的配置或者更改现存的设置。众所周知，为了在命令行中进行网络设定的配置，我们首先必须知道系统中有多少个可用的网络接口。本次这个简单的指南将列出所有可能的方式来在 Linux 和 Unix 操作系统中找到可用的网络接口。

### 在 Linux 中找到可用的网络接口

我们可以使用下面的这些方法来找到可用的网络接口。

#### 方法 1 使用 ifconfig 命令

使用 `ifconfig` 命令来查看网络接口仍然是最常使用的方法。我相信还有很多 Linux 用户仍然使用这个方法。

```
$ ifconfig -a
```

示例输出：

```
enp5s0: flags=4098<BROADCAST,MULTICAST> mtu 1500
    ether 24:b6:fd:37:8b:29 txqueuelen 1000 (Ethernet)
    RX packets 0 bytes 0 (0.0 B)
    RX errors 0 dropped 0 overruns 0 frame 0
    TX packets 0 bytes 0 (0.0 B)
    TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING> mtu 65536
    inet 127.0.0.1 netmask 255.0.0.0
    inet6 ::1 prefixlen 128 scopeid 0x10<host>
    loop txqueuelen 1000 (Local Loopback)
    RX packets 171420 bytes 303980988 (289.8 MiB)
    RX errors 0 dropped 0 overruns 0 frame 0
    TX packets 171420 bytes 303980988 (289.8 MiB)
    TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0

wlp9s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST> mtu 1500
    inet 192.168.225.37 netmask 255.255.255.0 broadcast 192.168.225.255
    inet6 2409:4072:6183:c604:c218:85ff:fe50:474f prefixlen 64 scopeid 0x0<global>
    inet6 fe80::c218:85ff:fe50:474f prefixlen 64 scopeid 0x20<link>
    ether c0:18:85:50:47:4f txqueuelen 1000 (Ethernet)
    RX packets 564574 bytes 628671925 (599.5 MiB)
    RX errors 0 dropped 0 overruns 0 frame 0
    TX packets 299706 bytes 60535732 (57.7 MiB)
    TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0
```

如上面的输出所示，在我的 Linux 机器上有两个网络接口，它们分别叫做 `enp5s0`（主板上的有线网卡）和 `wlp9s0`（无线网卡）。其中的 `lo` 是环回网卡，被用来访问本地的网络的服务，通常它的 IP 地址为 `127.0.0.1`。

我们也可以在许多 UNIX 变种例如 FreeBSD 中使用相同的 `ifconfig` 来列出可用的网卡。

#### 方法 2 使用 ip 命令

在最新的 Linux 版本中， `ifconfig` 命令已经被弃用了。你可以使用 `ip` 命令来罗列出网络接口，正如下面这样：

```
$ ip link show
```

示例输出：

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp5s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether 24:b6:fd:37:8b:29 brd ff:ff:ff:ff:ff:ff
3: wlp9s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DORMANT group default qlen 1000
    link/ether c0:18:85:50:47:4f brd ff:ff:ff:ff:ff:ff
```

![](https://www.ostechnix.com/wp-content/uploads/2019/02/ip-command.png)

你也可以使用下面的命令来查看。

```
$ ip addr
```

```
$ ip -s link
```

你注意到了吗？这些命令同时还显示出了已经连接的网络接口的状态。假如你仔细查看上面的输出，你将注意到我的有线网卡并没有跟网络线缆连接（从上面输出中的 `DOWN` 可以看出）。另外，我的无线网卡已经连接了（从上面输出中的 `UP` 可以看出）。想知晓更多的细节，可以查看我们先前的指南 [在 Linux 中查看网络接口的已连接状态][1]。

这两个命令（`ifconfig` 和 `ip`）已经足够在你的 LInux 系统中查看可用的网卡了。

然而，仍然有其他方法来列出 Linux 中的网络接口，下面我们接着看。

#### 方法 3 使用 /sys/class/net 目录

Linux 内核将网络接口的详细信息保存在 `/sys/class/net` 目录中，你可以通过查看这个目录的内容来检验可用接口的列表是否和前面的结果相符。

```
$ ls /sys/class/net
```

示例输出：

```
enp5s0 lo wlp9s0
```

#### 方法 4 使用 /proc/net/dev 目录

在 Linux 操作系统中，文件 `/proc/net/dev` 中包含有关网络接口的信息。

要查看可用的网卡，只需使用下面的命令来查看上面文件的内容：

```
$ cat /proc/net/dev
```

示例输出：

```
Inter-| Receive | Transmit
face |bytes packets errs drop fifo frame compressed multicast|bytes packets errs drop fifo colls carrier compressed
wlp9s0: 629189631 566078 0 0 0 0 0 0 60822472 300922 0 0 0 0 0 0
enp5s0: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
lo: 303980988 171420 0 0 0 0 0 0 303980988 171420 0 0 0 0 0 0
```

#### 方法 5 使用 netstat 命令

`netstat` 命令可以列出各种不同的信息，例如网络连接、路由表、接口统计信息、伪装连接和多播成员等。

```
$ netstat -i
```

示例输出：

```
Kernel Interface table
Iface MTU RX-OK RX-ERR RX-DRP RX-OVR TX-OK TX-ERR TX-DRP TX-OVR Flg
lo 65536 171420 0 0 0 171420 0 0 0 LRU
wlp9s0 1500 565625 0 0 0 300543 0 0 0 BMRU
```

请注意 `netstat` 被弃用了， `netstat -i` 的替代命令是 `ip -s link`。另外需要注意的是这个方法将只列出激活的接口，而不是所有可用的接口。

#### 方法 6 使用 nmcli 命令

`nmcli` 是一个用来控制 NetworkManager 和报告网络状态的命令行工具。它可以被用来创建、展示、编辑、删除、激活、停用网络连接和展示网络状态。

假如你的 Linux 系统中安装了 NetworkManager，你便可以使用下面的命令来使用 `nmcli` 列出可以的网络接口：

```
$ nmcli device status
```

或者

```
$ nmcli connection show
```

现在你知道了如何在 Linux 中找到可用网络接口的方法，接下来，请查看下面的指南来知晓如何在 Linux 中配置 IP 地址吧。

- [如何在 Linux 和 Unix 中配置静态 IP 地址][2]
- [如何在 Ubuntu 18.04 LTS 中配置 IP 地址][3]
- [如何在 Arch Linux 中配置静态和动态 IP 地址][4]
- [如何在 Linux 中为单个网卡分配多个 IP 地址][5]

假如你知道其他快捷的方法来在 Linux 中找到可用的网络接口，请在下面的评论部分中分享出来，我将检查你们的评论并更新这篇指南。

这就是全部的内容了，更多精彩内容即将呈现，请保持关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-available-network-interfaces-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/how-to-find-out-the-connected-state-of-a-network-cable-in-linux/
[2]: https://www.ostechnix.com/configure-static-ip-address-linux-unix/
[3]: https://www.ostechnix.com/how-to-configure-ip-address-in-ubuntu-18-04-lts/
[4]: https://www.ostechnix.com/configure-static-dynamic-ip-address-arch-linux/
[5]: https://www.ostechnix.com/how-to-assign-multiple-ip-addresses-to-single-network-card-in-linux/
