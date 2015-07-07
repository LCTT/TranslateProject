使用 SNMP 和 Cacti 监控 Linux 服务器
================================================================================
SNMP（简单网络管理协议）用于收集设备内部发生的数据，如负载、磁盘状态、带宽之类。像Cacti这样的网络监控工具用这些数据来生成图标以达到监控的目的。

在一个典型的Cacti和SNMP部署中，会有一台或多台启用了SNMP的设备，以及一台独立的用来从那些设备收集SNMP回馈的监控服务器。请记住，所有需要监控的设备必须启用SNMP。在本教程中，出于演示目的，我们将在同一台Linux服务器上配置Cacti和SNMP。

### 在Debian或Ubuntu上配置SNMP ###

要在基于Debian的系统上安装SNMP代理（snmpd），请运行以下命令：

    root@server:~# apt-get install snmpd

然后，如下编辑配置文件。

    root@server:~# vim /etc/snmp/snmpd.conf

----------

    # 使snmpd 监听再所有接口上
    agentAddress  udp:161
    
    # 定义一个只读的 community 'myCommunity' 和源网络
    rocommunity myCommunity 172.17.1.0/24
    
    sysLocation    Earth
    sysContact     email@domain.tld

在编辑完配置文件后，重启snmpd。

    root@server:~# service snmpd restart

### 在CentOS或RHEL上配置SNMP ###

要安装SNMP工具和库，请运行以下命令。

    root@server:~# sudo yum install net-snmp

然后，如下编辑SNMP配置文件。

    root@server:~# vim /etc/snmp/snmpd.conf

----------

    # 定义一个使用 community 'myCommunity' 和源网络 172.17.1.0/24 的用户 'myUser'
    com2sec myUser 172.17.1.0/24 myCommunity
    
    # 将 myUser 加到 'myGroup' 组，定义组权限
    group    myGroup    v1        myUser
    group    myGroup    v2c        myUser
    view all included .1
    access myGroup    ""    any    noauth     exact    all    all    none

----------

    root@server:~# service snmpd restart
    root@server:~# chkconfig snmpd on

重启snmpd服务，然后添加到启动服务列表。

### 测试SNMP ###

SNMP可以通过运行snmpwalk命令进行测试。如果SNMP已经配置成功，该命令会生成大量输出。

    root@server:~# snmpwalk -c myCommunity 172.17.1.44 -v1

----------

    iso.3.6.1.2.1.1.1.0 = STRING: "Linux mrtg 3.5.0-17-generic #28-Ubuntu SMP Tue Oct 9 19:31:23 UTC 2012 x86_64"
    iso.3.6.1.2.1.1.2.0 = OID: iso.3.6.1.4.1.8072.3.2.10
    iso.3.6.1.2.1.1.3.0 = Timeticks: (2097) 0:00:20.97
    
    ~~ 输出截断 ~~
    
    iso.3.6.1.2.1.92.1.1.2.0 = Gauge32: 1440
    iso.3.6.1.2.1.92.1.2.1.0 = Counter32: 1
    iso.3.6.1.2.1.92.1.2.2.0 = Counter32: 0
    iso.3.6.1.2.1.92.1.3.1.1.2.7.100.101.102.97.117.108.116.1 = Timeticks: (1) 0:00:00.01
    iso.3.6.1.2.1.92.1.3.1.1.3.7.100.101.102.97.117.108.116.1 = Hex-STRING: 07 DD 0B 12 00 39 27 00 2B 06 00 

### 配置带有SNMP的Cacti ###

在本教程中，我们将在同一台Linux服务器上设置Cacti和SNMP。所以，到刚刚配置SNMP的Linux服务器上去[安装Cacti][2]吧。

安装完后，Cacti网页界面可以通过“http://172.17.1.44/cacti ”来访问，当然，在你的环境中，请将IP地址换成你的服务器的地址。

