Translating by yujianxuechuan,占坑
How to set up Internet connection sharing with iptables on Linux
怎样使用linux的iptables工具进行网络共享
================================================================================
In this tutorial, I'll explain how to share a single Internet connection among multiple devices on Linux. While consumer-grade WiFi routers have become mainstream nowadays, making this problem a non-issue, suppose you don't have one at home. However, say you have a Linux box already assembled with a modem and a LAN card. The modem is connected to the Internet with a dynamic public IP address, and the LAN card connected to your switch/hub. Other devices (Linux/Windows PC, laptop) are connected to the switch without having any Internet connection. To share the Internet connection of the Linux box, you have to turn the box into a gateway, so that it can relay traffic to and from other devices.
在本教程中，我将解释多个设备怎样在linux下共享一个网络连接。目前无线路由器已经成为主流的消费品，从而解决了本文这一问题，假设你家中并没有一台无线路由器。然而，你却有一台已经有"猫"和局lan网卡的的linux主机。"猫"是以动态公有IP地址的模式连接的互联网，主机的lan网卡连接到你的交换机或者集线器。其他设备（如linux或者windows的PC或者笔记本）以网桥的形式连接并无互联网连接。为了共享linux主机的互联网，你必须把主机摄制成网关，于是它才能实现从其他设备中传送和接受信息。
### Glossary of Terms ###
术语字汇
- **Private IP address** (non-routeable address) is an IP address used for a Local Area Network (not visible through Internet).
- **Public IP address** (routeable address) is an IP address that is visible through Internet.
- **IP masquerading** is a function that allows set of machines to reach the Internet via a MASQ gateway. Those machines behind the MASQ gateway is never visible to the Internet. Any outgoing and incoming traffic from and to the machines behind the MASQ gateway must pass through the MASQ gateway.
- **Network Address Translation** (NAT) is a function that can make a private IP address reaches the Internet with the help of IP masquerading.
-私有IP地址（不可到达地址）是一个被用于本地局域网的IP地址（在互联网中不可见）。
-公用IP地址（可到达地址）是一个在互联网中可见的IP地址。
IP伪装是一项允许一系列机器通过MASQ网关连接互联网的功能。这些MASQ网关之外的机器在互联网中是不可见的。MASQ之后的机器中任何流入或流出的数据必须经过MASQ网关。
-网络地址转换（NAT）是一项通过IP伪装技术可以使私有IP地址访问互联网的功能。
### Hardware Requirements ###
硬件要求
- One Linux box with two interfaces (one public IP address and the other private IP address), which will be used as a gateway.
- One or more Linux/Windows PC or laptop with private IP addresses.
- Switch/HUB (optional).
-一台有两个接口（一个公有IP地址和其他的私有IP地址）的linux主机，这个主机将被用作网关。
-一台或者多台拥有私有IP地址的linux/windows系统的PC或者笔记本。
-交换机/集线器（可选）。
### Step-by-Step Guide ###
教程步骤
The following procedure is required on the Linux box (the connection sharing gateway).
接下来的过程需要在linux主机（用于共享的网关）上完成。
#### 1. Activate IP forwarding ####
1、激活IP转发
In order to set up Internet connection sharing, you need to enable IP forwarding on the Linux box with a kernel parameter. Startup kernel parameters stored in /etc/sysctl.conf.
为了设置网络共享，你需要在linux主机上更改一个内核参数来使能IP转发功能。内核启动参数设定在/etc/sysctl.conf文件中。
Open the file, and locate line with the following parameter "# net.ipv4.ip_forward = 0". Remove hash mark (i.e., uncomment it), and set the value to 1. It should look like the following:
打开这个文件，定位到含有"# net.ipv4.ip_forward = 0"的这一行，移除#号（即取消注释），然后将其值设置为1，改好之后应该和下面的一致。
    net.ipv4.ip_forward = 1

You may also activate IP forwaring at run time by the following command:
你还要使激活IP转发功能生效，通过执行下面的命令：
    $ sudo sysctl -w net.ipv4.ip_forward=1
    $ sudo sysctl -p

#### 2. NAT configuration ####
2、NAT配置
Another important part of Internet connection sharing is NAT configuration which can be done using iptables command. iptables maintains four firewall tables:
另一个网络共享的重要部分是NAT配置，这可以通过使用iptables的命令，iptables包含四个防火墙的表格：
- FILTER (the default table)
- NAT
- MANGLE
- RAW
- FILTER (默认表格)
- NAT
- MANGLE
- RAW

In this tutorial we will use only two tables: FILTER and NAT tables.
这个教程中我们将仅使用两个表格：FILTER和NAT表格。
First, flush all active firewall rules.
首先，刷新所有活跃的防火墙的规则。
    $ sudo iptables -X
    $ sudo iptables -F
    $ sudo iptables -t nat -X
    $ sudo iptables -t nat -F

