CentOS 7最小化安装后找不到‘ifconfig’命令——修复小提示
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/08/centos7-790x493.jpg)

就像我们所知道的，“**ifconfig**”命令用于配置GNU/Linux系统的网络接口。它显示网络接口卡的详细信息，包括IP地址，MAC地址，以及网络接口卡状态之类。但是，该命令已经过时了，而且在最小化版本的RHEL 7以及它的克隆版本CentOS 7，Oracle Linux 7和Scientific Linux 7中也找不到该命令。  

### 在CentOS最小化服务器版本中如何查找网卡IP和其它详细信息？ ###

CentOS 7最小化系统，使用“**ip addr**”和“**ip link**”命令来查找网卡详情。要知道统计数据，可以使用“**ip -s link**”。

要查看网卡细节，输入以下命令：

    ip addr

输出样例：

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: venet0: <BROADCAST,POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN 
        link/void 
        inet 127.0.0.1/32 scope host venet0
        inet 192.168.1.101/32 brd 192.168.1.101 scope global venet0:0

要查看网络接口统计数据，输入命令： 

    ip link

输出样例：

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    2: venet0: <BROADCAST,POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/void

或者

    ip -s link

输出样例：

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        RX: bytes  packets  errors  dropped overrun mcast   
        0          0        0       0       0       0      
        TX: bytes  packets  errors  dropped carrier collsns 
        0          0        0       0       0       0      
    2: venet0: <BROADCAST,POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/void 
        RX: bytes  packets  errors  dropped overrun mcast   
        8515667    6667     0       0       0       0      
        TX: bytes  packets  errors  dropped carrier collsns 
        300403     4249     0       0       0       0

### 在CentOS 7最小化服务器版本中如何启用并使用“ifconfig”命令？ ###

如果你不知道在哪里可以找到ifconfig命令，请按照以下简单的步骤来找到它。首先，让我们找出哪个包提供了ifconfig命令。要完成这项任务，输入以下命令：

    yum provides ifconfig

输出样例：

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.aol.in
     * extras: centos.aol.in
     * updates: centos.aol.in
    net-tools-2.0-0.17.20131004git.el7.x86_64 : Basic networking tools
    Repo        : @base
    Matched from:
    Filename    : /usr/sbin/ifconfig

或者你也可以使用以下命令。

    yum whatprovides ifconfig

这里，“provides”或者“whatprovides”开关用于找出某个包提供了某些功能或文件。

就像你在上面的输出中所看到的，**net-tools**包提供了ifconfig命令。因此，让我们安装net-tools包来使用ifconfig命令。

    yum install net-tools

现在，你就可以像以往一样使用**ifconfig**命令了。

    ifconfig -a

输出样例：

    lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 16436
            inet 127.0.0.1  netmask 255.0.0.0
            inet6 ::1  prefixlen 128  scopeid 0x10<host>
            loop  txqueuelen 0  (Local Loopback)
            RX packets 0  bytes 0 (0.0 B)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 0  bytes 0 (0.0 B)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
    
    venet0: flags=211<UP,BROADCAST,POINTOPOINT,RUNNING,NOARP>  mtu 1500
            inet 127.0.0.1  netmask 255.255.255.255  broadcast 0.0.0.0  destination 127.0.0.1
            unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 0  (UNSPEC)
            RX packets 7073  bytes 8549159 (8.1 MiB)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 4611  bytes 359201 (350.7 KiB)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
    
    venet0:0: flags=211<UP,BROADCAST,POINTOPOINT,RUNNING,NOARP>  mtu 1500
            inet 192.168.1.101  netmask 255.255.255.255  broadcast 192.168.1.101  destination 192.168.1.101
            unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 0  (UNSPEC)

尽情享受吧！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/ifconfig-command-found-centos-7-minimal-installation-quick-tip-fix/

作者：[Senthilkumar][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
