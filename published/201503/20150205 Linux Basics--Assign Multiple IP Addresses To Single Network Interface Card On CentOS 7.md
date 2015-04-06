在CentOS 7上给一个网卡分配多个IP地址
================================================================================
有时你也许想要给一个网卡多个地址。你该怎么做呢？另外买一个网卡来分配地址？在小型网络中其实不用这么做。我们现在可以在CentOS/RHEL 7中给一个网卡分配多个ip地址。想知道怎么做么？好的，跟随我，这并不难。

首先，让我们找到网卡的IP地址。在我的CentOS 7服务器中，我只使用了一个网卡。

用root特权运行下面的命令：

    ip addr

示例输出：

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 08:00:27:80:63:19 brd ff:ff:ff:ff:ff:ff
        inet 192.168.1.150/24 brd 192.168.1.255 scope global enp0s3
           valid_lft forever preferred_lft forever

如上所见，我的网卡名是enp0s3，ip地址是192.168.1.150。

如你所知，网卡的配置文件存储在 **/etc/sysconfig/network-scripts/** 目录下。每个网卡的详细内容将会以不同的名字存储，比如**ifcfg-enp0s3**。

让我们看下**ifcfg-enp0s3**的细节。

    cat /etc/sysconfig/network-scripts/ifcfg-enp0s3

示例输出：

    TYPE="Ethernet"
    BOOTPROTO="none"
    DEFROUTE="yes"
    IPV4_FAILURE_FATAL="no"
    IPV6INIT="yes"
    IPV6_AUTOCONF="yes"
    IPV6_DEFROUTE="yes"
    IPV6_FAILURE_FATAL="no"
    NAME="enp0s3"
    UUID="e9f9caef-cb9e-4a19-aace-767c6ee6f849"
    ONBOOT="yes"
    HWADDR="08:00:27:80:63:19"
    IPADDR0="192.168.1.150"
    PREFIX0="24"
    GATEWAY0="192.168.1.1"
    DNS1="192.168.1.1"
    IPV6_PEERDNS="yes"
    IPV6_PEERROUTES="yes"

好的，现在我们将在相同的子网中分配多个地址了。

编辑文件 **/etc/sysconfig/network-scripts/ifcfg-enp0s3**：

    vi /etc/sysconfig/network-scripts/ifcfg-enp0s3

像下面那样加入额外的IP地址。

    TYPE="Ethernet"
    BOOTPROTO="none"
    DEFROUTE="yes"
    IPV4_FAILURE_FATAL="no"
    IPV6INIT="yes"
    IPV6_AUTOCONF="yes"
    IPV6_DEFROUTE="yes"
    IPV6_FAILURE_FATAL="no"
    NAME="enp0s3"
    UUID="933cdc9b-b383-4ddd-b219-5a72c69c9cf0"
    ONBOOT="yes"
    HWADDR="08:00:27:3F:AB:68"
    IPADDR0="192.168.1.150"
    IPADDR1="192.168.1.151"
    IPADDR2="192.168.1.152"
    PREFIX0="24"
    GATEWAY0="192.168.1.1"
    DNS1="192.168.1.1"
    IPV6_PEERDNS="yes"
    IPV6_PEERROUTES="yes"

如你所见，我已经加了两个IP地址：**IPADDR1=”192.168.1.151″ & IPADDR2=”192.168.1.152″**

类似地，你可以加入更多的ip地址。

最后，保存并退出文件。重启网络服务来使更改生效。

    systemctl restart network

现在，让我们检查是否已经加入了ip地址。

    ip addr

示例输出：

    : lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 08:00:27:3f:ab:68 brd ff:ff:ff:ff:ff:ff
        inet 192.168.1.150/24 brd 192.168.1.255 scope global enp0s3
           valid_lft forever preferred_lft forever
        inet 192.168.1.151/24 brd 192.168.1.255 scope global secondary enp0s3
           valid_lft forever preferred_lft forever
        inet 192.168.1.152/24 brd 192.168.1.255 scope global secondary enp0s3
           valid_lft forever preferred_lft forever
        inet6 fe80::a00:27ff:fe3f:ab68/64 scope link 
           valid_lft forever preferred_lft forever

