SSH协议端口号选为22的故事
======================

为什么 [SSH][4]（安全终端）的端口号是 22 呢，这不是一个巧合，这其中有个我（Tatu Ylonen，SSH 协议的设计者）未曾诉说的故事。

### 将 SSH 协议端口号设为 22 的故事

1995 年春我编写了 SSH 协议的最初版本，那时候 [telnet][5] 和 [FTP][6] 正被广泛使用。

当时我设计 SSH 协议想着是为了替代 `telnet`（端口 23）和 `ftp`（端口21）两个协议的，而端口 22 是空闲的。我想当然地就选择了夹在 `telnet` 和 `ftp` 的端口中间的数字。我觉得端口号虽然是个小事但似乎又存在着某种信念。但我到底要怎么拿到那个端口号呢？我未曾拥有过任何一个端口号，但我却认识几个拥有端口号的人。

在那时取得端口号的事情其实说来挺简单的。毕竟当时的因特网（Internet）并不是很大，是因特网爆炸的早期。端口号分配的活儿是 IANA（Internet Assigned Numbers Authority，互联网数字分配机构）干的。在那时这机构可相当于是因特网先驱 [Jon Postel][7] 和 [Joyce K. Reynolds][8] 一般的存在。Jon 参与编写了多项主要的协议标准，例如 IP（RFC 791）、ICMP（RFC 792）和 TCP（RFC 793）等一些你应该早有耳闻的协议。

我可以说是敬畏 Jon 先生的，他参与编写了几乎所有主要的因特网标准文档（Internet RFCs）！

1995年7月，就在我发布 `ssh-1.0` 前，我发送了一封邮件给 IANA：

```
From ylo Mon Jul 10 11:45:48 +0300 1995
From: Tatu Ylonen <ylo@cs.hut.fi>
To: Internet Assigned Numbers Authority <iana@isi.edu>
Subject: 请求取得一个端口号
Organization: 芬兰赫尔辛基理工大学

亲爱的机构成员：

我写了个可以在不安全的网络环境中安全地从一台机器登录到另一台机器的程序。它主要是对 telnet 
协议以及 rlogin 协议的功能性提升和安全性改进。说的具体些，就是可以防御 IP、DNS 或路由
等欺骗行为。我打算将我的软件免费贡献给因特网并得到广泛地使用。

我希望为我的软件注册一个端口号，要是这个端口号在 1 到 255 之间就更好了，这样我就可以在名字
服务器中使用 WKS 域了。

我在附件中附上了协议标准的草案。这个软件已经在本地运行了几个月了，我已准备在获得端口号后
就发布。如果端口号分配一事安排的及时，我希望这周就将要发布的软件准备好。我目前在 beta 版
测试时使用的端口号是 22，如果要是能够分配到这个端口，我就不用做什么更改了（目前这个端口在
列表中还是空闲的）。

软件中服务的名称叫 `ssh`（系安全终端的缩写）。

您最真诚的，

Tatu Ylonen <ylo@cs.hut.fi>

... 附件：ssh-1.0 协议标准
```

第二天，我就收到了 Joyce 发来的邮件：

```
Date: Mon, 10 Jul 1995 15:35:33 -0700
From: jkrey@ISI.EDU
To: ylo@cs.hut.fi
Subject: 回复：请求取得一个端口号
Cc: iana@ISI.EDU

Tatu,

我们将端口号 22 注册给 ssh 服务了，你目前是该服务的主要联系人。

Joyce
```

这就搞定了！SSH 的端口正式使用 22！！！

1995年7月12日上午2点21分，我给我在赫尔辛基理工大学的测试者们宣布了 SSH 的最后 beta 版本。当日下午5点23分，我给测试者们宣布了 ssh-1.0.0 版本。1995年7月12日，下午5点51分，我将一份 SSH（安全终端）的宣告发给了 `cypherpunks@toad.com` 的邮件列表，此外我还将其发给了一些新闻团体、其他的邮件列表和一些在因特网上讨论此事的人们。

### 如何更改 SSH 服务的端口号

SSH 服务器是默认运行在 22 号端口上的。然而，某些原因需要，它也可以运行在别的端口上。比如方便测试使用，又比如在同一个宿主机上运行多个不同的配置。当然，极少情况下，不使用 root 权限运行它也可以，比如某些有必要运行在没有权限的端口之上的情况（端口号大于等于 1024）。

