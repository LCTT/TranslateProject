Linux 中最佳的网络监视工具
===============================

保持对我们的网络的管理，防止任何程序过度使用网络、导致整个系统操作变慢，对管理员来说是至关重要的。对不同的系统操作，这是有几个网络监视工具。在这篇文章中，我们将讨论从 Linux 终端中运行的 10 个网络监视工具。它对不使用 GUI 而希望通过 SSH 来保持对网络管理的用户来说是非常理想的。

### Iftop

 [![iftop network monitoring tool](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/iftop_orig.png)][2] 

与 Linux 用户经常使用的 Top 是非常类似的。这是一个系统监视工具，它允许我们知道在我们的系统中实时运行的进程，并可以很容易地管理它们。Iftop 与 Top 应用程序类似，但它是专门监视网络的，通过它可以知道更多的关于网络的详细情况和使用网络的所有进程。

我们可以从 [这个链接][3] 获取关于这个工具的更多信息以及下载必要的包。

### Vnstat

 [![vnstat network monitoring tool](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/vnstat.png?1511885309)][4] 
 
**Vnstat** 是一个缺省包含在大多数 Linux 发行版中的网络监视工具。它允许我们在一个用户选择的时间周期内获取一个实时管理的发送和接收的流量。

我们可以从 [这个链接][5] 获取关于这个工具的更多信息以及下载必要的包。

### Iptraf

 [![iptraf monitoring tool for linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/iptraf_orig.gif)][6] 
 
**IPTraf** 是一个 Linux 的、基于控制台的、实时网络监视程序。（IP LAN） - 收集经过这个网络的各种各样的信息作为一个 IP 流量监视器，包括 TCP 标志信息、ICMP 详细情况、TCP / UDP 流量故障、TCP 连接包和 Byne 报告。它也收集接口上全部的 TCP、UDP、…… 校验和错误、接口活动等等的详细情况。

我们可以从 [这个链接][7] 获取这个工具的更多信息以及下载必要的包。

### Monitorix - 系统和网络监视

 [![monitorix system monitoring tool for linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/monitorix_orig.png)][8] 

Monitorix 是一个轻量级的免费应用程序，它设计用于去监视尽可能多的 Linux / Unix 服务器的系统和网络资源。一个 HTTP web 服务器可以被添加到它里面，定期去收集系统和网络信息，并且在一个图表中显示它们。它跟踪平均的系统负载、内存分配、磁盘健康状态、系统服务、网络端口、邮件统计信息（Sendmail、Postfix、Dovecot、等等）、MySQL 统计信息以及其它的更多内容。它设计用于去管理系统的整体性能，以及帮助检测故障、瓶颈、异常活动、等等。

下载及更多 [信息在这里][9]。

### Dstat

 [![dstat network monitoring tool](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/dstat_orig.png)][10] 

这个监视器相比前面的几个知名度低一些，但是，在一些发行版中已经缺省包含了。

我们可以从 [这个链接][11] 获取这个工具的更多信息以及下载必要的包。

### Bwm-ng

 [![bwm-ng monitoring tool](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/bwm-ng_orig.png)][12] 

这是最简化的工具中的一个。它允许你去从交互式连接中取得数据，并且，为了便于其它设备使用，在取得数据的同时，能以某些格式导出它们。

我们可以从 [这个链接][13] 获取这个工具的更多信息以及下载必要的包。

### Ibmonitor

 [![ibmonitor tool for linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ibmonitor_orig.jpg)][14] 

与上面的类似，它显示连接接口上过滤后的网络流量，并且，从接收到的流量中明确地区分区开发送流量。

我们可以从 [这个链接][15] 获取这个工具的更多信息以及下载必要的包。
​
### Htop - Linux 进程跟踪

 [![htop linux processes monitoring tool](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/htop_orig.png)][16] 

Htop 是一个更高级的、交互式的、实时的 Linux 进程跟踪工具。它类似于 Linux 的 top 命令，但是有一些更高级的特性，比如，一个更易于使用的进程管理接口、快捷键、水平和垂直的进程视图、等更多特性。Htop 是一个第三方工具，它不包含在 Linux 系统中，你必须使用 **YUM** 或者 **APT-GET** 或者其它的包管理工具去安装它。关于安装它的更多信息，读[这篇文章][17]。

我们可以从 [这个链接][18] 获取这个工具的更多信息以及下载必要的包。 

### Arpwatch - 以太网活动监视器

 [![arpwatch ethernet monitoring tool](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arpwatch_orig.png)][19] 

Arpwatch 是一个设计用于在 Linux 网络中去管理以太网通讯的地址解析的程序。它持续监视以太网通讯并记录 IP 地址和 MAC 地址的变化。在一个网络中，它们的变化同时伴随记录一个时间戳。它也有一个功能是当一对 IP 和 MAC 地址被添加或者发生变化时，发送一封邮件给系统管理员。在一个网络中发生 ARP 攻击时，这个功能非常有用。

我们可以从 [这个链接][20] 获取这个工具的更多信息以及下载必要的包。

### Wireshark - 网络监视工具

 [![wireshark network monitoring tool](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/how-to-use-wireshark_1.jpg?1512299583)][21] 
 
**[Wireshark][1]** 是一个免费的应用程序，它允许你去捕获和查看前往你的系统和从你的系统中返回的信息，它可以去深入到通讯包中并查看每个包的内容 – 分开它们来满足你的特殊需要。它一般用于去研究协议问题和去创建和测试程序的特别情况。这个开源分析器是一个被公认的分析器商业标准，它的流行是因为纪念那些年的荣誉。

最初它被认识是因为 Ethereal，Wireshark 有轻量化的、易于去理解的界面，它能分类显示来自不同的真实系统上的协议信息。

### 结论

​在这篇文章中，我们看了几个开源的网络监视工具。由于我们从这些工具中挑选出来的认为是“最佳的”，并不意味着它们都是最适合你的需要的。例如，现在有很多的开源监视工具，比如，OpenNMS、Cacti、和 Zennos，并且，你需要去从你的个体情况考虑它们的每个工具的优势。

另外，还有不同的、更适合你的需要的不开源的工具。

你知道的或者使用的在 Linux 终端中的更多网络监视工具还有哪些？

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/best-network-monitoring-tools-for-linux

作者：[​​LinuxAndUbuntu][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:https://www.wireshark.org/
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/iftop_orig.png
[3]:http://www.ex-parrot.com/pdw/iftop/
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/vnstat.png
[5]:http://humdi.net/vnstat/
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/iptraf_orig.gif
[7]:http://iptraf.seul.org/
[8]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/monitorix_orig.png
[9]:http://www.monitorix.org
[10]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/dstat_orig.png
[11]:http://dag.wiee.rs/home-made/dstat/
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/bwm-ng_orig.png
[13]:http://sourceforge.net/projects/bwmng/
[14]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ibmonitor_orig.jpg
[15]:http://ibmonitor.sourceforge.net/
[16]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/htop_orig.png
[17]:http://wesharethis.com/knowledgebase/htop-and-atop/
[18]:http://hisham.hm/htop/
[19]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arpwatch_orig.png
[20]:http://linux.softpedia.com/get/System/Monitoring/arpwatch-NG-7612.shtml
[21]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/how-to-use-wireshark_1_orig.jpg


