[#]: collector: "lujun9972"
[#]: translator: "tinyeyeser"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12103-1.html"
[#]: subject: "Control the firewall at the command line"
[#]: via: "https://fedoramagazine.org/control-the-firewall-at-the-command-line/"
[#]: author: "Paul W. Frields https://fedoramagazine.org/author/pfrields/"

在 Fedora 命令行下玩转防火墙
======

![](https://img.linux.net.cn/data/attachment/album/202004/12/123040ghxuicphyhsoppch.jpg)

网络防火墙，顾名思义：为了阻止不需要的网络连接而设置的防护性屏障。在与外界建立连接或是提供网络服务时常常会用到。例如，在学校或是咖啡厅里使用笔记本电脑时，你一定不想某个陌生人窥探你的电脑。

每个 Fedora 系统都内置了一款防火墙。这是 Linux 内核网络功能的一部分。本文介绍如何通过 `firewall-cmd` 命令修改防火墙的配置。

### 网络基础

本文并不教授计算机网络的[所有知识][2]，但还是会简单介绍一些网络基础。

网络中的所有计算机都有一个 *IP 地址*，可以把它想象成一个邮箱地址，有了邮箱地址，邮件才知道发往何处。每台计算机还会拥有一组*端口*，端口号范围从 0 到 65535。同样的，你可以把这些端口想象成用来连接邮箱地址的连接点。

通常情况下，端口会是一个标准端口号或是根据应用程序的应答要求选定的一个端口范围。例如，一台 Web 服务器通常会保留 80 端口用于 HTTP 通信，443 端口用于 HTTPS。小于 1024 的端口主要用于系统或常见用途，1024-49151 端口是已经注册的，49152 及以上端口多为临时使用（只限短时间使用）。

互联网传输中最常见的两个协议，[TCP][4] 和 [UDP][5]。当要传输的数据很重要，不能有丢包时，就使用 TCP 协议，如果数据包没有按顺序到达，还需要重组为正确的顺序。UDP 协议则更多用于对时间敏感的服务，为了保证时效性，有时允许丢失部分数据。

系统中运行的应用，例如 Web 服务器，会保留一些端口（例如上文提到的 80 和 443）。在网络传输过程中，主机会为传输的两端建立一个链接，一端是源地址和源端口，另一端是目的地址和目的端口。

网络防火墙就是基于地址、端口及其他标准的一组规则集，来对网络数据的传输进行屏蔽或阻断的。通过  `firewall-cmd` 命令，我们就可以查看或修改防火墙的工作配置。

### 防火墙域（zone）

为了验证防火墙是否开启，使用 `firewall-cmd` 命令，输入时要加上 [sudo](https://fedoramagazine.org/howto-use-sudo/)。（通常，在运行了 [PolicyKit](https://en.wikipedia.org/wiki/Polkit) 的环境中，你也可以不加 `sudo`）

```
$ sudo firewall-cmd --state
running
```

firewalld 服务支持任意数量的域。每个域都可以拥有独立的配置和防护规则。一台 Fedora 工作站的外部接口（例如 WIFI 或有线网卡）其默认域为 `FedoraWorkstation`。

要看有哪些域是激活状态，可以使用 `-–get-active-zones` 选项。在本示例中，有两个网卡，有线以太网卡 `wlp2s0` 和虚拟（libvirt）桥接网卡 `virbr0`：

```
$ sudo firewall-cmd --get-active-zones
FedoraWorkstation
  interfaces: wlp2s0
libvirt
  interfaces: virbr0
```

如果想看看默认域是什么，或是直接查询所有域：

```
$ sudo firewall-cmd --get-default-zone
FedoraWorkstation
$ sudo firewall-cmd --get-zones
FedoraServer FedoraWorkstation block dmz drop external home internal libvirt public trusted work
```

查询默认域中防火墙放行了哪些系统，使用 `-–list-services` 选项。下例给出了一个定制系统的查询结果，你可以看到与常见的结果有些不同。

```
$ sudo firewall-cmd --list-services
dhcpv6-client mdns samba-client ssh
```

该系统对外开启了四个服务。每个服务都对应一个常见端口。例如 `ssh` 服务对应 22 端口。

如果要查看当前域中防火墙还开启了哪些端口，可以使用 `--list-ports` 选项。当然，你也可以随时对其他域进行查询：

```
$ sudo firewall-cmd --list-ports --zone=FedoraWorkstation
1025-65535/udp 1025-65535/tcp
```

结果表明，从 1025 到 65535 端口（包含 UDP 和 TCP）默认都是开启的。

### 修改域、端口及服务

以上的配置都是预先设计好的防火墙策略。是为了确保新手用户安装的应用都能够正常访问网络。如果你确定自己心里有数，想要一个保护性更强的策略，可以将接口放入 `FedoraServer` 域，明确禁止所有端口的访问。（**警告**：如果你的服务器之前是联网状态，这么做可能会导致连接中断，那你就得到机房里去修改更多的配置项！）

```
$ sudo firewall-cmd --change-interface=<ifname> --zone=FedoraServer
success
```

**本文并不讨论如何制定防火墙策略，Fedora 社区里已经有很多讨论了。你大可以按照自身需要来修改配置。**

如果你想要开放某个服务的常见端口，可以将该服务加入默认域（或使用 `--zone` 指定一个不同的域）。还可以一次性将其加入多个域。下例开放了 HTTP 和 HTTPS 的常见端口 80、443：

```
$ sudo firewall-cmd --add-service=http --add-service=https
success
```

并非所有的服务都有默认端口，不过大部分都是有的。使用  `-–get-services` 选项可以查看完整列表。

如果你想指定某个特定端口号，可以直接用数字和协议进行配置。（多数情况下，`-–add-service` 和 `-–add-port` 这两个选项是合在一起使用的）下例开启的是 UDP 协议的网络启动服务：

```
$ sudo firewall-cmd --add-port=67/udp
success
```

**重要**：如果想要在系统重启或是 firewalld 服务重启后，配置仍然生效，**必须**在命令中加上 `-–permanent` 选项。本文中的例子只是临时修改了配置，下次遇到系统重启或是 firewalld 服务重启，这些配置就失效了。

以上只是 `firewall-cmd` 和 firewalld 服务诸多功能中的一小部分。firewalld 项目的[主页][8]还有更多信息值得你去探索和尝试。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/control-the-firewall-at-the-command-line/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[tinyeyeser](https://github.com/tinyeyeser)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/firewall-cmd-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Portal:Internet
[3]: https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
[4]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[5]: https://en.wikipedia.org/wiki/User_Datagram_Protocol
[6]: https://fedoramagazine.org/howto-use-sudo/
[7]: https://en.wikipedia.org/wiki/Polkit
[8]: https://firewalld.org/
[9]: https://unsplash.com/@jakobustrop?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[10]: https://unsplash.com/s/photos/brick-wall?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
