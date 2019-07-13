netdev 第一天：IPsec！
============================================================

嗨！和去年一样，今年我又参加了 [netdev 会议][3]。（[这里][14]是我上一年所做的笔记）。

在今天的会议中，我学到了很多有关 IPsec 的知识，所以下面我将介绍它们！其中 Sowmini Varadhan 和 [Paul Wouters][5] 做了一场关于 IPsec 的专题研讨会。本文中的错误 100% 都是我的错 :)。

### 什么是 IPsec？

IPsec 是一个用来加密 IP 包的协议。某些 VPN 已经是通过使用 IPsec 来实现的。直到今天我才真正意识到 VPN 使用了不只一种协议，原来我以为 VPN 只是一个通用术语，指的是“你的数据包将被加密，然后通过另一台服务器去发送“。VPN 可以使用一系列不同的协议（OpenVPN、PPTP、SSTP、IPsec 等）以不同的方式来实现。

为什么 IPsec 和其他的 VPN 协议如此不同呢？（或者说，为什么在本次 netdev 会议会有 IPsec 的教程，而不是其他的协议呢？）我的理解是有 2 点使得它如此不同：

* 它是一个 IETF 标准，例如可以在文档 [RFC 6071][1] 等中查到（你知道 IETF 是制定 RFC 标准的组织吗？我也是直到今天才知道的！）。
* 它在 Linux 内核中被实现了（所以这才是为什么本次 netdev 会议中有关于它的教程，因为 netdev 是一个跟 Linux 内核网络有关的会议 :)）。

### IPsec 是如何工作的？

假如说你的笔记本正使用 IPsec 来加密数据包并通过另一台设备来发送它们，那这是怎么工作的呢？对于 IPsec 来说，它有 2 个部分：一个是用户空间部分，另一个是内核空间部分。

IPsec 的用户空间部分负责**密钥的交换**，使用名为 [IKE][6] （<ruby>网络密钥传输<rt>internet key exchange</rt></ruby>）的协议。总的来说，当你打开一个 VPN 连接的时候，你需要与 VPN 服务器通信，并且和它协商使用一个密钥来进行加密。

IPsec 的内核部分负责数据包的实际加密工作 —— 一旦使用 IKE 生成了一个密钥，IPsec 的用户空间部分便会告诉内核使用哪个密钥来进行加密。然后内核便会使用该密钥来加密数据包！

### 安全策略以及安全关联

（LCTT 译注：security association 我翻译为安全关联， 参考自 https://zh.wikipedia.org/wiki/%E5%AE%89%E5%85%A8%E9%97%9C%E8%81%AF ）

IPSec 的内核部分有两个数据库：**安全策略数据库**（SPD）和**安全关联数据库**（SAD）。

安全策略数据库包含 IP 范围和用于该范围的数据包需要执行的操作（对其执行 IPsec、丢弃数据包、让数据包通过）。对于这点我有点迷糊，因为针对不同 IP 范围的数据包所采取的规则已经在路由表（`sudo ip route list`）中使用过，但显然你也可以设定 IPsec 规则，但它们位于不同的地方！

而在我眼中，安全关联数据库存放有用于各种不同 IP 的加密密钥。

查看这些数据库的方式却是非常不直观的，需要使用一个名为 `ip xfrm` 的命令，至于 `xfrm` 是什么意思呢？我也不知道！

（LCTT 译注：我在 https://www.allacronyms.com/XFMR/Transformer 上查到 xfmr 是 Transformer 的简写，又根据 [man7](http://man7.org/linux/man-pages/man8/ip-xfrm.8.html) 上的简介， 我认为这个说法可信。）

```
# security policy database
$ sudo ip xfrm policy
$ sudo ip x p

# security association database
$ sudo ip xfrm state
$ sudo ip x s
```

### 为什么 IPsec 被实现在 Linux 内核中而 TLS 没有？

对于 TLS 和 IPsec 来说，当打开一个连接时，它们都需要做密钥交换（使用 Diffie-Hellman 或者其他算法）。基于某些可能很明显但我现在还没有理解（？？）的原因，在内核中人们并不想做密钥的交换。

IPsec 更容易在内核实现的原因是使用 IPsec 你可以更少频率地协商密钥的交换（对于每个你想通过 VPN 来连接的 IP 只需要一次），并且 IPsec 会话存活得更长。所以对于用户空间来说，使用 IPsec 来做密钥交换、密钥的获取和将密钥传递给内核将更容易，内核得到密钥后将使用该密钥来处理每个 IP 数据包。

而对于 TLS 来说，则存在一些问题：

a. 当你每打开一个 TLS 连接时，每次你都要做新的密钥交换，并且 TLS 连接存活时间较短。
b. 当你需要开始做加密时，使用 IPsec 没有一个自然的协议边界，你只需要加密给定 IP 范围内的每个 IP 包即可，但如果使用 TLS，你需要查看 TCP 流，辨别 TCP 包是否是一个数据包，然后决定是否加密它。

