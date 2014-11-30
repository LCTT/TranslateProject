iproute2 对决 net-tools 
================================================================================

如今很多系统管理员依然通过组合使用诸如ifconfig、route、arp和netstat等命令行工具（统称为net-tools）来配置网络功能，解决网络故障。net-tools起源于BSD的TCP/IP工具箱，后来成为老版本Linux内核中配置网络功能的工具。**但自2001年起，Linux社区已经对其停止维护。**同时，一些Linux发行版比如Arch Linux和CentOS/RHEL 7则已经完全抛弃了net-tools，只支持iproute2。

作为网络配置工具的一份子，iproute2的出现旨在从功能上取代net-tools。net-tools通过procfs(/proc)和ioctl系统调用去访问和改变内核网络配置，而iproute2则通过netlink套接字接口与内核通讯。抛开性能而言，iproute2的用户接口比net-tools显得更加直观。比如，各种网络资源（如link、IP地址、路由和隧道等）均使用合适的对象抽象去定义，使得用户可使用一致的语法去管理不同的对象。更重要的是，到目前为止，iproute2仍处在[持续开发][1]中。

如果你仍在使用net-tools，而且尤其需要跟上新版Linux内核中的最新最重要的网络特性的话，那么是时候转到iproute2的阵营了。原因就在于使用iproute2可以做很多net-tools无法做到的事情。

对于那些想要转到使用iproute2的用户，有必要了解下面有关net-tools和iproute2的众多对比。

### 显示所有已连接的网络接口 ###

下面的命令显示出所有可用网络接口的列表（无论接口是否激活）。

使用**net-tools**：

    $ ifconfig -a 

使用**iproute2**：

    $ ip link show 

