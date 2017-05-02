如何在 CentOS、RHEL 和 Fedora 上安装 DHCP 服务
============================================================

DHCP（Dynamic Host Configuration Protocol）是一个网络协议，它使得服务器能从预定义的 IP 池中为网络中的客户端节点自动分配 IP 地址并提供其它相关的网络配置参数。

这意味着每次客户端节点启动（连接到网络）的时候，它都会获得一个和从不改变的“静态” IP 地址相反的“动态” IP 地址。DHCP 服务器给 DHCP 客户端分配 IP 地址称为“租约”，租约时间随客户端需要的连接时间或 DHCP 的配置而异。

在这篇指南中，我们会介绍如何在 CentOS/RHEL 和 Fedora 发行版中安装和配置 DHCP 服务。

### 设置测试环境

本次安装中我们使用如下的测试环境：

- DHCP 服务器 - CentOS 7
- DHCP 客户端 - Fedora 25 和 Ubuntu 16.04

### DHCP 如何工作？

在进入下一步之前，让我们首先了解一下 DHCP 的工作流程：

*	当已连接到网络的客户端计算机（配置为使用 DHCP）启动时，它会发送一个 `DHCPDISCOVER` 消息到 DHCP 服务器。
*	当 DHCP 服务器接收到 `DHCPDISCOVER` 请求消息时，它会回复一个 `DHCPOFFER` 消息。
*	客户端收到 `DHCPOFFER` 消息后，它再发送给服务器一个 `DHCPREQUEST` 消息，表示客户端已准备好获取 `DHCPOFFER` 消息中提供的网络配置。
*	最后，DHCP 服务器收到客户端的 `DHCPREQUEST` 消息，并回复 `DHCPACK` 消息，表示允许客户端使用分配给它的 IP 地址。

### 第一步：在 CentOS 上安装 DHCP 服务

1、安装 DHCP 服务非常简单，只需要运行下面的命令即可。

```
$ yum -y install dhcp
```

重要：假如系统中有多个网卡，但你想只在其中一个网卡上启用 DHCP 服务，可以按照下面的步骤在该网卡上启用 DHCP 服务。

2、 打开文件 `/etc/sysconfig/dhcpd`，将指定网卡的名称添加到 `DHCPDARGS` 列表，假如网卡名称为 `eth0`，则添加：

```
DHCPDARGS=eth0
```

保存文件并退出 。

### 第二步：在 CentOS 上配置 DHCP 服务

3、 对于初学者来说，配置 DHCP 服务的第一步是创建 `dhcpd.conf` 配置文件，DHCP 主要配置文件一般是 `/etc/dhcp/dhcpd.conf`（默认情况下该文件为空），该文件保存了发送给客户端的所有网络信息。

但是，有一个样例配置文件 `/usr/share/doc/dhcp*/dhcpd.conf.sample`，这是配置 DHCP 服务的良好开始。

DHCP 配置文件中定义了两种类型的语句：

*	参数 - 说明如何执行任务、是否执行任务、或者给 DHCP 客户端发送什么网络配置选项。
*	声明 - 指定网络拓扑、定义客户端、提供客户端地址、或将一组参数应用于一组声明。

因此，首先复制示例配置文件为主配置文件：

```
$ cp /usr/share/doc/dhcp-4.2.5/dhcpd.conf.example /etc/dhcp/dhcpd.conf 
```

4、 然后，打开主配置文件并定义你的 DHCP 服务选项：

```
$ vi /etc/dhcp/dhcpd.conf 
```

首先在文件开头设置以下应用于全部子网的全局参数（注意要使用你实际场景中的值）：

```
option domain-name "tecmint.lan";
option domain-name-servers ns1.tecmint.lan, ns2.tecmint.lan;
default-lease-time 3600; 
max-lease-time 7200;
authoritative;
```

5、 然后，定义一个子网；在这个事例中，我们会为 `192.168.56.0/24` 局域网配置 DHCP（注意使用你实际场景中的值）：

