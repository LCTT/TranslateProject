Linux网络统计工具/命令
================================================================================
我在Linux(基于CentOS 或者 Debian 的发行版)中该如何查看当前网络端口吞吐量的统计信息？在Linux操作系统中如何查看当前内核snmp计数器以及网络端口的统计信息？

![](http://s0.cyberciti.org/images/category/old/networking.png)

你可以使用以下任何一个命令：

### nstat 命令 : 网络统计工具 ###

键入以下命令:

    # nstat

输出样例:

    #kernel
    IpInReceives                    133243             0.0
    IpInDelivers                    133243             0.0
    IpOutRequests                   92904              0.0
    IcmpOutErrors                   97                 0.0
    IcmpOutTimeExcds                97                 0.0
    IcmpMsgOutType3                 97                 0.0
    TcpActiveOpens                  538                0.0
    TcpEstabResets                  56                 0.0
    TcpInSegs                       129837             0.0
    TcpOutSegs                      89720              0.0
    TcpRetransSegs                  42                 0.0
    TcpOutRsts                      704                0.0
    UdpInDatagrams                  3255               0.0
    UdpNoPorts                      97                 0.0
    UdpOutDatagrams                 3270               0.0
    Ip6OutNoRoutes                  206                0.0
    TcpExtTW                        141                0.0
    TcpExtDelayedACKs               508                0.0
    TcpExtDelayedACKLocked          1                  0.0
    TcpExtDelayedACKLost            42                 0.0
    TcpExtTCPHPHits                 117659             0.0
    TcpExtTCPPureAcks               2158               0.0
    TcpExtTCPHPAcks                 605                0.0
    TcpExtTCPSackRecovery           1                  0.0
    TcpExtTCPLossUndo               16                 0.0
    TcpExtTCPSackFailures           4                  0.0
    TcpExtTCPFastRetrans            1                  0.0
    TcpExtTCPSlowStartRetrans       3                  0.0
    TcpExtTCPTimeouts               33                 0.0
    TcpExtTCPDSACKOldSent           40                 0.0
    TcpExtTCPDSACKRecv              5                  0.0
    TcpExtTCPAbortOnData            120                0.0
    TcpExtTCPAbortOnClose           55                 0.0
    TcpExtTCPSackShiftFallback      9                  0.0
    IpExtInOctets                   180131682          0.0
    IpExtOutOctets                  7289106            0.0

### ss 命令 : 查询套接字工具 ###

要查看统计汇总, 输入:

    # ss -s

输出样例:

    Total: 786 (kernel 804)
    TCP:   65 (estab 40, closed 7, orphaned 0, synrecv 0, timewait 6/0), ports 56
    Transport Total     IP        IPv6
    *	  804       -         -
    RAW	  1         1         0
    UDP	  12        9         3
    TCP	  58        52        6
    INET	  71        62        9
    FRAG	  0         0         0

查看[ss 命令教程][1] 获取更多信息。

### netstat 命令 : 不错的显示套接字信息的旧工具 ###

查看所有网络端口以及汇总信息表，输入：

    # netstat -i

输出样例:

    Kernel Interface table
    Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    eth0       1500 0    941022      0      0 0        688165      0      0      0 BMRU
    lo        16436 0      9304      0      0 0          9304      0      0      0 LRU
    ppp0       1496 0      3784      0      0 0          4177      0      0      0 MOPRU

查看每个协议的汇总统计信息，输入：

    # netstat -s

输出样例:

    Ip:
        1092065 total packets received
        0 forwarded
        0 incoming packets discarded
        1091681 incoming packets delivered
        798913 requests sent out
        895 dropped because of missing route
        759 reassemblies required
        375 packets reassembled ok
    Icmp:
        17 ICMP messages received
        0 input ICMP message failed.
        ICMP input histogram:
            timeout in transit: 8
            echo replies: 9
        1747 ICMP messages sent
        0 ICMP messages failed
        ICMP output histogram:
            destination unreachable: 1730
            echo request: 17
    IcmpMsg:
            InType0: 9
            InType11: 8
            OutType3: 1730
            OutType8: 17
    Tcp:
        4822 active connections openings
        1129 passive connection openings
        457 failed connection attempts
        165 connection resets received
        7 connections established
        1062519 segments received
        771394 segments send out
        7158 segments retransmited
        6 bad segments received.
        2578 resets sent
    Udp:
        20846 packets received
        1730 packets to unknown port received.
        0 packet receive errors
        19242 packets sent
    UdpLite:
    TcpExt:
        71 invalid SYN cookies received
        8 resets received for embryonic SYN_RECV sockets
        142 packets pruned from receive queue because of socket buffer overrun
        2109 TCP sockets finished time wait in fast timer
        84 packets rejects in established connections because of timestamp
        19454 delayed acks sent
        6 delayed acks further delayed because of locked socket
        Quick ack mode was activated 7306 times
        1 packets directly queued to recvmsg prequeue.
        1 bytes directly received in process context from prequeue
        823921 packet headers predicted
        24412 acknowledgments not containing data payload received
        10150 predicted acknowledgments
        242 times recovered from packet loss by selective acknowledgements
        33 congestion windows recovered without slow start by DSACK
        335 congestion windows recovered without slow start after partial ack
        336 TCP data loss events
        TCPLostRetransmit: 35
        1 timeouts after reno fast retransmit
        156 timeouts after SACK recovery
        116 timeouts in loss state
        461 fast retransmits
        5 forward retransmits
        608 retransmits in slow start
        2073 other TCP timeouts
        62 SACK retransmits failed
        43074 packets collapsed in receive queue due to low socket buffer
        8499 DSACKs sent for old packets
        101 DSACKs sent for out of order packets
        308 DSACKs received
        9 DSACKs for out of order packets received
        427 connections reset due to unexpected data
        122 connections reset due to early user close
        28 connections aborted due to timeout
        TCPDSACKIgnoredOld: 3
        TCPDSACKIgnoredNoUndo: 60
        TCPSpuriousRTOs: 4
        TCPSackShifted: 282
        TCPSackMerged: 740
        TCPSackShiftFallback: 1017
    IpExt:
        InMcastPkts: 47
        OutMcastPkts: 51
        InBcastPkts: 1
        InOctets: 1341508973
        OutOctets: 72525352
        InMcastOctets: 8649
        OutMcastOctets: 7519
        InBcastOctets: 328

查看 [netstat 命令教程][2] 获取更多信息。

### ip / ifconfig 命令 : 配置或者显示网络端口信息 ###

键入以下命令:

    # ifconfig 

或者

    # /sbin/ifconfig

或者

    # ifconfig eth0

----------

    eth0      Link encap:Ethernet  HWaddr b8:ac:6f:65:31:e5
              inet addr:192.168.1.5  Bcast:192.168.1.255  Mask:255.255.255.0
              inet6 addr: fe80::baac:6fff:fe65:31e5/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:966334 errors:0 dropped:0 overruns:0 frame:0
              TX packets:703297 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:1186255648 (1.1 GiB)  TX bytes:73968238 (70.5 MiB)
              Interrupt:17
    lo        Link encap:Local Loopback
              inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
              UP LOOPBACK RUNNING  MTU:16436  Metric:1
              RX packets:9666 errors:0 dropped:0 overruns:0 frame:0
              TX packets:9666 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0
              RX bytes:1399578 (1.3 MiB)  TX bytes:1399578 (1.3 MiB)
    ppp0      Link encap:Point-to-Point Protocol
              inet addr:10.1.11.70  P-t-P:10.0.31.18  Mask:255.255.255.255
              UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1496  Metric:1
              RX packets:3784 errors:0 dropped:0 overruns:0 frame:0
              TX packets:4177 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:3
              RX bytes:2400265 (2.2 MiB)  TX bytes:275983 (269.5 KiB)

显示网络端口统计信息，输入：

    # ip -s link

输出样例:

    1: lo:  mtu 16436 qdisc noqueue state UNKNOWN
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        RX: bytes  packets  errors  dropped overrun mcast
        1444187    9960     0       0       0       0
        TX: bytes  packets  errors  dropped carrier collsns
        1444187    9960     0       0       0       0
    2: eth0:  mtu 1500 qdisc mq state UP qlen 1000
        link/ether b8:ac:6f:65:31:e5 brd ff:ff:ff:ff:ff:ff
        RX: bytes  packets  errors  dropped overrun mcast
        1221956483 991501   0       0       0       24
        TX: bytes  packets  errors  dropped carrier collsns
        75623937   720272   0       0       0       0
    3: wlan0:  mtu 1500 qdisc noop state DOWN qlen 1000
        link/ether 00:21:6a:ca:9b:10 brd ff:ff:ff:ff:ff:ff
        RX: bytes  packets  errors  dropped overrun mcast
        0          0        0       0       0       0
        TX: bytes  packets  errors  dropped carrier collsns
        0          0        0       0       0       0
    4: pan0:  mtu 1500 qdisc noop state DOWN
        link/ether 4a:c7:5f:0e:8e:d8 brd ff:ff:ff:ff:ff:ff
        RX: bytes  packets  errors  dropped overrun mcast
        0          0        0       0       0       0
        TX: bytes  packets  errors  dropped carrier collsns
        0          0        0       0       0       0
    8: ppp0:  mtu 1496 qdisc pfifo_fast state UNKNOWN qlen 3
        link/ppp
        RX: bytes  packets  errors  dropped overrun mcast
        2419881    3848     0       0       0       0
        TX: bytes  packets  errors  dropped carrier collsns
        284151     4287     0       0       0       0

### sar 命令: 显示网络统计信息 ###

输入以下命令 (你需要 [通过sysstat包安装并启用sar][3]):

sar -n DEV

    Linux 2.6.32-220.2.1.el6.x86_64 (www.cyberciti.biz)    Tuesday 13 March 2012   _x86_64_        (2 CPU)
    12:00:01  CDT     IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
    12:10:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:10:01  CDT      eth0    127.13    121.32     95.45     18.34      0.00      0.00      0.00
    12:10:01  CDT      eth1     98.48    110.62     16.72     96.33      0.00      0.00      0.00
    12:20:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:20:01  CDT      eth0    139.95    133.41    106.30     19.95      0.00      0.00      0.00
    12:20:01  CDT      eth1    110.65    121.85     18.14    107.13      0.00      0.00      0.00
    12:30:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:30:01  CDT      eth0    147.85    132.49    115.78     20.45      0.00      0.00      0.00
    12:30:01  CDT      eth1    111.88    127.39     18.61    117.65      0.00      0.00      0.00
    12:40:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:40:01  CDT      eth0    136.75    124.64    105.24     19.48      0.00      0.00      0.00
    12:40:01  CDT      eth1    101.65    115.32     17.58    104.50      0.00      0.00      0.00
    12:50:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    12:50:01  CDT      eth0    131.45    125.69     96.49     19.58      0.00      0.00      0.00
    12:50:01  CDT      eth1    101.41    111.31     17.54     96.78      0.00      0.00      0.00
    01:00:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:00:01  CDT      eth0    140.30    133.27    102.17     20.75      0.00      0.00      0.00
    01:00:01  CDT      eth1    106.90    119.51     18.53    103.09      0.00      0.00      0.00
    01:10:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:10:01  CDT      eth0    152.03    127.74    125.56     19.85      0.00      0.00      0.00
    01:10:01  CDT      eth1    115.60    134.57     18.73    126.96      0.00      0.00      0.00
    01:20:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:20:01  CDT      eth0    138.55    130.55    103.03     20.20      0.00      0.00      0.00
    ....
    ..
    ....
    ..
    .
    01:00:01  CDT      eth1    156.82    169.48     28.83    138.49      0.00      0.00      0.00
    01:10:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:10:01  CDT      eth0    215.19    194.82    163.11     30.99      0.00      0.00      0.00
    01:10:01  CDT      eth1    162.49    183.79     28.36    163.70      0.00      0.00      0.00
    01:20:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:20:01  CDT      eth0    200.20    192.23    140.64     30.93      0.00      0.00      0.00
    01:20:01  CDT      eth1    153.60    166.96     27.32    140.26      0.00      0.00      0.00
    01:30:01  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:30:01  CDT      eth0    111.98    103.58     79.12     16.52      0.00      0.00      0.48
    01:30:01  CDT      eth1     87.50     95.58     14.74     79.35      0.00      0.00      0.00
    Average:        IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
    Average:           lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    Average:         eth0    211.21    196.20    156.18     31.20      0.00      0.00      0.01
    Average:         eth1    159.10    174.52     28.00    149.95      0.00      0.00      0.00

或者输入以下命令:

    # sar -n DEV 1 3

输出样例:

    Linux 2.6.32-220.2.1.el6.x86_64 (www.cyberciti.biz)    Tuesday 13 March 2012   _x86_64_        (2 CPU)
    01:44:03  CDT     IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
    01:44:04  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:44:04  CDT      eth0    161.70    154.26    105.20     26.63      0.00      0.00      0.00
    01:44:04  CDT      eth1    145.74    142.55     25.11    144.94      0.00      0.00      0.00
    01:44:04  CDT     IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
    01:44:05  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:44:05  CDT      eth0    162.14    156.31    107.46     42.18      0.00      0.00      0.00
    01:44:05  CDT      eth1    135.92    138.83     39.38    104.92      0.00      0.00      0.00
    01:44:05  CDT     IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
    01:44:06  CDT        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:44:06  CDT      eth0    303.92    293.14    272.91     37.40      0.00      0.00      0.00
    01:44:06  CDT      eth1    252.94    290.20     34.87    263.50      0.00      0.00      0.00
    Average:        IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s
    Average:           lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    Average:         eth0    210.37    202.34    163.19     35.66      0.00      0.00      0.00
    Average:         eth1    178.93    191.64     33.36    171.60      0.00      0.00      0.00

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/network-statistics-tools-rhel-centos-debian-linux/

作者：[nixCraft][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.cyberciti.biz/tips/about-us
[1]:https://linux.cn/article-4372-1.html
[2]:https://linux.cn/article-2434-1.html
[3]:http://www.cyberciti.biz/tips/identifying-linux-bottlenecks-sar-graphs-with-ksar.html