[#]: subject: "How to Configure VLAN Tagging Over Bonding on RHEL"
[#]: via: "https://www.2daygeek.com/configure-vlan-tagging-over-network-bonding-rhel/"
[#]: author: "Jayabal Thiyagarajan https://www.2daygeek.com/author/jayabal/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 RHEL 上通过绑定配置 VLAN 标记
======

在 Linux 中，你可以根据自己的需要创建高级网络设置，如网络绑定（Network Bonding）或网卡组队（NIC teaming）、VLAN 标记和桥接。这些高级功能可以提高网络连接的效率和可靠性。

你可以在以太网、绑定、组队或桥接设备等其他接口上创建 VLAN 接口。

在本文中，我们将学习如何在 RHEL 系统中通过网络绑定配置 VLAN 标记，它允许来自不同网络的流量共享共同的物理链接。

### 通过绑定对 VLAN 进行标记的先决条件：

  * 网络组队需要在网络交换机端口上启用 LACP (802.3ad)，以聚合链路。
  * 网络组队需要将网络端口配置为中继端口，这样可以在同一端口上添加多个 VLAN。此外，还要从他们那里获取 VLAN ID，以便在操作系统层面进行配置。
  * Linux 系统应该有两个接口。
  * 如果是物理服务器，我们建议在板载接口和 PCI 接口之间配置绑定，以避免主机端的网卡出现单点故障。



#### 绑定内核模块

使用 **lsmod 命令**检查 Linux 系统是否已加载绑定模块。

```

    lsmod | grep -i bonding

    bonding 12451 0

```

默认情况下已加载。否则，请使用 **modprobe** 命令加载它。

```

    modprobe bonding

```

### 1) LACP 绑定配置

我们将配置基于 LACP（Mode 4 – 802.3ad）的链路聚合绑定，通过组合名为 **em1** 和 **p7p1** 的两个接口，为绑定接口提供更大的带宽。

#### 1a) 创建 Bond 接口

在目录 **`/etc/sysconfig/network-scripts/`** 下创建 bond 接口文件 **`ifcfg-bond0`**。

```

    vi /etc/sysconfig/network-scripts/ifcfg-bond0

    TYPE=Bond
    DEVICE=bond0
    NAME=bond0
    BONDING_MASTER=yes
    BOOTPROTO=none
    ONBOOT=yes
    BONDING_OPTS="mode=4 miimon=100 lacp_rate=1"
    NM_CONTROLLED=no

```

#### 1b) 配置第一个从接口

配置您想要进行绑定的第一个从属接口 **`em1`**。 请根据您的环境使用正确的接口名称。

```

    vi /etc/sysconfig/network-scripts/ifcfg-em1

    TYPE=Ethernet
    BOOTPROTO=none
    DEVICE=em1
    ONBOOT=yes
    MASTER=bond0
    SLAVE=yes

```

#### 1c) 配置第二个从接口

配置您想要进行绑定的第二个从接口 **`p7p1`**。 请根据您的环境使用正确的接口名称。

```

    vi /etc/sysconfig/network-scripts/ifcfg-p7p1

    TYPE=Ethernet
    BOOTPROTO=none
    DEVICE=p7p1
    ONBOOT=yes
    MASTER=bond0
    SLAVE=yes

```

#### 重启网络服务

重启网络服务以启用绑定接口或使用 ifup 命令启动它们。

```

    systemctl restart network

```

### 2) 通过绑定接口进行 VLAN 标记

LACP Bonding 配置已完成，所有接口现已启动并运行。让我们按照以下步骤配置绑定接口上的 VLAN 标记。

正如先决条件中所讨论的，以下是映射到相应以太网卡端口（em1 和 p7p1）和网络交换机端口的 VLAN。

   * VLAN ID (221), VLAN N/W = 192.168.10.0/24
   * VLAN ID (331), VLAN N/W = 192.168.20.0/24



#### 2a) 将 VLAN 221 配置到 Bond0

为 VLAN id 221 创建标记接口文件 **`/etc/sysconfig/network-scripts/ifcfg-bond0.221`** 并添加以下内容。

```

    vi /etc/sysconfig/network-scripts/ifcfg-bond0.221

    DEVICE=bond0.221
    BOOTPROTO=none
    ONBOOT=yes
    IPADDR=192.168.10.100
    NETMASK=255.255.255.0
    GATEWAY=192.168.10.1
    VLAN=yes
    NM_CONTROLLED=no

```

#### 2b) 将 VLAN 331 配置到 Bond0

为 VLAN id 331 创建标记接口文件 **`/etc/sysconfig/network-scripts/ifcfg-bond0.331`** 并添加以下内容。

```

    vi /etc/sysconfig/network-scripts/ifcfg-bond0.331

    DEVICE=bond0.331
    BOOTPROTO=none
    ONBOOT=yes
    IPADDR=192.168.20.100
    NETMASK=255.255.255.0
    GATEWAY=192.168.20.1
    VLAN=yes
    NM_CONTROLLED=no

```

#### 重启网络服务

重启网络服务以启用绑定接口或使用 ifup 命令启动它们。

```

    systemctl restart network

```

### 验证 VLAN 标记配置

最后使用 **[ip 命令][1]**验证 VLAN 标记接口是否已配置并启动和运行。

是的，我可以看到 **`bondo.221@bond0`** 和 **`bon0.331@bond0`** 有两个不同的 IP，并且能够通过 ssh 访问系统，没有任何问题。因此，VLAN 标记按预期工作。

![][2]

##### 结论

恭喜，您已经了解了如何在 RHEL 系统上通过 LACP 绑定配置 VLAN 标记，该系统监听两个 VLAN。VLAN 标记不限于两个 VLAN，支持多个 VLAN，您可以根据该 VLAN 的网络配置添加 VLAN 标记。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/configure-vlan-tagging-over-network-bonding-rhel/

作者：[Jayabal Thiyagarajan][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/jayabal/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-ip-command-configure-network-interface/
[2]: https://www.2daygeek.com/wp-content/uploads/2023/09/configure-vlan-tagging-over-bonding-rhel-1024x395.jpg