![](http://farm6.staticflickr.com/5512/10972747655_0298f6ce6c_z.jpg)

![](http://farm6.staticflickr.com/5532/10972982543_67e15433b8_z.jpg)

安装过程中Cacti的路径一般都是正确的，但是如有必要，请再次检查以下。

![](http://farm4.staticflickr.com/3764/10972920304_138670d3cf_z.jpg)

在首次安装过程中，Cacti默认的用户名和密码是“admin”和“admin”。在首次登录后会强制你修改密码。

![](http://farm6.staticflickr.com/5542/10972747775_531fe445ef_o.png)

### 添加设备到Cacti并管理 ###

Cacti将根据先前配置的SNMP字符串注册设备。在本教程中，我们将只添加启用了SNMP的本地服务器。

要添加设备，我们必须以管理员登录，然后转到Cacti管理员面板中的控制台。点击 控制台 > 设备。

![](http://farm8.staticflickr.com/7411/10972747855_b464972e56_z.jpg)

那里可能已经有一个名为‘localhost’的设备。我们不需要它，因为我们要创建全新的图表。我们可以将该设备从列表中删除，使用“添加”按钮来添加新设备。

![](http://farm8.staticflickr.com/7373/10972747895_977e0eccd6_z.jpg)

接下来，我们设置设备参数。

![](http://farm8.staticflickr.com/7400/10972747935_df03500de7_z.jpg)

现在设备已经添加，我们来指定想要创建的图表模板。你可以在该页面的最后部分中找到这块内容。

![](http://farm4.staticflickr.com/3773/10972747955_083101e6ab_z.jpg)

然后，我们继续来创建图表。

![](http://farm4.staticflickr.com/3734/10972747985_fae6b78888.jpg)

这里，我们创建用于平均负载、RAM和硬盘、处理器的图表。

![](http://farm8.staticflickr.com/7374/10972920484_ed6b33b8b8_z.jpg)

### 接口的图表和64位计数器 ###

默认情况下，Cacti在SNMP查询中使用32位计数器。32位计数器对于大多数带宽图表而言已经足够了，但是对于超过100Mbps的带宽，它就无能为力了。如果已经知道带宽会超过100Mbps，建议你使用64位计数器。使用64位计数器一点也不麻烦。

![](http://farm8.staticflickr.com/7320/10972982813_120fe1f3d0_z.jpg)

**注意**： Cacti会花费大约15分钟来产生新图表，除了耐心等待，你别无选择。

### 创建图表树 ###

这些截图展示了如何创建图表树，以及如何添加图表到这些树中。

![](http://farm8.staticflickr.com/7429/10972748045_ca06bec889_z.jpg)

![](http://farm3.staticflickr.com/2833/10972920584_f33624862a_z.jpg)

![](http://farm6.staticflickr.com/5548/10972836666_f31e4de0e7_z.jpg)

![](http://farm4.staticflickr.com/3786/10972836776_1675611740_z.jpg)

我们可以验证图表树中的图表。

![](http://farm4.staticflickr.com/3707/10972836836_3dabe56765_z.jpg)

### 用户管理 ###

最后，我们创建一个只具有查看我们刚创建的图表权限的用户。Cacti内建了用户管理系统，而且是高度可定制的。

![](http://farm8.staticflickr.com/7313/10972920624_61e13157f9_z.jpg)

![](http://farm6.staticflickr.com/5536/10972920644_59a9797685_z.jpg)

![](http://farm3.staticflickr.com/2872/10972920744_24f75fb5a8_z.jpg)

在完成这些步骤后，我们可以使用‘user1’来登录进去，并验证只有该用户可以查看该图表。

![](http://farm8.staticflickr.com/7423/10972748265_c2608b3683_z.jpg)

![](http://farm4.staticflickr.com/3763/10972748335_9cd012c6fe_z.jpg)

至此，我们在网络监控系统中部署了一台Cacti服务器。Cacti服务器比较稳定，可以处理大量图表而不会出问题。

希望本文对你有所帮助。

--------------------------------------------------------------------------------

via: http://xmodulo.com/monitor-linux-servers-snmp-cacti.html

作者：[Sarmed Rahman][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:https://linux.cn/article-4683-1.html
