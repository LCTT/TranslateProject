在 RedHat/CentOS 7.x 中使用 nmcli 命令管理网络
===============
[**Red Hat Enterprise Linux 7** 与 **CentOS 7**][1] 中默认的网络服务由 **NetworkManager** 提供，这是动态控制及配置网络的守护进程，它用于保持当前网络设备及连接处于工作状态，同时也支持传统的 ifcfg 类型的配置文件。

NetworkManager 可以用于以下类型的连接：Ethernet，VLANS，Bridges，Bonds，Teams，Wi-Fi，mobile boradband（如移动3G）以及 IP-over-InfiniBand。针对与这些网络类型，NetworkManager 可以配置他们的网络别名，IP 地址，静态路由，DNS，VPN连接以及很多其它的特殊参数。

可以用命令行工具 nmcli 来控制 NetworkManager。

###nmcli 用法###

    # nmcli [ OPTIONS ] OBJECT { COMMAND | help }

我们可以通过 TAB 键补全命令，当你忘记这个命令的语法时只需要按下 TAB 就可以看到选项列表。

![nmcli tab](http://blog.linoxide.com/wp-content/uploads/2014/12/nmcli-tab.jpg)

使用 nmcli 的一些例子：

    # nmcli general status

这条命令将 NetworkManager 的所有状态都打印出来。

    # nmcli connection show

显示所有连接。

    # nmcli connection show -a

仅显示当前活动的连接。

    # nmcli device status

列出 NetworkManager 识别出的设备列表及他们的状态。

![nmcli general](http://blog.linoxide.com/wp-content/uploads/2014/12/nmcli-gneral.jpg)

### 启动/停止 网络接口###

使用 nmcli 工具启动或停止网络接口，与 ifconfig 的 up/down 是一样的。

使用下列命令停止某个接口：

    # nmcli device disconnect eno16777736

下列命令用来启动接口：

    # nmcli device connect eno16777736

###添加静态IP的以太网连接

以下命令可以添加一个静态IP地址的以太网连接：

    # nmcli connection add type ethernet con-name NAME_OF_CONNECTION ifname interface-name ip4 IP_ADDRESS gw4 GW_ADDRESS

根据你需要的配置更改 NAME\_OF\_CONNECTION,IP\_ADDRESS, GW\_ADDRESS参数（如果不需要网关的话可以省略最后一部分）。

    # nmcli connection add type ethernet con-name NEW ifname eno16777736 ip4 192.168.1.141 gw4 192.168.1.1

使用下列命令设置DNS服务器：

    # nmcli connection modify NEW ipv4.dns "8.8.8.8 8.8.4.4"

下列命令启动新的 Ethernet 连接：

    # nmcli connection up NEW ifname eno16777736

查看新连接的配置信息：

    # nmcli -p connection show NEW

![nmcli add static](http://blog.linoxide.com/wp-content/uploads/2014/12/nmcli-add-static.jpg)

###增加一个使用 DHCP 的新连接

增加新的连接，使用DHCP自动分配IP地址，网关，DNS等，你要做的就是将命令行后 ip/gw 地址部分去掉就行了，DHCP会自动分配这些参数。

例，在 eno 16777736 设备上配置一个 名为 NEW\_DHCP 的 DHCP 连接

    # nmcli connection add type ethernet con-name NEW_DHCP ifname eno16777736

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/nmcli-tool-red-hat-centos-7/

作者：[Adrian Dinu][a]
译者：[SPccman](https://github.com/SPccman)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/7.0_Release_Notes/
