Ubuntu 16.04上的服务器监控报警系统 Shinken
=====


Shinken是一个用python 实现的，开源的主机和网络监视的，Nagios like的框架，他可以运行在所有支持python程序的操作系统上，比如说 Linux，Unix和Windows，Shinken由 Jean Gabes编写作为一个新的Nagios架构概念证明，但是这个想法被Nagios的作者拒绝而后成为了一个独立的类Nagios网络系统监视软件。

在这篇教程中，我将会描述如何源代码编译安装Shinken和向监视系统中添加一台Linux主机。我将会以Ubuntu 16.04 Xenial Xerus操作系统来作为 Shinken 服务器和监控端。

### 第一步-安装Shinken 服务器

Shinken是一个python框架，我们可以通过pip或者源码来安装他，在这一步中，我们将用源代码编译安装Shinken。

在我们开始安装Shinken之前还需要完成几个步骤。

安装一些新的python软件包和创建“shinken”系统用户：

```
sudo apt-get install python-setuptools python-pip python-pycurl
useradd -m -s /bin/bash shinken
```

从GitHub仓库下载Shinken源代码：

```
git clone https://github.com/naparuba/shinken.git
cd shinken/
```

然后用以下命令安装Shinken：

```
git checkout 2.4.3
python setup.py install
```

然后，为了得到更好的效果，我们还需要在Ubuntu的软件库中安装“python-cherrypy3“软件包：

```
sudo apt-get install python-cherrypy3
```

到这里，Shinken已经成功安装，接下来我们将Shinken添加到系统启动项并且启动他：

```
update-rc.d shinken defaults
systemctl start shinken
```

### 第二部-安装Shinken Webui2

Webui2是Shinken的web界面（在shinken.io可以找到）。最简单的安装 Sshinken webui2 的方法是使用shinken CLI命令（必须作为shinken用户执行）。

切换到shinken用户：

```
su - shinken
```

初始化shiken配置文件-下面的命令将会创建一个新的配置文件 .shinken.ini：

```
shinken --init
```

接下来用shinken CLI命令来安装webui2：

```
shinken install webui2
```

