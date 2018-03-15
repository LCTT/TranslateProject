如何在Linux上检查您的网络连接
======

![](https://images.idgesg.net/images/article/2018/03/network-connections-100751906-large.jpg)

**ip**命令有很多可以告诉你网络连接配置和状态的信息，但是所有这些词和数字意味着什么？ 让我们深入了解一下，看看所有显示的值都试图告诉你什么。

当您使用`ip a`（或`ip addr`）命令获取系统上所有网络接口的信息时，您将看到如下所示的内容：

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

这个系统上的两个接口 - 环回（lo）和网络（enp0s25）——显示了很多统计数据。 “lo”接口显然是环回地址。 我们可以在列表中看到环回IPv4地址（127.0.0.1）和环回IPv6（ **::1**）。 正常的网络接口更有趣。

### 为什么是enp0s25而不是eth0

如果你想知道为什么它在这个系统上被称为**enp0s25**，而不是可能更熟悉的**eth0**，那我们可以稍微解释一下。

新的命名方案被称为“可预测的网络接口”。 它已经在基于systemd的Linux系统上使用了一段时间了。 接口名称取决于硬件的物理位置。 “**en**”仅仅就是“ethernet”的意思就像“eth”用于对于eth0，一样。 “**p**”是以太网卡的总线编号，“**s**”是插槽编号。 所以“enp0s25”告诉我们很多我们正在使用的硬件的信息。

<BROADCAST,MULTICAST,UP,LOWER_UP> 这个配置串告诉我们：
```
BROADCAST 	该接口支持广播
MULTICAST 	该接口支持多播
UP 			网络接口已启用
LOWER_UP 	网络电缆已插入，设备已连接至网络
mtu 1500 	最大传输单位（数据包大小）为1,500字节
```

列出的其他值也告诉了我们很多关于接口的知识，但我们需要知道“brd”和“qlen”这些词代表什么意思。 所以，这里显示的是上面展示的**ip**信息的其余部分的翻译。

```
mtu 										最大传输单位（数据包大小）为1,500字节
qdisc pfifo_fast 							用于数据包排队
state UP 									网络接口已启用
group default 								接口组
qlen 1000 									传输队列长度
link/ether 00:1e:4f:c8:43:fc 				接口的MAC（硬件）地址
brd ff:ff:ff:ff:ff:ff 						广播地址
inet 192.168.0.24/24 						IPv4地址
brd 192.168.0.255 							广播地址
scope global 								全局有效
dynamic enp0s25 							地址是动态分配的
valid_lft 80866sec 							IPv4地址的有效使用期限
preferred_lft 80866sec 						IPv4地址的首选生存期
inet6 fe80::2c8e:1de0:a862:14fd/64			IPv6地址
scope link 									仅在此设备上有效
valid_lft forever 							IPv6地址的有效使用期限
preferred_lft forever 						IPv6地址的首选生存期
```

您可能已经注意到，ifconfig命令提供的一些信息未包含在**ip a** 命令的输出中 —— 例如传输数据包的统计信息。 如果您想查看发送和接收的数据包数量以及冲突数量的列表，可以使用以下ip命令：

```
$ ip -s link show enp0s25
2: enp0s25: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
 link/ether 00:1e:4f:c8:43:fc brd ff:ff:ff:ff:ff:ff
 RX: bytes packets errors dropped overrun mcast
 224258568 418718 0 0 0 84376
 TX: bytes packets errors dropped carrier collsns
 6131373 78152 0 0 0 0
```

另一个**ip**命令提供有关系统路由表的信息。
```
$ ip route show
default via 192.168.0.1 dev enp0s25 proto static metric 100
169.254.0.0/16 dev enp0s25 scope link metric 1000
192.168.0.0/24 dev enp0s25 proto kernel scope link src 192.168.0.24 metric 100
```

**ip**命令是非常通用的。 您可以从**ip**命令及其来自[Red Hat][1]的选项获得有用的备忘单。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3262045/linux/checking-your-network-connections-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf
