理解多区域配置中的 firewalld
============================================================

现在的新闻里充斥着服务器被攻击和数据失窃事件。对于一个阅读过安全公告博客的人来说，通过访问错误配置的服务器，利用最新暴露的安全漏洞或通过窃取的密码来获得系统控制权，并不是件多困难的事情。在一个典型的 Linux 服务器上的任何互联网服务都可能存在漏洞，允许未经授权的系统访问。

因为在应用程序层面上强化系统以防范任何可能的威胁是不可能做到的事情，而防火墙可以通过限制对系统的访问提供了安全保证。防火墙基于源 IP、目标端口和协议来过滤入站包。因为这种方式中，仅有几个 IP/端口/协议的组合与系统交互，而其它的方式做不到过滤。

Linux 防火墙是通过 netfilter 来处理的，它是内核级别的框架。这十几年来，iptables 被作为 netfilter 的用户态抽象层（LCTT 译注： userland，一个基本的 UNIX 系统是由 kernel 和 userland 两部分构成，除 kernel 以外的称为 userland）。iptables 将包通过一系列的规则进行检查，如果包与特定的 IP/端口/协议的组合匹配，规则就会被应用到这个包上，以决定包是被通过、拒绝或丢弃。

Firewalld 是最新的 netfilter 用户态抽象层。遗憾的是，由于缺乏描述多区域配置的文档，它强大而灵活的功能被低估了。这篇文章提供了一个示例去改变这种情况。

### Firewalld 的设计目标

firewalld 的设计者认识到大多数的 iptables 使用案例仅涉及到几个单播源 IP，仅让每个符合白名单的服务通过，而其它的会被拒绝。这种模式的好处是，firewalld 可以通过定义的源 IP 和/或网络接口将入站流量分类到不同<ruby>区域<rt>zone</rt></ruby>。每个区域基于指定的准则按自己配置去通过或拒绝包。

另外的改进是基于 iptables 进行语法简化。firewalld 通过使用服务名而不是它的端口和协议去指定服务，使它更易于使用，例如，是使用 samba 而不是使用 UDP 端口 137 和 138 和 TCP 端口 139 和 445。它进一步简化语法，消除了 iptables 中对语句顺序的依赖。

最后，firewalld 允许交互式修改 netfilter，允许防火墙独立于存储在 XML 中的永久配置而进行改变。因此，下面的的临时修改将在下次重新加载时被覆盖：

```
# firewall-cmd <some modification>
```

而，以下的改变在重加载后会永久保存：

```
# firewall-cmd --permanent <some modification>
# firewall-cmd --reload
```

### 区域

在 firewalld 中最上层的组织是区域。如果一个包匹配区域相关联的网络接口或源 IP/掩码 ，它就是区域的一部分。可用的几个预定义区域：

```
# firewall-cmd --get-zones
block dmz drop external home internal public trusted work
```

任何配置了一个**网络接口**和/或一个**源**的区域就是一个<ruby>活动区域<rt>active zone</rt></ruby>。列出活动的区域：

```
# firewall-cmd --get-active-zones
public
  interfaces: eno1 eno2
```

**Interfaces** （接口）是系统中的硬件和虚拟的网络适配器的名字，正如你在上面的示例中所看到的那样。所有的活动的接口都将被分配到区域，要么是默认的区域，要么是用户指定的一个区域。但是，一个接口不能被分配给多于一个的区域。

在缺省配置中，firewalld 设置所有接口为 public 区域，并且不对任何区域设置源。其结果是，`public` 区域是唯一的活动区域。

**Sources** （源）是入站 IP 地址的范围，它也可以被分配到区域。一个源（或重叠的源）不能被分配到多个区域。这样做的结果是产生一个未定义的行为，因为不清楚应该将哪些规则应用于该源。

因为指定一个源不是必需的，任何包都可以通过接口匹配而归属于一个区域，而不需要通过源匹配来归属一个区域。这表示通过使用优先级方式，优先到达多个指定的源区域，稍后将详细说明这种情况。首先，我们来检查 `public` 区域的配置：

```
# firewall-cmd --zone=public --list-all
public (default, active)
  interfaces: eno1 eno2
  sources:
  services: dhcpv6-client ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
# firewall-cmd --permanent --zone=public --get-target
default
```

逐行说明如下：

*   `public (default, active)` 表示 `public` 区域是默认区域（当接口启动时会自动默认），并且它是活动的，因为，它至少有一个接口或源分配给它。
*   `interfaces: eno1 eno2` 列出了这个区域上关联的接口。
*   `sources:` 列出了这个区域的源。现在这里什么都没有，但是，如果这里有内容，它们应该是这样的格式 xxx.xxx.xxx.xxx/xx。
*   `services: dhcpv6-client ssh` 列出了允许通过这个防火墙的服务。你可以通过运行 `firewall-cmd --get-services` 得到一个防火墙预定义服务的详细列表。
*   `ports:` 列出了一个允许通过这个防火墙的目标端口。它是用于你需要去允许一个没有在 firewalld 中定义的服务的情况下。
*   `masquerade: no` 表示这个区域是否允许 IP 伪装。如果允许，它将允许 IP 转发，它可以让你的计算机作为一个路由器。
*   `forward-ports:` 列出转发的端口。
*   `icmp-blocks:` 阻塞的 icmp 流量的黑名单。
*   `rich rules:` 在一个区域中优先处理的高级配置。
*   `default` 是目标区域，它决定了与该区域匹配而没有由上面设置中显式处理的包的动作。

### 一个简单的单区域配置示例

如果只是简单地锁定你的防火墙。简单地在删除公共区域上当前允许的服务，并重新加载：

```
# firewall-cmd --permanent --zone=public --remove-service=dhcpv6-client
# firewall-cmd --permanent --zone=public --remove-service=ssh
# firewall-cmd --reload
```

在下面的防火墙上这些命令的结果是：

```
# firewall-cmd --zone=public --list-all
public (default, active)
  interfaces: eno1 eno2
  sources:
  services:
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
# firewall-cmd --permanent --zone=public --get-target
default
```

本着尽可能严格地保证安全的精神，如果发生需要在你的防火墙上临时开放一个服务的情况（假设是 ssh），你可以增加这个服务到当前会话中（省略 `--permanent`），并且指示防火墙在一个指定的时间之后恢复修改：

```
# firewall-cmd --zone=public --add-service=ssh --timeout=5m
```

这个 `timeout` 选项是一个以秒（`s`）、分（`m`）或小时（`h`）为单位的时间值。

### 目标

当一个区域处理它的源或接口上的一个包时，但是，没有处理该包的显式规则时，这时区域的<ruby>目标<rt>target</rt></ruby>决定了该行为：

*   `ACCEPT`：通过这个包。
*   `%%REJECT%%`：拒绝这个包，并返回一个拒绝的回复。
*   `DROP`：丢弃这个包，不回复任何信息。
*   `default`：不做任何事情。该区域不再管它，把它踢到“楼上”。

在 firewalld 0.3.9 中有一个 bug （已经在 0.3.10 中修复），对于一个目标是除了“default”以外的源区域，不管允许的服务是什么，这的目标都会被应用。例如，一个使用目标 `DROP` 的源区域，将丢弃所有的包，甚至是白名单中的包。遗憾的是，这个版本的 firewalld 被打包到 RHEL7 和它的衍生版中，使它成为一个相当常见的 bug。本文中的示例避免了可能出现这种行为的情况。

### 优先权

活动区域中扮演两个不同的角色。关联接口行为的区域作为接口区域，并且，关联源行为的区域作为源区域（一个区域能够扮演两个角色）。firewalld 按下列顺序处理一个包：

1.  相应的源区域。可以存在零个或一个这样的区域。如果这个包满足一个<ruby>富规则<rt>rich rule</rt></ruby>、服务是白名单中的、或者目标没有定义，那么源区域处理这个包，并且在这里结束。否则，向上传递这个包。
2.  相应的接口区域。肯定有一个这样的区域。如果接口处理这个包，那么到这里结束。否则，向上传递这个包。
3.  firewalld 默认动作。接受 icmp 包并拒绝其它的一切。

这里的关键信息是，源区域优先于接口区域。因此，对于多区域的 firewalld 配置的一般设计模式是，创建一个优先源区域来允许指定的 IP 对系统服务的提升访问，并在一个限制性接口区域限制其它访问。

### 一个简单的多区域示例

为演示优先权，让我们在 `public` 区域中将 `http` 替换成 `ssh`，并且为我们喜欢的 IP 地址，如 1.1.1.1，设置一个默认的 `internal` 区域。以下的命令完成这个任务：

```
# firewall-cmd --permanent --zone=public --remove-service=ssh
# firewall-cmd --permanent --zone=public --add-service=http
# firewall-cmd --permanent --zone=internal --add-source=1.1.1.1
# firewall-cmd --reload
```

这些命令的结果是生成如下的配置：

```
# firewall-cmd --zone=public --list-all
public (default, active)
  interfaces: eno1 eno2
  sources:
  services: dhcpv6-client http
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
# firewall-cmd --permanent --zone=public --get-target
default
# firewall-cmd --zone=internal --list-all
internal (active)
  interfaces:
  sources: 1.1.1.1
  services: dhcpv6-client mdns samba-client ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
# firewall-cmd --permanent --zone=internal --get-target
default
```

在上面的配置中，如果有人尝试从 1.1.1.1 去 `ssh`，这个请求将会成功，因为这个源区域（`internal`）被首先应用，并且它允许 `ssh` 访问。

如果有人尝试从其它的地址，如 2.2.2.2，去访问 `ssh`，它不是这个源区域的，因为和这个源区域不匹配。因此，这个请求被直接转到接口区域（`public`），它没有显式处理 `ssh`，因为，public 的目标是 `default`，这个请求被传递到默认动作，它将被拒绝。

如果 1.1.1.1 尝试进行 `http` 访问会怎样？源区域（`internal`）不允许它，但是，目标是 `default`，因此，请求将传递到接口区域（`public`），它被允许访问。

现在，让我们假设有人从 3.3.3.3 拖你的网站。要限制从那个 IP 的访问，简单地增加它到预定义的 `drop` 区域，正如其名，它将丢弃所有的连接：

```
# firewall-cmd --permanent --zone=drop --add-source=3.3.3.3
# firewall-cmd --reload
```

下一次 3.3.3.3 尝试去访问你的网站，firewalld 将转发请求到源区域（`drop`）。因为目标是 `DROP`，请求将被拒绝，并且它不会被转发到接口区域（`public`）。

### 一个实用的多区域示例

假设你为你的组织的一台服务器配置防火墙。你希望允许全世界使用 `http` 和 `https` 的访问，你的组织（1.1.0.0/16）和工作组（1.1.1.0/8）使用 `ssh` 访问，并且你的工作组可以访问 `samba` 服务。使用 firewalld 中的区域，你可以用一个很直观的方式去实现这个配置。

`public` 这个命名，它的逻辑似乎是把全世界访问指定为公共区域，而 `internal` 区域用于为本地使用。从在 `public` 区域内设置使用 `http` 和 `https` 替换 `dhcpv6-client` 和 `ssh` 服务来开始：

```
# firewall-cmd --permanent --zone=public --remove-service=dhcpv6-client
# firewall-cmd --permanent --zone=public --remove-service=ssh
# firewall-cmd --permanent --zone=public --add-service=http
# firewall-cmd --permanent --zone=public --add-service=https
```

然后，取消 `internal` 区域的 `mdns`、`samba-client` 和 `dhcpv6-client` 服务（仅保留 `ssh`），并增加你的组织为源：

```
# firewall-cmd --permanent --zone=internal --remove-service=mdns
# firewall-cmd --permanent --zone=internal --remove-service=samba-client
# firewall-cmd --permanent --zone=internal --remove-service=dhcpv6-client
# firewall-cmd --permanent --zone=internal --add-source=1.1.0.0/16
```

为容纳你提升的 `samba` 的权限，增加一个富规则：

```
# firewall-cmd --permanent --zone=internal --add-rich-rule='rule family=ipv4 source address="1.1.1.0/8" service name="samba" accept'
```

最后，重新加载，把这些变化拉取到会话中：

```
# firewall-cmd --reload
```

仅剩下少数的细节了。从一个 `internal` 区域以外的 IP 去尝试通过 `ssh` 到你的服务器，结果是回复一个拒绝的消息。它是 firewalld 默认的。更为安全的作法是去显示不活跃的 IP 行为并丢弃该连接。改变 `public` 区域的目标为 `DROP`，而不是 `default` 来实现它：

```
# firewall-cmd --permanent --zone=public --set-target=DROP
# firewall-cmd --reload
```

但是，等等，你不再可以 ping 了，甚至是从内部区域！并且 icmp （ping 使用的协议）并不在 firewalld 可以列入白名单的服务列表中。那是因为，icmp 是第 3 层的 IP 协议，它没有端口的概念，不像那些捆绑了端口的服务。在设置公共区域为 `DROP` 之前，ping 能够通过防火墙是因为你的 `default` 目标通过它到达防火墙的默认动作（default），即允许它通过。但现在它已经被删除了。

为恢复内部网络的 ping，使用一个富规则：

```
# firewall-cmd --permanent --zone=internal --add-rich-rule='rule protocol value="icmp" accept'
# firewall-cmd --reload
```

结果如下，这里是两个活动区域的配置：

```
# firewall-cmd --zone=public --list-all
public (default, active)
  interfaces: eno1 eno2
  sources:
  services: http https
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
# firewall-cmd --permanent --zone=public --get-target
DROP
# firewall-cmd --zone=internal --list-all
internal (active)
  interfaces:
  sources: 1.1.0.0/16
  services: ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
        rule family=ipv4 source address="1.1.1.0/8" service name="samba" accept
        rule protocol value="icmp" accept
# firewall-cmd --permanent --zone=internal --get-target
default
```

