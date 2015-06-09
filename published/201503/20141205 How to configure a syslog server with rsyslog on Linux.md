在 Linux 上配置一个 syslog 服务器
========================================================================
syslog服务器可以用作一个网络中的日志监控中心，所有能够通过网络来发送日志的设施（包含了Linux或Windows服务器，路由器，交换机以及其他主机）都可以把日志发送给它。 通过设置一个syslog服务器，可以将不同设施/主机发送的日志，过滤和合并到一个独立的位置，这样使得你更容易地查看和获取重要的日志消息。

**rsyslog** 作为标准的syslog守护进程，预装在了大多数的Linux发行版中。在客户端/服务器架构的配置下，**rsyslog**同时扮演了两种角色：1.作为一个syslog服务器，**rsyslog**可以收集来自其他设施的日志信息；2.作为一个syslog客户端，**rsyslog**可以将其内部的日志信息传输到远程的syslog服务器。

在此，我们演示了在linux上如何通过**rsyslog**来配置一个中心化syslog服务器。 在进入详解之前，先温习一下syslog标准。

### syslog标准基础###

当通过syslog机制来收集日志时，有3个必须要考虑到的重要事情：

- **设施层级**: 监听何种类型的进程
- **严重性 （优先） 级别**: 收集何种级别的日志消息
- **目标**: 发送或记录日志消息到何处

现在我们更加深入地了解一下配置是如何定义的。

设施层级定义了一种用来对内部系统进程进行分类的方法，linux中的一些常见的设施包括:

- **auth**: 身份验证相关的消息（登录时）
- **cron**: 进程或应用调度相关的消息
- **daemon**: 守护进程相关的消息（内部服务器）
- **kernel**: 内核相关的消息
- **mail**: 内部邮件服务器相关的消息
- **syslog**: syslog 守护进程本身相关的消息
- **lpr**: 打印服务相关的消息
- **local0 - local7**: 用户自定义的消息 （local7 通常被Cisco 和 Windows 服务器 使用）

严重性（优先）级别有固定的标准缩写和指代的值，其中的数字7具有最高的级别，这些级别包含了：

