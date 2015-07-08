如何在 Linux 上用 IP转发使内部网络连接到互联网
================================================================================

大家好，今天我们学习一下在 Linux 上用 iptables 实现从一个网络接口到另一个接口的IP转发（数据包转发）。IP转发的概念是，使 Linux 机器像路由器一样将数据从一个网络发送到另一个网络。所以，它能作为一个**路由器**或者代理服务器，实现将一个连接的互联网或者网络连接共享给多个客户端机器。

这是一些启用IP转发或网络包转发方法的简单步骤。

### 1. 启用 IPv4 转发 ###

首先，我们需要在我们的 Linux 操作系统上启用 IPv4 转发。要做到这点，我们需要用 sudo 模式在 shell 或终端下执行下面的命令。

    $ sudo -s

    # echo 1 > /proc/sys/net/ipv4/ip_forward

![临时IP转发](http://blog.linoxide.com/wp-content/uploads/2015/03/ip-forward-temporary.png)

**注意：上面的命令能马上启用ip转发，但只是临时的，直到下一次重启。要永久启用，我们需要使用我们惯用的文本编辑器打开 /etc/sysctl.conf 文件。**

    # nano /etc/sysctl.conf

然后，增加 **net.ipv4.ip_forward = 1** 到文件中，或者删除那行的注释，保存并退出文件。

    net.ipv4.ip_forward = 1

![编辑 Sysctl](http://blog.linoxide.com/wp-content/uploads/2015/03/sysctl-edit.png)

运行下面的命令启用更改。

    # sysctl -p /etc/sysctl.conf

![启用 Sysctl 更改](http://blog.linoxide.com/wp-content/uploads/2015/03/enabling-changes-sysctl.png)

### 2. 配置 Iptables 防火墙 ###

我们需要允许特定的(或者所有的)数据包通过我们的路由器。在这之前，我们要知道连接我们 Linux 的网络设备的接口名称。我们可以通过在终端或者 shell 运行以下命令获得接口名称。

    # ifconfig -a

![Ifconfig](http://blog.linoxide.com/wp-content/uploads/2015/03/ifconfig.png)

这里，在我们的机器中， eth2 是连接到互联网或者网络的网卡接口， wlan2 是我们要使用 iptables 从 eth2 转发数据包的接口。要实现转发，我们需要运行以下命令。

    # iptables -A FORWARD -i wlan2 -o eth2 -j ACCEPT

注意：请用你 Linux 机器中的可用设备名称替换 wlan2 和 eth2。

现在，由于netfilter/iptables是一个无状态的防火墙，我们需要让 iptables 允许已建立的连接通过。要做到这点，我们要运行下面的命令。

    # iptables -A FORWARD -i eth2 -o wlan2 -m state --state ESTABLISHED,RELATED  -j ACCEPT

![用 iptables 转发](http://blog.linoxide.com/wp-content/uploads/2015/03/forwarding-iptables.png)

### 3. 配置 NAT ###

然后，最后我们需要通过执行下面的命令修改发送到互联网的数据包的源地址为 eth2。

    # iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE

![配置 nat](http://blog.linoxide.com/wp-content/uploads/2015/03/configuring-nat.png)

### 总结 ###

最后，我们在我们以 iptables 作为防火墙 Linux 机器上成功的配置了从一个接口到另一个接口的数据包转发。这篇文章教给你将你的私有接口连接到互联网，不需要桥接接口，而是将从一个接口进来的数据包路由到另一个接口。就是这些，如果你有任何问题、建议、反馈，请写到下面的评论框中，然后我们可以改进或更新我们的内容。非常感谢！享受吧 :-) 

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/ip-forwarding-connecting-private-interface-internet/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/