![](https://farm4.staticflickr.com/3852/15134851045_53a5135283_z.jpg)

### 激活或停用网络接口 ###

使用这些命令来激活或停用某个指定的网络接口。

使用**net-tools**：

    $ sudo ifconfig eth1 up
    $ sudo ifconfig eth1 down 

使用**iproute2**：

    $ sudo ip link set down eth1
    $ sudo ip link set up eth1 

### 为网络接口分配IPv4地址 ###

使用这些命令配置网络接口的IPv4地址。

使用**net-tools**：

    $ sudo ifconfig eth1 10.0.0.1/24 

使用**iproute2**：

    $ sudo ip addr add 10.0.0.1/24 dev eth1 

值得注意的是，可以使用iproute2给同一个接口分配多个IP地址，ifconfig则无法这么做。使用ifconfig的变通方案是使用[IP别名][2]。

    $ sudo ip addr add 10.0.0.1/24 broadcast 10.0.0.255 dev eth1
    $ sudo ip addr add 10.0.0.2/24 broadcast 10.0.0.255 dev eth1
    $ sudo ip addr add 10.0.0.3/24 broadcast 10.0.0.255 dev eth1

### 移除网络接口的IPv4地址 ###

就IP地址的移除而言，除了给接口分配全0地址外，net-tools没有提供任何合适的方法来移除网络接口的IPv4地址。相反，iproute2则能很好地完全。

使用**net-tools**：

    $ sudo ifconfig eth1 0 

使用**iproute2**：

    $ sudo ip addr del 10.0.0.1/24 dev eth1 

### 显示网络接口的IPv4地址 ###

按照如下操作可查看某个指定网络接口的IPv4地址。

使用**net-tools**：

    $ ifconfig eth1 

使用**iproute2**：

    $ ip addr show dev eth1 

同样，如果接口分配了多个IP地址，iproute2会显示出所有地址，而net-tools只能显示一个IP地址。

![](https://farm6.staticflickr.com/5552/15134470952_f478190693_z.jpg)

### 为网络接口分配IPv6地址 ###

使用这些命令为网络接口添加IPv6地址。net-tools和iproute2都允许用户为一个接口添加多个IPv6地址。

使用**net-tools**：

    $ sudo ifconfig eth1 inet6 add 2002:0db5:0:f102::1/64
    $ sudo ifconfig eth1 inet6 add 2003:0db5:0:f102::1/64

使用**iproute2**：

    $ sudo ip -6 addr add 2002:0db5:0:f102::1/64 dev eth1
    $ sudo ip -6 addr add 2003:0db5:0:f102::1/64 dev eth1

### 显示网络接口的IPv6地址 ###

按照如下操作可显示某个指定网络接口的IPv6地址。net-tools和iproute2都可以显示出所有已分配的IPv6地址。

使用**net-tools**：

    $ ifconfig eth1 

使用**iproute2**：

    $ ip -6 addr show dev eth1 

![](https://farm4.staticflickr.com/3906/15111848536_f6cb7ddb4f_z.jpg)

### 移除网络设备的IPv6地址 ###

使用这些命令可移除接口中不必要的IPv6地址。

使用**net-tools**：

    $ sudo ifconfig eth1 inet6 del 2002:0db5:0:f102::1/64

使用**iproute2**：

    $ sudo ip -6 addr del 2002:0db5:0:f102::1/64 dev eth1

### 改变网络接口的MAC地址 ###

使用下面的命令可[篡改网络接口的MAC地址][3]，请注意在更改MAC地址前，需要停用接口。

使用**net-tools**：

    $ sudo ifconfig eth1 hw ether 08:00:27:75:2a:66 

使用**iproute2**：

    $ sudo ip link set dev eth1 address 08:00:27:75:2a:67

### 查看IP路由表 ###

net-tools中有两个选择来显示内核的IP路由表：route和netstat。在iproute2中，使用命令ip route。

使用**net-tools**：

    $ route -n

----------

    $ netstat -rn 

使用**iproute2**：

    $ ip route show 

![](https://farm6.staticflickr.com/5585/14948293867_c018df8efd_z.jpg)

### 添加和修改默认路由 ###

这里的命令用来添加或修改内核IP路由表中的默认路由规则。请注意在net-tools中可通过添加新的默认路由、删除旧的默认路由来实现修改默认路由。在iproute2使用ip route命令来代替。

使用**net-tools**：

    $ sudo route add default gw 192.168.1.2 eth0
    $ sudo route del default gw 192.168.1.1 eth0 

使用**iproute2**:

    $ sudo ip route add default via 192.168.1.2 dev eth0
    $ sudo ip route replace default via 192.168.1.2 dev eth0

### 添加和移除静态路由 ###

使用下面命令添加或移除一个静态路由。

使用**net-tools**：

    $ sudo route add -net 172.16.32.0/24 gw 192.168.1.1 dev eth0
    $ sudo route del -net 172.16.32.0/24 

使用**iproute2**：

    $ sudo ip route add 172.16.32.0/24 via 192.168.1.1 dev eth0
    $ sudo ip route del 172.16.32.0/24 

### 查看套接字统计信息 ###

这里的命令用来查看套接字统计信息（比如活跃或监听状态的TCP/UDP套接字）。

使用**net-tools**：

    $ netstat
    $ netstat -l 

使用**iproute2**：

    $ ss
    $ ss -l 

![](https://farm4.staticflickr.com/3843/14948157419_564982b0e6_z.jpg)

### 查看ARP表 ###

使用这些命令显示内核的ARP表。

使用**net-tools**:

    $ arp -an 

使用**iproute2**:

    $ ip neigh 

![](https://farm4.staticflickr.com/3908/14948193370_1c5256e8e1_z.jpg)

### 添加或删除静态ARP项 ###

按照如下操作在本地ARP表中添加或删除一个[静态ARP项][4]。

使用**net-tools**：

    $ sudo arp -s 192.168.1.100 00:0c:29:c0:5a:ef
    $ sudo arp -d 192.168.1.100 

使用**iproute2**：

    $ sudo ip neigh add 192.168.1.100 lladdr 00:0c:29:c0:5a:ef dev eth0
    $ sudo ip neigh del 192.168.1.100 dev eth0 

### 添加、删除或查看多播地址 ###

使用下面的命令配置或查看网络接口上的多播地址。

使用**net-tools**:

    $ sudo ipmaddr add 33:44:00:00:00:01 dev eth0
    $ sudo ipmaddr del 33:44:00:00:00:01 dev eth0
    $ ipmaddr show dev eth0
    $ netstat -g 

使用**iproute2**：

    $ sudo ip maddr add 33:44:00:00:00:01 dev eth0
    $ sudo ip maddr del 33:44:00:00:00:01 dev eth0
    $ ip maddr list dev eth0 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/linux-tcpip-networking-net-tools-iproute2.html

作者：[Dan Nanni][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://www.kernel.org/pub/linux/utils/net/iproute2/
[2]:http://xmodulo.com/2013/02/how-to-assign-multiple-ip-addresses-to-one-network-interface-on-centos.html
[3]:http://xmodulo.com/2014/02/spoof-mac-address-network-interface-linux.html
[4]:http://xmodulo.com/2013/02/how-to-add-or-remove-static-arp-entry-on-linux.html