- emerg: Emergency（紧急）- 0
- alert: Alerts （报警）- 1
- crit: Critical (关键）- 2
- err: Errors （错误）- 3
- warn: Warnings （警告）- 4
- notice: Notification （通知）- 5
- info: Information （消息）- 6
- debug: Debugging （调试）- 7 

最后，目标语句会让一个syslog客户端来执行以下三个任务之一：

1. 保存日志消息到一个本地文件；
2. 通过TCP/UDP将消息路由到远程的syslog服务器中；
3. 将其发送到一个标准输出中，例如控制台。

在 rsyslog里, syslog的配置是基于以下模式进行结构化的。

    [facility-level].[severity-level]  [destination]

### 在Linux中配置Rsyslog###

在我们理解syslog之后，现在可以通过rsyslog来将一个Linux服务器配置为一个中心syslog服务器了，另外我们也将看到如何在一个Windows的系统上配置一个syslog客户端来发送内部日志到该syslog服务器中。

### 第1步: 初始化系统需求 ###

要将linux主机设置为一个中央日志服务器， 我们需要创建一个分离的 /var 分区，并分配足够大的磁盘空间或者创建一个特殊的LVM卷组。这样就会使得syslog服务器能够承担在日积月累收集日志所带来的潜在增长。

### 第2步: 让rsyslog 后台进程生效 ###

rsyslog守护进程来自于当前的linux发布版本的预装模块，但是默认并没有启动。为了能够让rsyslog守护进程能够接受外部的消息，需要编辑其配置文件/etc/rsyslog.conf.

打开文件进行编辑，查找到下面的两行所在的位置，通过删除其行首的#字符来取消注释。

    $ModLoad imudp
    $UDPServerRun 514

这会使得rsysolog守护进程能够在UDP端口514上接受日志消息了---UDP是一种比TCP速度快，但是并不具有TCP一样的数据流的可靠性。所以如果你需要使用可靠的传送机制，就可以通过取消以下行的注释。

    $ModLoad imtcp
    $InputTCPServerRun 514 

需要注意的是，TCP和UDP可以被同时生效来监听TCP/UDP 连接。

### 第3步：创建日志接收模板###

接下来的这步，需要我们来为远程消息创建模板，并告知rsyslog守护进程如何记录从其他客户端机器所接受到的消息。

使用文本编辑器来打开 /etc/rsyslog.conf，然后在GLOBAL DIRECTIVE块前追加以下的模板。

    $template RemoteLogs,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log" *
    *.*  ?RemoteLogs
    & ~

在此对该模板进行简单解释，$template RemoteLogs（这里“RemoteLogs” 字符串可以为任何其他的描述性的名称）指令使rsyslog后台进程将日志消息写到/var/log下的单独的本地日志文件中，其中日志文件的名称是基于远程日志发送机器的主机名以及生成该日志的应用程序名进行定义的。其中第二行暗示了我们将RemoteLogs模板应用到所有接收到的日志上。

符号"& ~"表示了一个重定向规则，被用来告知rsyslog守护进程停止对日志消息的进一步处理，并且不要在本地写入。如果没有使用该重定向规则，那么所有的远程消息都会在写入上述描述的日志文件之外同时被写入到本地日志文件，这就意味着日志消息实际上被写了两次。使用该规则的另外一个结果就是syslog服务器本身的日志消息只会被以该机器主机名命名的专有文件中。

如果你想要的话，也可以使用下面的模式对特定的设备或严重性级别使用新的模板直接来记录日志消息。

    [facility-level].[severity-level]    ?RemoteLogs

例如：

将全部优先级别的所有内部用户验证消息指定为RemoteLogs模板：

    authpriv.*   ?RemoteLogs 

将所有系统进程中除开mail、用户验证和cron消息之外的进程产生的消息级别的日志指定为RemoteLogs模板：

    *.info,mail.none,authpriv.none,cron.none    ?RemoteLogs

如果我们想要将所有从远程客户端接受到的消息写入到一个以它们的IP地址命名的单个文件中，可以使用以下的模板。在此我们为该模板赋予了“IpTemplate”名称。

    $template IpTemplate,"/var/log/%FROMHOST-IP%.log" 
    *.*  ?IpTemplate 
    & ~ 

在我们启用rsyslog守护进程并编辑好配置文件之后，需要重启该守护进程。

在 Debian，Ubuntu 或 CentOS/RHEL 6中：

    $ sudo service rsyslog restart 

在 Fedora 或 CentOS/RHEL 7中：

    $ sudo systemctl restart rsyslog 

我们可以通过netstat命令来验证rsyslog守护进程是否正常工作。

     $ sudo netstat -tulpn | grep rsyslog 

在UDP监听端口下工作的rsyslog守护进程会有类似下面的输出。

    udp     0 0    0.0.0.0:514    0.0.0.0:*      551/rsyslogd 
    udp6    0 0    :::514         :::*           551/rsyslogd 

如果rsyslog守护进程被设置在TCP连接端口，那么应该有类似下面所示的输出。

    tcp     0 0     0.0.0.0:514   0.0.0.0:*     LISTEN    1891/rsyslogd 
    tcp6    0 0     :::514        :::*          LISTEN    1891/rsyslogd

### 发送Windows日志到一个远程的rsyslog服务器###

要将一个Windows客户端的日志消息转发到我们的rsyslog服务器，需要一个安装 Windows syslog 代理。当然，有许多的syslog代理可以在windows上运行，在此我们可以使用一个自由软件程序 [Datagram SyslogAgent][1].

在下载安装该syslog代理后，需要将其配置为作为服务运行。指定使用何种协议来发送数据，以及远程rsyslog服务器的IP地址和端口，最后指定应该传输的事件日志类型，如下所示。

![](https://farm8.staticflickr.com/7509/15305930594_27b7f4440a_o.jpg)

在我们完成所有的这些配置之后，我们就可以启动该服务并且在中央rsyslog服务器中使用命令行工具tail -f来查看日志文件了。

### 总结###

通过创建一个可以收集本地和远程主机的中央rsyslog服务器，我们可以更好地了解在这些系统内部究竟发生着什么，而且可以更加容易地调试它们的问题，是否在它们之间有任何延迟或崩溃存在。

--------------------------------------------------------------------------------

via: http://xmodulo.com/configure-syslog-server-linux.html

作者：[Caezsar M][a]
译者：[theo-l](https://github.com/theo-l)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/caezsar
[1]:http://www.syslogserver.com/download.html
