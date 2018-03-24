如何在 Debian Linux 上设置和配置网桥
=====

我是一个新 Debian Linux 用户，我想为 Debian Linux 上运行的虚拟化环境（KVM）设置网桥。那么我该如何在 Debian Linux 9.x 服务器上的  /etc/network/interfaces 中设置桥接网络呢？

如何你想为你的虚拟机分配 IP 地址并使其可从你的局域网访问，则需要设置网络桥接器。默认情况下，虚拟机使用 KVM 创建的专用网桥。但你需要手动设置接口，避免与网络管理员发生冲突。

### 怎样安装 brctl

输入以下命令 [nixcmdn name=”apt”]/[apt-get 命令][1]:
`$ sudo apt install bridge-utils`

### 怎样在 Debian Linux 上设置网桥

你需要编辑  /etc/network/interface 文件。不过，我建议在 /etc/network/interface.d/ 目录下放置一个全新的配置。在 Debian Linux 配置网桥的过程如下：

#### 步骤 1 - 找出你的物理接口

使用 [ip 命令][2]:
`$ ip -f inet a s`
示例输出如下：
```
2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 inet 192.168.2.23/24 brd 192.168.2.255 scope global eno1
 valid_lft forever preferred_lft forever
```

eno1 是我的物理网卡。

#### 步骤 2 - 更新 /etc/network/interface 文件

确保只有 lo（loopback 在 /etc/network/interface 中处于活动状态）。（译注：loopback 指本地环回接口，也称为回送地址）删除与 eno1 相关的任何配置。这是我使用 [cat 命令][3] 打印的配置文件：
`$ cat /etc/network/interface`
```
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
 
source /etc/network/interfaces.d/*
 
# The loopback network interface
auto lo
iface lo inet loopback
```


#### 步骤 3 - 在 /etc/network/interfaces.d/br0 中配置网桥（br0）

使用文本编辑器创建一个 text 文件，比如 vi 命令：
`$ sudo vi /etc/network/interfaces.d/br0`
在其中添加配置：
```
## static ip config file for br0 ##
auto br0
iface br0 inet static
    address 192.168.2.23
    broadcast 192.168.2.255
    netmask 255.255.255.0
    gateway 192.168.2.254
    # If the resolvconf package is installed, you should not edit
    # the resolv.conf configuration file manually. Set name server here
    #dns-nameservers 192.168.2.254
    # If you have muliple interfaces such as eth0 and eth1
    # bridge_ports eth0 eth1
    bridge_ports eno1
    bridge_stp off # disable Spanning Tree Protocol
    bridge_waitport 0 # no delay before a port becomes available
    bridge_fd 0 # no forwarding delay
```

如果你想使用 DHCP 来获得 IP 地址：
```
## DHCP ip config file for br0 ##
auto br0
 
# Bridge setup
 iface br0 inet dhcp
  bridge_ports eno1
```

[在 vi/vim 中保存并关闭文件][4]。

#### 步骤 4 - [重新启动网络服务][5]

在重新启动网络服务之前，请确保防火墙已关闭。防火墙可能会引用较老的接口，例如 eno1。一旦服务重新启动，你必须更新 br0 接口的防火墙规则。键入以下命令重新启动防火墙：
`$ sudo systemctl restart network-manager`
确认服务已经重新启动：
`$ systemctl status network-manager`
借助 [ip 命令][2]寻找新的 br0 接口和路由表：
`$ ip a s $ ip r $ ping -c 2 cyberciti.biz`
示例输出：
![](https://www.cyberciti.biz/media/new/faq/2018/02/How-to-setup-and-configure-network-bridge-on-Debian-Linux.jpg)
你可以使用 brctl 命令查看网桥有关信息：
`$ brctl show`
显示当前网桥：
`$ bridge link`
![](https://www.cyberciti.biz/media/new/faq/2018/02/Show-current-bridges-and-what-interfaces-they-are-connected-to-on-Linux.jpg)


### 关于作者

作者是 nixCraft 的创建者，也是经验丰富的系统管理员，DevOps 工程师以及 Linux 操作系统/ Unix shell 脚本的培训师。通过订阅 [RSS/XML feed][6] 或者 [weekly email newsletter][7]获得**关于  SysAdmin, Linux/Unix 和开源主题的最新教程。**

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-configuring-bridging-in-debian-linux/

作者：[Vivek GIte][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[2]:https://www.cyberciti.biz/faq/linux-ip-command-examples-usage-syntax/ (See Linux/Unix ip command examples for more info)
[3]:https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/ (See Linux/Unix cat command examples for more info)
[4]:https://www.cyberciti.biz/faq/linux-unix-vim-save-and-quit-command/
[5]:https://www.cyberciti.biz/faq/linux-restart-network-interface/
[6]:https://www.cyberciti.biz/atom/atom.xml
[7]:https://www.cyberciti.biz/subscribe-to-weekly-linux-unix-newsletter-for-sysadmin/
