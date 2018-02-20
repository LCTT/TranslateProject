在 Debian 9 上使用 Rsyslog 安装一台中央日志服务器
======

在 Linux 上，日志文件包含了系统功能的信息，系统管理员经常使用日志来确认机器上的问题所在。日志可以帮助管理员去还原在过去的时间中在系统中发生的事件。一般情况下，Linux 中所有的日志文件都保存在 **/var/log** 目录下。在这个目录中，有几种类型的日志文件保存着各种信息。比如，记录系统事件的日志文件、记录安全相关信息的日志文件、内核专用的日志文件、用户或者 cron 作业使用的日志文件。日志文件的主要作用是为系统调试。Linux 中的大部分的日志文件都由 rsyslogd 服务来管理。在最新的 Linux 发行版中，日志文件也可能是由 journald 系统服务来管理和控制的。journald 服务是 systemd 初始化程序的一部分。日志守护程序保存的日志以二进制的格式、以易失性的方式写入到内存和 /run/log/journal/ 中的 Ring 缓冲区中，但是，日志服务也可以配置为永久存储系统日志信息。

在 Linux 中，可以配置运行一个 Rsyslog 服务器来中央化管理日志，在一个流行的服务端—客户端模式中，通过 TCP 或者 UDP 传输协议基于网络来发送日志信息，或者从网络设备、服务器、路由器、交换机、以及其它系统或嵌入式设备中接受生成的日志。

Rsyslog 守护程序可以被同时配置为以客户端或者服务端方式运行。配置作为一台服务器时，Rsyslog 将缺省监听TCP 和 UDP 的 514 端口，来收集远程系统基于网络发送的日志信息。配置为客户端运行时，Rsyslog 将通过相同的 TCP 或 UDP 端口基于网络来发送内部日志信息。

Rsyslog 可以根据选定的属性和动作来过滤 syslog 信息。Rsyslog 拥有的过滤器如下：

  1. 设备或者优先级过滤器
  2. 基于特性的过滤器
  3. 基于表达式的过滤器



 **设备** 过滤器代表了生成日志的 Linux 内部子系统。它们目前的分类如下：

  * **auth/authpriv** = 由验证进程产生的信息
  * **cron** = cron 任务相关的日志
  * **daemon** = 正在运行的系统服务相关的信息
  * **kernel** = Linux 内核信息
  * **mail** = 邮件服务器信息
  * **syslog** = syslog 或者其它守护程序（DHCP 服务器发送的日志在这里）相关的信息
  * **lpr** = 打印机或者打印服务器信息
  * **local0 - local7** = 管理员控制下的自定义信息



 **优先级或者严重程度** 级别分配如下所述的一个关键字或者一个数字。

  * **emerg** = 紧急 - 0
  * **alert** = 警报 - 1
  * **err** = 错误 - 3
  * **warn** = 警告 - 4
  * **notice** = 提示 - 5
  * **info** = 信息 - 6
  * **debug** = 调试 - 7 最高级别



也有一个 Rsyslog 专用的关键字，比如星号（*）可以用来定义所有的设备和优先级，**none** 关键字更具体地表示没有优先级，等号（=）表示仅那个优先级，感叹号（！）表示取消这个优先级。

Rsyslog 的动作部分由声明的 **目的地** 来表示。日志信息的目的地可以存储在文件系统中 /var/log/ 目录下的一个文件中，通过命名管道或者 FIFO 作为另一个本地进程的输入。日志信息也可以直达用户，或者丢弃到一个“黑洞”（/dev/null）中、或者发送到标准输出、或者通过一个 TCP/UDP 协议发送到一个远程 syslog 服务器。日志信息也可以保存在一个数据库中，比如 MySQL 或者 PostgreSQL。

### 配置 Rsyslog 为服务器

在大多数 Linux 发行版中 Rsyslog 守护程序是自动安装的。如果你的系统中没有安装 Rsyslog，你可以根据你的系统发行版执行如下之一的命令去安装这个服务。_运行这个命令必须有 root 权限_。

在基于 Debian 的发行版中：

`sudo apt-get install rsyslog`

在基于 RHEL 的发行版中，比如像 CentOS：

`sudo yum install rsyslog`

验证 Rsyslog 守护进程是否在你的系统中运行，根据发行版不同，可以选择运行下列的命令：

在新的使用 systemd 的 Linux 发行版中：

`systemctl status rsyslog.service`

在老的使用 init 的 Linux 发行版中：

`service rsyslog status`

`/etc/init.d/rsyslog status`

启动 rsyslog 守护进程运行如下的命令。

在使用 init 的老的 Linux 版本：

`service rsyslog start`

`/etc/init.d/rsyslog start`

在最新的 Linux 发行版：

`systemctl start rsyslog.service`

安装一个 rsyslog 程序运行为服务器模式，可以编辑主要的配置文件 **/etc/rsyslog.conf** 。可以使用下列所示的命令去改变它。

`sudo vi /etc/rsyslog.conf`

为允许在 UDP 的 514 端口上接收日志信息，找到并删除下列行前面的井号（#）以取消注释。缺省情况下，UDP 端口用于 syslog 去接收信息。
```
$ModLoad imudp
$UDPServerRun 514
```