端口号可以在配置文件 [/etc/ssh/sshd_config][9] 中将 `Port 22` 更改。也可以使用 `-p <port>` 选项运行 [sshd][10]。SSH 客户端和 [sftp][11] 程序也可以使用 `-p <port>` 选项。

### 配置 SSH 协议穿过防火墙

SSH 是少数经常需要穿过防火墙的协议之一。使用 SSH 常见的做法是不限制流量出口，尤其常见于一些较小的或者比较技术型的组织中，而流量入口通常会限制只有一台或者是少数几台服务器可以访问。

### SSH 的流量出口

在防火墙中配置 SSH 的流量出口十分简单。如果机器的流量流出存在总限制，只需要创建允许 22 在 TCP 上可以流出的规则即可。如果你想限制目标地址，你可以只让你组织的外部服务器或者 [跳板服务器][12] 有权通过该规则。

### 后门通道是有风险的

其实不限制 SSH 的流量出口是存在风险，SSH 协议是支持 [通道访问][13] 的。最初的想法是在外部服务器搭建一个 SSH 服务监听来自各处的连接，将进入的连接转发到组织并让这个连接可以访问某个内部服务器。

在某些场景下这当然非常的方便。开发者和系统管理员可以频繁的使用它打开一个通道以便于他们可以远程访问，比如在家里或者在旅行中使用笔记本电脑等场景。

然而通常来讲这些做法是违背安全策略的，跳过防火墙管理员和安全团队保护的控制无疑是违背安全策略的，比如这些： [PCI][14]、[HIPAA][15]、[NIST SP 800-53][16] 等。

[CryptoAuditor][17] 是一款可以控制通道穿过云服务器防火墙或者入口点的产品。该款产品在启用防火墙并阻挡未授权转发的场景中，配合 [通用 SSH 密钥管理器（Universal SSH Key Manager）][18] 去授权访问 [宿主密钥（host keys）][19] 以解密 SSH 会话。

### SSH 的流量出口访问权

对于流量出口访问权而言，这里有几点需要说一下：

*   配置防火墙，让所有去往 22 的连接只能流向特定的内部网络 IP 地址或者一个 [DMZ][1] 主机。并运用 [CryptoAuditor][2] 或者跳板机控制特定 IP 地址并审查所有访问组织的连接。
*   对不同的服务器访问权，应在防火墙中设置不同的访问端口。
*   只允许使用 VPN（虚拟专用网）连接 SSH 服务，比如 [IPsec][3] 协议。

### 通过 iptables 服务限制 SSH 访问

[Iptables][20] 是一款内建在 Linux 内核的宿主防火墙。通常配置以用于预防服务器免于匿名尝试访问那些未明确定义为开启的端口。

当 `iptables` 启用时，使用下面的命令将可以开启流量流入 SSH 服务，当然命令需要以 root 身份运行。

```
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
```

如果你想将上述命令创建的规则持久地保存，在某些系统版本中，可使用如下命令：

```
service iptables save
```

 ![防火墙开启 SSH 端口可以让我挖隧道去银行](https://www.ssh.com/s/ssh-port-firewall-access-banks-950x333-s+ZpRviP.png)

--------------------------------------------------------------------------------

via: https://www.ssh.com/ssh/port

作者：[Tatu Ylonen ][a]
译者：[kenxx](https://github.com/kenxx)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ssh.com/ssh/port
[1]:https://en.wikipedia.org/wiki/DMZ_(computing)
[2]:https://www.ssh.com/products/cryptoauditor/
[3]:https://www.ssh.com/network/ipsec/
[4]:https://www.ssh.com/ssh/
[5]:https://www.ssh.com/ssh/telnet
[6]:https://www.ssh.com/ssh/ftp/
[7]:https://en.wikipedia.org/wiki/Jon_Postel
[8]:https://en.wikipedia.org/wiki/Joyce_K._Reynolds
[9]:https://www.ssh.com/ssh/sshd_config/
[10]:https://www.ssh.com/ssh/sshd/
[11]:https://www.ssh.com/ssh/sftp/
[12]:https://www.ssh.com/iam/jump-server
[13]:https://www.ssh.com/ssh/tunneling/
[14]:https://www.ssh.com/compliance/pci/
[15]:https://www.ssh.com/compliance/hipaa/security-rule
[16]:https://www.ssh.com/compliance/nist-800-53/
[17]:https://www.ssh.com/products/cryptoauditor/
[18]:https://www.ssh.com/products/universal-ssh-key-manager/
[19]:https://www.ssh.com/ssh/host-key
[20]:https://en.wikipedia.org/wiki/Iptables