```
subnet 192.168.56.0 netmask 255.255.255.0 {
option routers                  192.168.56.1;
option subnet-mask              255.255.255.0;
option domain-search            "tecmint.lan";
option domain-name-servers      192.168.56.1;
range   192.168.56.10   192.168.56.100;
range   192.168.56.120  192.168.56.200;
}
```

### 第三步：为 DHCP 客户端分配静态 IP

只需要在 `/etc/dhcp/dhcpd.conf` 文件中定义下面的部分，其中你必须显式指定它的 MAC 地址和打算分配的 IP，你就可以为网络中指定的客户端计算机分配一个静态 IP 地址：

```
host ubuntu-node {
hardware  ethernet 00:f0:m4:6y:89:0g;
fixed-address 192.168.56.105;
}
host fedora-node {
hardware  ethernet 00:4g:8h:13:8h:3a;
fixed-address 192.168.56.110;
}
```

保存文件并关闭。

注意：你可以使用下面的命令找到 Linux 的 MAC 地址。

```
$ ifconfig -a eth0 | grep HWaddr
```

6、 现在，使用下面的命令启动 DHCP 服务，并使在下次系统启动时自动启动：

```
---------- On CentOS/RHEL 7 ---------- 
$ systemctl start dhcpd
$ systemctl enable dhcpd
---------- On CentOS/RHEL 6 ----------
$ service dhcpd start
$ chkconfig dhcpd on
```

7、 另外，别忘了使用下面的命令允许 DHCP 服务通过防火墙（DHCPD 守护进程通过 UDP 监听67号端口）： 

```
---------- On CentOS/RHEL 7 ----------
$ firewall-cmd --add-service=dhcp --permanent 
$ firewall-cmd --reload 
---------- On CentOS/RHEL 6 ----------
$ iptables -A INPUT -p tcp -m state --state NEW --dport 67 -j ACCEPT
$ service iptables save
```

### 第四步：配置 DHCP 客户端

8、 现在，你可以为网络中的客户端配置自动从 DHCP 服务器中获取 IP 地址。登录到客户端机器并按照下面的方式修改以太网接口的配置文件（注意网卡的名称和编号）：

```
# vi /etc/sysconfig/network-scripts/ifcfg-eth0
```

添加下面的选项：

```
DEVICE=eth0
BOOTPROTO=dhcp
TYPE=Ethernet
ONBOOT=yes
```

保存文件并退出。

9、 你也可以在桌面服务器中按照下面的截图（Ubuntu 16.04桌面版）通过 GUI 设置 `Method` 为 `Automatic (DHCP)`。

[
 ![Set DHCP in Client Network](http://www.tecmint.com/wp-content/uploads/2017/03/Set-DHCP-in-Client-Network.png) 
][3]

*在客户端网络中设置 DHCP*

10、 按照下面的命令重启网络服务（你也可以通过重启系统）：

```
---------- On CentOS/RHEL 7 ----------
$ systemctl restart network
---------- On CentOS/RHEL 6 ----------
$ service network restart
```

到了这里，如果所有设置都是正确的，你的客户端就应该能自动从 DHCP 服务器中获取 IP 地址。

你也可以阅读：

1.	[如何在 Debian Linux 中安装和配置 Multihomed ISC DHCP 服务][1]
2.	[配置网络的10个有用的 “IP” 命令][2]

在这篇文章中我们为你展示了如何在 RHEL/CentOS 中安装 DHCP 服务。在下面的评论框中给我们反馈吧。在接下来的文章中，我们还会为你展示如何在 Debian/Ubuntu 中安装 DHCP 服务。和 TecMint 保持联系。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S 的爱好者，即将推出的 Linux SysAdmin 网络开发人员，目前也是 TecMint 的内容创作者，他喜欢和电脑一起工作，并且坚信共享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-dhcp-server-in-centos-rhel-fedora/

作者：[Aaron Kili][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/install-and-configure-multihomed-isc-dhcp-server-on-debian-linux/
[2]:http://www.tecmint.com/ip-command-examples/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Set-DHCP-in-Client-Network.png
[4]:http://www.tecmint.com/author/aaronkili/
[5]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[6]:http://www.tecmint.com/free-linux-shell-scripting-books/
