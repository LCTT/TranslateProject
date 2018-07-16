怎样使用linux的iptables工具进行网络共享
================================================================================

在本教程中，我将解释多个设备怎样在linux下共享一个网络连接。目前无线路由器已经成为主流的消费品，从而解决了本文这一问题。这里假设你家中并没有一台无线路由器，不过，你却有一台已经有"猫"和有线网卡的的linux主机。"猫"是以动态公有IP地址的模式连接到互联网，主机的网卡连接到你的交换机或者集线器。其他设备（如linux或者windows的PC或者笔记本）以网桥的形式连接，并且没有连接到互联网。为了共享linux主机的互联网，你必须把主机转换成网关，以便它能实现从其他设备中传送和接受信息。

### 术语字汇 ###


- **私有IP地址**（路由不可达地址）是一个被用于本地局域网的IP地址（在互联网中不可见）。
- **公用IP地址**（路由可达地址）是一个在互联网中可见的IP地址。
- **IP伪装**是一项允许一系列机器通过MASQ网关连接互联网的功能。这些MASQ网关之外的机器在互联网中是不可见的。MASQ之后的机器中任何流入或流出的数据必须经过MASQ网关。
- **网络地址转换**（NAT）是一项通过IP伪装技术可以使私有IP地址访问互联网的功能。

### Hardware Requirements ###

硬件要求

- 一台有两个接口（一个公有IP地址和其他的私有IP地址）的linux主机，这个主机将被用作网关。
- 一台或者多台拥有私有IP地址的linux/windows系统的PC或者笔记本。
- 交换机/集线器（可选）。

### 教程步骤 ###

接下来的过程需要在linux主机（用于共享的网关）上完成。

#### 1、激活IP转发 ####

为了设置网络共享，你需要在linux主机上更改一个内核参数来使能IP转发功能。内核启动参数设定在/etc/sysctl.conf文件中。

打开这个文件，定位到含有"# net.ipv4.ip_forward = 0"的这一行，移除#号（即取消注释），然后将其值设置为1，改好之后应该和下面的一致。

    net.ipv4.ip_forward = 1

你还要使激活IP转发功能生效，通过执行下面的命令：

    $ sudo sysctl -w net.ipv4.ip_forward=1
    $ sudo sysctl -p

#### 2、NAT配置 ####

另一个网络共享的重要部分是NAT配置，这可以通过使用iptables的命令，iptables包含四个防火墙的规则表：

- FILTER (默认表格)
- NAT
- MANGLE
- RAW

这个教程中我们将仅使用两个表格：FILTER和NAT表格。

首先，刷新所有活跃的防火墙的规则。

    $ sudo iptables -X
    $ sudo iptables -F
    $ sudo iptables -t nat -X
    $ sudo iptables -t nat -F


在输入表格中，你需要设置转发链（FORWARD）成可接受的（ACCEPT）目的地，因此所有通过主机的数据包将会被正确的处理。

    $ sudo iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    $ sudo iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT


在NAT表中，你必须为你的WAN口启用IP伪装功能，我们假设WAN口协议是ppp0。为了在ppp0接口上使能IP伪造技术，我们使用以下的命令：

    $ sudo iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE

#### 3、配置私有IP地址 ####

在linux主机上的所有配置完成后，你需要配置其他设备（linux/windows的PC或笔记本）的DNS服务器以及默认网关，让它们的数据流可以指向linux主机。注意你不需要在linux主机上设置一个DNS服务器，从其他设备发出的每一个DNS请求都会通过上游的ISP自动转发到linux主机上。

如果你的其他设备上用的系统是linux，你可以通过以下命令来更改他们的默认网关和DNS服务器。假设你的网段是192.168.1.0/24的私有IP地址网段，linux主机上绑定的IP地址是192.168.1.1。

    $ sudo ip route del default
    $ sudo ip route add default via 192.168.1.1
    $ sudo sh -c "echo 'nameserver 192.168.1.1' > /etc/resolv.conf"

如果还有其他的linux设备，那么你可以重复以上命令。

如果你有windows设备，你可以通过控制面板的网络连接属性来更改默认网关和DNS服务器。

#### 4、完整的脚本 ####

这是一个在linux主机上设置网络连接共享的一个完整的脚本。WAN口（ppp0协议）需要根据你具体的网络接口协议来替换。

    $ sudo vi /usr/local/bin/ishare

----------

    #!/bin/bash
    
    ## Internet connection shating script
    
    sysctl -w net.ipv4.ip_forward=1
    sysctl -p
    iptables -X
    iptables -F
    iptables -t nat -X
    iptables -t nat -F
    iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    iptables -I FORWARD  -m state --state RELATED,ESTABLISHED -j ACCEPT
    iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE

保存以上的脚本到/usr/local/bin/ishare，然后添加可执行权限通过执行下面的命令。

    $ sudo chmox +x /usr/local/bin/ishare

如果你需要这个脚本开机启动，你需要在/etc/rc.local文件中执行这个脚本，并在该文件中的"exit 0"之前添加下面一行。

    /usr/local/bin/ishare

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/internet-connection-sharing-iptables-linux.html

译者：[yujianxuechuan](https://github.com/yujianxuechuan) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
