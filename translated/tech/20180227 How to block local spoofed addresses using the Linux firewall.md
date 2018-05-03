如何使用 Linux 防火墙隔离本地欺骗地址
======

> 如何使用 iptables 防火墙保护你的网络免遭黑客攻击。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA)

即便是被入侵检测和隔离系统所保护的远程网络，黑客们也在寻找各种精巧的方法入侵。IDS/IPS 不能停止或者减少那些想要接管你的网络控制权的黑客攻击。不恰当的配置允许攻击者绕过所有部署的安全措施。

在这篇文章中，我将会解释安全工程师或者系统管理员该怎样避免这些攻击。

几乎所有的 Linux 发行版都带着一个内建的防火墙来保护运行在 Linux 主机上的进程和应用程序。大多数防火墙都按照 IDS/IPS 解决方案设计，这样的设计的主要目的是检测和避免恶意包获取网络的进入权。

Linux 防火墙通常有两种接口：iptables 和 ipchains 程序（LCTT 译注：在支持 systemd 的系统上，采用的是更新的接口 firewalld）。大多数人将这些接口称作 iptables 防火墙或者 ipchains 防火墙。这两个接口都被设计成包过滤器。iptables 是有状态防火墙，其基于先前的包做出决定。ipchains 不会基于先前的包做出决定，它被设计为无状态防火墙。

在这篇文章中，我们将会专注于内核 2.4 之后出现的 iptables 防火墙。

有了 iptables 防火墙，你可以创建策略或者有序的规则集，规则集可以告诉内核该如何对待特定的数据包。在内核中的是Netfilter 框架。Netfilter 既是框架也是 iptables 防火墙的项目名称。作为一个框架，Netfilter 允许 iptables 勾连被设计来操作数据包的功能。概括地说，iptables 依靠 Netfilter 框架构筑诸如过滤数据包数据的功能。

每个 iptables 规则都被应用到一个表中的链上。一个 iptables 链就是一个比较包中相似特征的规则集合。而表（例如 `nat` 或者 `mangle`）则描述不同的功能目录。例如， `mangle` 表用于修改包数据。因此，特定的修改包数据的规则被应用到这里；而过滤规则被应用到 `filter` 表，因为 `filter` 表过滤包数据。

iptables 规则有一个匹配集，以及一个诸如 `Drop` 或者 `Deny` 的目标，这可以告诉 iptables 对一个包做什么以符合规则。因此，没有目标和匹配集，iptables 就不能有效地处理包。如果一个包匹配了一条规则，目标会指向一个将要采取的特定措施。另一方面，为了让 iptables 处理，每个数据包必须匹配才能被处理。

现在我们已经知道 iptables 防火墙如何工作，让我们着眼于如何使用 iptables 防火墙检测并拒绝或丢弃欺骗地址吧。

### 打开源地址验证

作为一个安全工程师，在处理远程的欺骗地址的时候，我采取的第一步是在内核打开源地址验证。

源地址验证是一种内核层级的特性，这种特性丢弃那些伪装成来自你的网络的包。这种特性使用反向路径过滤器方法来检查收到的包的源地址是否可以通过包到达的接口可以到达。（LCTT 译注：到达的包的源地址应该可以从它到达的网络接口反向到达，只需反转源地址和目的地址就可以达到这样的效果）

利用下面简单的脚本可以打开源地址验证而不用手工操作：

```
#!/bin/sh
#作者: Michael K Aboagye
#程序目标: 打开反向路径过滤
#日期: 7/02/18
#在屏幕上显示 “enabling source address verification”
echo -n "Enabling source address verification…"
#将值0覆盖为1来打开源地址验证
echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter
echo "completed"
```

上面的脚本在执行的时候只显示了 `Enabling source address verification` 这条信息而不会换行。默认的反向路径过滤的值是 `0`，`0` 表示没有源验证。因此，第二行简单地将默认值 `0` 覆盖为 `1`。`1` 表示内核将会通过确认反向路径来验证源地址。

最后，你可以使用下面的命令通过选择 `DROP` 或者 `REJECT` 目标之一来丢弃或者拒绝来自远端主机的欺骗地址。但是，处于安全原因的考虑，我建议使用 `DROP` 目标。

像下面这样，用你自己的 IP 地址代替 `IP-address` 占位符。另外，你必须选择使用 `REJECT` 或者 `DROP` 中的一个，这两个目标不能同时使用。

```
iptables -A INPUT -i internal_interface -s IP_address -j REJECT / DROP  
iptables -A INPUT -i internal_interface -s 192.168.0.0/16  -j REJECT / DROP
```

这篇文章只提供了如何使用 iptables 防火墙来避免远端欺骗攻击的基础知识。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/block-local-spoofed-addresses-using-linux-firewall

作者：[Michael Kwaku Aboagye][a]
译者：[leemeans](https://github.com/leemeans)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/revoks
