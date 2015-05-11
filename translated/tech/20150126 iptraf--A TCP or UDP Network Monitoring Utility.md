
iptraf:一个实用的TCP/UDP网络监控工具
================================================================================

[iptraf][1]是一个基于ncurses（ncurses-based)的IP局域网监控器，用来生成包括TCP信息，UDP计数，ICMP和OSPF信息，以太网加载信息，结点状态信息，IP校验和错误等等统计数据。

它基于ncurses的用户界面帮助用户免于记忆繁琐的命令行开关。

### 特征 ###

- 拥有一个IP流量监控器，用来显示你的网络中的流量变化信息。包括TCP标识信息，包以及字节计数，ICMP细节，OSPF包类型。

- 拥有普通和详细的交互统计数据显示了IP，TCP，UDP，ICMP，非IP以及其他的IP包计数，IP校验和错误，交互活动，包尺寸计数。（这里一些专业术语拿不定）

- 拥有一个TCP和UDP服务监控器，能够显示普通TCP和UDP应用端口上发送的和接收的包的数量。

- 拥有一个局域网数据统计模块，能够检查到(discover)处于活动状态的主机，并显示其上正在运行的数据活动的统计信息。

- 拥有TCP，UDP，以及其他协议的显示过滤器（display filters），允许你只查看感兴趣的流量。

- 日志功能。

- 支持以太网，FDDI，ISDN，SLIP，PPP以及loopback接口类型（interface types)。

- 利用Linux内核内置的（built-in）原始套接字接口，允许它（指iptraf）能够用于许多种网卡上（这句话翻译不好）

- 全屏，菜单式驱动的操作。

安装方法

### Ubuntu以及其衍生版本 ###

    sudo apt-get install iptraf

### Arch Linux以及其衍生版本 ###

    sudo pacman -S iptra

### Fedora以及其衍生版本 ###

    sudo yum install iptraf

### 用法 ###


如果不加任何命令行选项地运行**iptraf**命令，程序将进入一种交互模式，通过主菜单可以访问多种设备(various facilities)

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/iptraf_1.png)


简易的上手导航菜单。

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/iptraf_2.png)

为monitor选择界面（接口）？

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/iptraf_3.png)

接口 **pp0** 处的流量。

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/iptraf_4.png)

开始吧！


--------------------------------------------------------------------------------

via: http://www.unixmen.com/iptraf-tcpudp-network-monitoring-utility/

作者：[Enock Seth Nyamador][a]
译者：[DongShuaike](https://github.com/DongShuaike)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/seth/
[1]:http://iptraf.seul.org/about.html
