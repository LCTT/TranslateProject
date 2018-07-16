试试Linux下的ip命令，ifconfig已经过时了
================================================================================
linux的**ip**命令和**ifconfig**类似，但前者功能更强大，并旨在取代后者。使用ip命令，只需一个命令，你就能很轻松地执行一些网络管理任务。ifconfig是net-tools中已被废弃使用的一个命令，许多年前就已经没有维护了。iproute2套件里提供了许多增强功能的命令，ip命令即是其中之一。

![Net tools vs Iproute2](http://linoxide.com/wp-content/uploads/2014/05/Linux-Nettools-vs-Iproute2.png)

要安装ip，请[点击这里][1]下载**iproute2套装工具** 。不过，大多数Linux发行版已经预装了iproute2工具。

你也可以使用git命令来下载最新源代码来编译：

    $ git clone https://kernel.googlesource.com/pub/scm/linux/kernel/git/shemminger/iproute2.git

![iproute2 git clone](http://linoxide.com/wp-content/uploads/2014/04/iproute2-git-clone.png)

### 设置和删除Ip地址 ###

要给你的机器设置一个IP地址，可以使用下列ip命令：

    $ sudo ip addr add 192.168.0.193/24 dev wlan0

请注意IP地址要有一个后缀，比如/24。这种用法用于在无类域内路由选择（CIDR）中来显示所用的子网掩码。在这个例子中，子网掩码是255.255.255.0。

在你按照上述方式设置好IP地址后，需要查看是否已经生效。

    $ ip addr show wlan0

![set ip address](http://linoxide.com/wp-content/uploads/2014/04/set-ip-address.png)

你也可以使用相同的方式来删除IP地址，只需用del代替add。

    $ sudo ip addr del 192.168.0.193/24 dev wlan0

![delete ip address](http://linoxide.com/wp-content/uploads/2014/04/delete-ip-address.png)

### 列出路由表条目 ###

ip命令的路由对象的参数还可以帮助你查看网络中的路由数据，并设置你的路由表。第一个条目是默认的路由条目，你可以随意改动它。

在这个例子中，有几个路由条目。这个结果显示有几个设备通过不同的网络接口连接起来。它们包括WIFI、以太网和一个点对点连接。

    $ ip route show

![ip route show](http://linoxide.com/wp-content/uploads/2014/04/ip-route-show.png)

假设现在你有一个IP地址，你需要知道路由包从哪里来。可以使用下面的路由选项（译注：列出了路由所使用的接口等）：

    $ ip route get 10.42.0.47

![ip route get](http://linoxide.com/wp-content/uploads/2014/04/ip-route-get.png)

### 更改默认路由 ###

要更改默认路由，使用下面ip命令：

    $ sudo ip route add default via 192.168.0.196

![default route](http://linoxide.com/wp-content/uploads/2014/04/default-route.png)

### 显示网络统计数据 ###

使用ip命令还可以显示不同网络接口的统计数据。

![ip statistics all interfaces](http://linoxide.com/wp-content/uploads/2014/04/ip-statistics-all-interfaces.png)

当你需要获取一个特定网络接口的信息时，在网络接口名字后面添加选项**ls**即可。使用多个选项**-s**会给你这个特定接口更详细的信息。特别是在排除网络连接故障时，这会非常有用。

    $ ip -s -s link ls p2p1

![ip link statistics](http://linoxide.com/wp-content/uploads/2014/04/ip-link-statistics-.png)

### ARP条目 ###

地址解析协议（ARP）用于将一个IP地址转换成它对应的物理地址，也就是通常所说的MAC地址。使用ip命令的neigh或者neighbour选项，你可以查看接入你所在的局域网的设备的MAC地址。

    $ ip neighbour

![ip neighbour](http://linoxide.com/wp-content/uploads/2014/04/ip-neighbour.png)

### 监控netlink消息 ###

也可以使用ip命令查看netlink消息。monitor选项允许你查看网络设备的状态。比如，所在局域网的一台电脑根据它的状态可以被分类成REACHABLE或者STALE。使用下面的命令：

    $ ip monitor all

![ip monitor all](http://linoxide.com/wp-content/uploads/2014/04/ip-monitor-all.png)

### 激活和停止网络接口 ###

你可以使用ip命令的up和down选项来激某个特定的接口，就像ifconfig的用法一样。

在这个例子中，当ppp0接口被激活和在它被停止和再次激活之后，你可以看到相应的路由表条目。这个接口可能是wlan0或者eth0。将ppp0更改为你可用的任意接口即可。
    
    $ sudo ip link set ppp0 down

    $ sudo ip link set ppp0 up

![ip link set up and down](http://linoxide.com/wp-content/uploads/2014/04/ip-link-set-up-and-down.png)

### 获取帮助 ###

当你陷入困境，不知道某一个特定的选项怎么用的时候，你可以使用help选项。man页面并不会提供许多关于如何使用ip选项的信息，因此这里就是获取帮助的地方。

比如，想知道关于route选项更多的信息：

    $ ip route help

![ip route help](http://linoxide.com/wp-content/uploads/2014/04/ip-route-help.png)

### 小结 ###

对于网络管理员们和所有的Linux使用者们，ip命令是必备工具。是时候抛弃ifconfig命令了，特别是当你写脚本时。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/use-ip-command-linux/

译者：[KayGuoWhu](https://github.com/KayGuoWhu) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linuxgrill.com/anonymous/iproute2/NEW-OSDL/