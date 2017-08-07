用 NMAP 探测操作系统
============================

有时，能够知道一个网络里的机器的操作系统（OS）是有一定好处的。当你知道一台机器的操作系统后，因为你可以在网上搜索专门针对该系统的安全漏洞，所以入侵系统也会更加容易。当然，安全漏洞通常都会很快被修补，但安全漏洞存在时你需要知道。

对你自己的网络进行扫描以便发现操作系统类型可以帮助你了解黑客将如何侵入你的网络。

### 操作系统探测数据库

NAMP 带有一个数据库，它在你安装 NAMP 的时候就会被安装。这个数据库用于操作系统的探测，但是它不会自动更新。

这个数据库位于 `/usr/share/nmap/nmap-os-db`。进行更新的最简单方式是首先找到数据库的版本号，用文本编辑器打开这个文件，版本号通常位于第二行。我的数据库的第二行是 `# $Id: nmap-os-db 35407 2015-11-10 04:26:26Z dmiller $`，即这个文件的数据库版本是 35407。

要在网上查找一个可更新版本，可以浏览 https://svn.nmap.org/nmap，如图 1 所示：

![Figure 01.jpg](https://www.linux.org/attachments/figure-01-jpg.699/)

*图 1*

你可以从图中看到版本号为 36736，与我的系统上的版本号相比，这个版本号似乎是一个更新的版本。为了对更新的操作系统进行准确的操作系统探测，当然需要对这个数据库进行更新。

保留较旧的数据库版本也是一个不错的主意。我当前和版本是 35407，我将在终端执行下面的命令：

```
sudo mv /usr/share/nmap/nmap-os-db /usr/share/nmap/nmap-os-db-35407
```

这个数据库被以包含版本号的方式重命名了，下一步就是从网站上下载新版本的数据库，在终端执行下面命令：

```
cd /usr/share/nmap
sudo su
wget   https://svn.nmap.org/nmap/nmap-os-db
```

新的数据库即将开始被下载，但是你应该加上版本号，就像你在图 1 中看到的版本号 36736。使用文本编辑器打开这个数据库，然后在第二行加上版本号。当版本号变化后，你可以更新你的数据库，然后在其中加入版本号，以便在再次检查更新时做好准备。

### 系统探测过程

在我们开始使用实际的命令并执行系统探测之前，我们应该详细介绍扫描过程中将会发生的事情。

会执行五种不同的测试，每种测试由一个或者多个数据包组成，目标系统对每个数据包作出的响应有助于确定操作系统的类型。

五种不同的测试是：

1.  序列生成（Sequence Generation）
2.  ICMP 回显
3.  TCP 显式拥塞通知（Explicit Congestion Notification）
4.  TCP
5.  UDP

现在让我们分别看看他们各自在做什么。

**序列生成**

序列生成测试由六个数据包组成，这六个包是每隔 100 毫秒分开发送的，且都是 TCP SYN 包。

每个 TCP SYN 包的结果将有助于 NMAP 确定操作系统的类型。

**ICMP 回显**

两个有着不同设置的 ICMP 请求包被送到目标系统，由此产生的反应将有助于实现验证操作系统类型。

**TCP 显式拥塞通知（Explicit Congestion Notification）**

当生成许多包通过路由器时会导致其负载变大，这称之为拥塞。其结果就是系统会变慢以降低拥堵，以便路由器不会发生丢包。

这个包仅为了得到目标系统的响应而发送。因为不同的操作系统以不同的方式处理这个包，所以返回的特定值可以用来判断操作系统。

**TCP**

在这个测试中会发送六个数据包。

一些带有特定的包设置的包被发送用来到打开的或关闭的端口。结果也将会因为操作系统的不同而不同。

所有 TCP 包都是以如下不同的标志被发送：

1.  无标志
2.  SYN、FIN、URG 和 PSH
3.  ACK
4.  SYN
5.  ACK
6.  FIN、PSH 和 URG

**UDP**

这个测试由一个被发送给一个关闭的端口的数据包组成。

如果目标系统上的这个端口是关闭的，而且返回一条 ICMP 端口不可达的信息，那么就说明没有防火墙。

### NMAP 操作系统检测命令

现在我们开始实际动手进行系统探测。如果你已经读过一些我写的关于 NMAP 的文章，那么最好不要执行 PING 操作。为了跳过 PING，我们使用参数 `Pn`。为了看到详细的信息，你应该使用 `-v` 参数用于动态显示。为了获取系统的信息，需要使用 `-O` 参数。

为了使命令顺利运行和执行 TCP SYN 扫描，你需要以管理员的身份来执行这个命令。在我的例子中，我将只在一个系统上而不是整个网络上进行扫描，使用的命令是：

```
sudo nmap -v -Pn -O 192.168.0.63
```

扫描的结果如图2所示，扫描显示七个开放的端口。

![Figure 02.jpg](https://www.linux.org/attachments/figure-02-jpg.700/)

*图 2*

开放的端口是：

1.  21/tcp ftp
2.  22/tcp ssh
3.  111/tcp rpcbind
4.  139/tcp netbios-ssn
5.  445/tcp microsoft-ds
6.  2049/tcp nfs
7.  54045/tcp unknown

系统的 MAC 地址为为：`00:1E:4F:9F:DF:7F`。

后面部分显示系统类型为：

```
Device type: general purpose
Running: Linux 3.X|4.X
OS CPE: cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kernel:4
OS details: Linux 3.2 - 4.6
Uptime guess: 0.324 days (since Sun Apr 23 08:43:32 2017)
```

系统当前运行的是 Ubuntu Server 16.04，Linux 内核为 4.8，运行时间猜的较准确。

我在另一个系统了又进行了一次测试，结果如图3所示：

![Figure 03.jpg](https://www.linux.org/attachments/figure-03-jpg.701/)

*图 3*

这次扫描中开放的端口与上次不同。所猜的系统为 ‘Microsoft Windows 2000|XP’，实际上是 Windows XP sp3。

### 端口嗅探结果

让我们来看看图 2 所示的第一次扫描中在后台发生了什么。

首先 NMAP 执行一次 TCP 隐秘扫描，在本次系统探测实例中以一个如图 4 所示的数据包 2032 开始。

![Figure 04.jpg](https://www.linux.org/attachments/figure-04-jpg.702/)

*图 4*

序列生成（Sequence Generation）开始于数据包 2032/2033，第六个数据包是 2047/2048。注意每个都被发送两次，且每隔 100ms 发送下一个数据包。

发送的 ICMP 数据包是 2050 - 2053，2 个数据包重复一遍，实际上是 4 个数据包。

2056-2057 是 TCP 显式拥塞通知数据包。

对 TCP 的 6 个测试是 2059、2060、2061、2063、2065、2067。

最后的 UDP 测试是 2073。

这些就是用于确定目标系统上操作系统的类型的测试。

我希望这将有助于你理解如何更新 NMAP 系统探测数据库和执行对系统的扫描。请注意，你可以和你不在同一个网络中的系统进行扫描，所以可以对互联网上的任何系统进行扫描。

--------------------------------------------------------------------------------

via: https://www.linux.org/threads/nmap-os-detection.4564/

作者：[Jarret B][a]
译者：[zhousiyu325](https://github.com/zhousiyu325)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.org/members/jarret-b.29858/
[1]:https://svn.nmap.org/nmap
[2]:https://svn.nmap.org/nmap/nmap-os-db