On the INPUT table, you have to set chain FORWARD to ACCEPT target, so all packets passed through the box will be processed correctly.
在输入表格中，你需要设置转发链成可接受的目的地，因此艘游通过主机的数据包将会被正确的处理。
    $ sudo iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    $ sudo iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

On the NAT table, you have to enable IP masquerading for your WAN interface. We assume that the WAN interface is ppp0. To enable IP masquerading on ppp0 interface, you can use the following command:
在NAT表中，你必须为你的WAN口使能IP伪装，我们假设WAN口协议是ppp0。为了在ppp0接口上使能IP伪造技术，我们使用以下的命令：
    $ sudo iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE

#### 3. Configuring a private IP address ####
3、配置私有IP地址
After all configuration is completed on the Linux box, you have to configure the DNS server and default gateway of other devices (Linux/Windows PC, laptop), so that they point to the Linux box. Note that you don't need to set up a DNS server on the Linux box. Every DNS request from other devices are automatically forwarded by the Linux box to your upstream ISP.
在linux主机上的所有配置完成后，你需要配置其他设备（linux/windows的PC或笔记本）的DNS服务器以及默认网关，因此他们的数据流可以指向linux主机。注意你不需要在linux主机上设置一个DNS服务器，从其他设备发出的每一个DNS请求都会通过上游的ISP自动转发到linux主机上。
If you are using Linux on the other devices, you can use the following command to change their default gateway and DNS servers. I assume that you are using 192.168.1.0/24 private IP address segment, and that 192.168.1.1 is the IP address assigned to the Linux box.
如果你的其他设备上用的系统是linux，你可以通过以下命令来更改他们的默认网关和DNS服务器。假设你的网段是192.168.1.0/24的私有IP地址网段，linux主机上绑定的IP地址是192.168.1.1。
    $ sudo ip route del default
    $ sudo ip route add default via 192.168.1.1
    $ sudo sh -c "echo 'nameserver 192.168.1.1' > /etc/resolv.conf"

If you have other Linux devices, you can repeat the command above on other devices.
如果还有其他的linux设备，那么你可以重复以上命令。
If you have a Windows device, you can change the default gateway and the DNS server via network connection properties on the control panel.
如果你有windows设备，你可以通过控制面板的网络连接属性来更改默认网关和DNS服务器。
#### 4. The complete script ####
4、完整的脚本
Here is the complete script which sets up Internet connection sharing on the Linux box. The WAN interface (ppp0) needs to be replaced according to your environment.
这是一个在linux主机上设置网络连接共享的一个完整的脚本。WAN口（ppp0协议）需要根据你具体的网络接口协议来替换。
    $ sudo vi /usr/local/bin/ishare

----------

In this tutorial we will use only two tables: FILTER and NAT tables.

First, flush all active firewall rules.

    $ sudo iptables -X
    $ sudo iptables -F
    $ sudo iptables -t nat -X
    $ sudo iptables -t nat -F

On the INPUT table, you have to set chain FORWARD to ACCEPT target, so all packets passed through the box will be processed correctly.

    $ sudo iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    $ sudo iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

On the NAT table, you have to enable IP masquerading for your WAN interface. We assume that the WAN interface is ppp0. To enable IP masquerading on ppp0 interface, you can use the following command:

    $ sudo iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE

#### 3. Configuring a private IP address ####

After all configuration is completed on the Linux box, you have to configure the DNS server and default gateway of other devices (Linux/Windows PC, laptop), so that they point to the Linux box. Note that you don't need to set up a DNS server on the Linux box. Every DNS request from other devices are automatically forwarded by the Linux box to your upstream ISP.

If you are using Linux on the other devices, you can use the following command to change their default gateway and DNS servers. I assume that you are using 192.168.1.0/24 private IP address segment, and that 192.168.1.1 is the IP address assigned to the Linux box.

    $ sudo ip route del default
    $ sudo ip route add default via 192.168.1.1
    $ sudo sh -c "echo 'nameserver 192.168.1.1' > /etc/resolv.conf"

If you have other Linux devices, you can repeat the command above on other devices.

If you have a Windows device, you can change the default gateway and the DNS server via network connection properties on the control panel.

#### 4. The complete script ####

Here is the complete script which sets up Internet connection sharing on the Linux box. The WAN interface (ppp0) needs to be replaced according to your environment.

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

Save the above script to /usr/local/bin/ishare, and then change the executable bit by the following command.
保存以上的脚本到/usr/local/bin/ishare，然后添加可执行权限通过执行下面的命令。
    $ sudo chmox +x /usr/local/bin/ishare

If you want the script executed every startup, you can register the script to /etc/rc.local. Open /etc/rc.local, before statement "exit 0", add the following line:
如果你需要这个脚本开机启动，你需要在/etc/rc.local文件中注册这个脚本，在文件中的"exit 0"之前添加下面一行。
    /usr/local/bin/ishare

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/internet-connection-sharing-iptables-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
