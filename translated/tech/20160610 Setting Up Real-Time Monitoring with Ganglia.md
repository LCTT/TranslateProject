使用Ganglia来监控linux类型的网格和集群服务器
===========
自从SA接手服务和主机管理以后，监控类的工具就成了他们的好帮手。其中比较有名的有[Nagios][11], [Zabbix][10], [Icinga][9], 和 Centreon.以上这些重量级的监控工具，让一个新手SA来设置，并使用其中的高级特性是非常困难的。
本文将向你介绍Ganglia，它是一个容易扩展配置的监控系统。它可以查看服务器中的各项性能指标，也可以实时图形化的展示集群配置。
[![Install Gangila Monitoring in Linux](http://www.tecmint.com/wp-content/uploads/2016/06/Install-Gangila-Monitoring-in-Linux.png)][8]

在Linux上安装Ganglia
Ganglia能够让集群和网格服务器更加容易管理。
我们可以远程创建一个包含所有主机的网格配置，其中的成员主机可以使用模板设置。

此外Ganglia对移动设备进行过页面优化，排版非常人性化。当然你还可以导出`csv`和 `.json`格式的数据。

我们的测试环境包括一个安装Ganglia的主节点服务器CentOS7(IP 地址 192.168.0.29)和一个作为被监控端的Ubuntu 14.04主机 (192.168.0.32)。我们将通过Ganglia Web的页面来监控这台Ubuntu主机。

下面的例子可以给大家提供参考，CentOS7作为主节点，Ubuntu作为被监控对象。

### 安装和配置 Ganglia

请遵循以下步骤在主节点服务器安装监控工具。

#### 1. 1. 使用yum源 [EPEL repository][7] ，然后安装 Ganglia和相关工具:
命令如下

```
# yum update && yum install epel-release
# yum install ganglia rrdtool ganglia-gmetad ganglia-gmond ganglia-web
```

Ganglia将附加安装一些应用，它们的功能如下：

  1.  `rrdtool`, 轮询数据库，它是一个储存以及用图形化显示变化数据的工具
  2.  `ganglia-gmetad` 一个守护进程，用来收集被监控主机的数据。被监控主机与主节点主机都要安装Ganglia-gmond（监控守护进程自己）
  3.  `ganglia-web` 提供Web前端用于显示监控系统的历史数据

#### 2. 使用Apache为Ganglia配置Web身份认证

  如果你想了解更多的高级认证机制，请参阅[Authorization and Authentication][6]选择Apache部分。

  为完成这部分的任务，我们需要用Apache来创建一个用户名和对应的密码，下面的例子我们先来创建一个叫`adminganglia`的用户名，然后给他分配一个密码，它将被储存在 /etc/httpd/auth.basic（如果随便选择根目录或其他Apache没有权限读取的目录，这项配置最终将会以失败告终。） 

```
# htpasswd -c /etc/httpd/auth.basic adminganglia

```

给adminganglia添加密码，需要经过2次确认

#### 3. 修改配置文件 /etc/httpd/conf.d/ganglia.conf 

```
Alias /ganglia /usr/share/ganglia
<Location /ganglia>
AuthType basic
AuthName "Ganglia web UI"
AuthBasicProvider file
AuthUserFile "/etc/httpd/auth.basic"
Require user adminganglia
</Location>

```

#### 4. 编辑 /etc/ganglia/gmetad.conf:

  首先, 使用gridname命令来设置集群的名称。

```
gridname "Home office"

```

  然后, 使用data_source命令根据集群的名称来设置主节点主机和被监控节点的轮询时间

```
data_source "Labs" 60 192.168.0.29:8649 # Master node
data_source "Labs" 60 192.168.0.32 # Monitored node

```

#### 5. 编辑 /etc/ganglia/gmond.conf.

  a)确保集群的配置和下面的一样。

```
cluster {
name = "Labs" # The name in the data_source directive in gmetad.conf
owner = "unspecified"
latlong = "unspecified"
url = "unspecified"
}

```

  b) 在udp_send_chanel 中，注释掉 mcast_join directive:

```
udp_send_channel   {
# mcast_join = 239.2.11.71
host = localhost
port = 8649
ttl = 1
}

```

  c)在udp_recv_channel 中:注释掉mcast_join 和bind部分

```
udp_recv_channel {
# mcast_join = 239.2.11.71 ## comment out
port = 8649
# bind = 239.2.11.71 ## comment out
}
```

  保存并退出

#### 6.打开8649/udp端口，更改SELinux确保php脚本能够连接：