因为在网络上使用 UDP 协议交换数据并不可靠，你可以设置 Rsyslog 使用 TCP 协议去向远程服务器输出日志信息。为启用 TCP 协议去接受日志信息，打开 **/etc/rsyslog.conf** 文件并删除如下行前面的井号（#）以取消注释。这将允许 rsyslog 守护程序去绑定并监听 TCP 协议的 514 端口。
```
$ModLoad imtcp
 $InputTCPServerRun 514 ****
```

_在 rsyslog 上可以**同时**启用两种协议_。

如果你想去指定那个发送者被允许访问 rsyslog 守护程序，可以在启用协议行的后面添加如下的行：
```
$AllowedSender TCP, 127.0.0.1, 10.110.50.0/24, *.yourdomain.com
```

在接收入站日志信息之前，你需要去创建一个 rsyslog 守护程序解析日志的新模板，这个模板将指示本地 Rsyslog 服务器在哪里保存入站的日志信息。在 **$AllowedSender** 行后以如下示例去创建一个合适的模板。
```
$template Incoming-logs,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log" 
*.*  ?Incoming-logs
& ~
```

为了仅接收内核生成的日志信息，可以使用如下的语法。

```
kern.*   ?Incoming-logs
```

接收到的日志由上面的模板来解析，它将保存在本地文件系统的 /var/log/ 目录的文件中，之后的是以客户端主机名客户端设备名命名的日志文件名字：%HOSTNAME% 和 %PROGRAMNAME% 变量。

下面的 **& ~** 重定向规则，配置 Rsyslog 守护程序去保存入站日志信息到由上面的变量名字指定的文件中。否则，接收到的日志信息将被进一步处理，并将保存在本地的日志文件中，比如，/var/log/syslog 文件中。

为添加一个规则去丢弃所有与邮件相关的日志信息，你可以使用下列的语法。
```
mail.* ~
```

可以在输出文件名中使用的其它变量还有：%syslogseverity%、%syslogfacility%、%timegenerated%、%HOSTNAME%、%syslogtag%、%msg%、%FROMHOST-IP%、%PRI%、%MSGID%、%APP-NAME%、%TIMESTAMP%、%\$year%、%\$month%、%\$day%。

以版本 7 启动的 Rsyslog，将使用一个新的配置格式，在一个 Rsyslog 服务器中声明一个模板。

一个版本 7 的模板应该看起来是如下行的样子。
```
template(name="MyTemplate" type="string"
         string="/var/log/%FROMHOST-IP%/%PROGRAMNAME:::secpath-replace%.log"
        )
```

另一种模式是，你也可以使用如下面所示的样子去写上面的模板：

```
template(name="MyTemplate" type="list") {
    constant(value="/var/log/")
    property(name="fromhost-ip")
    constant(value="/")
    property(name="programname" SecurePath="replace")
    constant(value=".log")
    } **
**
```

为了让 Rsyslog 配置文件的变化生效，你必须重启守护程序来加载新的配置。

`sudo service rsyslog restart`

`sudo systemctl restart rsyslog`

在一个 Debian 的 Linux 系统上去检查它监听哪个套接字，你可以用 root 权限去运行 **netstat** 命令。将输出传递给一个过滤程序，比如 **grep**。

`sudo netstat -tulpn | grep rsyslog`

**请注意：** 为了允许建立入站连接，你必须在防火墙上打开 Rsyslog 的端口。

在使用 Firewalld 的基于 RHEL 的发行版上，运行如下的命令：

`firewall-cmd --permanent --add-port=514/tcp`

`firewall-cmd --permanent --add-port=514/tcp`

`firewall-cmd -reload`

在使用 UFW 的基于 Debian 的发行版上，运行如下的命令：

`ufw allow 514/tcp`

`ufw allow 514/udp`

Iptables 防火墙规则：

`iptables -A INPUT -p tcp -m tcp --dport 514 -j ACCEPT`

`iptables -A INPUT -p udp --dport 514 -j ACCEPT`

### 配置 Rsyslog 作为一个客户端

启用 Rsyslog 守护程序以客户端模式运行，并将输出的本地日志信息发送到远程 Rsyslog 服务器，编辑 **/etc/rsyslog.conf** 文件并增加下列的行：

```
*. * @IP_REMOTE_RSYSLOG_SERVER:514

*. * @FQDN_RSYSLOG_SERVER:514
```

这个行启用了 Rsyslog 服务，并将输出的所有内部日志发送到一个远处的 UDP 的 514 端口上运行的 Rsyslog 服务器上。

为了使用 TCP 协议去发送日志信息，使用下列的模板：
```
*. *  @@IP_reomte_syslog_server:514
```

输出所有优先级的、仅与 cron 相关的日志信息到一个 Rsyslog 服务器上，使用如下的模板：
```
cron.* @ IP_reomte_syslog_server:514
```

在 /etc/rsyslog.conf 文件中添加下列行，可以在 Rsyslog 服务器无法通过网络访问时，临时将客户端的日志信息存储在它的一个磁盘缓冲文件中，当网络或者服务器恢复时，再次进行发送。
```
$ActionQueueFileName queue
$ActionQueueMaxDiskSpace 1g
$ActionQueueSaveOnShutdown on
$ActionQueueType LinkedList
$ActionResumeRetryCount -1
```

为使上述规则生效，需要重新 Rsyslog 守护程序，以激活为客户端模式。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/rsyslog-centralized-log-server-in-debian-9/

作者：[Matt Vas][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