![](https://www.howtoforge.com/images/server-monitoring-with-shinken-on-ubuntu-16-04/6.png)

到现在webui2已经被安装，但是我们还需要用pip来安装安装MongoDB和另一个python软件包。在root下运行如下命令：

```
sudo apt-get install mongodb
pip install pymongo>=3.0.3 requests arrow bottle==0.12.8
```

接下来，切换到shinken目录下并且通过编辑broker-master.cfg文件来添加这个新的webui2模块：

```
cd /etc/shinken/brokers/
vim broker-master.cfg
```

在第40行添加一个模块选项：

```
modules     webui2
```

保存文件并且退出编辑器

现在进入contacts目录下编辑admin.cfg来进行管理配置。

```
cd /etc/shinken/contacts/
vim admin.cfg
```

按照如下修改：

```
contact_name    admin       # Username 'admin'
password        yourpass    # Pass 'mypass'
```

保存和退出。

### 第三步-安装Nagios插件和Shinken软件包

在这一步中，我们将安装Nagios插件和一些perl模块。然后从shinken.io安装其他的软件包来实现监视。

安装Nagios插件和安装perl模块所需要的cpanminus：

```
sudo apt-get install nagios-plugins* cpanminus
```

用cpanm命令来安装perl模块。

```
cpanm Net::SNMP
cpanm Time::HiRes
cpanm DBI
```

现在我们创建了一个到shinken的目录的链接并且为日志文件创建了一个新的目录。

```
chmod u+s /usr/lib/nagios/plugins/check_icmp
ln -s /usr/lib/nagios/plugins/utils.pm /var/lib/shinken/libexec/
mkdir -p /var/log/rhosts/
touch /var/log/rhosts/remote-hosts.log
```

然后，安装shinken软件包 ssh和linux-snmp用来监视，从shinken.io来安装SSH和SNMP：

```
su - shinken
shinken install ssh
shinken install linux-snmp
```

### 第四步-添加一个Linux主机

我们将添加一个新的linux主机，它将被一台IP地址为192.168.1.121，主机名为host-one的Ubuntu 16.04 服务器监控。
连接到 host-one主机：

```
ssh host1@192.168.1.121
```

从Ubuntu软件库中安装 snmp和snmpd软件包：

```
sudo apt-get install snmp snmpd
```

然后，用vim编辑snmpd.conf配置文件：

```
vim /etc/snmp/snmpd.conf
```

注释掉第15行和取消注释第17行：

```
#agentAddress  udp:127.0.0.1:161
agentAddress udp:161,udp6:[::1]:161
```

注释掉第51和53行，然后添加如下配置：

```
#rocommunity mypass  default    -V systemonly
#rocommunity6 mypass  default   -V systemonly

rocommunity mypass
```

保存和退出。

现在启动用systemctl命令来启动snmpd服务：
```
systemctl start snmpd
```

通过在hosts文件夹下创建新的文件来定义一个新的主机：

```
cd /etc/shinken/hosts/
vim host-one.cfg
```

粘贴如下配置信息：

```
define host{
        use                 generic-host,linux-snmp,ssh
        contact_groups      admins
        host_name           host-one
        address             192.168.1.121
        _SNMPCOMMUNITY      mypass        # SNMP Pass Config on snmpd.conf
    }
```

保存和退出。

在shinken服务器上编辑SNMP配置文件。

```
vim /etc/shinken/resource.d/snmp.cfg
```

将public改为mypass-必须和你在客户端snmpd配置文件中使用的密码相同：

```
$SNMPCOMMUNITYREAD$=mypass
```

保存和退出。

现在将服务端和客户端都重启：	

```
reboot
```

现在Linux主机已经被成功地添加到shinken服务器中了。

### 第五步-访问 Shinken Webui2

访问Shinken webui2在端口7677（将URL中的IP替换成你自己的IP地址）：

```
http://192.168.1.120:7767
```

用管理员用户和密码登陆（你在admin.cfg文件中设置的）
![](https://www.howtoforge.com/images/server-monitoring-with-shinken-on-ubuntu-16-04/1.png)

Webui2中的Shinken面板。

![](https://www.howtoforge.com/images/server-monitoring-with-shinken-on-ubuntu-16-04/2.png)

我们的两个服务器正在被Shinken监控。

![](https://www.howtoforge.com/images/server-monitoring-with-shinken-on-ubuntu-16-04/3.png)

列出所有被linux-snmp监控的服务。

![](https://www.howtoforge.com/images/server-monitoring-with-shinken-on-ubuntu-16-04/4.png)

所有主机和服务的状态信息。


![](https://www.howtoforge.com/images/server-monitoring-with-shinken-on-ubuntu-16-04/5.png)

### 第6步-Shinken常见的问题

- NTP服务器相关的问题

当你得到如下的NTP错误提示

```
TimeSync - CRITICAL ( NTP CRITICAL: No response from the NTP server)
TimeSync - CRITICAL ( NTP CRITICAL: Offset unknown )
```

为了解决这个问题，在所有Linux主机上安装ntp

```
sudo apt-get install ntp ntpdate
```

编辑ntp配置文件：

```
vim /etc/ntp.conf
```

注释掉所有pools并替换为：

```
#pool 0.ubuntu.pool.ntp.org iburst
#pool 1.ubuntu.pool.ntp.org iburst
#pool 2.ubuntu.pool.ntp.org iburst
#pool 3.ubuntu.pool.ntp.org iburst

pool 0.id.pool.ntp.org
pool 1.asia.pool.ntp.org
pool 0.asia.pool.ntp.org
```

然后，在新的一行添加如下限制规则：

```
# Local users may interrogate the ntp server more closely.
restrict 127.0.0.1
restrict 192.168.1.120 #shinken server IP address
restrict ::1
NOTE: 192.168.1.120 is the Shinken server IP address.
```

保存和退出。

启动ntp并且检查Shinken面板。

```
ntpd
```

- check_netint.pl Not Found问题

从github仓库下载源代码到shinken的库目录下：

```
cd /var/lib/shinken/libexec/
wget https://raw.githubusercontent.com/Sysnove/shinken-plugins/master/check_netint.pl
chmod +x check_netint.pl
chown shinken:shinken check_netint.pl
```

- 网路占用率的问题

这是错误信息：

```
ERROR : Unknown interface eth\d+
```

检查你的网络接口并且编辑linux-snmp模版。

在我的Ununtu服务器，网卡是“enp0s8”，而不是eth0，所以我遇到了这个错误。

vim编辑linux-snmp模版：

```
vim /etc/shinken/packs/linux-snmp/templates.cfg
```

在第24行添加网络接口信息：

```
_NET_IFACES         eth\d+|em\d+|enp0s8
```

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/server-monitoring-with-shinken-on-ubuntu-16-04/

作者：[Muhammad Arul][a]
译者：[LinuxBars](https://github.com/LinuxBars)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/server-monitoring-with-shinken-on-ubuntu-16-04/
Save and exit.
