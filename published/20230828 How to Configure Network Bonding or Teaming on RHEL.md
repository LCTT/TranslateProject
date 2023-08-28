[#]: subject: "How to Configure Network Bonding or Teaming on RHEL"
[#]: via: "https://www.2daygeek.com/configure-network-bonding-nic-teaming-rhel/"
[#]: author: "Jayabal Thiyagarajan https://www.2daygeek.com/author/jayabal/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16136-1.html"

在 RHEL 上配置网络绑定（成组）
======

![][0]

网络 <ruby>[绑定][1]<rt>Bonding</rt></ruby>（<ruby>成组<rt>Teaming</rt></ruby>） 是 Linux 的一项内核特性，它让我们可以将多个网络接口（例如 `ens192`、`ens224`）聚合为一个专有的虚拟网络接口，被称为通道绑定（`bond0`）。这样做能够提升吞吐量并增加冗余备份。

网络绑定一共支持 7 种模式，你可以根据实际需求进行设置。<ruby>链接聚合控制协议<rt>Link Aggregation Control Protocol</rt></ruby>（LACP）， 即模式 4（802.3ad）因其支持链接聚合与冗余而被广泛应用。

在本篇文章中，我们将引导你学习如何在 RHEL 系统中配置网卡（网络）绑定。

### LACP 绑定的前置条件

  * 网络团队需要在网络交换机的端口上开启 LACP（802.3ad）来实现链接的聚合。
  * 一个 Linux 系统应该配备至少两个网络接口。
  * 对于物理服务器，我们推荐在板载接口与 PCI 接口间进行绑定配置，以避免在主机端的网络卡出现单点故障。

### Bonding 模块

你可以使用 `lsmod` 命令来确认你的 Linux 系统是否已经加载了 `bonding` 模块。

```
lsmod | grep -i bonding
bonding               12451  0
```

系统应该默认已加载。如果未看到，可以运用 `modprobe` 命令进行加载。

```
modprobe bonding
```

### 创建绑定接口

在 `/etc/sysconfig/network-scripts/` 路径下，创建一个名为 `ifcfg-bond0` 的绑定接口文件。依据你的网络情况，你可能需要修改诸如 `IP`、`MASK` 以及 `GATEWAY` 等值。

```
vi /etc/sysconfig/network-scripts/ifcfg-bond0
```

```
TYPE=Bond
DEVICE=bond0
NAME=bond0
BONDING_MASTER=yes
BOOTPROTO=none
ONBOOT=yes
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
BONDING_OPTS="mode=4 miimon=100 lacp_rate=1"
```

参数 | 描述
---|---
`BONDING_MASTER=yes` | 表示设备是一个绑定主设备。
`mode=4` | 绑定模式是 IEEE 802.3ad 动态链接聚合（LACP）。
`miimon=100` | 定义以毫秒单位的 MII 链路监测频率，这决定了多久检查每个从属链路的状态一次以寻找失败的链路。`0` 值将禁用 MII 链路监测。`100` 是个不错的初始值。
`lacp_rate=1` | 一个设置项，规定我们将以何种频率要求我们的链路伙伴每秒钟发送 LACPDU。默认为慢，即 `0`。

### 配置第一个子接口

修改你希望添加到绑定中的第一个子接口。请根据你的实际环境使用合适的接口名。

```
vi /etc/sysconfig/network-scripts/ifcfg-ens192
```

```
TYPE=Ethernet
BOOTPROTO=none
DEVICE=ens192
ONBOOT=yes
MASTER=bond0
SLAVE=yes
```

### 配置第二个子接口

修改你希望添加到绑定中的第二个子接口。请根据你的实际环境使用合适的接口名。

```
vi /etc/sysconfig/network-scripts/ifcfg-ens224
```

```
TYPE=Ethernet
BOOTPROTO=none
DEVICE=ens224
ONBOOT=yes
MASTER=bond0
SLAVE=yes
```

### 重启网络服务

重启网络服务以激活绑定接口。

```
systemctl restart network
```

### 验证绑定配置

你可以借助 [ip 命令][2] 来查看绑定接口以及其子接口的情况。可以看到，`bond0` 现在已启动并在运行。

![][3]

### 查阅绑定接口状态

检查以下文件，你可以看到绑定接口及其子接口的详细信息。输出结果应该看起来很不错，我们能看到诸如绑定模式，MII 状态，MII 轮询间隔，LACP 速率，端口数量等信息。

```
cat /proc/net/bonding/bond0
```

```
Ethernet Channel Bonding Driver: v3.7.1 (April 27, 2011)

Bonding Mode: IEEE 802.3ad Dynamic link aggregation
Transmit Hash Policy: layer (0)
MII Status: up
MII Polling Interval (ms): 100
Up Delay (ms): 0
Down Delay (ms): 0

802.3ad info
LACP rate: fast
Min links: 0
Aggregator selection policy (ad_select): stable
System priority: 65535
System MAC address: c8:5b:76:4d:d4:5c
Active Aggregator Info:
        Aggregator ID: 1
        Number of ports: 2
        Actor Key: 15
        Partner Key: 32773
        Partner Mac Address: e4:a7:a0:32:fc:e9

Slave Interface: ens192
MII Status: up
Speed: 10000 Mbps
Duplex: full
Link Failure Count: 0
Permanent HW addr: c8:5b:76:4d:d4:5c
Slave queue ID: 0
Aggregator ID: 1
Actor Churn State: none
Partner Churn State: none
Actor Churned State: 0
Partner Churned State: 0
details actor lacp pdu:
    system priority: 65535
    system mac address: c8:5b:76:4d:d4:5c
    port key: 15
    port priority: 255
    port number: 1
    port state: 63
details Partner lacp pdu:
    system priority: 32667
    system mac address: e4:a7:a0:32:fc:e9
    oper key: 32773
    port priority: 32768
    port number: 290
    port state: 61

Slave Interface: ens224
MII Status: up
Speed: 10000 Mbps
Duplex: full
Link Failure Count: 0
Permanent HW addr: e4:a7:a0:32:fc:e9
Slave queue ID: 0
Aggregator ID: 1
Actor Churn State: none
Partner Churn State: none
Actor Churned State: 0
Partner Churned State: 0
details actor lacp pdu:
    system priority: 65535
    system mac address: e4:a7:a0:32:fc:e9
    port key: 15
    port priority: 255
    port number: 2
    port state: 63
details Partner lacp pdu:
    system priority: 32667
    system mac address: c8:5b:76:4d:d4:5c
    oper key: 32773
    port priority: 32768
    port number: 16674
    port state: 61
```

### 容错/冗余测试

为了验证容错性和连接速度，你可以逐个断开接口，然后检查服务器是否仍旧可达。

  * 测试用例-1：当两个子接口都启动并运行时，使用 [ethtool 命令][4] 检查链路速度。
  * 测试用例-2：断开第一个子接口，然后尝试访问系统。
  * 测试用例-3：断开第二个子接口，然后尝试访问系统。

#### 测试用例-1：

如果你想检测下连接速度：没错，我在 `bond0` 上看到了 `20 Gbps` 的速度，因为每个子接口支持 10 Gbps。

```
ethtool bond0
```

```
Settings for bond0:
        Supported ports: [ ]
        Supported link modes:   Not reported
        Supported pause frame use: No
        Supports auto-negotiation: No
        Supported FEC modes: Not reported
        Advertised link modes:  Not reported
        Advertised pause frame use: No
        Advertised auto-negotiation: No
        Advertised FEC modes: Not reported
        Speed: 20000Mb/s
        Duplex: Full
        Port: Other
        PHYAD: 0
        Transceiver: internal
        Auto-negotiation: off
        Link detected: yes
```

#### 测试用例-2：

现在我们将关闭第一个子接口。

```
ifdown ens192
```

```
Device 'ens192' successfully disconnected.
```

通过 `ssh` 尝试访问系统。没问题，系统现在是可以访问的。

```
ssh [email protected]
```

由于已经有一个子接口关闭，你现在在 `bond0` 上只能看到 10 Gbps 的速度。

```
ethtool bond0 | grep -i speed
```

```
            Speed: 10000Mb/s
```

现在，我们再次查看绑定接口的状态。可以看出，只有一个子接口处于活跃状态。

```
cat /proc/net/bonding/bond0
```

#### 测试用例-3：

我们来关闭第二个子接口，并进行类似测试用例-2 的测试：

```
ifdown ens224
```

```
Device 'ens224' successfully disconnected.
```

### 结语

我希望你已经掌握了在 RHEL 上配置 LACP 绑定的方法。

在本教程中，我们为你展示了在 RHEL 系统配置网络绑定或网卡聚合的最简单方式。

如果你有任何疑问或者反馈，欢迎在下面留言。

*（题图：MJ/939f6ba6-eb46-480d-8879-3a422c7425d2）*

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/configure-network-bonding-nic-teaming-rhel/

作者：[Jayabal Thiyagarajan][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/jayabal/
[b]: https://github.com/lujun9972
[1]: https://www.kernel.org/doc/Documentation/networking/bonding.txt
[2]: https://www.2daygeek.com/linux-ip-command-configure-network-interface/
[3]: https://www.2daygeek.com/wp-content/uploads/2023/08/configure-network-bonding-nic-teaming-rhel-2-1024x276.jpg
[4]: https://www.2daygeek.com/view-change-ethernet-adapter-settings-nic-card-linux/
[0]: https://img.linux.net.cn/data/attachment/album/202308/28/122437eaiz28h2y0a594z9.jpg