```
# firewall-cmd --add-port=8649/udp
# firewall-cmd --add-port=8649/udp --permanent
# setsebool -P httpd_can_network_connect 1

```

#### 7.重启Apache，gmetad，gmond并确保他们在开机启动里面。

```
# systemctl restart httpd gmetad gmond
# systemctl enable httpd gmetad httpd

```

至此，我们现在能够打开并登录Ganglia的Web页面 `http://192.168.0.29/ganglia` 

  [![Gangila Web Interface](http://www.tecmint.com/wp-content/uploads/2016/06/Gangila-Web-Interface.png)][5]

  Gangila Web Interface

#### 8. 在Ubuntu上安装Ganglia-monitor：

```
$ sudo aptitude update && aptitude install ganglia-monitor

```

#### 9. 编辑被监控主机的配置文件/etc/ganglia/gmond.conf，在主节点主机上也是相同的文件，注释掉网格里面不在线的主机。需要编辑udp_send_channel和udp_recv_channelshould这两项

```
cluster {
name = "Labs" # The name in the data_source directive in gmetad.conf
owner = "unspecified"
latlong = "unspecified"
url = "unspecified"
}
udp_send_channel   {
mcast_join = 239.2.11.71
host = localhost
port = 8649
ttl = 1
}
udp_recv_channel {
mcast_join = 239.2.11.71 ## comment out
port = 8649
bind = 239.2.11.71 ## comment out
}

```

Then, restart the service:
之后重启服务

```
$ sudo service ganglia-monitor restart

```

#### 10. 刷新页面你将看到各种状态以及图形化的展示集群或网格的配置情况(用下拉菜单选择我们想查看的集群或网格):

[![Ganglia Home Office Grid Report](http://www.tecmint.com/wp-content/uploads/2016/06/Ganglia-Home-Office-Grid-Report.png)][4]

Ganglia中网格的报告

使用菜单按钮你可以选择组里面的节点主机，这将非常容易的获取到你感兴趣的信息。可以使用对比选项来查看集群中所有主机的信息。

当然你也可以使用正则表达式来快速对比一组主机

[![Ganglia Host Server Information](http://www.tecmint.com/wp-content/uploads/2016/06/Ganglia-Server-Information.png)][3]

Ganglia Host Server Information

One of the features I personally find most appealing is the mobile-friendly summary, which you can access using the Mobile tab. Choose the cluster you’re interested in and then the individual host:
能够使用移动设备管理，对于移动端有友好界面，这是一个非常吸引人的特点。在集群中选中一个主机，点击它。

[![Ganglia Mobile Friendly Summary View](http://www.tecmint.com/wp-content/uploads/2016/06/Ganglia-Mobile-View.png)][2]

Ganglia 移动端截图
### 总结

本篇文章向大家介绍了Ganglia，他是一个功能强大扩展性很好的监控工具，主要用来监控集群和网格。它可以随意安装，便捷的组合各种功能（你甚至可以尝试一下官方提供的demo网站[official website][1]）。
此时你可能会发现许多知名的it企业或许并不使用Ganglia来监控作为监控工具。他们有自己更好的工具去实现，除了那些工具以外，我们这篇文章里面提到的Ganglia可能是最方便的图形化（在图示主机上显示对应的名字）工具。
但是请不要拘泥于本篇文章，尝试一下自己去做，不必犹豫不敢尝试。如果你有任何问题也欢迎给我留言。
--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-configure-ganglia-monitoring-centos-linux/

作者：[Gabriel Cánepa][a]

译者：[ivo-wang](https://github.com/ivo-wang)

校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]:http://ganglia.info/
[2]:http://www.tecmint.com/wp-content/uploads/2016/06/Ganglia-Mobile-View.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/06/Ganglia-Server-Information.png
[4]:http://www.tecmint.com/wp-content/uploads/2016/06/Ganglia-Home-Office-Grid-Report.png
[5]:http://www.tecmint.co m/wp-content/uploads/2016/06/Gangila-Web-Interface.png
[6]:http://httpd.apache.org/docs/current/howto/auth.html
[7]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[8]:http://www.tecmint.com/wp-content/uploads/2016/06/ Install-Gangila-Monitoring-in-Linux.png
[9]:http://www.tecmint.com/install-icinga-in-centos-7/
[10]:http://www.tecmint.com/install-and-configure-zabbix-monitoring-on-debian-centos-rhel/
[11]:http://www.tecmint.com/install-nagios-in-linux/
