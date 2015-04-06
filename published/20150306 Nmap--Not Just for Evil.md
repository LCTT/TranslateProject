Nmap--不是只能用于做坏事！
================================================================================
如果SSH是系统管理员世界的"瑞士军刀"的话，那么Nmap就是一盒炸药。炸药很容易被误用然后将你的双脚崩掉，但是也是一个很有威力的工具，能够胜任一些看似无法完成的任务。

大多数人想到Nmap时，他们想到的是扫描服务器，查找开放端口来实施攻击。然而，在过去的这些年中，这样的超能力在当你管理服务器或计算机遇到问题时也是非常的有用。无论是你试图找出在你的网络上有哪些类型的服务器使用了指定的IP地址，或者尝试锁定一个新的NAS设备，以及扫描网络等，都会非常有用。

下图显示了我的QNAP NAS的网络扫描结果。我使用该设备的唯一目的是为了NFS和SMB文件共享，但是你可以看到，它包含了一大堆大开大敞的端口。如果没有Nmap，很难发现机器到底在运行着什么玩意儿。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1002061/11825nmapf1.jpg)

*网络扫描*

另外一个可能你没想到的用途是用它来扫描一个网络。你甚至根本不需要root的访问权限，而且你也可以非常容易地来指定你想要扫描的网络地址块，例如输入：

    nmap 192.168.1.0/24

上述命令会扫描我的局域网中全部的254个可用的IP地址，让我可以知道那个是可以Ping的，以及那些端口是开放的。如果你刚刚在网络上添加一个新的硬件，但是不知道它通过DHCP获取的IP地址是什么，那么此时Nmap就是无价之宝。例如，上述命令在我的网络中揭示了这个问题：

    Nmap scan report for TIVO-8480001903CCDDB.brainofshawn.com (192.168.1.220)
    Host is up (0.0083s latency).
    Not shown: 995 filtered ports
    PORT     STATE  SERVICE
    80/tcp   open   http
    443/tcp  open   https
    2190/tcp open   tivoconnect
    2191/tcp open   tvbus
    9080/tcp closed glrpc

它不仅显示了新的Tivo 设备，而且还告诉我那些端口是开放的。由于它的可靠性、可用性以及“黑边帽子”的能力，Nmap获得了本月的 <<编辑推荐>>奖。这不是一个新的程序，但是如果你是一个linux用户的话，你应该玩玩它。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/nmap%E2%80%94not-just-evil

作者：[Shawn Powers][a]
译者：[theo-l](https://github.com/theo-l)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/shawn-powers
