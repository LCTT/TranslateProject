[#]: subject: "Diagnose connectivity issues with the Linux ping command"
[#]: via: "https://opensource.com/article/21/10/linux-ping-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 Linux ping 命令诊断网络连接问题
======
>在本文中，我们将讨论网络连接最基本的诊断工具之一——ping 命令。

![World locations with red dots with a sun burst background][1]

如今，联网计算机变得十分普遍，以至于我们大多数人都理所当然地认为，房间一侧的计算机可以连接上房间另一侧的计算机，更不用说能连接上世界的另一端的计算机了。如此，网络使 Internet、云、文件共享、媒体流、远程管理、打印等服务成为可能。但是当网络出现问题时，有时很难诊断到底是其中哪一环节出现了问题。下面，我们就来介绍：网络连接最基本的诊断工具之一——`ping` 命令。

### 基本的 ping 命令

当你无法访问本地网络上的计算机或 Internet 上的服务器时，你可以 `ping` 它的 IP 地址。`ping` 将 <ruby> Internet 控制报文协议<rt> Internet Control Message Protocol </rt></ruby>(ICMP) 数据包发送到目标 IP 地址。当我们要对网路连接状况进行判断时，ICMP 是个非常有用的协议，本质上 ICMP 是一个响应和应答信号。

让我们由近及远地进行故障排除。请先 `ping` 你自己的计算机，以确保你的计算机正在运行 <ruby>网络栈<rt> networking stack </rt></ruby>。你正在操作的计算机称为 <ruby> _主机_<rt> localhost </rt></ruby>，本地回环地址是：127.0.0.1。

`ping` 命令能用主机的 <ruby>主机名<rt> hostname </rt></ruby>、IP 地址（即 127.0.0.1）或者仅仅用简写 `0`，来表示 _主机_。

你可以使用 `-c`选项，来控制发送数据包的 <ruby>次数<rt> count </rt></ruby>。

```
$ ping 0 -c 1
PING 0 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.069 ms

\--- 0 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.069/0.069/0.069/0.000 ms
```

在你确认本地网络栈已启动并运行后，接下来，你可以 `ping` 你的路由器的 IP 地址。路由器的 IP 地址通常以 192，168 或 10 开头。实际的 IP 地址取决于路由器的配置。

当你没有指定要发送多少次请求时，你可以用 **Ctrl**+**C**，来终止 `ping` 的运行。

```
$ ping 192.168.0.1 
PING 192.168.0.1 (192.168.0.1) 56(84) bytes of data.
From 192.168.0.100: icmp_seq=2 Redirect Host(New nexthop: 192.168.0.1)
From 192.168.0.100: icmp_seq=3 Redirect Host(New nexthop: 192.168.0.1)
From 192.168.0.100: icmp_seq=4 Redirect Host(New nexthop: 192.168.0.1)
From 192.168.0.100: icmp_seq=5 Redirect Host(New nexthop: 192.168.0.1)
^C
```

如果你能 `ping` 通路由器，则表示你的有线或无线连接能正常工作。

对于你的局域网上的其他主机呢？你可以 `ping` 各种设备，但是并非所有设备都能保证响应，因为一些设备会丢弃 ICMP 数据包，但许多设备会做出响应。例如，我可以 `ping` 我的打印机：

```
`$ ping 192.168.0.4 `
```

### Ping 路由器以外的其他服务器

在确定你自己的网络内部都能连通以后，你还可以 `ping` 通到路由器以外的其他服务器。同样地，并非所有服务器都能接收 ICMP 数据包，更不用说响应 ICMP 数据包了。然而，也有一些服务器可以接收并响应 ICMP 数据包，而在互联网中的一个重要服务器是 <ruby>**域名服务器**<rt> nameserver </rt></ruby>。

Google 的 <ruby>域名解析服务器<rt> DNS server </rt></ruby>的 IP 地址很容易记住，而且它会响应 `ping` 请求：

```
$ ping -c 2 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=116 time=53.3 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=116 time=53.5 ms

\--- 8.8.8.8 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1000ms
rtt min/avg/max/mdev = 53.304/53.424/53.544/0.120 ms
```

当你连不上一个网站时，你可以查询全球 DNS 网络，以找出其主机服务器的地址，然后 `ping` 该服务器。这至少可以告诉你，网站不通的原因是主机已关闭，或者只是 Web 服务器问题。

例如，假设你尝试访问 example.com，但是发现失败了。首先，使用 `host` 命令找到 example.com 的 IP 地址：

```
$ host example.com
example.com has address 93.184.216.34
example.com has IPv6 address 2606:2800:220:1:248:1893:25c8:1946
example.com mail is handled by 0
```

然后，`ping` 该网站的的 IP 地址：

```
`$ ping 93.184.216.34 -c 1`
```

### Ping 使用 IPv6

`ping` 不仅可以使用 IPv4，还能使用 IPv6。可以通过指定 `-4` 或 `-6` 选项，来只使用 IPv4 或 IPv6。

### Ping 设置数据包大小

你可以使用 `-s` 选项，来更改要发送的 ICMP 数据包的 <ruby>大小<rt> size </rt></ruby>。默认的数据大小为 56 字节，加上 8 字节包头，总共得到 64 字节的 ICMP 数据包。以下的示例将发送的 ICMP 数据包大小修改为 35+8=43 个字节：

```
`$ ping -s 35 -c 5 8.8.8.8`
```

你可以使用 `-D` 选项，使得在终端中的每个 ping 回复之前，先打印出当前的时间戳。该时间戳为 UNIX 时间戳，加上微秒：

```
$ ping -D 8.8.8.8 
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
[1634013430.297468] 64 bytes from 8.8.8.8: icmp_seq=1 ttl=116 time=53.3 ms
[1634013431.298738] 64 bytes from 8.8.8.8: icmp_seq=2 ttl=116 time=53.1 ms
```

### Ping 设置时间间隔/长短

你可以使用 `-i` 选项，来更改两次 `ping` 请求之间的 <ruby>时间间隔<rt> interval </rt></ruby>。以下的示例将 `ping` 间隔更改为 2 秒：

```
`$ ping -i 2 `
```

你也可以使用 `-w` 选项，来在一段时间后终止 `ping`。

```
`$ ping -w 6`
```

### 使用 ping 的工具

使用 `ping` 的工具有很多。例如，`iputils` 包提供了 `ping` 命令；[Busybox][2] 也有`ping` 命令；BSD 也有；甚至还有一个用于 `ping` 的 GUI：Gping，它可用于 Linux、macOS 和 Windows。你可以在 [Github][3] 上找到更多有关 `gping` 的信息。

### 一起来学习吧

`ping` 命令很简单，但它可以帮你诊断网络连接问题。下次再遇到网络连接问题时，让 `ping` 命令成为你解决问题的第一个工具吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-ping-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[chai001125](https://github.com/chai001125)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/world_remote_teams.png?itok=Wk1yBFv6 (World locations with red dots with a sun burst background)
[2]: https://opensource.com/article/21/8/what-busybox
[3]: https://github.com/orf/gping
