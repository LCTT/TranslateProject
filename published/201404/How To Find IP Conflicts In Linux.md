如何在Linux中发现IP地址冲突
================================================================================
你们都知道什么是IP地址，是吧？它们被分配给网络上的设备来代表它们。它们通过DHCP服务器分配并且会经常改变。现在有两种IP地址。动态的一种会经常改变（几天一次），而静态的就如它的名字那样是静态的，意味着它们不会改变。

有时这会引发一些冲突。当一个动态IP被分配了并且有另外一台网络设备已经拥有了相同的IP。或者在相同网络子网上有多台分配IP的DHCP服务器。如果你有连通问题并且假设它是由于IP冲突造成的，那么你可以使用一个工具称作arp-scan来扫描它们。

这个工具会在本地网络发送ARP（Address Resolution Protocol）(地址解析协议)包来收集地址。如果有多个MAC地址声称拥有相同的IP地址，那么这里就存在冲突。

要在Ubuntu或者Debian上安装arp-scan则输入：

    $ sudo apt-get install arp-scan

对于Fedora，CentOS或者RedHat：

    $ sudo yum install arp-scan

要检测IP冲突，运行下面的命令:

    $ sudo arp-scan –I eth0 -l

输出示例：

    192.168.1.10   00:1b:a9:63:a2:4c       BROTHER INDUSTRIES, LTD.
    192.168.1.30   00:1e:8f:58:ec:49       CANON INC.
    192.168.1.33   00:25:4b:1b:10:20       Apple, Inc
    192.168.1.37   10:9a:dd:55:d7:95       Apple Inc
    192.168.1.38   20:c9:d0:27:8d:56       (Unknown)
    192.168.1.39   d4:85:64:4d:35:be       Hewlett Packard
    192.168.1.39   00:0b:46:e4:8e:6d       Cisco (DUP: 2)
    192.168.1.40   90:2b:34:18:59:c0       (Unknown)

在本例中，**192.168.1.39**这个IP冲突了，因为它出现了两次。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/find-ip-conflicts-linux/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
