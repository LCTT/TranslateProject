[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13089-1.html"
[#]: subject: "Why you need to drop ifconfig for ip"
[#]: via: "https://opensource.com/article/21/1/ifconfig-ip-linux"
[#]: author: "Rajan Bhardwaj https://opensource.com/users/rajabhar"

放弃 ifconfig，拥抱 ip 命令
======

> 开始使用现代方法配置 Linux 网络接口。

![](https://img.linux.net.cn/data/attachment/album/202102/05/233847lpg1lnz7kl2czgfj.jpg)

在很长一段时间内，`ifconfig` 命令是配置网络接口的默认方法。它为 Linux 用户提供了很好的服务，但是网络很复杂，所以配置网络的命令必须健壮。`ip` 命令是现代系统中新的默认网络命令，在本文中，我将向你展示如何使用它。

`ip` 命令工作在 [OSI 网络栈][2] 的两个层上：第二层（数据链路层）和第三层（网络 或 IP）层。它做了之前 `net-tools` 包的所有工作。

### 安装 ip

`ip` 命令包含在 `iproute2util` 包中，它可能已经在你的 Linux 发行版中安装了。如果没有，你可以从发行版的仓库中进行安装。

### ifconfig 和 ip 使用对比 

`ip` 和 `ifconfig` 命令都可以用来配置网络接口，但它们做事方法不同。接下来，作为对比，我将用它们来执行一些常见的任务。

#### 查看网口和 IP 地址

如果你想查看主机的 IP 地址或网络接口信息，`ifconfig` （不带任何参数）命令提供了一个很好的总结。

```
$ ifconfig
                                                                                                
eth0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500                                                                 
       ether bc:ee:7b:5e:7d:d8  txqueuelen 1000  (Ethernet)                                                       
       RX packets 0  bytes 0 (0.0 B)
       RX errors 0  dropped 0  overruns 0  frame 0
       TX packets 0  bytes 0 (0.0 B)
       TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
       inet 127.0.0.1  netmask 255.0.0.0
       inet6 ::1  prefixlen 128  scopeid 0x10<host>
       loop  txqueuelen 1000  (Local Loopback)
       RX packets 41  bytes 5551 (5.4 KiB)
       RX errors 0  dropped 0  overruns 0  frame 0
       TX packets 41  bytes 5551 (5.4 KiB)
       TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
       inet 10.1.1.6  netmask 255.255.255.224  broadcast 10.1.1.31
       inet6 fdb4:f58e:49f:4900:d46d:146b:b16:7212  prefixlen 64  scopeid 0x0<global>
       inet6 fe80::8eb3:4bc0:7cbb:59e8  prefixlen 64  scopeid 0x20<link>
       ether 08:71:90:81:1e:b5  txqueuelen 1000  (Ethernet)
       RX packets 569459  bytes 779147444 (743.0 MiB)
       RX errors 0  dropped 0  overruns 0  frame 0
       TX packets 302882  bytes 38131213 (36.3 MiB)
       TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

新的 `ip` 命令提供了类似的结果，但命令是 `ip address show`，或者简写为 `ip a`:

```
$ ip a

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host  
      valid_lft forever preferred_lft forever
2: eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
   link/ether bc:ee:7b:5e:7d:d8 brd ff:ff:ff:ff:ff:ff
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
   link/ether 08:71:90:81:1e:b5 brd ff:ff:ff:ff:ff:ff
   inet 10.1.1.6/27 brd 10.1.1.31 scope global dynamic wlan0
      valid_lft 83490sec preferred_lft 83490sec
   inet6 fdb4:f58e:49f:4900:d46d:146b:b16:7212/64 scope global noprefixroute dynamic  
      valid_lft 6909sec preferred_lft 3309sec
   inet6 fe80::8eb3:4bc0:7cbb:59e8/64 scope link  
      valid_lft forever preferred_lft forever
```

#### 添加 IP 地址

使用 `ifconfig` 命令添加 IP 地址命令为：

```
$ ifconfig eth0 add 192.9.203.21
```

`ip` 类似：

```
$ ip address add 192.9.203.21 dev eth0
```

`ip` 中的子命令可以缩短，所以下面这个命令同样有效：

```
$ ip addr add 192.9.203.21 dev eth0
```

你甚至可以更短些：

```
$ ip a add 192.9.203.21 dev eth0
```

#### 移除一个 IP 地址

添加 IP 地址与删除 IP 地址正好相反。

使用 `ifconfig`，命令是：

```
$ ifconfig eth0 del 192.9.203.21
```

`ip` 命令的语法是：

```
$ ip a del 192.9.203.21 dev eth0
```

#### 启用或禁用组播

使用 `ifconfig` 接口来启用或禁用 <ruby>[组播][3]<rt>multicast</rt></ruby>：

```
# ifconfig eth0 multicast
```

对于 `ip`，使用 `set` 子命令与设备（`dev`）以及一个布尔值和 `multicast` 选项：

```
# ip link set dev eth0 multicast on
```

#### 启用或禁用网络

每个系统管理员都熟悉“先关闭，然后打开”这个技巧来解决问题。对于网络接口来说，即打开或关闭网络。

`ifconfig` 命令使用 `up` 或 `down` 关键字来实现：

```
# ifconfig eth0 up
```

或者你可以使用一个专用命令：

```
# ifup eth0
```

`ip` 命令使用 `set` 子命令将网络设置为 `up` 或 `down` 状态：

```
# ip link set eth0 up
```

#### 开启或关闭地址解析功能（ARP）

使用 `ifconfig`，你可以通过声明它来启用：

```
# ifconfig eth0 arp
```

使用 `ip`，你可以将 `arp` 属性设置为 `on` 或 `off`：

```
# ip link set dev eth0 arp on
```

### ip 和 ipconfig 的优缺点

`ip` 命令比 `ifconfig` 更通用，技术上也更有效，因为它使用的是 `Netlink` 套接字，而不是 `ioctl` 系统调用。

`ip` 命令可能看起来比 `ifconfig` 更详细、更复杂，但这是它拥有更多功能的一个原因。一旦你开始使用它，你会了解它的内部逻辑（例如，使用 `set` 而不是看起来随意混合的声明或设置）。

最后，`ifconfig` 已经过时了（例如，它缺乏对网络命名空间的支持），而 `ip` 是为现代网络而生的。尝试并学习它，使用它，你会由衷高兴的！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/ifconfig-ip-linux

作者：[Rajan Bhardwaj][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rajabhar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk "Tips and gears turning"
[2]: https://en.wikipedia.org/wiki/OSI_model
[3]: https://en.wikipedia.org/wiki/Multicast
