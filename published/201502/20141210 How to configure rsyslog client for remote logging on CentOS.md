CentOS上配置rsyslog客户端用以远程记录日志
================================================================================
**rsyslog**是一个开源工具，被广泛用于Linux系统以通过TCP/UDP协议转发或接收日志消息。rsyslog守护进程可以被配置成两种环境，一种是配置成日志收集服务器，rsyslog进程可以从网络中收集其它主机上的日志数据，这些主机会将日志配置为发送到另外的远程服务器。rsyslog的另外一个用法，就是可以配置为客户端，用来过滤和发送内部日志消息到本地文件夹（如/var/log）或一台可以路由到的远程rsyslog服务器上。

假定你的网络中已经有一台[已经配置好并启动的][1]rsyslog服务器，本指南将为你展示如何来设置CentOS系统将其内部日志消息路由到一台远程rsyslog服务器上。这将大大改善你的系统磁盘空间的使用，尤其是当你还没有一个用于/var目录的独立的大分区。

### 步骤一： 安装Rsyslog守护进程 ###

在CentOS 6和7上，rsyslog守护进程已经预先安装了。要验证rsyslog是否已经安装到你的CentOS系统上，请执行如下命令：

    # rpm -qa | grep rsyslog
    # rsyslogd -v 

![](https://farm8.staticflickr.com/7502/15988316295_ac2e07e7f3_z.jpg)

如果处于某种原因，rsyslog守护进程没有出现在你的系统中，请使用以下命令来安装：

     # yum install rsyslog 

### 步骤二： 配置Rsyslog守护进程为客户端 ###

接下来的步骤，是要将你的CentOS机器转变成rsyslog客户端，将其所有内部日志消息发送到远程中央日志服务器上。

要实现该功能，请使用你喜爱的文本编辑器打开位于/etc路径下的rsyslog主配置文件：

    # nano /etc/rsyslog.conf 

开启文件用于编辑后，你需要添加以下声明到文件底部。将IP地址替换为你的远程rsyslog服务器的IP地址。

    *.*  @192.168.1.25:514 

上面的声明告诉rsyslog守护进程，将系统上各个设备的各种日志消息路由到远程rsyslog服务器（192.168.1.25）的UDP端口514。

如果出于某种原因，你需要更为可靠的协议，如TCP，而rsyslog服务器也被配置为监听TCP连接，你必须在远程主机的IP地址前添加一个额外的@字符，像下面这样：

    *.*  @@192.168.1.25:514 

注意，你也可以将rsyslog服务器的IP地址替换成它的主机名（FQDN）。

如果你只想要转发服务器上的指定设备的日志消息，比如说内核设备，那么你可以在rsyslog配置文件中使用以下声明。

    kern.* @192.168.1.25:514 

修改配置文件后，你需要重启进程以激活修改：

**CentOS 7：**

    # systemctl restart rsyslog.service 

**CentOS 6：**

     # service rsyslog restart 

####非 syslog 日志的转发

在另外一种环境中，让我们假定你已经在机器上安装了一个名为“foobar”的应用程序，它会在/var/log下生成foobar.log日志文件。现在，你想要将它的日志定向到rsyslog服务器，这可以通过像下面这样在rsyslog配置文件中加载imfile模块来实现。

首先，加载imfile模块，这只需做一次。

    module(load="imfile" PollingInterval="5") 

然后，指定日志文件的路径以便imfile模块可以检测到：

    input(type="imfile"
          File="/var/log/foobar.log"
          Tag="foobar"
          Severity="error"
          Facility="local7")

最后，定向local7设备到远程rsyslog服务器：

    local7.* @192.168.1.25:514

别忘了重启rsyslog进程哦！

### 步骤三： 让Rsyslog进程自动启动 ###

要让rsyslog客户端在每次系统重启后自动启动，请运行以下命令：

**CentOS 7：**

    # systemctl enable rsyslog.service 

**CentOS 6：**

    # chkconfig rsyslog on 

### 小结 ###

在本教程中，我演示了如何将CentOS系统转变成rsyslog客户端以强制它发送日志消息到远程rsyslog服务器。这里我假定rsyslog客户端和服务器之间的连接是安全的（如，在有防火墙保护的公司网络中）。不管在任何情况下，都不要配置rsyslog客户端将日志消息通过不安全的网络转发，或者，特别是通过互联网转发，因为syslog协议是一个明文协议。要进行安全传输，可以考虑使用[TLS/SSL][2]来加密日志消息的传输。

--------------------------------------------------------------------------------

via: http://xmodulo.com/configure-rsyslog-client-centos.html

作者：[Caezsar M][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/caezsar
[1]:http://xmodulo.com/configure-syslog-server-linux.html
[2]:http://www.rsyslog.com/doc/rsyslog_tls.html
