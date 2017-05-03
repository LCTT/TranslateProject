translating by [kenxx](https://github.com/kenxx)

SSH PORT 
============================================================

SSH协议端口号选为22的故事
======================

The [SSH][4] (Secure Shell) port is 22\. It is not a co-incidence. This is a story I (Tatu Ylonen) haven't told before.

为什么 [SSH][4]（安全终端）的端口号是 22 呢，这不是一个巧合，这其中有个我（Tatu Ylonen，SSH 协议的设计者）未曾诉说的故事。

### THE STORY OF GETTING SSH PORT 22

### 将 SSH 协议端口号设为 22 的故事

I wrote the initial version of SSH in Spring 1995\. It was a time when [telnet][5] and [FTP][6] were widely used.

1995 年春我编写了 SSH 协议的最初版本，那时候 [telnet][5] 和 [FTP][6] 正被广泛使用。

Anyway, I designed SSH to replace both `telnet` (port 23) and `ftp` (port 21). Port 22 was free. It was conveniently between the ports for `telnet` and `ftp`. I figured having that port number might be one of those small things that would give some aura of credibility. But how could I get that port number? I had never allocated one, but I knew somebody who had allocated a port.

当时我设计 SSH 协议想着是为了替代 `telnet`（端口 23）和 `ftp`（端口21）两个协议的，而端口 22 是空闲的。我想当然地就选择了夹在 `telnet` 和 `ftp` 的端口中间的数字。我觉得端口号虽然是个小事但似乎又存在着某种信念。但我到底要怎么拿到那个端口号呢？我未曾拥有过任何一个端口号，但我却认识几个拥有端口号的人。

The basic process for port allocation was fairly simple at that time. Internet was smaller and we were in very early stages of the Internet boom. Port numbers were allocated by IANA (Internet Assigned Numbers Authority). At the time, that meant an esteemed Internet pioneer called [Jon Postel][7] and [Joyce K. Reynolds][8]. Among other things, Jon had been the editor of such minor protocol standards as IP (RFC 791), ICMP (RFC 792), and TCP (RFC 793). Some of you may have heard of them.

在那时取得端口号的事情其实说来挺简单的。毕竟当时的因特网（Internet）并不是很大，是因特网爆炸的早期。端口号分配的活儿是 IANA（Internet Assigned Numbers Authority，互联网数字分配机构）干的。在那时这机构可相当于是因特网先驱 [Jon Postel][7] 和 [Joyce K. Reynolds][8] 一般的存在。Jon 参与编写了多项主要的协议标准，例如 IP（RFC 791）、ICMP（RFC 792）和 TCP（RFC 793）等一些你应该早有耳闻的协议。

To me Jon felt outright scary, having authored all the main Internet RFCs!

我可以说是敬畏 Jon 先生的，他参与编写了几乎所有主要的因特网标准文档（Internet RFCs）！

Anyway, just before announcing `ssh-1.0` in July 1995, I sent this e-mail to IANA:

就在我发布 `ssh-1.0` 前，1995年7月，我发送了一封邮件给 INAN：

```
From ylo Mon Jul 10 11:45:48 +0300 1995
From: Tatu Ylonen <ylo@cs.hut.fi>
To: Internet Assigned Numbers Authority <iana@isi.edu>
Subject: request for port number
Organization: Helsinki University of Technology, Finland


From ylo Mon Jul 10 11:45:48 +0300 1995
From: Tatu Ylonen <ylo@cs.hut.fi>
To: Internet Assigned Numbers Authority <iana@isi.edu>
Subject: request for port number
Subject: 请求取得一个端口号
Organization: Helsinki University of Technology, Finland
Organization: 芬兰赫尔辛基理工大学

Dear Sir,
亲爱的先生：

I have written a program to securely log from one machine into another
over an insecure network.  It provides major improvements in security
and functionality over existing telnet and rlogin protocols and
implementations.  In particular, it prevents IP, DNS and routing
spoofing.  My plan is to distribute the software freely on the
Internet and to get it into as wide use as possible.

我写了个可以在不安全的网络环境中安全地从一台机器登录到另一台机器的程序。它主要是
对 telnet 协议以及 rlogin 协议的功能性提升和安全性改进。说的具体些，就是可以
防御 IP、DNS 或路由等欺骗行为。我打算将我的软件免费贡献给因特网并得到广泛地使用。

I would like to get a registered privileged port number for the
software.  The number should preferably be in the range 1-255 so that
it can be used in the WKS field in name servers.

我希望为我的软件注册一个端口号，要是这个端口号在 1 到 255 之间就更好了，这样我就可以在名字
服务器中使用 WKS 域了。

I'll enclose the draft RFC for the protocol below.  The software has
been in local use for several months, and is ready for publication
except for the port number.  If the port number assignment can be
arranged in time, I'd like to publish the software already this week.
I am currently using port number 22 in the beta test.  It would be
great if this number could be used (it is currently shown as
Unassigned in the lists).

我在附件中附上了协议标准的草案。这个软件已经在本地运行了几个月了，我准备在获得端口号后
就发布。如果端口号分配一事安排的及时，我希望这周就将要发布的软件准备好。我目前在 beta 版
测试时使用的端口号是 22，如果要是能够分配到这个端口，我就不用做什么更改了（目前这个端口在
列表中还是空闲的）。

The service name for the software is "ssh" (for Secure Shell).

软件中服务的名称叫 `ssh`（系安全终端的缩写）。

Yours sincerely,

您最真诚的，

Tatu Ylonen <ylo@cs.hut.fi>

... followed by protocol specification for ssh-1.0
... 附件：ssh-1.0 协议标准
```

The next day, I had an e-mail from Joyce waiting in my mailbox:

第二天，我就收到了 Joyce 发来的邮件：

```
Date: Mon, 10 Jul 1995 15:35:33 -0700
From: jkrey@ISI.EDU
To: ylo@cs.hut.fi
Subject: Re: request for port number
Subject: 回复：请求取得一个端口号
Cc: iana@ISI.EDU

Tatu,

We have assigned port number 22 to ssh, with you as the point of
contact.

我们将端口号 22 注册给 ssh 服务了，你目前是该服务的主要联系人。

Joyce
```

There we were! SSH port was 22!!!

这就搞定了！SSH 的端口正式使用 22！！！

On July 12, 1995, at 2:32am, I announced a final beta version to my beta testers at Helsinki University of Technology. At 5:23pm I announced ssh-1.0.0 packages to my beta testers. At 5:51pm on July 12, 1995, I sent an announcement about SSH (Secure Shell) to the `cypherpunks@toad.com` mailing list. I also posted it in a few newsgroups, mailing lists, and directly to selected people who had discussed related topics on the Internet.

1995年7月12日上午2点21分，我给我在赫尔辛基理工大学的试用者们宣布了 SSH 的最后 beta 版本。当日下午5点23分，我给试用者们宣布了 ssh-1.0.0 版本。1995年7月12日下午5点51分，我将一份 SSH（安全终端）的宣告发给了 `cypherpunks@toad.com` 邮件列表，此外我还将其发给了一些新闻团体、邮件列表和一些在因特网上讨论这个事情的人们。

### CHANGING THE SSH PORT IN THE SERVER

### 如何更改 SSH 服务的端口号

By default, the SSH server still runs in port 22\. However, there are occasions when it is run in a different port. Testing use is one reason. Running multiple configurations on the same host is another. Rarely, it may also be run without root privileges, in which case it must be run in a non-privileged port (i.e., port number >= 1024).

SSH 服务器是默认运行在 22 号端口上的。然而，某些原因需要，它也可以运行在别的端口上。方便测试使用是一个原因，在同一个宿主机上运行多个不同的配置也可以是一个原因。当然，极少情况下，不使用 root 权限运行它也可以，比如在某些必须运行在没有权限的端口之上的情况（端口号大于等于 1024）。

The port number can be configured by changing the `Port 22` directive in [/etc/ssh/sshd_config][9]. It can also be specified using the `-p <port>` option to [sshd][10]. The SSH client and [sftp][11] programs also support the `-p <port>` option.

端口号可以在配置文件 [/etc/ssh/sshd_config][9] 中将 `Port 22` 更改。也可以使用 `-p <port>` 选项运行 [sshd][10]。SSH 客户端和 [sftp][11] 程序也可以使用 `-p <port>` 选项。

### CONFIGURING SSH THROUGH FIREWALLS

### 配置 SSH 协议穿过防火墙

SSH is one of the few protocols that are frequently permitted through firewalls. Unrestricted outbound SSH is very common, especially in smaller and more technical organizations. Inbound SSH is usually restricted to one or very few servers.

SSH 是少数经常需要允许穿过防火墙的协议之一。使用 SSH 常见的做法是不限制流量出口，尤其在一些较小的或者比较技术型的组织中，而流量入口通常会限制只有一台或者是少数几台服务器可以访问。

### OUTBOUND SSH

### SSH 的流量出口

Configuring outbound SSH in a firewall is very easy. If there are restrictions on outgoing traffic at all, just create a rule that allows TCP port 22 to go out. That is all. If you want to restrict the destination addresses, you can also limit the rule to only permit access to your organization's external servers in the cloud, or to a [jump server][12] that guards cloud access.

在防火墙中配置 SSH 的流量出口十分简单。如果机器的流量流出存在总限制，只需要创建允许 22 在 TCP 上可以流出的规则即可。如果你想限制目标地址，你可以只让你组织的外部服务器或者 [跳板服务器][12] 有权通过该规则。

### BACK-TUNNELING IS A RISK

### 后门通道是有风险的

Unrestricted outbound SSH can, however, be risky. The SSH protocol supports [tunneling][13]. The basic idea is that it is possible to have the SSH server on an external server listen to connections from anywhere, forward those back into the organization, and then make a connection to some Internal server.

其实不限制 SSH 的流量出口是存在风险，SSH 协议是支持 [通道访问][13] 的。最初的想法是在外部服务器搭建一个 SSH 服务监听来自各处的连接，将进入的连接转发到组织并让这个连接可以访问某个内部服务器。

This can be very convenient in some environments. Developers and system administrators frequently use it to open a tunnel that they can use to gain remote access from their home or from their laptop when they are travelling.

在某些场景下这当然非常的方便。开发者和系统管理员可以频繁的使用它打开一个通道以便于他们可以远程访问，比如在家里或者在旅行中使用笔记本电脑等场景。

However, it generally violates policy, takes control away from firewall administrators and the security team, and it violates policy. It can, for example, violate [PCI][14], [HIPAA][15], or [NIST SP 800-53][16]. It can be used by hackers and foreign intelligence agencies to leave backdoors into organizations.

然而通常来讲这些做法是违背安全策略的，跳过防火墙管理员和安全团队保护的控制无疑是违背安全策略的，比如这些： [PCI][14]、[HIPAA][15]、[NIST SP 800-53][16] 等。

[CryptoAuditor][17] is a product that can control tunneling at a firewall or at the entry point to a group of cloud servers. It works together with [Universal SSH Key Manager][18] to gain access to [host keys][19] and is able to use them to decrypt the SSH sessions at a firewall and block unauthorized forwarding.

[CryptoAuditor][17] 是一款可以控制通道穿过云服务器防火墙或者入口点的产品。在启用防火墙和被阻挡的未授权转发的场景中，配合 [通用 SSH 密钥管理器（Universal SSH Key Manager）][18] 去授权访问 [宿主密钥（host keys）][19] 以解密 SSH 会话。

### INBOUND SSH ACCESS

### SSH 的流量出口访问权

For inbound access, there are a few practical alternatives:

对于流量出口访问权而言，这里有几点需要说一下：

*   Configure firewall to forward all connections to port 22 to a particular IP address on the internal network or [DMZ][1]. Run [CryptoAuditor][2] or a jump server at that IP address to control and audit further access into the organization.
*   Use different ports on the firewall to access different servers.
*   Only allow SSH access after you have logged in using a VPN (Virtual Private Network), typically using the [IPsec][3] protocol.

*   配置防火墙转发所有来自 22 的连接只能流向特定的内部网络 IP 地址或者一个 [DMZ][1] 主机。运用 [CryptoAuditor][2] 或者跳板机控制特定 IP 地址并审查所有访问组织的连接。
*   对不同的服务器访问权，应在防火墙中设置不同的访问端口。
*   只允许使用 VPN（虚拟专用网）连接 SSH 服务，比如 [IPsec][3] 协议。

### ENABLING SSH ACCESS VIA IPTABLES

### 通过 iptables 服务限制 SSH 访问

[Iptables][20] is a host firewall built into the Linux kernel. It is typically configured to protect the server by preventing access to any ports that have not been expressly opened.

[Iptables][20] 是一款内建在 Linux 内核的宿主防火墙。通常配置以用于预防服务器免于匿名尝试访问那些未明确定义为开启的端口。

If `iptables` is enabled on the server, the following commands can be used to permit incoming SSH access. They must be run as root.

当 `iptables` 启用时，使用下面的命令将可以开启流量流入 SSH 服务，当然命令需要以 root 身份运行。

```
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
```

If you want to save the rules permanently, on some systems that can be done with the command:

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
