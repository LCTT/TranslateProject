Nmcli 网络管理命令行工具基础
================================================================================

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/08/networking1.jpg)

### 介绍 ###

在本教程中，我们会在CentOS / RHEL 7中讨论网络管理工具（NetworkManager command line tool），也叫**nmcli**。那些使用**ifconfig**的用户应该在CentOS 7中避免使用**ifconfig** 了。

让我们用nmcli工具配置一些网络设置。

#### 要得到系统中所有接口的地址信息 ####

    [root@localhost ~]# ip addr show

**示例输出：**

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
     inet 127.0.0.1/8 scope host lo
     valid_lft forever preferred_lft forever
     inet6 ::1/128 scope host 
     valid_lft forever preferred_lft forever
    2: eno16777736: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
     link/ether 00:0c:29:67:2f:4c brd ff:ff:ff:ff:ff:ff
     inet 192.168.1.51/24 brd 192.168.1.255 scope global eno16777736
     valid_lft forever preferred_lft forever
     inet6 fe80::20c:29ff:fe67:2f4c/64 scope link 
     valid_lft forever preferred_lft forever

#### 检索与已连接的接口相关的数据包统计 ####

    [root@localhost ~]# ip -s link show eno16777736

**示例输出：**

![](http://www.unixmen.com/wp-content/uploads/2015/08/unxmen_0111.png)

#### 得到路由配置 ####

    [root@localhost ~]# ip route

示例输出：

    default via 192.168.1.1 dev eno16777736 proto static metric 100 
    192.168.1.0/24 dev eno16777736 proto kernel scope link src 192.168.1.51 metric 100

#### 分析主机/网站路径 ####

    [root@localhost ~]# tracepath unixmen.com

输出像traceroute，但是更加完整。

![](http://www.unixmen.com/wp-content/uploads/2015/08/unxmen_01211.png)

### nmcli 工具 ###

**nmcli** 是一个非常丰富和灵活的命令行工具。nmcli使用的情况有：

- **设备** – 正在使用的网络接口
- **连接** – 一组配置设置，对于一个单一的设备可以有多个连接，可以在连接之间切换。

#### 找出有多少连接服务于多少设备 ####

    [root@localhost ~]# nmcli connection show

![](http://www.unixmen.com/wp-content/uploads/2015/08/unxmen_013.png)

#### 得到特定连接的详情 ####

    [root@localhost ~]# nmcli connection show eno1

**示例输出：**

![](http://www.unixmen.com/wp-content/uploads/2015/08/unxmen_0141.png)

#### 得到网络设备状态 ####

    [root@localhost ~]# nmcli device status

----------

     DEVICE               TYPE              STATE          CONNECTION 
    eno16777736            ethernet      connected              eno1 
    lo                     loopback      unmanaged               --

#### 使用“dhcp”创建新的连接 ####

    [root@localhost ~]# nmcli connection add con-name "dhcp" type ethernet ifname eno16777736

这里，

- **connection add** – 添加新的连接
- **con-name** – 连接名
- **type** – 设备类型
- **ifname** – 接口名

这个命令会使用dhcp协议添加连接

**示例输出：**

    Connection 'dhcp' (163a6822-cd50-4d23-bb42-8b774aeab9cb) successfully added.

#### 不通过dhcp分配IP，使用“static”添加地址 ####

    [root@localhost ~]# nmcli connection add con-name "static" ifname eno16777736 autoconnect no type ethernet ip4 192.168.1.240 gw4 192.168.1.1

**示例输出：**

    Connection 'static' (8e69d847-03d7-47c7-8623-bb112f5cc842) successfully added.

**更新连接：**

    [root@localhost ~]# nmcli connection up eno1

再检查一遍，ip地址是否已经改变

    [root@localhost ~]# ip addr show

![](http://www.unixmen.com/wp-content/uploads/2015/08/unxmen_0151.png)

#### 添加DNS设置到静态连接中 ####

    [root@localhost ~]# nmcli connection modify "static" ipv4.dns 202.131.124.4

#### 添加更多的DNS ####

	[root@localhost ~]# nmcli connection modify "static" +ipv4.dns 8.8.8.8

**注意**：要使用额外的**+**符号，并且要是**+ipv4.dns**，而不是**ip4.dns**。

####添加一个额外的ip地址####

    [root@localhost ~]# nmcli connection modify "static" +ipv4.addresses 192.168.200.1/24

使用命令刷新设置：

    [root@localhost ~]# nmcli connection up eno1

![](http://www.unixmen.com/wp-content/uploads/2015/08/unxmen_016.png)

你会看见，设置生效了。

完结。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/basics-networkmanager-command-line-tool-nmcli/

作者：Rajneesh Upadhyay
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
