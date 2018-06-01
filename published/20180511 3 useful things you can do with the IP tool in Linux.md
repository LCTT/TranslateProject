你可以用 Linux 中的 IP 工具做 3 件有用的事情
======

> 如何使用 IP 工具来快速轻松地找到你的 IP 地址、显示路由表等等。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

`ifconfig` 命令在 Linux 上被弃用已有十多年的时间了，而 `iproute2` 项目包含了神奇的工具 `ip`。许多在线教程资源仍然采用旧的命令行工具，如 `ifconfig`、`route` 和 `netstat`。本教程的目标是分享一些可以使用 `ip` 工具轻松完成的网络相关的事情。

### 找出你的 IP 地址

```
[dneary@host]$ ip addr show
[snip]
44: wlp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
        link/ether 5c:e0:c5:c7:f0:f1 brd ff:ff:ff:ff:ff:ff
        inet 10.16.196.113/23 brd 10.16.197.255 scope global dynamic wlp4s0
        valid_lft 74830sec preferred_lft 74830sec
        inet6 fe80::5ee0:c5ff:fec7:f0f1/64 scope link
        valid_lft forever preferred_lft forever
```

`ip addr show` 会告诉你很多关于你的所有网络链接设备的信息。在这里，我的无线以太网卡（`wlp4s0`）是 IPv4 地址（`inet` 字段）`10.16.196.113/23`。 `/23` 表示 32 位 IP 地址中的 23 位将被该子网中的所有 IP 地址共享。子网中的 IP 地址范围从 `10.16.196.0` 到 `10.16.197.254`。子网的广播地址（IP 地址后面的 `brd` 字段）`10.16.197.255` 保留给子网上所有主机的广播流量。

我们能只使用 `ip addr show dev wlp4s0` 来显示单个设备的信息。

### 显示你的路由表

```
[dneary@host]$ ip route list
default via 10.16.197.254 dev wlp4s0 proto static metric 600
10.16.196.0/23 dev wlp4s0 proto kernel scope link src 10.16.196.113 metric 601
192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1 linkdown
```

路由表是本地主机帮助网络流量确定去哪里的方式。它包含一组路标，将流量发送到特定的接口，以及在其旅途中的特定下一个地点。

如果你运行任何虚拟机或容器，它们将获得自己的 IP 地址和子网，这可能会使这些路由表非常复杂，但在单个主机中，通常有两条指令。对于本地流量，将其发送到本地以太网上，并且网络交换机将找出（使用称为 ARP 的协议）哪个主机拥有目标 IP 地址，并且要将流量发送到哪里。对于到互联网的流量，将其发送到本地网关节点，它将更好地了解如何到达目的地。

在上面的情况中，第一行代表外部流量的外部网关，第二行代表本地流量，第三行代表主机上运行的虚拟机的虚拟网桥，但该链接当前未激活。

### 监视你的网络配置

```
[dneary@host]$ ip monitor all
[dneary@host]$ ip -s link list wlp4s0
```

`ip monitor` 命令可用于监视路由表（网络接口上的网络寻址）的更改或本地主机上 ARP 表的更改。此命令在调试与容器和网络相关的网络问题时特别有用，如当两个虚拟机应该能彼此通信，但实际不能。

在使用 `all` 时，`ip monitor` 会报告所有的更改，前缀以 `[LINK]`（网络接口更改）、`[ROUTE]`（更改路由表）、`[ADDR]`（IP 地址更改）或 `[NEIGH]`（与马无关 —— 与邻居的 ARP 地址相关的变化）。

你还可以监视特定对象上的更改（例如，特定的路由表或 IP 地址）。

另一个适用于许多命令的有用选项是 `ip -s`，它提供了一些统计信息。添加第二个 `-s` 选项可以添加更多统计信息。上面的 `ip -s link list wlp4s0` 会给出很多关于接收和发送的数据包的信息、丢弃的数据包数量、检测到的错误等等。

### 提示：缩短你的命令

一般来说，对于 `ip` 工具，你只需要包含足够的字母来唯一标识你想要做的事情。你可以使用 `ip mon` 来代替 `ip monitor`。你可以使用 `ip a l`，而不是 `ip addr list`，并且可以使用 `ip r`来代替 `ip route`。`ip link list` 可以缩写为 `ip l ls`。要了解可用于更改命令行为的许多选项，请浏览 [ip 手册页][1]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/useful-things-you-can-do-with-IP-tool-Linux

作者：[Dave Neary][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dneary
[1]:https://www.systutorials.com/docs/linux/man/8-ip-route/
