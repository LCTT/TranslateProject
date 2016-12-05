在Linux中找出所有已连接的主机IP地址
============================================================

你可以在Linux的生态系统中找到很多[网络监控工具][1]，它们可以为你生成出网络中所有的设备以及它们的IP。

然而，有时候你实际只需要一个简单的命令行工具只用一个命令就能提供一些相同的信息。

本篇教程会向你展示如何找出所有连接到给定网络的主机IP地址。这里我们会使用[nmap工具来找出所有][2]连接到相同网络的设备的IP地址

[nmap][3](Network Mapper的简称)是一款开源、强大并且多功能的探查网络的一款工具，用来[执行扫描、网络审查][4]和[查找远程的开放端口][5]等等。

以防你系统中还没有安装nmap，在你的发行版中运行合适的命令来安装它：

```
$ sudo yum install nmap         [在基于RedHat的系统中]
$ sudo dnf install nmap         [在基于Fedora 22+的版本中]
$ sudo apt-get install nmap     [在基于Debian/Ubuntu的系统中]
```

安装完成后，使用的语法是：

```
$ nmap  [scan type...]  options  {target specification}
```

{target specification}这个参数可以用主机名、ip地址、网络等来替代。

所以要列出所有连接到指定网络的主机ip，首先使用[ifconfig命令][6]或者[ip命令][7]来确定网络以及它的子网掩码：

```
$ ifconfig
或者
$ ip addr show
```
[
 ![Find Network Details in Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Find-Network-Details-in-Linux.png) 
][8]

在Linux中查找网络细节

接下来，如下运行nmap命令：

```
$ nmap  -sn  10.42.0.0/24
```
[
 ![Find All Live Hosts on Network](http://www.tecmint.com/wp-content/uploads/2016/11/Find-All-Live-Hosts-on-Network.png) 
][9]

查找网络中所有活跃的主机

上面的命令中：

1. `-sn` - 是扫描的类型，这里是ping方式扫描。默认上，nmap使用端口扫描，但是这里会禁用端口扫描。
2. `10.42.0.0/24` - 是目标网络，用你实际的网络来替换。

要了解全面的信息，查看nmap的手册：

```
$ man nmap
```

或者不带任何参数直接运行nmap查看总结的使用信息：

```
$ nmap
```

额外地，对于有兴趣学习Linux安全扫描技术的人，你可以阅读[Nmap in Kali Linux][10]这篇实践指导。

好了，就是这样了，记得在下面的回复区给我们发送问题或者评论。你也可以跟我们分享其他列出指定网络已连接设备的IP地址的方法。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/find-live-hosts-ip-addresses-on-linux-network/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[2]:http://www.tecmint.com/nmap-network-security-scanner-in-kali-linux/
[3]:http://www.tecmint.com/nmap-command-examples/
[4]:http://www.tecmint.com/audit-network-performance-security-and-troubleshooting-in-linux/
[5]:http://www.tecmint.com/find-open-ports-in-linux/
[6]:http://www.tecmint.com/ifconfig-command-examples/
[7]:http://www.tecmint.com/ip-command-examples/
[8]:http://www.tecmint.com/wp-content/uploads/2016/11/Find-Network-Details-in-Linux.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/11/Find-All-Live-Hosts-on-Network.png
[10]:http://www.tecmint.com/nmap-network-security-scanner-in-kali-linux/
