[#]: subject: "How to send raw network packets in Python with tun/tap"
[#]: via: "https://jvns.ca/blog/2022/09/06/send-network-packets-python-tun-tap/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "HankChow"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何使用 tun/tap 通过 Python 发送网络数据包
======

最近我正在做一个项目，为了解释计算机网络的工作原理，我需要在不使用封装好的网络工具库的前提下，通过一些 Python 玩具代码来实现一些计算机网络协议。

这个项目还在进行当中，但我想首先讨论一下这个项目的基础：用 Python 发送网络数据包。

在这篇文章中，我们会从一个小型 Python 程序中发送一个 SYN 包（也就是 TCP 连接中的第一个包），并从 `example.com` 获得一个应答。这篇文章的所有代码都会记录在这个 [gist][1] 当中。

### 什么是网络数据包？

网络数据包实际上是一个个字节串。以下是 TCP 连接中的第一个包内容：

```

    b'E\x00\x00,\x00\x01\x00\x00@\x06\x00\xc4\xc0\x00\x02\x02"\xc2\x95Cx\x0c\x00P\xf4p\x98\x8b\x00\x00\x00\x00`\x02\xff\xff\x18\xc6\x00\x00\x02\x04\x05\xb4'

```

上面这个字节串包含了两个部分，前 20 字节是 IP 地址部分，剩余的字节是 TCP 部分。但在这篇文章中，我不打算展开介绍这个字节串的详细结构。

重点在于，我们收发网络数据包，实际上就是收发这些字节串。

### 为什么要使用 `tun/tap`?

在 Linux（或其它操作系统）上实现一个自己的 TCP 连接，难点在于 Linux 内核本身已经完整实现了这一个过程。

因此如果你通过常规网络接口向诸如 `example.com` 发送一个 `SYN` 包，后续的整个过程就是：

  1. 你向 `expample.com` 发送了一个 `SYN` 包
  2. `example.com` 应答了一个 `SYN ACK` 包（目前还在预期之内）
  3. Linux 内核捕获到 `example.com` 应答的 `SYN ACK` 包，但会认为自己并没有创建这样的连接，随即关闭连接
  4. 你自己的 TCP 连接创建失败了


我在几年前和朋友讨论这个问题的时候，他建议我使用 `tun/tap`。我花了好几个小时来研究怎样通过这个工具来实现这样的连接，于是就有了我这篇文章。

### `tun/tap` 提供了一个“虚拟网络设备”

我喜欢这样理解 `tun/tap`：它类似于在我的网络里有一台可以收发网络数据包小型计算机，但这台“小型计算机”实际上是我写的一个 Python 程序。

实际上这个解释不算很恰当，我希望能准确描述 `tun/tap` 是如何与真实的 Linux 网络栈相结合的，但我发现我做不到，只能用“虚拟网络设备”来概括。希望以下的代码示例可以为读者展示得更加清楚一些。

### tun 与 tap

`tun/tap` 得名于它创建了两种网络接口：

  * `tun`：允许你处理 IP 层的数据包
  * `tap`：允许你处理以太网层的数据包


我们需要用的是 **`tun`**， 我比较了解它的使用方式，当然 `tap` 也是类似的。

### 如何创建 `tun` 网络接口

以下是我使用 192.0.2.2 这个 IP 创建 `tun` 网络接口的命令：

```

    sudo ip tuntap add name tun0 mode tun user $USER
    sudo ip link set tun0 up
    sudo ip addr add 192.0.2.1 peer 192.0.2.2 dev tun0

    sudo iptables -t nat -A POSTROUTING -s 192.0.2.2 -j MASQUERADE
    sudo iptables -A FORWARD -i tun0 -s 192.0.2.2 -j ACCEPT
    sudo iptables -A FORWARD -o tun0 -d 192.0.2.2 -j ACCEPT

```

上面的几条命令做了两件事：

  1. 使用 IP 地址 `192.0.2.2` 创建一个 `tun` 设备，并让当前用户对它可写
  2. 使用 `iptables` 为这个 `tun` 设备代理流量，并通过 NAT 的方式将数据包转发到互联网


`iptables` 的部分不可缺少，否则数据包只能在我的计算机内部流转而不能发出到互联网上，这将毫无意义。


### 如何使用 Python 连接到 tun 网络接口

以下这个函数开启一个 `tun` 网络接口，可以通过 `openTun('tun0')` 的方式调用，这是我研究 [scapy][2] 里关于 `tun` 的源码之后了解到的它的实现方式。

```

    import struct
    from fcntl import ioctl

    def openTun(tunName):
        tun = open("/dev/net/tun", "r+b", buffering=0)
        LINUX_IFF_TUN = 0x0001
        LINUX_IFF_NO_PI = 0x1000
        LINUX_TUNSETIFF = 0x400454CA
        flags = LINUX_IFF_TUN | LINUX_IFF_NO_PI
        ifs = struct.pack("16sH22s", tunName, flags, b"")
        ioctl(tun, LINUX_TUNSETIFF, ifs)
        return tun

```

它实际上做了两件事情：

  1. 在二进制模式下打开 `/dev/net/tun` 
  2. 调用 `ioctl` 并告诉 Linux 我们需要一个名为 `tun0` 的 `tun` 设备（当然，可以使用其它任何名称，只需要将其作为 `tunName` 传入函数即可）



网络接口开启之后，我们就可以使用 Python 对其进行读写操作了，和读写其它文件的方式没有什么太大的差异。

### 发送 SYN 包

在有了 `openTun` 函数之后，就可以发送 SYN 包了。

以下是在 Python 中使用 `openTun` 函数的发送 SYN 包的方式。

```

    syn = b'E\x00\x00,\x00\x01\x00\x00@\x06\x00\xc4\xc0\x00\x02\x02"\xc2\x95Cx\x0c\x00P\xf4p\x98\x8b\x00\x00\x00\x00`\x02\xff\xff\x18\xc6\x00\x00\x02\x04\x05\xb4'
    tun = openTun(b"tun0")
    tun.write(syn)
    reply = tun.read(1024)
    print(repr(reply))

```

我用 `sudo python3 syn.py` 的方式运行，它会把 `example.com` 的响应打印出来：

```

    b'E\x00\x00,\x00\x00@\x00&\x06\xda\xc4"\xc2\x95C\xc0\x00\x02\x02\x00Px\x0cyvL\x84\xf4p\x98\x8c`\x12\xfb\xe0W\xb5\x00\x00\x02\x04\x04\xd8'

```

这只是一个发送 SYN 包的试验性代码。在真实的实现中，需要根据实际情况生成对应的字节串，而不是把字节串写死在代码当中；另外，我们还需要解析远端服务器的响应，而不是仅仅把它原样打印出来。但由于这涉及到 TCP 包的结构，因此在这篇文章中，我不打算深入展开介绍这两部分。

### 使用 tcpdump 观察这些数据包

如果我们对 `tun0` 网络接口运行 `tcpdump`，我们就可以看到与远端 `example.com` 的收发包情况：

```

    $ sudo tcpdump -ni tun0
    12:51:01.905933 IP 192.0.2.2.30732 > 34.194.149.67.80: Flags [S], seq 4101019787, win 65535, options [mss 1460], length 0
    12:51:01.932178 IP 34.194.149.67.80 > 192.0.2.2.30732: Flags [S.], seq 3300937416, ack 4101019788, win 64480, options [mss 1240], length 0

```

`Flags [S]` 是我们发送的 SYN 包，`Flags [S.]` 则是对应的 SYN ACK 响应，这表明连接已经成功建立了，同时 Linux 本身的网络栈没有中断这一连接。

### tcpdump 也展示了 NAT 的运作方式

我们同样可以在真实的网络接口（比如我的无线网卡 `wlp3s0`）上运行 `tcpdump` 以观察网络数据包的收发情况。此时，我们的运行参数就需要把 `-i tun0` 改为 `-i wlp3s0`。

```

    $ sudo tcpdump -ni wlp3s0 host 34.194.149.67
    tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
    listening on wlp3s0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
    12:56:01.204382 IP 192.168.1.181.30732 > 34.194.149.67.80: Flags [S], seq 4101019787, win 65535, options [mss 1460], length 0
    12:56:01.228239 IP 34.194.149.67.80 > 192.168.1.181.30732: Flags [S.], seq 144769955, ack 4101019788, win 64480, options [mss 1240], length 0
    12:56:05.334427 IP 34.194.149.67.80 > 192.168.1.181.30732: Flags [S.], seq 144769955, ack 4101019788, win 64480, options [mss 1240], length 0
    12:56:13.524973 IP 34.194.149.67.80 > 192.168.1.181.30732: Flags [S.], seq 144769955, ack 4101019788, win 64480, options [mss 1240], length 0
    12:56:29.705007 IP 34.194.149.67.80 > 192.168.1.181.30732: Flags [S.], seq 144769955, ack 4101019788, win 64480, options [mss 1240], length 0

```

需要注意的是：

  * IP 地址发生了变化，变成了 `192.168.1.181`。这是因为发生了“<ruby>网络地址转换<rt>Network Address Translation</rt></ruby>”，也就是 NAT。
  * 我们从 `example.com` 收到了很多次响应。这是因为我们没有完成整个 TCP 握手的过程，仅仅发送了一个 SYN 包就挂起了连接，这个时候远端服务器会以<ruby>指数退避<rt>exponential backoff</rt></ruby>的方式响应：分别在 4 秒、8 秒、16 秒后重试。<ruby>SYN 洪泛<rt>SYN flooding</rt></ruby>就是一种使远端服务器大量重试发送 SYN ACK 包的 DDOS 攻击，当然这里仅重发数次 SYN ACK 包并不会对远端服务器产生影响。
  * 我需要在命令中声明 `host 34.194.149.67`，因为在我的真实无线网卡上还有很多其它的网络数据包，我只需要查看指定远端服务器 IP 的网络数据包。


我不完全确定为什么我们在 `wlp3s0` 网络接口上比在 `tun0` 网络接口上会看见更多的 SYN 响应，我推测是我们的 Python 程序中只读取了一次响应的原因。

### 这既简单又可靠

上一次我使用 Python 实现 TCP 连接的时候，我是通过 <ruby>ARP 欺骗<rt>ARP spoofing</rt></ruby>的方式实现的，但上文中的方式相比起来会更加可靠。另外，在公共网络中使用 ARP 欺骗是不道德的行为。

### 以下是代码

文中所有的代码都保存在 [gist][1] 当中，如果你想要自行尝试，可以执行以下命令：

```

    bash setup.sh # needs to run as root, has lots of `sudo` commands
    python3 syn.py # runs as a regular user

```

里面的代码仅在 Linux 系统下测试通过，但我认为在 Mac 上也有类似的方式可以使用 `tun/tap`。

### scapy 推荐

最后，我想推荐大家使用 [scapy][2] 这个 Python 网络库，它可以让你在不造轮子的情况下进行很多这种类似的试验。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/09/06/send-network-packets-python-tun-tap/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://gist.github.com/jvns/552e6d5e6fec6c3ddf2fcd4ccdab45d5
[2]: https://scapy.net/
