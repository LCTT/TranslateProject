[#]: subject: "NMState: A declarative networking config tool"
[#]: via: "https://fedoramagazine.org/nmstate-a-declarative-networking-config-tool/"
[#]: author: "Maurizio Garcia https://fedoramagazine.org/author/malgnuz/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13861-1.html"

NMState：一个声明式网络配置工具
======

![](https://img.linux.net.cn/data/attachment/album/202110/08/145714mqcyh6sshchomyot.jpg)

这篇文章描述并演示了 NMState，这是一个使用声明式方法配置主机的网络管理器。这意味着你可以通过 API 定义所需的配置状态，而工具则通过<ruby>提供者<rt>provider</rt></ruby>来应用配置。

### 配置方法：命令式与声明式

网络管理有时候是一项非常复杂的任务，这取决于环境的规模和多样性。在 IT 的早期，网络管理依赖于网络管理员在网络设备上手动执行命令。如今，<ruby>基础设施即代码<rt>Infrastructure as Code</rt></ruby>（IaC）允许以不同的方式将这些任务自动化。z这基本上有两种方法：命令式或声明式。

在命令式方法中，你会定义“如何”达到所需的配置状态。而在声明式范式里则定义了“什么”是所需的配置状态，所以它不确定哪些步骤是必需的，也不确定它们必须以何种顺序执行。这种方法目前正在聚集更多的人员参与，你可以在目前使用的大多数管理和编排工具上找到它。

### NMState：一个声明式的工具

NMState 是一个网络管理器，允许你按照声明式方法配置主机。这意味着你通过一个北向的声明式 API 定义所需的配置状态，这个工具通过南向的<ruby>提供者<rt>provider</rt></ruby>应用配置。

目前 NMState 支持的唯一的提供者是 NetworkManager，它是为 Fedora Linux 提供网络功能的主要服务。不过，NMState 的开发计划中将逐渐增加其他提供者。

关于 NMState 的进一步信息，请访问其项目 [站点][4] 或 GitHub [仓库][5]。

### 安装

NMState 在 Fedora Linux 29+ 上可用，需要在系统上安装并运行 NetworkManager 1.26 或更高版本。下面是在 Fedora Linux 34 上的安装情况：

```
$ sudo dnf -y install nmstate
...
输出节略
...
Installed:
  NetworkManager-config-server-1:1.30.4-1.fc34.noarch      gobject-introspection-1.68.0-3.fc34.x86_64      nispor-1.0.1-2.fc34.x86_64              nmstate-1.0.3-2.fc34.noarch
  python3-gobject-base-3.40.1-1.fc34.x86_64                python3-libnmstate-1.0.3-2.fc34.noarch          python3-nispor-1.0.1-2.fc34.noarch      python3-varlink-30.3.1-2.fc34.noarch

Complete!
```

这样，你可以使用 `nmstatectl` 作为 NMState 的命令行工具。请参考 `nmstatectl -help` 或 `man nmstatectl` 以了解关于这个工具的进一步信息。

### 使用 NMstate

首先要检查系统中安装的 NMState 版本：

```
$ nmstatectl version
1.0.3
```

检查一个网络接口的当前配置，例如 `eth0` 的配置：

```
$ nmstatectl show eth0
2021-06-29 10:28:21,530 root         DEBUG    NetworkManager version 1.30.4
2021-06-29 10:28:21,531 root         DEBUG    Async action: Retrieve applied config: ethernet eth0 started
2021-06-29 10:28:21,531 root         DEBUG    Async action: Retrieve applied config: ethernet eth1 started
2021-06-29 10:28:21,532 root         DEBUG    Async action: Retrieve applied config: ethernet eth0 finished
2021-06-29 10:28:21,533 root         DEBUG    Async action: Retrieve applied config: ethernet eth1 finished
---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 100
    next-hop-address: ''
    next-hop-interface: eth0
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 100
    next-hop-address: 192.168.122.1
    next-hop-interface: eth0
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 100
    next-hop-address: ''
    next-hop-interface: eth0
    table-id: 254
interfaces:
- name: eth0
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.238
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: true
  ipv6:
    enabled: true
    address:
    - ip: fe80::c3c9:c4f9:75b1:a570
      prefix-length: 64
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    autoconf: true
    dhcp: true
  lldp:
    enabled: false
  mac-address: 52:54:00:91:E4:4E
  mtu: 1500
```

正如你在上面看到的，这个网络配置显示了四个主要部分：

  * `dns-resolver`：这部分是这个接口的名字服务器配置。
  * `route-rules`：它说明了路由规则。 
  * `routes`：它包括动态和静态路由。
  * `interfaces`：这部分描述了 ipv4 和 ipv6 设置。

### 修改配置

你可以在两种模式下修改所需的配置状态：

  * 交互式：通过 `nmstatectl edit` 编辑接口配置。这个命令调用环境变量 `EDITOR` 定义的文本编辑器，因此可以用 yaml 格式编辑网络状态。完成编辑后，NMState 将应用新的网络配置，除非有语法错误。
  * 基于文件的：使用 `nmstatectl apply` 应用接口配置，它从先前创建的 yaml 或 json 文件中导入一个所需的配置状态。

下面几节告诉你如何使用 NMState 来改变网络配置。这些改变可能会对系统造成破坏，所以建议在测试系统或客户虚拟机上执行这些任务，直到你对 NMState 有更好的理解。

这里使用的测试系统有两个以太网接口，`eth0` 和 `eth1`：

```
$ ip -br -4 a
lo               UNKNOWN        127.0.0.1/8
eth0             UP             192.168.122.238/24
eth1             UP             192.168.122.108/24
```

#### 互动配置模式的例子

使用 `nmstatectl edit` 命令将 `eth0` 接口的 MTU 改为 9000 字节，如下所示：

```
$ sudo nmstatectl edit eth0

---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 100
    next-hop-address: ''
    next-hop-interface: eth0
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 100
    next-hop-address: 192.168.122.1
    next-hop-interface: eth0
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 100
    next-hop-address: ''
    next-hop-interface: eth0
    table-id: 254
interfaces:
- name: eth0
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.123
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: true
  ipv6:
    enabled: true
    address:
    - ip: fe80::c3c9:c4f9:75b1:a570
      prefix-length: 64
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    autoconf: true
    dhcp: true
  lldp:
    enabled: false
  mac-address: 52:54:00:91:E4:4E
  mtu: 9000
```

在保存并退出编辑器后，NMState 应用新的网络期望状态：

```
2021-06-29 11:29:05,726 root         DEBUG    Nmstate version: 1.0.3
2021-06-29 11:29:05,726 root         DEBUG    Applying desire state: {'dns-resolver': {'config': {}, 'running': {'search': [], 'server': ['192.168.122.1']}}, 'route-rules': {'config': []}, 'routes': {'config': [], 'running': [{'destination': 'fe80::/64', 'metric': 102, 'next-hop-address': '', 'next-hop-interface': 'eth0', 'table-id': 254}, {'destination': '0.0.0.0/0', 'metric': 102, 'next-hop-address': '192.168.122.1', 'next-hop-interface': 'eth0', 'table-id': 254}, {'destination': '192.168.122.0/24', 'metric': 102, 'next-hop-address': '', 'next-hop-interface': 'eth0', 'table-id': 254}]}, 'interfaces': [{'name': 'eth0', 'type': 'ethernet', 'state': 'up', 'ipv4': {'enabled': True, 'address': [{'ip': '192.168.122.238', 'prefix-length': 24}], 'auto-dns': True, 'auto-gateway': True, 'auto-route-table-id': 0, 'auto-routes': True, 'dhcp': True}, 'ipv6': {'enabled': True, 'address': [{'ip': 'fe80::5054:ff:fe91:e44e', 'prefix-length': 64}], 'auto-dns': True, 'auto-gateway': True, 'auto-route-table-id': 0, 'auto-routes': True, 'autoconf': True, 'dhcp': True}, 'lldp': {'enabled': False}, 'mac-address': '52:54:00:91:E4:4E', 'mtu': 9000}]}
--- output omitted ---
2021-06-29 11:29:05,760 root         DEBUG    Async action: Update profile uuid:2bdee700-f62b-365a-bd1d-69d9c31a9f0c iface:eth0 type:ethernet started
2021-06-29 11:29:05,792 root         DEBUG    Async action: Update profile uuid:2bdee700-f62b-365a-bd1d-69d9c31a9f0c iface:eth0 type:ethernet finished
```

现在，使用 `ip` 命令和 `eth0` 的配置文件来检查 `eth0`  的 `MTU` 是不是 9000 字节。

```
$ ip link show eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9000 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 52:54:00:91:e4:4e brd ff:ff:ff:ff:ff:ff
    altname enp1s0

$ sudo cat /etc/NetworkManager/system-connections/eth0.nmconnection
[sudo] password for admin:
[connection]
id=eth0
uuid=2bdee700-f62b-365a-bd1d-69d9c31a9f0c
type=ethernet
interface-name=eth0
lldp=0
permissions=

[ethernet]
cloned-mac-address=52:54:00:91:E4:4E
mac-address-blacklist=
mtu=9000

[ipv4]
dhcp-client-id=mac
dhcp-timeout=2147483647
dns-search=
method=auto

[ipv6]
addr-gen-mode=eui64
dhcp-duid=ll
dhcp-iaid=mac
dhcp-timeout=2147483647
dns-search=
method=auto
ra-timeout=2147483647

[proxy]
```

#### 基于文件的配置模式的例子

让我们使用基于文件的方法来设置一个新的配置状态。这里我们禁用 `eth1` 接口的 IPv6 配置。

首先，创建一个 yaml 文件来定义 `eth1` 接口的期望状态。使用 `nmstatectl show` 来保存当前设置，然后使用 `nmstatectl edit` 来禁用 IPv6。

```
$ nmstatectl show eth1 > eth1.yaml

$ vi eth1.yaml
---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 101
    next-hop-address: 192.168.122.1
    next-hop-interface: eth1
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
interfaces:
- name: eth1
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.108
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: true
  ipv6:
    enabled: false
    address:
    - ip: fe80::5054:ff:fe3c:9b04
      prefix-length: 64
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    autoconf: true
    dhcp: true
  lldp:
    enabled: false
  mac-address: 52:54:00:3C:9B:04
  mtu: 1500
```

保存新的配置后，用它来应用新的状态：

```
$ sudo nmstatectl apply eth1.yaml

2021-06-29 12:17:21,531 root         DEBUG    Nmstate version: 1.0.3
2021-06-29 12:17:21,531 root         DEBUG    Applying desire state: {'dns-resolver': {'config': {}, 'running': {'search': [], 'server': ['192.168.122.1']}}, 'route-rules': {'config': []}, 'routes': {'config': [], 'running': [{'destination': 'fe80::/64', 'metric': 101, 'next-hop-address': '', 'next-hop-interface': 'eth1', 'table-id': 254}, {'destination': '0.0.0.0/0', 'metric': 101, 'next-hop-address': '192.168.122.1', 'next-hop-interface': 'eth1', 'table-id': 254}, {'destination': '192.168.122.0/24', 'metric': 101, 'next-hop-address': '', 'next-hop-interface': 'eth1', 'table-id': 254}]}, 'interfaces': [{'name': 'eth1', 'type': 'ethernet', 'state': 'up', 'ipv4': {'enabled': True, 'address': [{'ip': '192.168.122.108', 'prefix-length': 24}], 'auto-dns': True, 'auto-gateway': True, 'auto-route-table-id': 0, 'auto-routes': True, 'dhcp': True}, 'ipv6': {'enabled': False}, 'lldp': {'enabled': False}, 'mac-address': '52:54:00:3C:9B:04', 'mtu': 1500}]}
--- output omitted ---
2021-06-29 12:17:21,582 root         DEBUG    Async action: Update profile uuid:5d7244cb-673d-3b88-a675-32e31fad4347 iface:eth1 type:ethernet started
2021-06-29 12:17:21,587 root         DEBUG    Async action: Update profile uuid:5d7244cb-673d-3b88-a675-32e31fad4347 iface:eth1 type:ethernet finished
--- output omitted ---
Desired state applied:
---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 101
    next-hop-address: 192.168.122.1
    next-hop-interface: eth1
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
interfaces:
- name: eth1
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.108
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: true
  ipv6:
    enabled: false
  lldp:
    enabled: false
  mac-address: 52:54:00:3C:9B:04
  mtu: 1500
```

你可以检查看到 `eth1` 接口没有配置任何 IPv6：

```
$ ip -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             192.168.122.238/24 fe80::5054:ff:fe91:e44e/64
eth1             UP             192.168.122.108/24

$ sudo cat /etc/NetworkManager/system-connections/eth1.nmconnection
[connection]
id=eth1
uuid=5d7244cb-673d-3b88-a675-32e31fad4347
type=ethernet
interface-name=eth1
lldp=0
permissions=

[ethernet]
cloned-mac-address=52:54:00:3C:9B:04
mac-address-blacklist=
mtu=1500

[ipv4]
dhcp-client-id=mac
dhcp-timeout=2147483647
dns-search=
method=auto

[ipv6]
addr-gen-mode=eui64
dhcp-duid=ll
dhcp-iaid=mac
dns-search=
method=disabled

[proxy]
```

#### 临时应用改变

NMState 的一个有趣的功能允许你临时配置一个期望的网络状态。如果你对这个配置感到满意，你可以事后提交。否则，当超时（默认为 60 秒）过后，它将回滚。

修改前面例子中的 `eth1` 配置，使它有一个 IPv4 静态地址，而不是通过 DHCP 动态获得。

```
$ vi eth1.yaml

---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 101
    next-hop-address: 192.168.122.1
    next-hop-interface: eth1
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
interfaces:
- name: eth1
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.110
      prefix-length: 24
    auto-dns: true
    auto-gateway: true
    auto-route-table-id: 0
    auto-routes: true
    dhcp: false
  ipv6:
    enabled: false
  lldp:
    enabled: false
  mac-address: 52:54:00:3C:9B:04
  mtu: 1500
```

现在，使用选项 `no-commit` 临时应用这个配置，让它只在 30 秒内有效。这可以通过添加选项 `timeout` 来完成。同时，我们将运行 `ip -br a` 命令三次，看看配置在 `eth1` 接口的 IPv4 地址是如何变化的，然后配置就会回滚。

```
$ ip -br a && sudo nmstatectl apply --no-commit --timeout 30 eth1.yaml && sleep 10 && ip -br a && sleep 25 && ip -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             192.168.122.238/24 fe80::5054:ff:fe91:e44e/64
eth1             UP             192.168.122.108/24
2021-06-29 17:29:18,266 root         DEBUG    Nmstate version: 1.0.3
2021-06-29 17:29:18,267 root         DEBUG    Applying desire state: {'dns-resolver': {'config': {}, 'running': {'search': [], 'server': ['192.168.122.1']}}, 'route-rules': {'config': []}, 'routes': {'config': [], 'running': [{'destination': 'fe80::/64', 'metric': 101, 'next-hop-address': '', 'next-hop-interface': 'eth1', 'table-id': 254}, {'destination': '0.0.0.0/0', 'metric': 101, 'next-hop-address': '192.168.122.1', 'next-hop-interface': 'eth1', 'table-id': 254}, {'destination': '192.168.122.0/24', 'metric': 101, 'next-hop-address': '', 'next-hop-interface': 'eth1', 'table-id': 254}]}, 'interfaces': [{'name': 'eth1', 'type': 'ethernet', 'state': 'up', 'ipv4': {'enabled': True, 'address': [{'ip': '192.168.122.110', 'prefix-length': 24}], 'dhcp': False}, 'ipv6': {'enabled': False}, 'lldp': {'enabled': False}, 'mac-address': '52:54:00:3C:9B:04', 'mtu': 1500}]}
--- output omitted ---
Desired state applied:
---
dns-resolver:
  config: {}
  running:
    search: []
    server:
    - 192.168.122.1
route-rules:
  config: []
routes:
  config: []
  running:
  - destination: fe80::/64
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
  - destination: 0.0.0.0/0
    metric: 101
    next-hop-address: 192.168.122.1
    next-hop-interface: eth1
    table-id: 254
  - destination: 192.168.122.0/24
    metric: 101
    next-hop-address: ''
    next-hop-interface: eth1
    table-id: 254
interfaces:
- name: eth1
  type: ethernet
  state: up
  ipv4:
    enabled: true
    address:
    - ip: 192.168.122.110
      prefix-length: 24
    dhcp: false
  ipv6:
    enabled: false
  lldp:
    enabled: false
  mac-address: 52:54:00:3C:9B:04
  mtu: 1500
Checkpoint: NetworkManager|/org/freedesktop/NetworkManager/Checkpoint/7
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             192.168.122.238/24 fe80::5054:ff:fe91:e44e/64
eth1             UP             192.168.122.110/24
lo               UNKNOWN        127.0.0.1/8 ::1/128
eth0             UP             192.168.122.238/24 fe80::5054:ff:fe91:e44e/64
eth1             UP             192.168.122.108/24
```

从上面可以看到，`eth1` 的 IP 地址从 `192.168.122.108` 暂时变成了 `192.168.122.110`，然后在超时结束后又回到了 `192.168.122.108`。

### 总结

NMState 是一个声明式的网络配置工具，目前可以通过 NetworkManager API 在主机中应用所需的网络配置状态。这种状态既可以用文本编辑器交互式地定义，也可以用基于文件的方法创建一个 yaml 或 json 文件。

这种工具提供了“基础设施即代码”，它可以自动化网络任务，也减少了使用传统配置方法可能出现的潜在错误配置或不稳定的网络情况。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/nmstate-a-declarative-networking-config-tool/

作者：[Maurizio Garcia][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/malgnuz/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/07/magic-816x345.jpg
[2]: https://unsplash.com/@marigard?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/magic?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://nmstate.io/
[5]: https://github.com/nmstate/nmstate
