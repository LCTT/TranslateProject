iptraf：TCP/UDP网络监控工具
================================================================================
[iptraf][1]是一个基于ncurses开发的IP局域网监控工具，它可以生成各种网络统计数据，包括TCP信息、UDP统计、ICMP和OSPF信息、以太网负载信息、节点统计、IP校验和错误和其它一些信息。

它基于ncurses的用户界面也会把使用者从命令行选项的梦靥中拯救出来。

### 功能 ###

- 一个用于显示通过网络的IP流量信息的IP流量监控器，包括TCP标识信息、包和字节统计、ICMP详情、OSPF包类型
- 显示IP、TCP、UDP、ICMP、非IP和其它IP包计数、IP校验和错误、接口活动、包大小计数的综合详细的接口统计数据
- 一个用于计数常用TCP和UDP应用端口的流入和流出包的TCP和UDP服务监控器
- 一个用于发现活动主机和显示这些活动主机的数据活动的局域网统计模块
- TCP、UDP和其它协议的显示过滤器，允许你查看你做感兴趣的流量
- 日志记录
- 支持以太网、FDDI、ISDN、SLIP、PPP和回环接口类型
- 利用Linux内核内建的原生套接口界面，可以用于大范围支持的网卡
- 全屏、菜单驱动操作

###要安装###

**Ubuntu及其衍生版**

    sudo apt-get install iptraf

**Arch Linux及其衍生版**

    sudo pacman -S iptra

**Fedora及其衍生版**

    sudo yum install iptraf

### 用法 ###

如果**iptraf**命令不带任何命令行选项执行，该程序就会以交互模式显现，可以通过主菜单获得各种各样的工具。

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/iptraf_1.png)

易于导航的菜单。

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/iptraf_2.png)

选择监控的接口。

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/iptraf_3.png)

来自**ppp0**接口的流量

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/iptraf_4.png)

希望你喜欢。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/iptraf-tcpudp-network-monitoring-utility/

作者：[Enock Seth Nyamador][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/seth/
[1]:http://iptraf.seul.org/about.html
