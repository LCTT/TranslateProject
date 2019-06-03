[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10800-1.html)
[#]: subject: (Four Methods To Check The Default Gateway Or Router IP Address In Linux?)
[#]: via: (https://www.2daygeek.com/check-find-default-gateway-or-router-ip-address-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

4 种在 Linux 中检查默认网关或者路由器 IP 地址的方法
==============================================

你应该意识到你的默认网关是你的路由器的 IP 地址。一般这是在安装过程中由操作系统自动检测的，如果没有，你可能需要改变它。如果你的系统不能 ping 自身，那么很可能是一个网关问题，你必须修复它。在网络中，当你有多个网络适配器或路由器时，这种情况可能会发生。

网关是一个扮演着入口点角色的路由器，可以从一个网络传递网络数据到另一个网络。

下面是一些可能帮助你收集到与该话题相似的一些信息。

* [在 Linux 命令行检查你的公网 IP 地址的 9 种方法][1]
* [如何在 Linux 启用和禁用网卡？][2]

这可以通过下面的四个命令完成。

* `route` 命令：被用来显示和操作 IP 路由表。
* `ip` 命令：类似于 `ifconfig`，常用于设置静态 IP 地址、路由 & 默认网关，等等。
* `netstat` 命令：是一个命令行工具，用来显示网络连接相关的信息（包括入站和出站的），例如路由表、伪装连接、多播成员和网络接口。
* `routel` 命令：被用来以好看的输出格式列出路由。

### 1）在 Linux 中如何使用 route 命令检查默认的网关或者路由 IP 地址？

`route` 命令被用来显示和操作 IP 路由表。

它主要用于通过一个已经配置的接口给特定的主机或者网络设置静态的路由。

当使用 `add` 或者 `del` 选项时，`route` 修改路由表。没有这些选项，`route` 显示路由表的当前内容。

```
# route
或
# route -n

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         www.routerlogin 0.0.0.0         UG    600    0        0 wlp8s0
192.168.1.0     0.0.0.0         255.255.255.0   U     600    0        0 wlp8s0
```

### 2）如何在 Linux 中使用 ip 命令检查默认网关或者路由 IP 地址？

[IP 命令][3] 类似于 `ifconfig`，常用于配置静态 IP 地址、路由 & 默认网关，等等。

`ifconfig` 命令因为多年没有维护而被遗弃了，即使它仍然在大多数 Linux 发行版上可获得。

`ifconfig` 命令已经被 `ip` 命令替代了，`ip` 命令是非常强大的，只要一个命令就能执行几个网络管理任务。

`ip` 命令工具附带在 iproute2 包中。在主要的 Linux 发行版中都默认预装了 iproute2 。

如果没有，你可以在你的终端中在包管理器的帮助下通过指定 iproute2 来安装它。

```
# ip r
或
# ip route
或
# ip route show

default via 192.168.1.1 dev wlp8s0 proto dhcp metric 600
192.168.1.0/24 dev wlp8s0 proto kernel scope link src 192.168.1.6 metric 600
```

### 3）如何在 Linux 中使用 netstat 命令检查默认网关或者路由 IP 地址？

`netstat` 代表 Network Statistics，是一个用来显示网络连接相关的信息（包括入站和出站）的命令行工具，例如路由表、伪装连接，多播成员和网络接口。

它列出所有的 tcp、udp 套接字连接和 unix 套接字连接。

它在网络中被用来诊断网络问题并判断网络中的流量总量来作为性能测量指标。

```
# netstat -r

Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         www.routerlogin 0.0.0.0         UG        0 0          0 wlp8s0
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 wlp8s0
```

### 4）如何在 Linux 中使用 routel 命令检查默认网关或者路由 IP 地址？

它用来以好看的输出格式列出路由信息。这些程序是一系列你可以用来替代 iproute2 的帮助脚本（`routel` 和 `routef`）。

`routel` 脚本以一种被认为更容易解释并且等价于 `route` 输出列表的格式来输出路由信息。

如果 `routef` 脚本不加任何参数，将仅仅简单的将路由表清空。小心！这意味着删除所有的路由，让你的网络不再可用。

```
# routel
         target            gateway          source    proto    scope    dev tbl
        default        192.168.1.1                     dhcp          wlp8s0
   192.168.1.0/ 24                     192.168.1.6   kernel     link wlp8s0
      127.0.0.0          broadcast       127.0.0.1   kernel     link     lo local
     127.0.0.0/ 8            local       127.0.0.1   kernel     host     lo local
      127.0.0.1              local       127.0.0.1   kernel     host     lo local
127.255.255.255          broadcast       127.0.0.1   kernel     link     lo local
    192.168.1.0          broadcast     192.168.1.6   kernel     link wlp8s0 local
    192.168.1.6              local     192.168.1.6   kernel     host wlp8s0 local
  192.168.1.255          broadcast     192.168.1.6   kernel     link wlp8s0 local
            ::1                                      kernel              lo
        fe80::/ 64                                   kernel          wlp8s0
            ::1              local                   kernel              lo local
fe80::ad00:2f7e:d882:5add              local                   kernel          wlp8s0 local
        ff00::/ 8                                                    wlp8s0 local
```

如果你只想打印默认的网关那么使用下面的格式。


```
# routel | grep default
        default        192.168.1.1                     dhcp          wlp8s0
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-find-default-gateway-or-router-ip-address-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/check-find-server-public-ip-address-linux/
[2]: https://www.2daygeek.com/enable-disable-up-down-nic-network-interface-port-linux-using-ifconfig-ifdown-ifup-ip-nmcli-nmtui/
[3]: https://www.2daygeek.com/ip-command-configure-network-interface-usage-linux/
