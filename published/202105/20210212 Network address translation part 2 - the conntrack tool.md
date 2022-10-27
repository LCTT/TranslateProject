[#]: collector: (lujun9972)
[#]: translator: (cooljelly)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13373-1.html)
[#]: subject: (Network address translation part 2 – the conntrack tool)
[#]: via: (https://fedoramagazine.org/network-address-translation-part-2-the-conntrack-tool/)
[#]: author: (Florian Westphal https://fedoramagazine.org/author/strlen/)

网络地址转换（NAT）之连接跟踪工具
======

![](https://img.linux.net.cn/data/attachment/album/202105/09/120958wwocez99o2nofw8s.jpg)

这是有关<ruby>网络地址转换<rt>network address translation</rt></ruby>（NAT）的系列文章中的第二篇。之前的第一篇文章介绍了 [如何使用 iptables/nftables 的报文跟踪功能][2] 来定位 NAT 相关的连接问题。作为第二部分，本文介绍 `conntrack` 命令，它允许你查看和修改被跟踪的连接。

### 引言

通过 iptables 或 nftables 配置的 NAT 建立在 netfilters 连接跟踪子系统之上。`conntrack` 命令作为 “conntrack-tools” 软件包的一部分，用于查看和更改连接状态表。

### 连接跟踪状态表

连接跟踪子系统会跟踪它看到的所有报文流。运行 `sudo conntrack -L` 可查看其内容：

```
tcp 6 43184 ESTABLISHED src=192.168.2.5 dst=10.25.39.80 sport=5646 dport=443 src=10.25.39.80 dst=192.168.2.5 sport=443 dport=5646 [ASSURED] mark=0 use=1
tcp 6 26 SYN_SENT src=192.168.2.5 dst=192.168.2.10 sport=35684 dport=443 [UNREPLIED] src=192.168.2.10 dst=192.168.2.5 sport=443 dport=35684 mark=0 use=1
udp 17 29 src=192.168.8.1 dst=239.255.255.250 sport=48169 dport=1900 [UNREPLIED] src=239.255.255.250 dst=192.168.8.1 sport=1900 dport=48169 mark=0 use=1
```

上述显示结果中，每行表示一个连接跟踪项。你可能会注意到，每行相同的地址和端口号会出现两次，而且第二次出现的源地址/端口对和目标地址/端口对会与第一次正好相反！这是因为每个连接跟踪项会先后两次被插入连接状态表。第一个四元组（源地址、目标地址、源端口、目标端口）记录的是原始方向的连接信息，即发送者发送报文的方向。而第二个四元组则记录的是连接跟踪子系统期望收到的对端回复报文的连接信息。这解决了两个问题：

  1. 如果报文匹配到一个 NAT 规则，例如 IP 地址伪装，相应的映射信息会记录在链接跟踪项的回复方向部分，并自动应用于同一条流的所有后续报文。
  2. 即使一条流经过了地址或端口的转换，也可以成功在连接状态表中查找到回复报文的四元组信息。

原始方向的（第一个显示的）四元组信息永远不会改变：它就是发送者发送的连接信息。NAT 操作只会修改回复方向（第二个）四元组，因为这是接受者看到的连接信息。修改第一个四元组没有意义：netfilter 无法控制发起者的连接状态，它只能在收到/转发报文时对其施加影响。当一个报文未映射到现有连接表项时，连接跟踪可以为其新建一个表项。对于 UDP 报文，该操作会自动进行。对于 TCP 报文，连接跟踪可以配置为只有 TCP 报文设置了 [SYN 标志位][3] 才新建表项。默认情况下，连接跟踪会允许从流的中间报文开始创建，这是为了避免对启用连接跟踪之前就存在的流处理出现问题。

### 连接跟踪状态表和 NAT

如上一节所述，回复方向的四元组包含 NAT 信息。你可以通过命令过滤输出经过源地址 NAT 或目标地址 NAT 的连接跟踪项。通过这种方式可以看到一个指定的流经过了哪种类型的 NAT 转换。例如，运行 `sudo conntrack -L -p tcp –src-nat` 可显示经过源 NAT 的连接跟踪项，输出结果类似于以下内容：

```
tcp 6 114 TIME_WAIT src=10.0.0.10 dst=10.8.2.12 sport=5536 dport=80 src=10.8.2.12 dst=192.168.1.2 sport=80 dport=5536 [ASSURED]
```

这个连接跟踪项表示一条从 10.0.0.10:5536 到 10.8.2.12:80 的连接。与前面示例不同的是，回复方向的四元组不是原始方向四元组的简单翻转：源地址已修改。目标主机（10.8.2.12）将回复数据包发送到 192.168.1.2，而不是 10.0.0.10。每当 10.0.0.10 发送新的报文时，具有此连接跟踪项的路由器会将源地址替换为 192.168.1.2。当 10.8.2.12 发送回复报文时，该路由器将目的地址修改回 10.0.0.10。上述源 NAT 行为源自一条 [NFT 伪装][4] 规则：

```
inet nat postrouting meta oifname "veth0" masquerade
```

其他类型的 NAT 规则，例如目标地址 DNAT 规则或重定向规则，其连接跟踪项也会以类似的方式显示，回复方向四元组的远端地址或端口与原始方向四元组的远端地址或端口不同。

### 连接跟踪扩展

连接跟踪的记帐功能和时间戳功能是两个有用的扩展功能。运行 `sudo sysctl net.netfilter.nf_conntrack_acct=1` 可以在运行 `sudo conntrack -L` 时显示每个流经过的字节数和报文数。运行 `sudo sysctl net.netfilter.nf_conntrack_timestamp=1` 为每个连接记录一个开始时间戳，之后每次运行 `sudo conntrack -L` 时都可以显示这个流从开始经过了多少秒。在上述命令中增加 `–output ktimestamp` 选项也可以看到流开始的绝对时间。

### 插入和更改连接跟踪项

你可以手动为状态表添加连接跟踪项，例如：

```
sudo conntrack -I -s 192.168.7.10 -d 10.1.1.1 --protonum 17 --timeout 120 --sport 12345 --dport 80
```

这项命令通常被 conntrackd 用于状态复制，即将主防火墙的连接跟踪项复制到备用防火墙系统。于是当切换发生的时候，备用系统可以接管已经建立的连接且不会造成中断。连接跟踪还可以存储报文的带外元数据，例如连接跟踪标记和连接跟踪标签。可以用更新选项（`-U`）来修改它们：

```
sudo conntrack -U -m 42 -p tcp
```

这条命令将所有的 TCP 流的连接跟踪标记修改为 42。

### 删除连接跟踪项

在某些情况下，你可能想从状态表中删除条目。例如，对 NAT 规则的修改不会影响表中已存在流的经过报文。因此对 UDP 长连接（例如像 VXLAN 这样的隧道协议），删除表项可能很有意义，这样新的 NAT 转换规则才能生效。可以通过 `sudo conntrack -D` 命令附带可选的地址和端口列表选项，来删除相应的表项，如下例所示：

```
sudo conntrack -D -p udp  --src 10.0.12.4 --dst 10.0.0.1 --sport 1234 --dport 53
```

### 连接跟踪错误计数

`conntrack` 也可以输出统计数字：

```
# sudo conntrack -S
cpu=0 found=0 invalid=130 insert=0 insert_failed=0 drop=0 early_drop=0 error=0 search_restart=10
cpu=1 found=0 invalid=0 insert=0 insert_failed=0 drop=0 early_drop=0 error=0 search_restart=0
cpu=2 found=0 invalid=0 insert=0 insert_failed=0 drop=0 early_drop=0 error=0 search_restart=1
cpu=3 found=0 invalid=0 insert=0 insert_failed=0 drop=0 early_drop=0 error=0 search_restart=0
```

大多数计数器将为 0。`Found` 和 `insert` 数将始终为 0，它们只是为了后向兼容。其他错误计数包括：

  * `invalid`：报文既不匹配已有连接跟踪项，也未创建新连接。
  * `insert_failed`：报文新建了一个连接，但插入状态表时失败。这在 NAT 引擎在伪装时恰好选择了重复的源地址和端口时可能出现。
  * `drop`：报文新建了一个连接，但是没有可用的内存为其分配新的状态条目。
  * `early_drop`：连接跟踪表已满。为了接受新的连接，已有的未看到双向报文的连接被丢弃。
  * `error`：icmp(v6) 收到与已知连接不匹配的 icmp 错误数据包。
  * `search_restart`：查找过程由于另一个 CPU 的插入或删除操作而中断。
  * `clash_resolve`：多个 CPU 试图插入相同的连接跟踪条目。

除非经常发生，这些错误条件通常无害。一些错误可以通过针对预期工作负载调整连接跟踪子系统的参数来降低其发生概率，典型的配置包括 `net.netfilter.nf_conntrack_buckets` 和 `net.netfilter.nf_conntrack_max` 参数。可在 [nf_conntrack-sysctl 文档][5] 中查阅相应配置参数的完整列表。

当报文状态是 `invalid` 时，请使用 `sudo sysctl net.netfilter.nf_conntrack_log_invalid=255` 来获取更多信息。例如，当连接跟踪遇到一个所有 TCP 标志位均为 0 的报文时，将记录以下内容：

```
nf_ct_proto_6: invalid tcp flag combination SRC=10.0.2.1 DST=10.0.96.7 LEN=1040 TOS=0x00 PREC=0x00 TTL=255 ID=0 PROTO=TCP SPT=5723 DPT=443 SEQ=1 ACK=0
```

### 总结

本文介绍了如何检查连接跟踪表和存储在跟踪流中的 NAT 信息。本系列的下一部分将延伸讨论连接跟踪工具和连接跟踪事件框架。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/network-address-translation-part-2-the-conntrack-tool/

作者：[Florian Westphal][a]
选题：[lujun9972][b]
译者：[cooljelly](https://github.com/cooljelly)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/strlen/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/02/network-address-translation-part-2-816x345.jpg
[2]: https://linux.cn/article-13364-1.html
[3]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol#TCP_segment_structure
[4]: https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)#Masquerading
[5]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/networking/nf_conntrack-sysctl.rst
