在 Linux 中用 nmcli 命令绑定多块网卡
================================================================================
今天，我们来学习一下在 CentOS 7.x 中如何用 nmcli（Network Manager Command Line Interface：网络管理命令行接口）进行网卡绑定。

网卡（接口）绑定是将多块 **网卡** 逻辑地连接到一起从而允许故障转移或者提高吞吐率的方法。提高服务器网络可用性的一个方式是使用多个网卡。Linux 绑定驱动程序提供了一种将多个网卡聚合到一个逻辑的绑定接口的方法。这是个新的实现绑定的方法，并不影响 linux 内核中旧绑定驱动。

**网卡绑定为我们提供了两个主要的好处:**

1. **高带宽**
1. **冗余/弹性**

现在让我们在 CentOS 7 上配置网卡绑定吧。我们需要决定选取哪些接口配置成一个组接口（Team interface）。

运行 **ip link** 命令查看系统中可用的接口。

     $ ip link

![ip link](http://blog.linoxide.com/wp-content/uploads/2015/01/ip-link.png)

这里我们使用 **eno16777736** 和 **eno33554960** 网卡在 “主动备份” 模式下创建一个组接口。(译者注：关于不同模式可以参考：<a href="http://support.huawei.com/ecommunity/bbs/10155553.html">多网卡的7种bond模式原理</a>)

按照下面的语法，用 **nmcli** 命令为网络组接口创建一个连接。

    # nmcli con add type team con-name CNAME ifname INAME [config JSON]

**CNAME** 指代连接的名称，**INAME** 是接口名称，**JSON** (JavaScript Object Notation) 指定所使用的处理器(runner)。**JSON** 语法格式如下：

    '{"runner":{"name":"METHOD"}}' 

**METHOD** 是以下的其中一个：**broadcast、activebackup、roundrobin、loadbalance** 或者 **lacp**。

### 1. 创建组接口 ###

现在让我们来创建组接口。这是我们创建组接口所使用的命令。

     # nmcli con add type team con-name team0 ifname team0 config '{"runner":{"name":"activebackup"}}'

![nmcli con create](http://blog.linoxide.com/wp-content/uploads/2015/01/nmcli-con-create.png)

运行 **# nmcli con show** 命令验证组接口配置。

    # nmcli con show

![显示组接口](http://blog.linoxide.com/wp-content/uploads/2015/01/show-team-interface.png)

### 2. 添加从设备 ###

现在让我们添加从设备到主设备 team0。这是添加从设备的语法：

    # nmcli con add type team-slave con-name CNAME ifname INAME master TEAM

在这里我们添加 **eno16777736** 和 **eno33554960** 作为 **team0** 接口的从设备。

    # nmcli con add type team-slave con-name team0-port1 ifname eno16777736 master team0

    # nmcli con add type team-slave con-name team0-port2 ifname eno33554960 master team0

![添加从设备到 team](http://blog.linoxide.com/wp-content/uploads/2015/01/adding-to-team.png)

再次用命令 **#nmcli con show** 验证连接配置。现在我们可以看到从设备配置信息。

    #nmcli con show

![显示从设备配置](http://blog.linoxide.com/wp-content/uploads/2015/01/show-slave-config.png)

### 3. 分配 IP 地址 ###

上面的命令会在 **/etc/sysconfig/network-scripts/** 目录下创建需要的配置文件。

现在让我们为 team0 接口分配一个 IP 地址并启用这个连接。这是进行 IP 分配的命令。

    # nmcli con mod team0 ipv4.addresses "192.168.1.24/24 192.168.1.1"
    # nmcli con mod team0 ipv4.method manual
    # nmcli con up team0

![分配 ip](http://blog.linoxide.com/wp-content/uploads/2015/01/ip-assignment.png)

### 4. 验证绑定 ###

用 **#ip add show team0** 命令验证 IP 地址信息。

    #ip add show team0

![验证 ip 地址](http://blog.linoxide.com/wp-content/uploads/2015/01/verfiy-ip-adress.png)

现在用 **teamdctl** 命令检查 **主动备份** 配置功能。

    # teamdctl team0 state

![teamdctl 检查主动备份](http://blog.linoxide.com/wp-content/uploads/2015/01/teamdctl-activebackup-check.png)

现在让我们把激活的端口断开连接并再次检查状态来确认主动备份配置是否像希望的那样工作。

    # nmcli dev dis eno33554960

![断开激活端口连接](http://blog.linoxide.com/wp-content/uploads/2015/01/disconnect-activeport.png)

断开激活端口后再次用命令 **#teamdctl team0 state** 检查状态。

    # teamdctl team0 state

![teamdctl 检查断开激活端口连接](http://blog.linoxide.com/wp-content/uploads/2015/01/teamdctl-check-activeport-disconnect.png)

是的，它运行良好！！我们会使用下面的命令连接回到 team0 的断开的连接。

    #nmcli dev con eno33554960

![nmcli dev 连接断开的连接](http://blog.linoxide.com/wp-content/uploads/2015/01/nmcli-dev-connect-disconected.png)

我们还有一个 **teamnl** 命令可以显示 **teamnl** 命令的一些选项。

用下面的命令检查在 team0 运行的端口。

    # teamnl team0 ports

![teamnl 检查端口](http://blog.linoxide.com/wp-content/uploads/2015/01/teamnl-check-ports.png)

显示 **team0** 当前活动的端口。

    # teamnl team0 getoption activeport

![显示 team0 活动端口](http://blog.linoxide.com/wp-content/uploads/2015/01/display-active-port-team0.png)

好了，我们已经成功地配置了网卡绑定 :-) ，如果有任何反馈，请告诉我们。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/interface-nics-bonding-linux/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/