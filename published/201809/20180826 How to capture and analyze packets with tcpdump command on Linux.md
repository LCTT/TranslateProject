如何在 Linux 上使用 tcpdump 命令捕获和分析数据包
======

`tcpdump` 是一个有名的命令行**数据包分析**工具。我们可以使用 `tcpdump` 命令捕获实时 TCP/IP 数据包，这些数据包也可以保存到文件中。之后这些捕获的数据包可以通过 `tcpdump` 命令进行分析。`tcpdump` 命令在网络层面进行故障排除时变得非常方便。

![](https://www.linuxtechi.com/wp-content/uploads/2018/08/tcpdump-command-examples-linux.jpg)

`tcpdump` 在大多数 Linux 发行版中都能用，对于基于 Debian 的Linux，可以使用 `apt` 命令安装它。

```
# apt install tcpdump -y
```

在基于 RPM 的 Linux 操作系统上，可以使用下面的 `yum` 命令安装 `tcpdump`。

```
# yum install tcpdump -y
```

当我们在没用任何选项的情况下运行 `tcpdump` 命令时，它将捕获所有接口的数据包。因此，要停止或取消 `tcpdump` 命令，请键入 `ctrl+c`。在本教程中，我们将使用不同的实例来讨论如何捕获和分析数据包。

### 示例：1）从特定接口捕获数据包

当我们在没用任何选项的情况下运行 `tcpdump` 命令时，它将捕获所有接口上的数据包，因此，要从特定接口捕获数据包，请使用选项 `-i`，后跟接口名称。

语法：

```
# tcpdump -i {接口名}
```

假设我想从接口 `enp0s3` 捕获数据包。

输出将如下所示，

```
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
06:43:22.905890 IP compute-0-1.example.com.ssh > 169.144.0.1.39374: Flags [P.], seq 21952160:21952540, ack 13537, win 291, options [nop,nop,TS val 26164373 ecr 6580205], length 380
06:43:22.906045 IP compute-0-1.example.com.ssh > 169.144.0.1.39374: Flags [P.], seq 21952540:21952760, ack 13537, win 291, options [nop,nop,TS val 26164373 ecr 6580205], length 220
06:43:22.906150 IP compute-0-1.example.com.ssh > 169.144.0.1.39374: Flags [P.], seq 21952760:21952980, ack 13537, win 291, options [nop,nop,TS val 26164373 ecr 6580205], length 220
06:43:22.906291 IP 169.144.0.1.39374 > compute-0-1.example.com.ssh: Flags [.], ack 21952980, win 13094, options [nop,nop,TS val 6580205 ecr 26164373], length 0
06:43:22.906303 IP 169.144.0.1.39374 > compute-0-1.example.com.ssh: Flags [P.], seq 13537:13609, ack 21952980, win 13094, options [nop,nop,TS val 6580205 ecr 26164373], length 72
06:43:22.906322 IP compute-0-1.example.com.ssh > 169.144.0.1.39374: Flags [P.], seq 21952980:21953200, ack 13537, win 291, options [nop,nop,TS val 26164373 ecr 6580205], length 220
^C
109930 packets captured
110065 packets received by filter
133 packets dropped by kernel
[[email protected] ~]#

```

### 示例：2）从特定接口捕获特定数量数据包

假设我们想从特定接口（如 `enp0s3`）捕获 12 个数据包，这可以使用选项 `-c {数量} -I {接口名称}` 轻松实现。

```
root@compute-0-1 ~]# tcpdump -c 12 -i enp0s3
```

上面的命令将生成如下所示的输出，

[![N-Number-Packsets-tcpdump-interface][1]][2]

### 示例：3）显示 tcpdump 的所有可用接口

使用 `-D` 选项显示 `tcpdump` 命令的所有可用接口，

```
[root@compute-0-1 ~]# tcpdump -D
1.enp0s3
2.enp0s8
3.ovs-system
4.br-int
5.br-tun
6.nflog (Linux netfilter log (NFLOG) interface)
7.nfqueue (Linux netfilter queue (NFQUEUE) interface)
8.usbmon1 (USB bus number 1)
9.usbmon2 (USB bus number 2)
10.qbra692e993-28
11.qvoa692e993-28
12.qvba692e993-28
13.tapa692e993-28
14.vxlan_sys_4789
15.any (Pseudo-device that captures on all interfaces)
16.lo [Loopback]
[[email protected] ~]#
```

我正在我的一个 openstack 计算节点上运行 `tcpdump` 命令，这就是为什么在输出中你会看到数字接口、标签接口、网桥和 vxlan 接口

### 示例：4）捕获带有可读时间戳的数据包（`-tttt` 选项）

默认情况下，在 `tcpdump` 命令输出中，不显示可读性好的时间戳，如果您想将可读性好的时间戳与每个捕获的数据包相关联，那么使用 `-tttt` 选项，示例如下所示，

```
[[email protected] ~]# tcpdump -c 8 -tttt -i enp0s3
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
2018-08-25 23:23:36.954883 IP compute-0-1.example.com.ssh > 169.144.0.1.39406: Flags [P.], seq 1449206247:1449206435, ack 3062020950, win 291, options [nop,nop,TS val 86178422 ecr 21583714], length 188
2018-08-25 23:23:36.955046 IP 169.144.0.1.39406 > compute-0-1.example.com.ssh: Flags [.], ack 188, win 13585, options [nop,nop,TS val 21583717 ecr 86178422], length 0
2018-08-25 23:23:37.140097 IP controller0.example.com.amqp > compute-0-1.example.com.57818: Flags [P.], seq 814607956:814607964, ack 2387094506, win 252, options [nop,nop,TS val 86172228 ecr 86176695], length 8
2018-08-25 23:23:37.140175 IP compute-0-1.example.com.57818 > controller0.example.com.amqp: Flags [.], ack 8, win 237, options [nop,nop,TS val 86178607 ecr 86172228], length 0
2018-08-25 23:23:37.355238 IP compute-0-1.example.com.57836 > controller0.example.com.amqp: Flags [P.], seq 1080415080:1080417400, ack 1690909362, win 237, options [nop,nop,TS val 86178822 ecr 86163054], length 2320
2018-08-25 23:23:37.357119 IP controller0.example.com.amqp > compute-0-1.example.com.57836: Flags [.], ack 2320, win 1432, options [nop,nop,TS val 86172448 ecr 86178822], length 0
2018-08-25 23:23:37.357545 IP controller0.example.com.amqp > compute-0-1.example.com.57836: Flags [P.], seq 1:22, ack 2320, win 1432, options [nop,nop,TS val 86172449 ecr 86178822], length 21
2018-08-25 23:23:37.357572 IP compute-0-1.example.com.57836 > controller0.example.com.amqp: Flags [.], ack 22, win 237, options [nop,nop,TS val 86178825 ecr 86172449], length 0
8 packets captured
134 packets received by filter
69 packets dropped by kernel
[[email protected] ~]#
```

### 示例：5）捕获数据包并将其保存到文件（`-w` 选项）

使用 `tcpdump` 命令中的 `-w` 选项将捕获的 TCP/IP 数据包保存到一个文件中，以便我们可以在将来分析这些数据包以供进一步分析。

语法：

```
# tcpdump -w 文件名.pcap -i {接口名}
```

注意：文件扩展名必须为 `.pcap`。

假设我要把 `enp0s3` 接口捕获到的包保存到文件名为 `enp0s3-26082018.pcap`。

```
[root@compute-0-1 ~]# tcpdump -w enp0s3-26082018.pcap -i enp0s3
```

上述命令将生成如下所示的输出，

```
[root@compute-0-1  ~]# tcpdump -w enp0s3-26082018.pcap -i enp0s3
tcpdump: listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
^C841 packets captured
845 packets received by filter
0 packets dropped by kernel
[root@compute-0-1  ~]# ls
anaconda-ks.cfg enp0s3-26082018.pcap
[root@compute-0-1  ~]#
```

捕获并保存大小**大于 N 字节**的数据包。

```
[root@compute-0-1  ~]# tcpdump -w enp0s3-26082018-2.pcap greater 1024
```

捕获并保存大小**小于 N 字节**的数据包。

```
[root@compute-0-1  ~]# tcpdump -w enp0s3-26082018-3.pcap less 1024
```

### 示例：6）从保存的文件中读取数据包（`-r` 选项）

在上面的例子中，我们已经将捕获的数据包保存到文件中，我们可以使用选项 `-r` 从文件中读取这些数据包，例子如下所示，

```
[root@compute-0-1 ~]# tcpdump -r enp0s3-26082018.pcap
```

用可读性高的时间戳读取包内容，

```
[root@compute-0-1  ~]# tcpdump -tttt -r enp0s3-26082018.pcap
reading from file enp0s3-26082018.pcap, link-type EN10MB (Ethernet)
2018-08-25 22:03:17.249648 IP compute-0-1.example.com.ssh > 169.144.0.1.39406: Flags [P.], seq 1426167803:1426167927, ack 3061962134, win 291, options
[nop,nop,TS val 81358717 ecr 20378789], length 124
2018-08-25 22:03:17.249840 IP 169.144.0.1.39406 > compute-0-1.example.com.ssh: Flags [.], ack 124, win 564, options [nop,nop,TS val 20378791 ecr 81358
717], length 0
2018-08-25 22:03:17.454559 IP controller0.example.com.amqp > compute-0-1.example.com.57836: Flags [.], ack 1079416895, win 1432, options [nop,nop,TS v
al 81352560 ecr 81353913], length 0
2018-08-25 22:03:17.454642 IP compute-0-1.example.com.57836 > controller0.example.com.amqp: Flags [.], ack 1, win 237, options [nop,nop,TS val 8135892
2 ecr 81317504], length 0
2018-08-25 22:03:17.646945 IP compute-0-1.example.com.57788 > controller0.example.com.amqp: Flags [.], seq 106760587:106762035, ack 688390730, win 237
, options [nop,nop,TS val 81359114 ecr 81350901], length 1448
2018-08-25 22:03:17.647043 IP compute-0-1.example.com.57788 > controller0.example.com.amqp: Flags [P.], seq 1448:1956, ack 1, win 237, options [nop,no
p,TS val 81359114 ecr 81350901], length 508
2018-08-25 22:03:17.647502 IP controller0.example.com.amqp > compute-0-1.example.com.57788: Flags [.], ack 1956, win 1432, options [nop,nop,TS val 813
52753 ecr 81359114], length 0
.........................................................................................................................
```

### 示例：7）仅捕获特定接口上的 IP 地址数据包（`-n` 选项）

使用 `tcpdump` 命令中的 `-n` 选项，我们能只捕获特定接口上的 IP 地址数据包，示例如下所示，

```
[root@compute-0-1 ~]# tcpdump -n -i enp0s3
```

上述命令输出如下，

```
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
22:22:28.537904 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 1433301395:1433301583, ack 3061976250, win 291, options [nop,nop,TS val 82510005 ecr 20666610], length 188
22:22:28.538173 IP 169.144.0.1.39406 > 169.144.0.20.ssh: Flags [.], ack 188, win 9086, options [nop,nop,TS val 20666613 ecr 82510005], length 0
22:22:28.538573 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 188:552, ack 1, win 291, options [nop,nop,TS val 82510006 ecr 20666613], length 364
22:22:28.538736 IP 169.144.0.1.39406 > 169.144.0.20.ssh: Flags [.], ack 552, win 9086, options [nop,nop,TS val 20666613 ecr 82510006], length 0
22:22:28.538874 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 552:892, ack 1, win 291, options [nop,nop,TS val 82510006 ecr 20666613], length 340
22:22:28.539042 IP 169.144.0.1.39406 > 169.144.0.20.ssh: Flags [.], ack 892, win 9086, options [nop,nop,TS val 20666613 ecr 82510006], length 0
22:22:28.539178 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 892:1232, ack 1, win 291, options [nop,nop,TS val 82510006 ecr 20666613], length 340
22:22:28.539282 IP 169.144.0.1.39406 > 169.144.0.20.ssh: Flags [.], ack 1232, win 9086, options [nop,nop,TS val 20666614 ecr 82510006], length 0
22:22:28.539479 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 1232:1572, ack 1, win 291, options [nop,nop,TS val 82510006 ecr 20666614], length 340
22:22:28.539595 IP 169.144.0.1.39406 > 169.144.0.20.ssh: Flags [.], ack 1572, win 9086, options [nop,nop,TS val 20666614 ecr 82510006], length 0
22:22:28.539760 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 1572:1912, ack 1, win 291, options [nop,nop,TS val 82510007 ecr 20666614], length 340
.........................................................................
```

您还可以使用 `tcpdump` 命令中的 `-c` 和 `-N` 选项捕获 N 个 IP 地址包，

```
[root@compute-0-1  ~]# tcpdump -c 25 -n -i enp0s3
```


### 示例：8）仅捕获特定接口上的 TCP 数据包

在 `tcpdump` 命令中，我们能使用 `tcp` 选项来只捕获 TCP 数据包，

```
[root@compute-0-1  ~]# tcpdump -i enp0s3 tcp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
22:36:54.521053 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 1433336467:1433336655, ack 3061986618, win 291, options [nop,nop,TS val 83375988 ecr 20883106], length 188
22:36:54.521474 IP 169.144.0.1.39406 > 169.144.0.20.ssh: Flags [.], ack 188, win 9086, options [nop,nop,TS val 20883109 ecr 83375988], length 0
22:36:54.522214 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 188:552, ack 1, win 291, options [nop,nop,TS val 83375989 ecr 20883109], length 364
22:36:54.522508 IP 169.144.0.1.39406 > 169.144.0.20.ssh: Flags [.], ack 552, win 9086, options [nop,nop,TS val 20883109 ecr 83375989], length 0
22:36:54.522867 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 552:892, ack 1, win 291, options [nop,nop,TS val 83375990 ecr 20883109], length 340
22:36:54.523006 IP 169.144.0.1.39406 > 169.144.0.20.ssh: Flags [.], ack 892, win 9086, options [nop,nop,TS val 20883109 ecr 83375990], length 0
22:36:54.523304 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 892:1232, ack 1, win 291, options [nop,nop,TS val 83375990 ecr 20883109], length 340
22:36:54.523461 IP 169.144.0.1.39406 > 169.144.0.20.ssh: Flags [.], ack 1232, win 9086, options [nop,nop,TS val 20883110 ecr 83375990], length 0
22:36:54.523604 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 1232:1572, ack 1, win 291, options [nop,nop,TS val 83375991 ecr 20883110], length 340
...................................................................................................................................................
```

### 示例：9）从特定接口上的特定端口捕获数据包

使用 `tcpdump` 命令，我们可以从特定接口 `enp0s3` 上的特定端口（例如 22）捕获数据包。

语法：

```
# tcpdump -i {interface-name} port {Port_Number}
```
```
[root@compute-0-1  ~]# tcpdump -i enp0s3 port 22
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
22:54:45.032412 IP compute-0-1.example.com.ssh > 169.144.0.1.39406: Flags [P.], seq 1435010787:1435010975, ack 3061993834, win 291, options [nop,nop,TS val 84446499 ecr 21150734], length 188
22:54:45.032631 IP 169.144.0.1.39406 > compute-0-1.example.com.ssh: Flags [.], ack 188, win 9131, options [nop,nop,TS val 21150737 ecr 84446499], length 0
22:54:55.037926 IP compute-0-1.example.com.ssh > 169.144.0.1.39406: Flags [P.], seq 188:576, ack 1, win 291, options [nop,nop,TS val 84456505 ecr 21150737], length 388
22:54:55.038106 IP 169.144.0.1.39406 > compute-0-1.example.com.ssh: Flags [.], ack 576, win 9154, options [nop,nop,TS val 21153238 ecr 84456505], length 0
22:54:55.038286 IP compute-0-1.example.com.ssh > 169.144.0.1.39406: Flags [P.], seq 576:940, ack 1, win 291, options [nop,nop,TS val 84456505 ecr 21153238], length 364
22:54:55.038564 IP 169.144.0.1.39406 > compute-0-1.example.com.ssh: Flags [.], ack 940, win 9177, options [nop,nop,TS val 21153238 ecr 84456505], length 0
22:54:55.038708 IP compute-0-1.example.com.ssh > 169.144.0.1.39406: Flags [P.], seq 940:1304, ack 1, win 291, options [nop,nop,TS val 84456506 ecr 21153238], length 364
............................................................................................................................
```


### 示例：10）在特定接口上捕获来自特定来源 IP 的数据包

在 `tcpdump` 命令中，使用 `src` 关键字后跟 IP 地址，我们可以捕获来自特定来源 IP 的数据包，

语法：

```
# tcpdump -n -i {接口名} src {IP 地址}
```

例子如下，

```
[root@compute-0-1  ~]# tcpdump -n -i enp0s3 src 169.144.0.10
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
23:03:45.912733 IP 169.144.0.10.amqp > 169.144.0.20.57800: Flags [.], ack 526623844, win 243, options [nop,nop,TS val 84981008 ecr 84982372], length 0
23:03:46.136757 IP 169.144.0.10.amqp > 169.144.0.20.57796: Flags [.], ack 2535995970, win 252, options [nop,nop,TS val 84981232 ecr 84982596], length 0
23:03:46.153398 IP 169.144.0.10.amqp > 169.144.0.20.57798: Flags [.], ack 3623063621, win 243, options [nop,nop,TS val 84981248 ecr 84982612], length 0
23:03:46.361160 IP 169.144.0.10.amqp > 169.144.0.20.57802: Flags [.], ack 2140263945, win 252, options [nop,nop,TS val 84981456 ecr 84982821], length 0
23:03:46.376926 IP 169.144.0.10.amqp > 169.144.0.20.57808: Flags [.], ack 175946224, win 252, options [nop,nop,TS val 84981472 ecr 84982836], length 0
23:03:46.505242 IP 169.144.0.10.amqp > 169.144.0.20.57810: Flags [.], ack 1016089556, win 252, options [nop,nop,TS val 84981600 ecr 84982965], length 0
23:03:46.616994 IP 169.144.0.10.amqp > 169.144.0.20.57812: Flags [.], ack 832263835, win 252, options [nop,nop,TS val 84981712 ecr 84983076], length 0
23:03:46.809344 IP 169.144.0.10.amqp > 169.144.0.20.57814: Flags [.], ack 2781799939, win 252, options [nop,nop,TS val 84981904 ecr 84983268], length 0
23:03:46.809485 IP 169.144.0.10.amqp > 169.144.0.20.57816: Flags [.], ack 1662816815, win 252, options [nop,nop,TS val 84981904 ecr 84983268], length 0
23:03:47.033301 IP 169.144.0.10.amqp > 169.144.0.20.57818: Flags [.], ack 2387094362, win 252, options [nop,nop,TS val 84982128 ecr 84983492], length 0
^C
10 packets captured
12 packets received by filter
0 packets dropped by kernel
```

### 示例：11）在特定接口上捕获来自特定目的 IP 的数据包

语法：

```
# tcpdump -n -i {接口名} dst {IP 地址}
```

```
[root@compute-0-1  ~]# tcpdump -n -i enp0s3 dst 169.144.0.1
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
23:10:43.520967 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 1439564171:1439564359, ack 3062005550, win 291, options [nop,nop,TS val 85404988 ecr 21390356], length 188
23:10:43.521441 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 188:408, ack 1, win 291, options [nop,nop,TS val 85404988 ecr 21390359], length 220
23:10:43.521719 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 408:604, ack 1, win 291, options [nop,nop,TS val 85404989 ecr 21390359], length 196
23:10:43.521993 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 604:800, ack 1, win 291, options [nop,nop,TS val 85404989 ecr 21390359], length 196
23:10:43.522157 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 800:996, ack 1, win 291, options [nop,nop,TS val 85404989 ecr 21390359], length 196
23:10:43.522346 IP 169.144.0.20.ssh > 169.144.0.1.39406: Flags [P.], seq 996:1192, ack 1, win 291, options [nop,nop,TS val 85404989 ecr 21390359], length 196
.........................................................................................
```

### 示例：12）捕获两台主机之间的 TCP 数据包通信

假设我想捕获两台主机 169.144.0.1 和 169.144.0.20 之间的 TCP 数据包，示例如下所示，

```
[root@compute-0-1  ~]# tcpdump -w two-host-tcp-comm.pcap -i enp0s3 tcp and \(host 169.144.0.1 or host 169.144.0.20\)
```

使用 `tcpdump` 命令只捕获两台主机之间的 SSH 数据包流，

```
[root@compute-0-1  ~]# tcpdump -w ssh-comm-two-hosts.pcap -i enp0s3 src 169.144.0.1 and port 22 and dst 169.144.0.20 and port 22
```

### 示例：13）捕获两台主机之间（来回）的 UDP 网络数据包

语法：

```
# tcpdump -w -s -i udp and \(host and host \)
```

```
[root@compute-0-1  ~]# tcpdump -w two-host-comm.pcap -s 1000 -i enp0s3 udp and \(host 169.144.0.10 and host 169.144.0.20\)
```

### 示例：14）捕获十六进制和 ASCII 格式的数据包

使用 `tcpdump` 命令，我们可以以 ASCII 和十六进制格式捕获 TCP/IP 数据包，

要使用 `-A` 选项捕获 ASCII 格式的数据包，示例如下所示:

```
[root@compute-0-1  ~]# tcpdump -c 10 -A -i enp0s3
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
00:37:10.520060 IP compute-0-1.example.com.ssh > 169.144.0.1.39406: Flags [P.], seq 1452637331:1452637519, ack 3062125586, win 333, options [nop,nop,TS val 90591987 ecr 22687106], length 188
E...[root@compute-0-1 @...............V.|...T....MT......
.fR..Z-....b.:..Z5...{.'p....]."}...Z..9.?......."root@compute-0-1 <.....V..C.....{,...OKP.2.*...`..-sS..1S...........:.O[.....{G..%ze.Pn.T..N.... ....qB..5...n.....`...:=...[..0....k.....S.:..5!.9..G....!-..'..
00:37:10.520319 IP 169.144.0.1.39406 > compute-0-1.example.com.ssh: Flags [.], ack 188, win 13930, options [nop,nop,TS val 22687109 ecr 90591987], length 0
root@compute-0-1 @.|+..............T.V.}O..6j.d.....
.Z-..fR.
00:37:11.687543 IP controller0.example.com.amqp > compute-0-1.example.com.57800: Flags [.], ack 526624548, win 243, options [nop,nop,TS val 90586768 ecr 90588146], length 0
root@compute-0-1 @.!L...
.....(..g....c.$...........
.f>..fC.
00:37:11.687612 IP compute-0-1.example.com.57800 > controller0.example.com.amqp: Flags [.], ack 1, win 237, options [nop,nop,TS val 90593155 ecr 90551716], length 0
root@compute-0-1 @..........
...(.c.$g.......Se.....
.fW..e..
..................................................................................................................................................
```

要同时以十六进制和 ASCII 格式捕获数据包，请使用 `-XX` 选项。

```
[root@compute-0-1  ~]# tcpdump -c 10 -XX -i enp0s3
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes
00:39:15.124363 IP compute-0-1.example.com.ssh > 169.144.0.1.39406: Flags [P.], seq 1452640859:1452641047, ack 3062126346, win 333, options [nop,nop,TS val 90716591 ecr 22718257], length 188
0x0000: 0a00 2700 0000 0800 27f4 f935 0800 4510 ..'.....'..5..E.
0x0010: 00f0 5bc6 4000 4006 8afc a990 0014 a990 ..[root@compute-0-1 @.........
0x0020: 0001 0016 99ee 5695 8a5b b684 570a 8018 ......V..[..W...
0x0030: 014d 5418 0000 0101 080a 0568 39af 015a .MT........h9..Z
0x0040: a731 adb7 58b6 1a0f 2006 df67 c9b6 4479 .1..X......g..Dy
0x0050: 19fd 2c3d 2042 3313 35b9 a160 fa87 d42c ..,=.B3.5..`...,
0x0060: 89a9 3d7d dfbf 980d 2596 4f2a 99ba c92a ..=}....%.O*...*
0x0070: 3e1e 7bf7 3af2 a5cc ee4f 10bc 7dfc 630d >.{.:....O..}.c.
0x0080: 898a 0e16 6825 56c7 b683 1de4 3526 ff04 ....h%V.....5&..
0x0090: 68d1 4f7d babd 27ba 84ae c5d3 750b 01bd h.O}..'.....u...
0x00a0: 9c43 e10a 33a6 8df2 a9f0 c052 c7ed 2ff5 .C..3......R../.
0x00b0: bfb1 ce84 edfc c141 6dad fa19 0702 62a7 .......Am.....b.
0x00c0: 306c db6b 2eea 824e eea5 acd7 f92e 6de3 0l.k...N......m.
0x00d0: 85d0 222d f8bf 9051 2c37 93c8 506d 5cb5 .."-...Q,7..Pm\.
0x00e0: 3b4a 2a80 d027 49f2 c996 d2d9 a9eb c1c4 ;J*..'I.........
0x00f0: 7719 c615 8486 d84c e42d 0ba3 698c w......L.-..i.
00:39:15.124648 IP 169.144.0.1.39406 > compute-0-1.example.com.ssh: Flags [.], ack 188, win 13971, options [nop,nop,TS val 22718260 ecr 90716591], length 0
0x0000: 0800 27f4 f935 0a00 2700 0000 0800 4510 ..'..5..'.....E.
0x0010: 0034 6b70 4000 4006 7c0e a990 0001 a990 root@compute-0-1 @.|.......
0x0020: 0014 99ee 0016 b684 570a 5695 8b17 8010 ........W.V.....
0x0030: 3693 7c0e 0000 0101 080a 015a a734 0568 6.|........Z.4.h
0x0040: 39af
.......................................................................
```

这就是本文的全部内容，我希望您能了解如何使用 `tcpdump` 命令捕获和分析 TCP/IP 数据包。请分享你的反馈和评论。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/capture-analyze-packets-tcpdump-command-linux/

作者：[Pradeep Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ypingcn](https://github.com/ypingcn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
[1]: https://www.linuxtechi.com/wp-content/uploads/2018/08/N-Number-Packsets-tcpdump-interface-1024x422.jpg
[2]: https://www.linuxtechi.com/wp-content/uploads/2018/08/N-Number-Packsets-tcpdump-interface.jpg