实际上有一个补丁用于 [在 Linux 内核中实现 TLS][7]，它让用户空间做密钥交换，然后传给内核密钥，所以很明显，使用 TLS 不是不可能的，但它是一个新事物，并且我认为相比使用 IPsec，使用 TLS 更加复杂。

### 使用什么软件来实现 IPsec 呢？

据我所知有 Libreswan 和 Strongswan 两个软件。今天的教程关注的是 libreswan。

有些让人迷糊的是，尽管 Libreswan 和 Strongswan 是不同的程序包，但它们都会安装一个名为 `ipsec` 的二进制文件来管理 IPsec 连接，并且这两个 `ipsec` 二进制文件并不是相同的程序（尽管它们担任同样的角色）。

在上面的“IPsec 如何工作”部分，我已经描述了 Strongswan 和 Libreswan 做了什么 —— 使用 IKE 做密钥交换，并告诉内核有关如何使用密钥来做加密。

### VPN 不是只能使用 IPsec 来实现！

在本文的开头我说“IPsec 是一个 VPN 协议”，这是对的，但你并不必须使用 IPsec 来实现 VPN！实际上有两种方式来使用 IPsec：

1. “传输模式”，其中 IP 表头没有改变，只有 IP 数据包的内容被加密。这种模式有点类似于使用 TLS —— 你直接告诉服务器你正在通信（而不是通过一个 VPN 服务器或其他设备），只有 IP 包里的内容被加密。 
2. ”隧道模式“，其中 IP 表头和它的内容都被加密了，并且被封装进另一个 UDP 包内。这个模式被 VPN 所使用 ——  你获取你正传送给一个秘密网站的包，然后加密它，并将它送给你的 VPN 服务器，然后 VPN 服务器再传送给你。

### 投机的 IPsec

今天我学到了 IPsec “传输模式”的一个有趣应用，它叫做 “投机的 IPsec”（通过它，你可以通过开启一个 IPsec 连接来直接和你要通信的主机连接，而不是通过其他的中介服务器），现在已经有一个“投机的 IPsec” 服务器了，它位于 [http://oe.libreswan.org/][8]。

我认为当你在你的电脑上设定好 `libreswan` 和 `unbound` DNS 程序后，当你连接到 [http://oe.libreswan.org][8] 时，主要发生了如下的几件事：

1. `unbound` 做一次 DNS 查询来获取 `oe.libreswan.org` (`dig ipseckey oe.libreswan.org`) 的 IPSECKEY 记录，以便获取到公钥来用于该网站（这需要 DNSSEC 是安全的，并且当我获得足够多这方面的知识后，我将用另一篇文章来说明它。假如你想看到相关的结果，并且如果你只是使用 dig 命令来运行此次 DNS 查询的话，它也可以工作）。
2. `unbound` 将公钥传给 `libreswan` 程序，然后 `libreswan` 使用它来和运行在  `oe.libreswan.org` 网站上的 IKE 服务器做一次密钥交换。
3. `libreswan`  完成了密钥交换，将加密密钥传给内核并告诉内核当和 `oe.libreswan.org` 做通信时使用该密钥。
4. 你的连接现在被加密了！即便它是 HTTP 连接！有趣吧！

### IPsec 和 TLS 相互借鉴

在今天的教程中听到一个有趣的花絮是 IPsec 和 TLS 协议实际上总是从对方学习 —— 正如他们说在 TLS 出现前， IPsec 的 IKE 协议有着完美的正向加密，而 IPsec 也从 TLS 那里学了很多。很高兴能听到不同的网络协议之间是如何从对方那里学习并与时俱进的事实！

### IPsec 是有趣的！

我已经花了很长时间来学习 TLS，很明显它是一个超级重要的网络协议（让我们来加密网络吧！:D）。但 IPsec 也是一个很重要的网络加密协议，它与 TLS 有着不同的角色！很明显有些移动电话协议（例如 5G/LTE）使用 IPsec 来加密它们的网络流量！

现在我很高兴我知道更多关于 IPsec 的知识！和以前一样可能本文有些错误，但希望不会错的太多 :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/07/11/netdev-day-1--ipsec/

作者：[Julia Evans][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about
[1]:https://tools.ietf.org/html/rfc6071
[2]:https://jvns.ca/categories/netdev
[3]:https://www.netdevconf.org/0x12/
[4]:https://jvns.ca/categories/netdev/
[5]:https://nohats.ca/
[6]:https://en.wikipedia.org/wiki/Internet_Key_Exchange
[7]:https://blog.filippo.io/playing-with-kernel-tls-in-linux-4-13-and-go/
[8]:http://oe.libreswan.org/
[14]:https://jvns.ca/categories/netdev/