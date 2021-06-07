[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11513-1.html)
[#]: subject: (Transition to Nftables)
[#]: via: (https://opensourceforu.com/2019/10/transition-to-nftables/)
[#]: author: (Vijay Marcel D https://opensourceforu.com/author/vijay-marcel/)

过渡到 nftables
======

![](https://img.linux.net.cn/data/attachment/album/201910/29/085827o8b7rbswjjr7ijsr.jpg)

> 开源世界中的每个主要发行版都在演进，逐渐将 nftables 作为了默认防火墙。换言之，古老的 iptables 现在已经消亡。本文是有关如何构建 nftables 的教程。

当前，有一个与 nftables 兼容的 iptables-nft 后端，但是很快，即使是它也不再提供了。另外，正如 Red Hat 开发人员所指出的那样，有时它可能会错误地转换规则。我们需要知道如何构建自己的 nftables，而不是依赖于 iptables 到 nftables 的转换器。

在 nftables 中，所有地址族都遵循一个规则。与 iptables 不同，nftables 在用户空间中运行，iptables 中的每个模块都运行在内核（空间）中。它很少需要更新内核，并带有一些新功能，例如映射、地址族和字典。

### 地址族

地址族确定要处理的数据包的类型。在 nftables 中有六个地址族，它们是：

* ip
* ipv6
* inet
* arp
* bridge
* netdev

在 nftables 中，ipv4 和 ipv6 协议可以被合并为一个称为 inet 的单一地址族。因此，我们不需要指定两个规则：一个用于 ipv4，另一个用于 ipv6。如果未指定地址族，它将默认为 ip 协议，即 ipv4。我们感兴趣的领域是 inet 地址族，因为大多数家庭用户将使用 ipv4 或 ipv6 协议。

### nftables

典型的 nftables 规则包含三个部分：表、链和规则。

表是链和规则的容器。它们由其地址族和名称来标识。链包含 inet/arp/bridge/netdev 等协议所需的规则，并具有三种类型：过滤器、NAT 和路由。nftables 规则可以从脚本加载，也可以在终端键入，然后另存为规则集。

对于家庭用户，默认链为过滤器。inet 系列包含以下钩子：

* Input
* Output
* Forward
* Pre-routing
* Post-routing

### 使用脚本还是不用？

最大的问题之一是我们是否可以使用防火墙脚本。答案是：这是你自己的选择。这里有一些建议：如果防火墙中有数百条规则，那么最好使用脚本，但是如果你是典型的家庭用户，则可以在终端中键入命令，然后（保存并在重启时）加载规则集。每种选择都有其自身的优缺点。在本文中，我们将在终端中键入它们以构建防火墙。

nftables 使用一个名为 `nft` 的程序来添加、创建、列出、删除和加载规则。确保使用以下命令将 nftables 与 conntrackd 和 netfilter-persistent 软件包一起安装，并删除 iptables：

```
apt-get install nftables conntrackd netfilter-persistent
apt-get purge iptables
```

`nft` 需要以 root 身份运行或使用 `sudo` 运行。使用以下命令分别列出、刷新、删除规则集和加载脚本。

```
nft list ruleset
nft flush ruleset
nft delete table inet filter
/usr/sbin/nft -f /etc/nftables.conf
```

### 输入策略

就像 iptables 一样，防火墙将包含三部分：输入（`input`）、转发（`forward`）和输出（`output`）。在终端中，为输入（`input`）策略键入以下命令。在开始之前，请确保已刷新规则集。我们的默认策略将会删除所有内容。我们将在防火墙中使用 inet 地址族。将以下规则以 root 身份添加或使用 `sudo` 运行：

```
nft add table inet filter
nft add chain inet filter input { type filter hook input priority 0 \; counter \; policy drop \; }
```

你会注意到有一个名为 `priority 0` 的东西。这意味着赋予该规则更高的优先级。挂钩通常赋予负整数，这意味着更高的优先级。每个挂钩都有自己的优先级，过滤器链的优先级为 0。你可以检查 nftables  Wiki 页面以查看每个挂钩的优先级。

要了解你计算机中的网络接口，请运行以下命令：

```
ip link show
```

它将显示已安装的网络接口，一个是本地主机、另一个是以太网端口或无线端口。以太网端口的名称如下所示：`enpXsY`，其中 `X` 和 `Y` 是数字，无线端口也是如此。我们必须允许本地主机的流量，并且仅允许从互联网建立的传入连接。

nftables 具有一项称为裁决语句的功能，用于解析规则。裁决语句为 `accept`、`drop`、`queue`、`jump`、`goto`、`continue` 和 `return`。由于这是一个很简单的防火墙，因此我们将使用 `accept` 或 `drop` 处理数据包。

```
nft add rule inet filter input iifname lo accept
nft add rule inet filter input iifname enpXsY ct state new, established, related accept
```

接下来，我们必须添加规则以保护我们免受隐秘扫描。并非所有的隐秘扫描都是恶意的，但大多数都是。我们必须保护网络免受此类扫描。第一组规则列出了要测试的 TCP 标志。在这些标志中，第二组列出了要与第一组匹配的标志。

```
nft add rule inet filter input iifname enpXsY tcp flags \& \(syn\|fin\) == \(syn\|fin\) drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(syn\|rst\) == \(syn\|rst\) drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(fin\|rst\) == \(fin\|rst\) drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(ack\|fin\) == fin drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(ack\|psh\) == psh drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(ack\|urg\) == urg drop
```

记住，我们在终端中键入这些命令。因此，我们必须在一些特殊字符之前添加一个反斜杠，以确保终端能够正确解释该斜杠。如果你使用的是脚本，则不需要这样做。

### 关于 ICMP 的警告

互联网控制消息协议（ICMP）是一种诊断工具，因此不应完全丢弃该流量。完全阻止 ICMP 的任何尝试都是不明智的，因为它还会导致停止向我们提供错误消息。仅启用最重要的控制消息，例如回声请求、回声应答、目的地不可达和超时等消息，并拒绝其余消息。回声请求和回声应答是 `ping` 的一部分。在输入策略中，我们仅允许回声应答、而在输出策略中，我们仅允许回声请求。

```
nft add rule inet filter input iifname enpXsY icmp type { echo-reply, destination-unreachable, time-exceeded } limit rate 1/second accept
nft add rule inet filter input iifname enpXsY ip protocol icmp drop
```

最后，我们记录并丢弃所有无效数据包。

```
nft add rule inet filter input iifname enpXsY ct state invalid log flags all level info prefix \”Invalid-Input: \”
nft add rule inet filter input iifname enpXsY ct state invalid drop
```

### 转发和输出策略

在转发和输出策略中，默认情况下我们将丢弃数据包，仅接受已建立连接的数据包。

```
nft add chain inet filter forward { type filter hook forward priority 0 \; counter \; policy drop \; }
nft add rule inet filter forward ct state established, related accept
nft add rule inet filter forward ct state invalid drop
nft add chain inet filter output { type filter hook output priority 0 \; counter \; policy drop \; }
```

典型的桌面用户只需要端口 80 和 443 即可访问互联网。最后，允许可接受的 ICMP 协议并在记录无效数据包时丢弃它们。

```
nft add rule inet filter output oifname enpXsY tcp dport { 80, 443 } ct state established accept
nft add rule inet filter output oifname enpXsY icmp type { echo-request, destination-unreachable, time-exceeded } limit rate 1/second accept
nft add rule inet filter output oifname enpXsY ip protocol icmp drop
nft add rule inet filter output oifname enpXsY ct state invalid log flags all level info prefix \”Invalid-Output: \”
nft add rule inet filter output oifname enpXsY ct state invalid drop
```

现在我们必须保存我们的规则集，否则重新启动时它将丢失。为此，请运行以下命令：

```
sudo nft list ruleset. > /etc/nftables.conf
```

我们须在引导时加载 nftables，以下将在 systemd 中启用 nftables 服务：

```
sudo systemctl enable nftables
```

接下来，编辑 nftables 单元文件以删除 `Execstop` 选项，以避免在每次引导时刷新规则集。该文件通常位于 `/etc/systemd/system/sysinit.target.wants/nftables.service`。现在重新启动nftables：

```
sudo systemctl restart nftables
```

### 在 rsyslog 中记录日志

当你记录丢弃的数据包时，它们直接进入 syslog，这使得读取该日志文件非常困难。最好将防火墙日志重定向到单独的文件。在 `/var/log` 目录中创建一个名为 `nftables` 的目录，并在其中创建两个名为 `input.log` 和 `output.log` 的文件，分别存储输入和输出日志。确保系统中已安装 rsyslog。现在转到 `/etc/rsyslog.d` 并创建一个名为 `nftables.conf` 的文件，其内容如下：

```
:msg,regex,”Invalid-Input: “ -/var/log/nftables/Input.log
:msg,regex,”Invalid-Output: “ -/var/log/nftables/Output.log & stop
```

现在，我们必须确保日志是可管理的。为此，使用以下代码在 `/etc/logrotate.d` 中创建另一个名为 `nftables` 的文件：

```
/var/log/nftables/* { rotate 5 daily maxsize 50M missingok notifempty delaycompress compress postrotate invoke-rc.d rsyslog rotate > /dev/null endscript }
```

重新启动 nftables。现在，你可以检查你的规则集。如果你觉得在终端中键入每个命令很麻烦，则可以使用脚本来加载 nftables 防火墙。我希望本文对保护你的系统有用。

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/transition-to-nftables/

作者：[Vijay Marcel D][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/vijay-marcel/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/01/REHfirewall-1.jpg?resize=696%2C481&ssl=1 (REHfirewall)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/01/REHfirewall-1.jpg?fit=900%2C622&ssl=1
