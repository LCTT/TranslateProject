[#]: subject: "How To Find Default Gateway IP Address In Linux And Unix From Commandline"
[#]: via: "https://ostechnix.com/find-default-gateway-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Linux 和 Unix 中如何从命令行查找默认网关的 IP 地址
======
Linux 下查找网关或路由器 IP 地址的 5 种方法。

**网关**是一个节点或一个路由器，当连接到同一路由器时，它允许两个或多个 IP 地址不同的主机相互通信。如果没有网关，它们将无法相互通信。换句话说，网关充当接入点，将网络数据从本地网络传输到远程网络。在本指南中，我们将看到在 Linux 和 Unix 中从命令行找到默认网关的所有可能方法。

#### 内容

1. 在 Linux 中查找默认网关  1.1 使用 ip 命令查找默认网关  1.2 使用 route 命令显示默认网关 IP 地址  1.3 使用 netstat 命令查看网关 IP 地址  1.4 使用 routel 命令打印默认网关或路由器 IP 地址  1.5 从以太网配置文件中查找网关
2. 总结

### 在 Linux 中查找默认网关

Linux 中有各种各样的命令行工具可用于查看网关 IP 地址。最常用的工具是：**ip**、**ss** 和 **netcat**。我们将通过示例了解如何使用每种工具查看默认网关。

#### 1. 使用 ip 命令查找默认网关

**ip** 命令用于显示和操作 Linux 中的路由、网络设备、接口和隧道。

要查找默认网关或路由器 IP 地址，只需运行：

```
$ ip route
```

或者：

```
$ ip r
```

或者：

```
$ ip route show
```

**示例输出：**

```
default via 192.168.1.101 dev eth0 proto static metric 100 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.20 metric 100
```

你从输出中看到了 **"default via 192.168.1.101"** 这一行吗？它就是默认网关。我的默认网关是 **192.168.1.101**。

你可以使用 **-4** 参数只**显示 IPv4 网关**：

```
$ ip -4 route
```

或者，使用 **`-6`** 参数只**显示 IPv6 网关**：

```
$ ip -6 route
```

如你所见，IP 地址和子网详细信息也一并显示了。如果你想只显示默认网关，排除所有其他细节，可以使用 `ip route` 搭配 **`awk`** 命令，如下所示。

使用 `ip route` 和 `grep` 查找默认网关 IP 地址，执行命令：

```（to 校正，此条命令原文无，怀疑是作者忘记加了）
$ ip route | grep default
```

使用 `ip route` 和 `awk` 命令打印网关地址，执行命令：

```（to 校正，译注：wsl1 上无输出结果，正常 Linux 发行版无问题）
$ ip route | awk '/^default/{print $3}'
```

或者：

```
$ ip route show default | awk '{print $3}'
```

这将只列出网关 IP：

**示例输出：**

```
192.168.1.101
```

![使用 ip 命令列出默认网关][1]

你也可以使用 **[grep][2]** 命令配合 `ip route` 对默认网关进行过滤。

```
$ ip route | grep default
default via 192.168.1.101 dev eth0 proto static metric 100
```

在最新的 Linux 发行版中，`ip route` 是查找默认网关 ip 地址的推荐命令。然而，你们中的一些人可能仍然在使用传统的工具，如 `route` 和 **`netstat`**。旧习难改，对吧？下面的部分将介绍如何在 Linux 中使用 `route` 和 `netstat` 命令确定网关。

#### 2. 使用 route 命令显示默认网关 IP 地址

**route** 命令用于在较老的 Linux 发行版中显示和操作路由表，如 RHEL 6、CentOS 6 等。

如果你正在使用较老的 Linux 发行版，你可以使用 `route` 命令来显示默认网关。

请注意，在最新的 Linux 发行版中，`route` 工具已被弃用，`ip route` 命令取而代之。如果你因为某些原因仍然想使用 `route`，你需要安装它。

首先，我们需要检查哪个包提供了 `route` 命令。为此，在基于 RHEL 的系统上运行以下命令：

```
$ dnf provides route
```

**示例输出：**

```
net-tools-2.0-0.52.20160912git.el8.x86_64 : Basic networking tools
Repo        : @System
Matched from:
Filename    : /usr/sbin/route

net-tools-2.0-0.52.20160912git.el8.x86_64 : Basic networking tools
Repo        : baseos
Matched from:
Filename    : /usr/sbin/route
```

如你所见，net-tools 包提供了 `route` 命令。所以，让我们使用以下命令来安装它：

```
$ sudo dnf install net-tools
```

现在，运行带有 `-n` 参数的 `route` 命令来显示 Linux 系统中的网关或路由器 IP 地址：

```
$ route -n
```

**示例输出：**

```
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.1.101   0.0.0.0         UG    100    0        0 eth0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
192.168.1.0     0.0.0.0         255.255.255.0   U     100    0        0 eth0
```

![使用 route 命令显示默认网关 IP 地址][3]

如你所见，网关 IP 地址是 192.168.1.101。你还将在 Flags 下面看到两个字母 **UG**。字母 **U** 代表接口是 **UP**，**G** 表示网关。

#### 3. 使用 netstat 命令查看网关 IP 地址

**Netstat** 会输出 Linux 网络子系统的信息。使用 netstat 工具，我们可以在 Linux 和 Unix 系统中打印网络连接、路由表、接口统计信息、伪装连接和组播成员关系。

Netstat 是 net-tools 包的一部分，所以确保你已经在 Linux 系统中安装了它。使用以下命令在基于 RHEL 的系统中安装它：

```
$ sudo dnf install net-tools
```

使用 netstat 命令打印默认网关 IP 地址：

```
$ netstat -rn
```

**示例输出：**

```
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.1.101   0.0.0.0         UG        0 0          0 eth0
172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 eth0
```

![使用 netstat 命令查看网关 IP 地址][4]

`netstat` 命令与 `route` 命令的输出信息相同。如上输出可知，网关的 IP 地址为 192.168.1.191，UG 表示网关连接的网卡（NIC）是有效的，G 表示网关。

请注意 `netstat` 也已弃用，建议使用 **ss** 命令代替 netstat。

#### 4. 使用 routel 命令打印默认网关或路由器 IP 地址

**routel** 是一个脚本，它以一种漂亮格式的输出路由。routel 脚本的输出让一些人认为比 `ip route` 列表更直观。

routel 脚本也是 net-tools 包的一部分。

打印默认网关或路由器 IP 地址，运行 routel 脚本，不带任何参数，如下所示：

```
$ routel
```

**示例输出：**

```
target                   gateway          source    proto    scope    dev tbl
        default      192.168.1.101                   static            eth0 
    172.17.0.0/ 16                      172.17.0.1   kernel     linkdocker0 
   192.168.1.0/ 24                    192.168.1.20   kernel     link   eth0 
     127.0.0.0/ 8            local       127.0.0.1   kernel     host     lo local
      127.0.0.1              local       127.0.0.1   kernel     host     lo local
127.255.255.255          broadcast       127.0.0.1   kernel     link     lo local
     172.17.0.1              local      172.17.0.1   kernel     hostdocker0 local
 172.17.255.255          broadcast      172.17.0.1   kernel     linkdocker0 local
   192.168.1.20              local    192.168.1.20   kernel     host   eth0 local
  192.168.1.255          broadcast    192.168.1.20   kernel     link   eth0 local
            ::1                                      kernel              lo 
            ::/ 96     unreachable                                       lo 
::ffff:0.0.0.0/ 96     unreachable                                       lo 
    2002:a00::/ 24     unreachable                                       lo 
   2002:7f00::/ 24     unreachable                                       lo 
   2002:a9fe::/ 32     unreachable                                       lo 
   2002:ac10::/ 28     unreachable                                       lo 
   2002:c0a8::/ 32     unreachable                                       lo 
   2002:e000::/ 19     unreachable                                       lo 
   3ffe:ffff::/ 32     unreachable                                       lo 
        fe80::/ 64                                   kernel            eth0 
            ::1              local                   kernel              lo local
fe80::d085:cff:fec7:c1c3              local                   kernel            eth0 local
```

![使用 routel 命令打印默认网关或路由器 IP 地址][5]

只打印默认网关，和 `grep` 命令配合，如下所示：

```
$ routel | grep default
        default      192.168.1.101                   static            eth0
```

#### 5. 从以太网配置文件中查找网关

如果你在 **[Linux 或 Unix 中配置了静态 IP 地址][6]，你可以通过查看网络配置文件查看默认网关或路由器 IP 地址。

在基于 RPM 的系统上，如 Fedora、RHEL、CentOS、AlmaLinux 和 Rocky Linux 等，网络接口卡（简称 **NIC**）配置存储在 **/etc/sysconfig/network-scripts/** 目录下。

查找网卡的名称：

```
# ip link show
```

**示例输出：**

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0@if5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether d2:85:0c:c7:c1:c3 brd ff:ff:ff:ff:ff:ff link-netnsid 0
```

网卡名为 **eth0**。所以让我们打开这个 NIC 文件的网卡配置：

```
# cat /etc/sysconfig/network-scripts/ifcfg-eth0
```

**示例输出：**

```
DEVICE=eth0
ONBOOT=yes
UUID=eb6b6a7c-37f5-11ed-a59a-a0e70bdf3dfb
BOOTPROTO=none
IPADDR=192.168.1.20
NETMASK=255.255.255.0
GATEWAY=192.168.1.101
DNS1=8.8.8.8
```

如你所见，网关 IP 为 `192.168.1.101`。

在 Debian、Ubuntu 及其衍生版中，所有的网络配置文件都存储在 **/etc/network** 目录下。

```
$ cat /etc/network/interfaces
```

**示例输出：**

```
auto ens18
iface ens18 inet static
        address 192.168.1.150
        netmask 255.255.255.0
        gateway 192.168.1.101
        dns-nameservers 8.8.8.8
```

请注意，此方法仅在手动配置 IP 地址时有效。对于启用 DHCP 的网络，需要按照前面的 4 种方法操作。

### 总结

在本指南中，我们列出了在 Linux 和 Unix 系统中找到默认网关的 5 种不同方法，我们还在每种方法中包含了显示网关/路由器 IP 地址的示例命令。希望它对你有所帮助。

--------------------------------------------------------------------------------

via: https://ostechnix.com/find-default-gateway-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/09/Find-Default-Gateway-Using-ip-Command.png
[2]: https://ostechnix.com/the-grep-command-tutorial-with-examples-for-beginners/
[3]: https://ostechnix.com/wp-content/uploads/2022/09/Display-Default-Gateway-IP-Address-Using-route-Command.png
[4]: https://ostechnix.com/wp-content/uploads/2022/09/View-Gateway-IP-Address-Using-netstat-Command.png
[5]: https://ostechnix.com/wp-content/uploads/2022/09/Print-Default-Gateway-IP-Address-Or-Router-IP-Address-Using-routel-Command.png
[6]: https://ostechnix.com/configure-static-ip-address-linux-unix/
