[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12165-1.html)
[#]: subject: (How to Check the Available Network Interfaces, Associated IP Addresses, MAC Addresses, and Interface Speed on Linux)
[#]: via: (https://www.2daygeek.com/linux-unix-check-network-interfaces-names-nic-speed-ip-mac-address/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 上检查网卡信息
======

![](https://img.linux.net.cn/data/attachment/album/202004/29/214835m1ms3n00s6qbcycz.jpg)

默认情况下，在设置服务器时你会配置主网络接口。这是每个人所做的构建工作的一部分。有时出于各种原因，你可能需要配置额外的网络接口。

这可以是通过网络<ruby>绑定<rt>bonding</rt><ruby>/<ruby>协作<rt>teaming</rt></ruby>来提供高可用性，也可以是用于应用需求或备份的单独接口。

为此，你需要知道计算机有多少接口以及它们的速度来配置它们。

有许多命令可检查可用的网络接口，但是我们仅使用 `ip` 命令。以后，我们会另外写一篇文章来全部介绍这些工具。

在本教程中，我们将向你显示可用网络网卡（NIC）信息，例如接口名称、关联的 IP 地址、MAC 地址和接口速度。

### 什么是 ip 命令

[ip 命令][1] 类似于 `ifconfig`, 用于分配静态 IP 地址、路由和默认网关等。

```
# ip a

1: lo: mtu 65536 qdisc noqueue state UNKNOWN
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether fa:16:3e:a0:7d:5a brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.101/24 brd 192.168.1.101 scope global eth0
    inet6 fe80::f816:3eff:fea0:7d5a/64 scope link
       valid_lft forever preferred_lft forever
```

### 什么是 ethtool 命令

`ethtool` 用于查询或控制网络驱动或硬件设置。

```
# ethtool eth0
```

### 1）如何在 Linux 上使用 ip 命令检查可用的网络接口

在不带任何参数的情况下运行 `ip` 命令时，它会提供大量信息，但是，如果仅需要可用的网络接口，请使用以下定制的 `ip` 命令。

```
# ip a |awk '/state UP/{print $2}'

eth0:
eth1:
```

### 2）如何在 Linux 上使用 ip 命令检查网络接口的 IP 地址

如果只想查看 IP 地址分配给了哪个接口，请使用以下定制的 `ip` 命令。

```
# ip -o a show | cut -d ' ' -f 2,7
或
ip a |grep -i inet | awk '{print $7, $2}'

lo 127.0.0.1/8
192.168.1.101/24
192.168.1.102/24
```

### 3）如何在 Linux 上使用 ip 命令检查网卡的 MAC 地址

如果只想查看网络接口名称和相应的 MAC 地址，请使用以下格式。

检查特定的网络接口的 MAC 地址：

```
# ip link show dev eth0 |awk '/link/{print $2}'
00:00:00:55:43:5c
```

检查所有网络接口的 MAC 地址，创建该脚本：

```
# vi /opt/scripts/mac-addresses.sh

#!/bin/sh
ip a |awk '/state UP/{print $2}' | sed 's/://' | while read output;
do
  echo $output:
  ethtool -P $output
done
```

运行该脚本获取多个网络接口的 MAC 地址：

```
# sh /opt/scripts/mac-addresses.sh

eth0:
Permanent address: 00:00:00:55:43:5c
eth1:
Permanent address: 00:00:00:55:43:5d
```

### 4）如何在 Linux 上使用 ethtool 命令检查网络接口速度

如果要在 Linux 上检查网络接口速度，请使用 `ethtool` 命令。

检查特定网络接口的速度：

```
# ethtool eth0 |grep "Speed:"

Speed: 10000Mb/s
```

检查所有网络接口速度，创建该脚本：

```
# vi /opt/scripts/port-speed.sh

#!/bin/sh
ip a |awk '/state UP/{print $2}' | sed 's/://' | while read output;
do
  echo $output:
  ethtool $output |grep "Speed:"
done
```

运行该脚本获取多个网络接口速度：

```
# sh /opt/scripts/port-speed.sh

eth0:
Speed: 10000Mb/s
eth1:
Speed: 10000Mb/s
```

### 5）验证网卡信息的 Shell 脚本

通过此 shell 脚本你可以收集上述所有信息，例如网络接口名称、网络接口的 IP 地址，网络接口的 MAC 地址以及网络接口的速度。创建该脚本：

```
# vi /opt/scripts/nic-info.sh

#!/bin/sh
hostname
echo "-------------"
for iname in $(ip a |awk '/state UP/{print $2}')
do
  echo "$iname"
  ip a | grep -A2 $iname | awk '/inet/{print $2}'
  ip a | grep -A2 $iname | awk '/link/{print $2}'
  ethtool $iname |grep "Speed:"
done
```

运行该脚本检查网卡信息：

```
# sh /opt/scripts/nic-info.sh

vps.2daygeek.com
----------------
eth0:
192.168.1.101/24
00:00:00:55:43:5c
Speed: 10000Mb/s
eth1:
192.168.1.102/24
00:00:00:55:43:5d
Speed: 10000Mb/s
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-unix-check-network-interfaces-names-nic-speed-ip-mac-address/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/ip-command-configure-network-interface-usage-linux/
[2]: https://www.2daygeek.com/category/shell-script/