这个设置演示了一个三层嵌套的防火墙。最外层，`public`，是一个接口区域，包含全世界的访问。紧接着的一层，`internal`，是一个源区域，包含你的组织，它是 `public` 的一个子集。最后，一个富规则增加到最内层，包含了你的工作组，它是 `internal` 的一个子集。

这里的关键信息是，当在一个场景中可以突破到嵌套层，最外层将使用接口区域，接下来的将使用一个源区域，并且在源区域中额外使用富规则。

### 调试

firewalld 采用直观范式来设计防火墙，但比它的前任 iptables 更容易产生歧义。如果产生无法预料的行为，或者为了更好地理解 firewalld 是怎么工作的，则可以使用 iptables 描述 netfilter 是如何配置操作的。前一个示例的输出如下，为了简单起见，将输出和日志进行了修剪:

```
# iptables -S
-P INPUT ACCEPT
... (forward and output lines) ...
-N INPUT_ZONES
-N INPUT_ZONES_SOURCE
-N INPUT_direct
-N IN_internal
-N IN_internal_allow
-N IN_internal_deny
-N IN_public
-N IN_public_allow
-N IN_public_deny
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -j INPUT_ZONES_SOURCE
-A INPUT -j INPUT_ZONES
-A INPUT -p icmp -j ACCEPT
-A INPUT -m conntrack --ctstate INVALID -j DROP
-A INPUT -j REJECT --reject-with icmp-host-prohibited
... (forward and output lines) ...
-A INPUT_ZONES -i eno1 -j IN_public
-A INPUT_ZONES -i eno2 -j IN_public
-A INPUT_ZONES -j IN_public
-A INPUT_ZONES_SOURCE -s 1.1.0.0/16 -g IN_internal
-A IN_internal -j IN_internal_deny
-A IN_internal -j IN_internal_allow
-A IN_internal_allow -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT
-A IN_internal_allow -s 1.1.1.0/8 -p udp -m udp --dport 137 -m conntrack --ctstate NEW -j ACCEPT
-A IN_internal_allow -s 1.1.1.0/8 -p udp -m udp --dport 138 -m conntrack --ctstate NEW -j ACCEPT
-A IN_internal_allow -s 1.1.1.0/8 -p tcp -m tcp --dport 139 -m conntrack --ctstate NEW -j ACCEPT
-A IN_internal_allow -s 1.1.1.0/8 -p tcp -m tcp --dport 445 -m conntrack --ctstate NEW -j ACCEPT
-A IN_internal_allow -p icmp -m conntrack --ctstate NEW -j ACCEPT
-A IN_public -j IN_public_deny
-A IN_public -j IN_public_allow
-A IN_public -j DROP
-A IN_public_allow -p tcp -m tcp --dport 80 -m conntrack --ctstate NEW -j ACCEPT
-A IN_public_allow -p tcp -m tcp --dport 443 -m conntrack --ctstate NEW -j ACCEPT
```

在上面的 iptables 输出中，新的链（以 `-N` 开始的行）是被首先声明的。剩下的规则是附加到（以 `-A` 开始的行） iptables 中的。已建立的连接和本地流量是允许通过的，并且入站包被转到 `INPUT_ZONES_SOURCE` 链，在那里如果存在相应的区域，IP 将被发送到那个区域。从那之后，流量被转到 `INPUT_ZONES` 链，从那里它被路由到一个接口区域。如果在那里它没有被处理，icmp 是允许通过的，无效的被丢弃，并且其余的都被拒绝。

### 结论

firewalld 是一个文档不足的防火墙配置工具，它的功能远比大多数人认识到的更为强大。以创新的区域范式，firewalld 允许系统管理员去分解流量到每个唯一处理它的分类中，简化了配置过程。因为它直观的设计和语法，它在实践中不但被用于简单的单一区域中也被用于复杂的多区域配置中。

--------------------------------------------------------------------------------

via: https://www.linuxjournal.com/content/understanding-firewalld-multi-zone-configurations?page=0,0

作者：[Nathan Vance][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxjournal.com/users/nathan-vance
[1]:https://www.linuxjournal.com/tag/firewalls
[2]:https://www.linuxjournal.com/tag/howtos
[3]:https://www.linuxjournal.com/tag/networking
[4]:https://www.linuxjournal.com/tag/security
[5]:https://www.linuxjournal.com/tag/sysadmin
[6]:https://www.linuxjournal.com/users/william-f-polik
[7]:https://www.linuxjournal.com/users/nathan-vance
