[#]: collector: (lujun9972)
[#]: translator: (YungeG)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13691-1.html)
[#]: subject: (Managing your attached hardware on Linux with systemd-udevd)
[#]: via: (https://opensource.com/article/20/2/linux-systemd-udevd)
[#]: author: (David Clinton https://opensource.com/users/dbclinton)

在 Linux 使用 systemd-udevd 管理你的接入硬件
======

> 使用 udev 管理你的 Linux 系统处理物理设备的方式。

![](https://img.linux.net.cn/data/attachment/album/202108/17/104654z1evcdx41xfc4zpq.jpg)

Linux 能够出色地自动识别、加载、并公开接入的无数厂商的硬件设备。事实上，很多年以前，正是这个特性说服我，坚持让我的雇主将整个基础设施转换到 Linux。痛点在于 Redmond 的某家公司（LCTT 译注：指微软）不能在我们的 Compaq 台式机上加载集成网卡的驱动，而 Linux 可以轻松实现这一点。

从那以后的岁月里，Linux 的识别设备库随着该过程的复杂化而与日俱增，而 [udev][2] 就是解决这个问题的希望之星。udev 负责监听 Linux 内核发出的改变设备状态的事件。它可能是一个新 USB 设备被插入或拔出，也可能是一个无线鼠标因浸入洒出的咖啡中而脱机。

udev 负责处理所有的状态变更，比如指定访问设备使用的名称和权限。这些更改的记录可以通过 [dmesg][3] 获取。由于 dmesg 的输出通常有几千行，对结果进行过滤通常是聪明的选择。下面的例子说明了 Linux 如何识别我的 WiFi 接口。这个例子展示了我的无线设备使用的芯片组（`ath9k`）、启动过程早期阶段分配的原始名称（`wlan0`）、以及正在使用的又臭又长的永久名称（`wlxec086b1ef0b3`）：

```
$ dmesg | grep wlan
[    5.396874] ath9k_htc 1-3:1.0 wlxec086b1ef0b3: renamed from wlan0
```

在这篇文章中，我会讨论为何有人想要使用这样的名称。在这个过程中，我会探索剖析 udev 的配置文件，然后展示如何更改 udev 的设置，包括编辑系统命名设备的方式。这篇文件基于我的新课程中《[Linux 系统优化][4]》的一个模块。

### 理解 udev 配置系统

使用 systemd 的机器上，udev 操作由 `systemd-udevd` 守护进程管理，你可以通过常规的 systemd 方式使用 `systemctl status systemd-udevd` 检查 udev 守护进程的状态。

严格来说，udev 的工作方式是试图将它收到的每个系统事件与 `/lib/udev/rules.d/` 和 `/etc/udev/rules.d/` 目录下找到的规则集进行匹配。规则文件包括匹配键和分配键，可用的匹配键包括 `action`、`name` 和 `subsystem`。这意味着如果探测到一个属于某个子系统的、带有特定名称的设备，就会给设备指定一个预设的配置。

接着，“分配”键值对被拿来应用想要的配置。例如，你可以给设备分配一个新名称、将其关联到文件系统中的一个符号链接、或者限制为只能由特定的所有者或组访问。这是从我的工作站摘出的一条规则：

```
$ cat /lib/udev/rules.d/73-usb-net-by-mac.rules
# Use MAC based names for network interfaces which are directly or indirectly
# on USB and have an universally administered (stable) MAC address (second bit
# is 0). Don't do this when ifnames is disabled via kernel command line or
# customizing/disabling 99-default.link (or previously 80-net-setup-link.rules).

IMPORT{cmdline}="net.ifnames"
ENV{net.ifnames}=="0", GOTO="usb_net_by_mac_end"

ACTION=="add", SUBSYSTEM=="net", SUBSYSTEMS=="usb", NAME=="", \
    ATTR{address}=="?[014589cd]:*", \
    TEST!="/etc/udev/rules.d/80-net-setup-link.rules", \
    TEST!="/etc/systemd/network/99-default.link", \
    IMPORT{builtin}="net_id", NAME="$env{ID_NET_NAME_MAC}"
```

`add` 动作告诉 udev，只要新插入的设备属于网络子系统，*并且*是一个 USB 设备，就执行操作。此外，如果我理解正确的话，只有设备的 MAC 地址由特定范围内的字符组成，并且 `80-net-setup-link.rules` 和 `99-default.link` 文件*不*存在时，规则才会生效。

假定所有的条件都满足，接口 ID 会改变以匹配设备的 MAC 地址。还记得之前的 dmesg 信息显示我的接口名称从 `wlan0` 改成了讨厌的 `wlxec086b1ef0b3` 吗？那都是这条规则的功劳。我怎么知道？因为 `ec:08:6b:1e:f0:b3` 是设备的 MAC 地址（不包括冒号）。

```
$ ifconfig -a
wlxec086b1ef0b3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.103  netmask 255.255.255.0  broadcast 192.168.0.255
        inet6 fe80::7484:3120:c6a3:e3d1  prefixlen 64  scopeid 0x20<link>
        ether ec:08:6b:1e:f0:b3  txqueuelen 1000  (Ethernet)
        RX packets 682098  bytes 714517869 (714.5 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 472448  bytes 201773965 (201.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

Linux 默认包含这条 udev 规则，我不需要自己写。但是为什么费力进行这样的命名呢——尤其是看到这样的接口命名这么难使用后？仔细看一下包含在规则中的注释：

> 对直接或间接插入在 USB 上的网络接口使用基于 MAC 的名称，并且用一个普遍提供的（稳定的）MAC 地址（第二位是 0）。当 ifnames 通过内核命令行或 `customizing/disabling 99-default.link`（或之前的 `80-net-setup-link.rules`）被禁用时，不要这样做。

注意，这个规则专为基于 USB 的网络接口设计的。和 PCI 网络接口卡（NIC）不同，USB 设备很可能时不时地被移除或者替换，这意味着无法保证它们的 ID 不变。某一天 ID 可能是 `wlan0`，第二天却变成了 `wlan3`。为了避免迷惑应用程序，指定绝对 ID 给设备——就像分配给我的 USB 接口的 ID。

### 操作 udev 的设置

下一个示例中，我将从 [VirtualBox][5] 虚拟机里抓取以太网接口的 MAC 地址和当前接口 ID，然后用这些信息创建一个改变接口 ID 的 udev 新规则。为什么这么做？也许我打算从命令行操作设备，需要输入那么长的名称让人十分烦恼。下面是工作原理。

改变接口 ID 之前，我需要关闭 [Netplan][6] 当前的网络配置，促使 Linux 使用新的配置。下面是 `/etc/netplan/` 目录下我的当前网络接口配置文件：

```
$ less /etc/netplan/50-cloud-init.yaml
# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        enp0s3:
            addresses: []
            dhcp4: true
    version: 2
```

`50-cloud-init.yaml` 文件包含一个非常基本的接口定义，但是注释中也包含一些禁用配置的重要信息。为此，我将移动到 `/etc/cloud/cloud.cfg.d` 目录，创建一个名为 `/etc/cloud/cloud.cfg.d` 的新文件，插入 `network: {config: disabled}` 字符串。

尽管我只在 Ubuntu 发行版上测试了这个方法，但它应该在任何一个带有 systemd 的 Linux（几乎所有的 Linux 发行版都有 systemd）上都可以工作。不管你使用哪个，都可以很好地了解编写 udev 配置文件并对其进行测试。

接下来，我需要收集一些系统信息。执行 `ip` 命令，显示我的以太网接口名为 `enp0s3`，MAC 地址是 `08:00:27:1d:28:10`。

```
$ ip a
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:1d:28:10 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.115/24 brd 192.168.0.255 scope global dynamic enp0s3
```

现在，我要在 `/etc/udev/rules.d` 目录创建一个名为 `peristent-net.rules` 的新文件。我将给文件一个以较小的数字开头的名称，比如 10：

```
$ cat /etc/udev/rules.d/10-persistent-network.rules
ACTION=="add", SUBSYSTEM=="net",ATTR{address}=="08:00:27:1d:28:10",NAME="eth3"
```

数字越小，Linux 越早执行文件，我想要这个文件早点执行。文件被添加时，包含其中的代码就会分配名称 `eth3` 给网络设备——只要设备的地址能够匹配 `08:00:27:1d:28:10`，即我的接口的 MAC 地址 。

保存文件并重启计算机后，我的新接口名应该就会生效。我可能需要直接登录虚拟机，使用 `dhclient` 手动让 Linux 为这个新命名的网络请求一个 IP 地址。在执行下列命令前，可能无法打开 SSH 会话：

```
$ sudo dhclient eth3
```

大功告成。现在你能够促使 udev 控制计算机按照你想要的方式指向一个网卡，但更重要的是，你已经有了一些工具，可以弄清楚如何管理任何不听话的设备。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/linux-systemd-udevd

作者：[David Clinton][a]
选题：[lujun9972][b]
译者：[YungeG](https://github.com/YungeG)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dbclinton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_BUS_Apple_520.png?itok=ZJu-hBV1 (collection of hardware on blue backround)
[2]: https://en.wikipedia.org/wiki/Udev
[3]: https://en.wikipedia.org/wiki/Dmesg
[4]: https://pluralsight.pxf.io/RqrJb
[5]: https://www.virtualbox.org/
[6]: https://netplan.io/
