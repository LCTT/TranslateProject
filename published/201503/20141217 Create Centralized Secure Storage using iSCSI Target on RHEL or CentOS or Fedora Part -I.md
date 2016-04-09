使用iSCSI Target创建集中式安全存储（一）
================================================================================
**iSCSI** 是一种块级别的协议，用于通过TCP/IP网络共享**原始存储设备**，可以用已经存在的IP和以太网如网卡、交换机、路由器等通过iSCSI协议共享和访问存储。iSCSI target是一种由远程iSCSI服务器（target）提供的远程硬盘。

![Install iSCSI Target in Linux](http://www.tecmint.com/wp-content/uploads/2014/07/Install-iSCSI-Target-in-Linux.jpg)

*在Linux中安装iSCSI Target*

我们不需要占用很大的资源就可以为客户端提供稳定的连接和性能。iSCSI服务器称为“Target（目标器）”，它提供服务器上的存储共享。iSCSI客户端称为“Initiator（发起程序）”，它访问目标器共享的存储。市场中有卖的用于大型存储服务如SAN的iSCSI适配器。

**我们为什么要在大型存储领域中使用iSCSI适配器**

以太网适配器（NIC）被设计用于在系统、服务器和存储设备如NAS间传输分组数据，它不适合在Internet中传输块级数据。

### iSCSI Target的功能 ###

- 可以在一台机器上运行几个iSCSI 目标器
- 一台机器可以提供多个iSCSI 目标器用于iSCSI SAN访问
- 一个目标器就是一块存储，并且可以通过网络被发起程序（客户端）访问
- 把这些存储汇聚在一起让它们在网络中可以访问的是iSCSI LUN（逻辑单元号）
- iSCSI支持在同一个会话中使用多个连接
- iSCSI发起程序在网络中发现目标接着用LUN验证并登录，这样就可以本地访问远程存储。
- 我们可以在本地挂载的LUN上安装任何操作系统，就像我们安装我们本地的操作系统一样。

### 为什么需要iSCSI？ ###

在虚拟化中，我们需要存储拥有高度的冗余性、稳定性，iSCSI以低成本的方式提供了这些特性。与使用光纤通道的SAN比起来，我们可以使用已经存在的设备比如NIC、以太网交换机等建造一个低成本的SAN。

现在我开始使用iSCSI 目标器安装并配置安全存储。本篇中，我们遵循下面的步骤：

- 我们需要隔离一个系统来设置iSCSI Target服务器和发起程序（客户端）。
- 在大型存储环境中可以添加多个硬盘，但是这里我们除了基本的安装盘之外只使用了一个额外的驱动器。
- 这里我们只使用了2块硬盘，一个用于基本的服务器安装，另外一个用于存储（LUN），这个我们会在这个系列的第二篇描述。

#### 主服务器设置 ####

- 操作系统 – CentOS  6.5 (Final)
- iSCSI 目标器 IP – 192.168.0.200
- 使用的端口 : TCP 860, 3260
- 配置文件 : /etc/tgt/targets.conf

### 安装 iSCSI Target ###

打开终端并使用yum命令来搜索需要在iscsi 目标器上安装的包名。

    # yum search iscsi

#### 输出示例 ####

    ========================== N/S matched: iscsi =======================
    iscsi-initiator-utils.x86_64 : iSCSI daemon and utility programs
    iscsi-initiator-utils-devel.x86_64 : Development files for iscsi-initiator-utils
    lsscsi.x86_64 : List SCSI devices (or hosts) and associated information
    scsi-target-utils.x86_64 : The SCSI target daemon and utility programs

你会的到上面的那些结果，选择**Target**包来安装。

    # yum install scsi-target-utils -y

![Install iSCSI Utils](http://www.tecmint.com/wp-content/uploads/2014/07/Install-iSCSI-in-Linux.jpg)

*安装iSCSI工具*

列出安装的包里面的内容来了解默认的配置、服务和man页面的位置。

    # rpm -ql scsi-target-utils.x86_64

![List All iSCSI Files](http://www.tecmint.com/wp-content/uploads/2014/07/List-All-ISCSI-Files.jpg)

*列出所有的iSCSI包里面的文件*

让我们启动iSCSI服务，并检查服务运行的状态，iSCSI的服务名是**tgtd**。

    # /etc/init.d/tgtd start
    # /etc/init.d/tgtd status

![Start iSCSI Service](http://www.tecmint.com/wp-content/uploads/2014/07/Start-iSCSI-Service.jpg)

*启动iSCSI服务*

现在我们需要配置开机自动启动。

    # chkconfig tgtd on

现在验证tgtd服务的运行级别是否配置正确。

    # chkconfig --list tgtd

![Enable iSCSI on Startup](http://www.tecmint.com/wp-content/uploads/2014/07/Enable-iSCSI-on-Startup.jpg)

*开机启动iSCSI*

现在使用**tgtadm**来列出在我们的服务器上已经配置了哪些目标器和LUN。

    # tgtadm --mode target --op show

**tgtd**已经安装并在运行了，但是上面的命令没有**输出**因为我们还没有在目标器上定义LUN。要查看手册，可以运行‘**man**‘命令。

    # man tgtadm

![iSCSI Man Pages](http://www.tecmint.com/wp-content/uploads/2014/07/iSCSI-Man-Pages.jpg)

*iSCSI Man 页面*

如果你的target服务器上有iptable的话，那么我们需要为iSCSI添加iptable规则。首先使用netstat命令找出iscsi target的端口号，target总是监听TCP端口3260。

    # netstat -tulnp | grep tgtd

![Find iSCSI Port](http://www.tecmint.com/wp-content/uploads/2014/07/Find-iSCSI-Port.jpg)

*找出iSCSI端口*

下面加入如下规则让iptable允许广播iSCSI 目标器发现包。

    # iptables -A INPUT -i eth0 -p tcp --dport 860 -m state --state NEW,ESTABLISHED -j ACCEPT
    # iptables -A INPUT -i eth0 -p tcp --dport 3260 -m state --state NEW,ESTABLISHED -j ACCEPT

![Open iSCSI Ports](http://www.tecmint.com/wp-content/uploads/2014/07/Open-iSCSI-Ports.jpg)

*打开iSCSI端口*

![Add iSCSI Ports to Iptables](http://www.tecmint.com/wp-content/uploads/2014/07/Add-iSCSI-Ports-to-Iptables.jpg)

*添加iSCSI端口到iptable中*

**注意**： 规则可能根据你的 **默认链策略**而不同。接着保存iptable并重启该服务。

    # iptables-save
    # /etc/init.d/iptables restart

![Restart iptables](http://www.tecmint.com/wp-content/uploads/2014/07/Restart-iptables.jpg)

*重启iptable*

现在我们已经部署了一个目标器来共享LUN给通过TCP/IP认证的发起程序。这也适用于从小到大规模的生产环境。

在我的下篇文章中，我会展示如何[在目标器中使用LVM创建LUN][1]，并且如何在客户端中共享LUN，不要忘记留下有价值的评论。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-centralized-secure-storage-using-iscsi-targetin-linux/

作者：[Babin Lonston][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:http://www.tecmint.com/create-luns-using-lvm-in-iscsi-target/