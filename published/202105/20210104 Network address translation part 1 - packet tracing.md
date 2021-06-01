[#]: collector: (lujun9972)
[#]: translator: (cooljelly)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13364-1.html)
[#]: subject: (Network address translation part 1 – packet tracing)
[#]: via: (https://fedoramagazine.org/network-address-translation-part-1-packet-tracing/)
[#]: author: (Florian Westphal https://fedoramagazine.org/author/strlen/)

网络地址转换（NAT）之报文跟踪
======

![](https://img.linux.net.cn/data/attachment/album/202105/06/112410xhdkvvdajis3jhlj.jpg)

这是有关<ruby>网络地址转换<rt>network address translation</rt></ruby>（NAT）的系列文章中的第一篇。这一部分将展示如何使用 iptables/nftables 报文跟踪功能来定位 NAT 相关的连接问题。

### 引言

网络地址转换（NAT）是一种将容器或虚拟机暴露在互联网中的一种方式。传入的连接请求将其目标地址改写为另一个地址，随后被路由到容器或虚拟机。相同的技术也可用于负载均衡，即传入的连接被分散到不同的服务器上去。

当网络地址转换没有按预期工作时，连接请求将失败，会暴露错误的服务，连接最终出现在错误的容器中，或者请求超时，等等。调试此类问题的一种方法是检查传入请求是否与预期或已配置的转换相匹配。

### 连接跟踪

NAT 不仅仅是修改 IP 地址或端口号。例如，在将地址 X 映射到 Y 时，无需添加新规则来执行反向转换。一个被称为 “conntrack” 的 netfilter 系统可以识别已有连接的回复报文。每个连接都在 conntrack 系统中有自己的 NAT 状态。反向转换是自动完成的。

### 规则匹配跟踪

nftables 工具（以及在较小的程度上，iptables）允许针对某个报文检查其处理方式以及该报文匹配规则集合中的哪条规则。为了使用这项特殊的功能，可在合适的位置插入“跟踪规则”。这些规则会选择被跟踪的报文。假设一个来自 IP 地址 C 的主机正在访问一个 IP 地址是 S 以及端口是 P 的服务。我们想知道报文匹配了哪条 NAT 转换规则，系统检查了哪些规则，以及报文是否在哪里被丢弃了。

由于我们要处理的是传入连接，所以我们将规则添加到 prerouting 钩子上。prerouting 意味着内核尚未决定将报文发往何处。修改目标地址通常会使报文被系统转发，而不是由主机自身处理。

### 初始配置

```
# nft 'add table inet trace_debug'
# nft 'add chain inet trace_debug trace_pre { type filter hook prerouting priority -200000; }'
# nft "insert rule inet trace_debug trace_pre ip saddr $C ip daddr $S tcp dport $P tcp flags syn limit rate 1/second meta nftrace set 1"
```

第一条规则添加了一张新的规则表，这使得将来删除和调试规则可以更轻松。一句 `nft delete table inet trace_debug` 命令就可以删除调试期间临时加入表中的所有规则和链。

第二条规则在系统进行路由选择之前（`prerouting` 钩子）创建了一个基本钩子，并将其优先级设置为负数，以保证它在连接跟踪流程和 NAT 规则匹配之前被执行。

然而，唯一最重要的部分是第三条规则的最后一段：`meta nftrace set 1`。这条规则会使系统记录所有匹配这条规则的报文所关联的事件。为了尽可能高效地查看跟踪信息（提高信噪比），考虑对跟踪的事件增加一个速率限制，以保证其数量处于可管理的范围。一个好的选择是限制每秒钟最多一个报文或一分钟最多一个报文。上述案例记录了所有来自终端 `$C` 且去往终端 `$S` 的端口 `$P` 的所有 SYN 报文和 SYN/ACK 报文。限制速率的配置语句可以防范事件过多导致的洪泛风险。事实上，大多数情况下只记录一个报文就足够了。

对于 iptables 用户来讲，配置流程是类似的。等价的配置规则类似于：

```
# iptables -t raw -I PREROUTING -s $C -d $S -p tcp --tcp-flags SYN SYN  --dport $P  -m limit --limit 1/s -j TRACE
```

### 获取跟踪事件

原生 nft 工具的用户可以直接运行 `nft` 进入 nft 跟踪模式：

```
# nft monitor trace
```

这条命令会将收到的报文以及所有匹配该报文的规则打印出来（用 `CTRL-C` 来停止输出）：

```
trace id f0f627 ip raw prerouting  packet: iif "veth0" ether saddr ..
```

我们将在下一章详细分析该结果。如果你用的是 iptables，首先通过 `iptables –version` 命令检查一下已安装的版本。例如：

```

# iptables --version
iptables v1.8.5 (legacy)
```

`(legacy)` 意味着被跟踪的事件会被记录到内核的环形缓冲区中。你可以用 `dmesg` 或 `journalctl` 命令来查看这些事件。这些调试输出缺少一些信息，但和新工具提供的输出从概念上来讲很类似。你将需要首先查看规则被记录下来的行号，并与活跃的 iptables 规则集合手动关联。如果输出显示 `(nf_tables)`，你可以使用 `xtables-monitor` 工具：

```
# xtables-monitor --trace
```

如果上述命令仅显示版本号，你仍然需要查看 `dmesg`/`journalctl` 的输出。`xtables-monitor` 工具和 `nft` 监控跟踪工具使用相同的内核接口。它们之间唯一的不同点就是，`xtables-monitor` 工具会用 `iptables` 的语法打印事件，且如果你同时使用了 `iptables-nft` 和 `nft`，它将不能打印那些使用了 maps/sets 或其他只有 nftables 才支持的功能的规则。

### 示例

我们假设需要调试一个到虚拟机/容器的端口不通的问题。`ssh -p 1222 10.1.2.3` 命令应该可以远程连接那台服务器上的某个容器，但连接请求超时了。

你拥有运行那台容器的主机的登录权限。现在登录该机器并增加一条跟踪规则。可通过前述案例查看如何增加一个临时的调试规则表。跟踪规则类似于这样：

```
nft "insert rule inet trace_debug trace_pre ip daddr 10.1.2.3 tcp dport 1222 tcp flags syn limit rate 6/minute meta nftrace set 1"
```

在添加完上述规则后，运行 `nft monitor trace`，在跟踪模式下启动 nft，然后重试刚才失败的 `ssh` 命令。如果规则集较大，会出现大量的输出。不用担心这些输出，下一节我们会做逐行分析。

```
trace id 9c01f8 inet trace_debug trace_pre packet: iif "enp0" ether saddr .. ip saddr 10.2.1.2 ip daddr 10.1.2.3 ip protocol tcp tcp dport 1222 tcp flags == syn
trace id 9c01f8 inet trace_debug trace_pre rule ip daddr 10.2.1.2 tcp dport 1222 tcp flags syn limit rate 6/minute meta nftrace set 1 (verdict continue)
trace id 9c01f8 inet trace_debug trace_pre verdict continue
trace id 9c01f8 inet trace_debug trace_pre policy accept
trace id 9c01f8 inet nat prerouting packet: iif "enp0" ether saddr .. ip saddr 10.2.1.2 ip daddr 10.1.2.3 ip protocol tcp  tcp dport 1222 tcp flags == syn
trace id 9c01f8 inet nat prerouting rule ip daddr 10.1.2.3  tcp dport 1222 dnat ip to 192.168.70.10:22 (verdict accept)
trace id 9c01f8 inet filter forward packet: iif "enp0" oif "veth21" ether saddr .. ip daddr 192.168.70.10 .. tcp dport 22 tcp flags == syn tcp window 29200
trace id 9c01f8 inet filter forward rule ct status dnat jump allowed_dnats (verdict jump allowed_dnats)
trace id 9c01f8 inet filter allowed_dnats rule drop (verdict drop)
trace id 20a4ef inet trace_debug trace_pre packet: iif "enp0" ether saddr .. ip saddr 10.2.1.2 ip daddr 10.1.2.3 ip protocol tcp tcp dport 1222 tcp flags == syn
```

### 对跟踪结果作逐行分析

输出结果的第一行是触发后续输出的报文编号。这一行的语法与 nft 规则语法相同，同时还包括了接收报文的首部字段信息。你也可以在这一行找到接收报文的接口名称（此处为 `enp0`）、报文的源和目的 MAC 地址、报文的源 IP 地址（可能很重要 - 报告问题的人可能选择了一个错误的或非预期的主机），以及 TCP 的源和目的端口。同时你也可以在这一行的开头看到一个“跟踪编号”。该编号标识了匹配跟踪规则的特定报文。第二行包括了该报文匹配的第一条跟踪规则：

```
trace id 9c01f8 inet trace_debug trace_pre rule ip daddr 10.2.1.2 tcp dport 1222 tcp flags syn limit rate 6/minute meta nftrace set 1 (verdict continue)
```

这就是刚添加的跟踪规则。这里显示的第一条规则总是激活报文跟踪的规则。如果在这之前还有其他规则，它们将不会在这里显示。如果没有任何跟踪输出结果，说明没有抵达这条跟踪规则，或者没有匹配成功。下面的两行表明没有后续的匹配规则，且 `trace_pre` 钩子允许报文继续传输（判定为接受）。

下一条匹配规则是：

```
trace id 9c01f8 inet nat prerouting rule ip daddr 10.1.2.3  tcp dport 1222 dnat ip to 192.168.70.10:22 (verdict accept)
```

这条 DNAT 规则设置了一个到其他地址和端口的映射。规则中的参数 `192.168.70.10` 是需要收包的虚拟机的地址，目前为止没有问题。如果它不是正确的虚拟机地址，说明地址输入错误，或者匹配了错误的 NAT 规则。

### IP 转发

通过下面的输出我们可以看到，IP 路由引擎告诉 IP 协议栈，该报文需要被转发到另一个主机：

```
trace id 9c01f8 inet filter forward packet: iif "enp0" oif "veth21" ether saddr .. ip daddr 192.168.70.10 .. tcp dport 22 tcp flags == syn tcp window 29200
```

这是接收到的报文的另一种呈现形式，但和之前相比有一些有趣的不同。现在的结果有了一个输出接口集合。这在之前不存在的，因为之前的规则是在路由决策之前（`prerouting` 钩子）。跟踪编号和之前一样，因此仍然是相同的报文，但目标地址和端口已经被修改。假设现在还有匹配 `tcp dport 1222` 的规则，它们将不会对现阶段的报文产生任何影响了。

如果该行不包含输出接口（`oif`），说明路由决策将报文路由到了本机。对路由过程的调试属于另外一个主题，本文不再涉及。

```
trace id 9c01f8 inet filter forward rule ct status dnat jump allowed_dnats (verdict jump allowed_dnats)
```

这条输出表明，报文匹配到了一个跳转到 `allowed_dnats` 链的规则。下一行则说明了连接失败的根本原因：

```
trace id 9c01f8 inet filter allowed_dnats rule drop (verdict drop)
```

这条规则无条件地将报文丢弃，因此后续没有关于该报文的日志输出。下一行则是另一个报文的输出结果了：

```
trace id 20a4ef inet trace_debug trace_pre packet: iif "enp0" ether saddr .. ip saddr 10.2.1.2 ip daddr 10.1.2.3 ip protocol tcp tcp dport 1222 tcp flags == syn
```

跟踪编号已经和之前不一样，然后报文的内容却和之前是一样的。这是一个重传尝试：第一个报文被丢弃了，因此 TCP 尝试了重传。可以忽略掉剩余的输出结果了，因为它并没有提供新的信息。现在是时候检查那条链了。

### 规则集合分析

上一节我们发现报文在 inet filter 表中的一个名叫 `allowed_dnats` 的链中被丢弃。现在我们来查看它：

```
# nft list chain inet filter allowed_dnats
table inet filter {
 chain allowed_dnats {
  meta nfproto ipv4 ip daddr . tcp dport @allow_in accept
  drop
   }
}
```

接受 `@allow_in` 集的数据包的规则没有显示在跟踪日志中。我们通过列出元素的方式，再次检查上述报文的目标地址是否在 `@allow_in` 集中：

```
# nft "get element inet filter allow_in { 192.168.70.10 . 22 }"
Error: Could not process rule: No such file or directory
```

不出所料，地址-服务对并没有出现在集合中。我们将其添加到集合中。

```
# nft "add element inet filter allow_in { 192.168.70.10 . 22 }"
```

现在运行查询命令，它将返回新添加的元素。

```
# nft "get element inet filter allow_in { 192.168.70.10 . 22 }"
table inet filter {
   set allow_in {
      type ipv4_addr . inet_service
      elements = { 192.168.70.10 . 22 }
   }
}
```

`ssh` 命令现在应该可以工作，且跟踪结果可以反映出该变化：

```
trace id 497abf58 inet filter forward rule ct status dnat jump allowed_dnats (verdict jump allowed_dnats)

trace id 497abf58 inet filter allowed_dnats rule meta nfproto ipv4 ip daddr . tcp dport @allow_in accept (verdict accept)

trace id 497abf58 ip postrouting packet: iif "enp0" oif "veth21" ether .. trace id 497abf58 ip postrouting policy accept
```

这表明报文通过了转发路径中的最后一个钩子 - `postrouting`。

如果现在仍然无法连接，问题可能处在报文流程的后续阶段，有可能并不在 nftables 的规则集合范围之内。

### 总结

本文介绍了如何通过 nftables 的跟踪机制检查丢包或其他类型的连接问题。本系列的下一篇文章将展示如何检查连接跟踪系统和可能与连接跟踪流相关的 NAT 信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/network-address-translation-part-1-packet-tracing/

作者：[Florian Westphal][a]
选题：[lujun9972][b]
译者：[cooljelly](https://github.com/cooljelly)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/strlen/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/12/network-address-translation-part-1-816x346.png