如你所见，单个网卡已经有3个ip地址了。

让我们ping一下新增的IP地址：

    ping -c 4 192.168.1.151

示例输出：

    PING 192.168.1.151 (192.168.1.151) 56(84) bytes of data.
    64 bytes from 192.168.1.151: icmp_seq=1 ttl=64 time=0.048 ms
    64 bytes from 192.168.1.151: icmp_seq=2 ttl=64 time=0.075 ms
    64 bytes from 192.168.1.151: icmp_seq=3 ttl=64 time=0.077 ms
    64 bytes from 192.168.1.151: icmp_seq=4 ttl=64 time=0.077 ms
    
    --- 192.168.1.151 ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 2999ms
    rtt min/avg/max/mdev = 0.048/0.069/0.077/0.013 ms

----------

    ping -c 4 192.168.1.152

示例输出：

    PING 192.168.1.152 (192.168.1.152) 56(84) bytes of data.
    64 bytes from 192.168.1.152: icmp_seq=1 ttl=64 time=0.034 ms
    64 bytes from 192.168.1.152: icmp_seq=2 ttl=64 time=0.075 ms
    64 bytes from 192.168.1.152: icmp_seq=3 ttl=64 time=0.073 ms
    64 bytes from 192.168.1.152: icmp_seq=4 ttl=64 time=0.075 ms
    
    --- 192.168.1.152 ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 2999ms
    rtt min/avg/max/mdev = 0.034/0.064/0.075/0.018 ms

如果你想要使用**不同的子网**，你要改变**PREFIX0=24**成不同的子网，比如 **PREFIX1=16**。

比如，我想要添加一个A类地址（**比如10.0.0.1*）到我的网卡中。

    TYPE="Ethernet"
    BOOTPROTO="none"
    DEFROUTE="yes"
    IPV4_FAILURE_FATAL="no"
    IPV6INIT="yes"
    IPV6_AUTOCONF="yes"
    IPV6_DEFROUTE="yes"
    IPV6_FAILURE_FATAL="no"
    NAME="enp0s3"
    UUID="933cdc9b-b383-4ddd-b219-5a72c69c9cf0"
    ONBOOT="yes"
    HWADDR="08:00:27:3F:AB:68"
    IPADDR0="192.168.1.150"
    IPADDR1="192.168.1.151"
    IPADDR2="192.168.1.152"
    IPADDR3="10.0.0.1"
    PREFIX0="24"
    PREFIX1=16
    GATEWAY0="192.168.1.1"
    DNS1="192.168.1.1"
    IPV6_PEERDNS="yes"
    IPV6_PEERROUTES="yes"

你可以看到我已经添加一个A类地址(10.0.0.1)并且前缀是16。

保存并退出文件。重启网络服务，接着，ping新增的地址：

    ping -c 4 10.0.0.1

示例输出：

    PING 10.0.0.1 (10.0.0.1) 56(84) bytes of data.
    64 bytes from 10.0.0.1: icmp_seq=1 ttl=64 time=0.097 ms
    64 bytes from 10.0.0.1: icmp_seq=2 ttl=64 time=0.073 ms
    64 bytes from 10.0.0.1: icmp_seq=3 ttl=64 time=0.074 ms
    64 bytes from 10.0.0.1: icmp_seq=4 ttl=64 time=0.075 ms
    
    --- 10.0.0.1 ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 3000ms
    rtt min/avg/max/mdev = 0.073/0.079/0.097/0.014 ms

相似地，你可以添加不同的网关。

就是这样。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linux-basics-assign-multiple-ip-addresses-single-network-interface-card-centos-7/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
