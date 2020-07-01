[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12290-1.html)
[#]: subject: (How to Manipulate an Ethernet Card Using the ethtool Command)
[#]: via: (https://www.2daygeek.com/linux-ethtool-command-view-change-ethernet-adapter-settings-nic-card/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何使用 ethtool 命令管理以太网卡
======

![](https://img.linux.net.cn/data/attachment/album/202006/06/223359syh8n37luz8hhllh.jpg)

`ethtool` 用于查看和修改网络设备（尤其是有线以太网设备）的驱动参数和硬件设置。你可以根据需要更改以太网卡的参数，包括自动协商、速度、双工和局域网唤醒等参数。通过对以太网卡的配置，你的计算机可以通过网络有效地进行通信。该工具提供了许多关于接驳到你的 Linux 系统的以太网设备的信息。

在这篇文章中，我们将告诉你如何更改以下的参数以及如何查看这些参数。这篇文章将帮助你在 Linux 系统中排除与以太网卡相关的问题。

下面的信息将帮助你了解以太网卡的工作原理。

* **半双工**：半双工模式允许设备一次只能发送或接收数据包。
* **全双工**：全双工模式允许设备可以同时发送和接收数据包。
* **自动协商**：自动协商是一种机制，允许设备自动选择最佳网速和工作模式（全双工或半双工模式）。
* **速度**：默认情况下，它会使用最大速度，你可以根据自己的需要改变它。
* **链接检测**：链接检测可以显示网卡的状态。如果显示为 `no`，请尝试重启网卡。如果链路检测仍显示 `no`，则检查交换机与系统之间连接的线缆是否有问题。

### 如何在 Linux 上安装 ethtool

默认情况下，大多数系统上应该已经安装了 `ethtool`。如果没有，你可以从发行版的官方版本库中安装。

对于 RHEL/CentOS 6/7 系统，请使用 [yum 命令][1] 安装 `ethtool`：

```
$ sudo yum install -y ethtool
```

对于 RHEL/CentOS 8 和 Fedora 系统，请使用 [dnf 命令][2] 安装 `ethtool`：

```
$ sudo yum install -y ethtool
```

对于基于 Debian 的系统，请使用 [apt 命令][3] 或 [apt-get 命令][4] 安装 `ethtool`：

```
$ sudo apt-get install ethtool
```

对于 openSUSE 系统，使用 [zypper 命令][5] 安装 `ethtool`：

```
$ sudo zypper install -y ethtool
```

对于 Arch Linux 系统，使用 [pacman 命令][6] 安装 `ethtool`：

```
$ sudo pacman -S ethtool
```

### 如何检查 Linux 上的可用网络接口

你可以使用 [ip 命令][7]或 `ifconfig` 命令（在现代发行版中已被淘汰）来验证可用的、活动的网卡的名称和其他细节：

```
# ip a
或
# ifconfig

1: lo: mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:10:22:35:23:sf brd ff:ff:ff:ff:ff:ff
    inet 192.164.23.100/24 brd 192.164.23.255 scope global eth0
       valid_lft forever preferred_lft forever
```

### 如何检查 Linux 上的网卡（NIC）信息

掌握了以太网卡名称后，就可以使用 `ethtool` 命令轻松查看其详细信息，如下所示。

在 Linux 系统中，每个网卡（NIC）都被分配了唯一的名称，如 ethX、enpXXX 等。

* 旧的 Linux 发行版使用的是 `eth[X]` 格式。例如，RHEL 6 和它们的旧版本。
* 现代的 Linux 发行版使用 `enp[XXX]` 或 `ens[XXX]` 格式。例如，大多数现代 Linux 发行版都使用这种格式，包括 RHEL 7、Debian 10、Ubuntu 16.04 LTS。

```
# ethtool eth0

Settings for eth0:
        Supported ports: [ TP ]
        Supported link modes: 1000baseT/Full
                              10000baseT/Full
        Supported pause frame use: No
        Supports auto-negotiation: No
        Supported FEC modes: Not reported
        Advertised link modes: Not reported
        Advertised pause frame use: No
        Advertised auto-negotiation: No
        Advertised FEC modes: Not reported
        Speed: 10000Mb/s
        Duplex: Full
        Port: Twisted Pair
        PHYAD: 0
        Transceiver: internal
        Auto-negotiation: off
        MDI-X: Unknown
        Supports Wake-on: uag
        Wake-on: d
        Link detected: yes
```

### 如何检查以太网卡的驱动程序和固件版本

你可以使用 `ethtool` 命令的 `-i` 选项检查驱动程序版本、固件版本和总线的详细信息，如下所示：

```
# ethtool -i eth0

driver: vmxnet3
version: 1.4.16.0-k-NAPI
firmware-version:
expansion-rom-version:
bus-info: 0000:0b:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: yes
supports-priv-flags: no
```

### 如何检查网络使用情况统计

你可以使用 `ethtool` 命令中的 `-S` 选项来查看网络使用情况统计。它可以显示传输的字节数、接收的字节数、错误数等。

```
# ethtool -S eth0

NIC statistics:
     Tx Queue#: 0
       TSO pkts tx: 2053
       TSO bytes tx: 7167572
       ucast pkts tx: 4028081
       ucast bytes tx: 399093197
       mcast pkts tx: 0
       mcast bytes tx: 0
       bcast pkts tx: 0
       bcast bytes tx: 0
       pkts tx err: 0
       pkts tx discard: 0
       drv dropped tx total: 0
          too many frags: 0
          giant hdr: 0
          hdr err: 0
          tso: 0
       ring full: 0
       pkts linearized: 0
       hdr cloned: 0
       giant hdr: 0
     Tx Queue#: 1
       TSO pkts tx: 1955
       TSO bytes tx: 6536945
       ucast pkts tx: 3711838
       ucast bytes tx: 346309662
       mcast pkts tx: 0
       mcast bytes tx: 0
       bcast pkts tx: 1186
       bcast bytes tx: 49812
       pkts tx err: 0
       pkts tx discard: 0
       drv dropped tx total: 0
          too many frags: 0
          giant hdr: 0
          hdr err: 0
          tso: 0
       ring full: 0
       pkts linearized: 0
       hdr cloned: 0
       giant hdr: 0
     Rx Queue#: 0
       LRO pkts rx: 0
       LRO byte rx: 0
       ucast pkts rx: 5084776
       ucast bytes rx: 4673133395
       mcast pkts rx: 0
       mcast bytes rx: 0
       bcast pkts rx: 154143
       bcast bytes rx: 45415676
       pkts rx OOB: 0
       pkts rx err: 0
       drv dropped rx total: 0
          err: 0
          fcs: 0
       rx buf alloc fail: 0
     Rx Queue#: 1
       LRO pkts rx: 0
       LRO byte rx: 0
       ucast pkts rx: 6346769
       ucast bytes rx: 4835534292
       mcast pkts rx: 0
       mcast bytes rx: 0
       bcast pkts rx: 3464
       bcast bytes rx: 714646
       pkts rx OOB: 0
       pkts rx err: 0
       drv dropped rx total: 0
          err: 0
          fcs: 0
       rx buf alloc fail: 0
     tx timeout count: 0
```

### 如何改变以太网设备的速度

你可以根据需要改变以太网的速度。当你进行此更改时，网卡将自动掉线，你需要使用 [ifup 命令][8] 或 `ip` 命令或 `nmcli` 命令将其重新上。

```
# ethtool -s eth0 speed 100
# ip link set eth0 up
```

### 如何在 Linux 上启用/禁用以太网卡的自动协商？

你可以使用 `ethtool` 命令中的 `autoneg` 选项启用或禁用自动协商，如下图所示：

```
# ethtool -s eth0 autoneg off
# ethtool -s eth0 autoneg on
```

### 如何同时更改多个参数

如果你想使用 `ethtool` 命令同时更改以太网卡的多个参数，请使用下面的格式：

```
Syntax:
ethtool –s [device_name] speed [10/100/1000] duplex [half/full] autoneg [on/off]
```

```
# ethtool –s eth0 speed 1000 duplex full autoneg off
```

### 如何检查特定网卡的自动协商、RX 和 TX

要查看关于特定以太网设备的自动协商等详细信息，请使用以下格式：
 
```
# ethtool -a eth0
```

### 如何从多个设备中识别出特定的网卡（闪烁网卡上的 LED）

如果你想识别一个特定的物理接口，这个选项非常有用。下面的 `ethtool` 命令会使 `eth0` 端口的 LED 灯闪烁：

```
# ethtool -p eth0
```

### 如何在 Linux 中永久设置这些参数

在系统重启后，你使用 `ethtool` 所做的更改将被默认恢复。

要使自定义设置永久化，你需要更新网络配置文件中的值。根据你的 Linux 发行版，你可能需要将此值更新到正确的文件中。

对于基于 RHEL 的系统。你必须使用 `ETHTOOL_OPTS` 变量：

```
# vi /etc/sysconfig/network-scripts/ifcfg-eth0

ETHTOOL_OPTS="speed 1000 duplex full autoneg off"
```

对于基于 Debian 的系统：

```
# vi /etc/network/interfaces

post-up ethtool -s eth0 speed 1000 duplex full autoneg off
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-ethtool-command-view-change-ethernet-adapter-settings-nic-card/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[2]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[6]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[7]: https://www.2daygeek.com/ip-command-configure-network-interface-usage-linux/
[8]: https://www.2daygeek.com/enable-disable-up-down-nic-network-interface-port-linux-using-ifconfig-ifdown-ifup-ip-nmcli-nmtui/
