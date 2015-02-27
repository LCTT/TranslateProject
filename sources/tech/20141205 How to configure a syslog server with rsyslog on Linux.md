theo-l is translating

How to configure a syslog server with rsyslog on Linux
如何在linux上通过rsyslog来配置一个syslog服务器
========================================================================
A syslog server represents a central log monitoring point on a network, to which all kinds of devices including Linux or Windows servers, routers, switches or any other hosts can send their logs over network. By setting up a syslog server, you can filter and consolidate logs from different hosts and devices into a single location, so that you can view and archive important log messages more easily.
syslog服务器表示一个用来监控一个网络中的端点--所有能够通过网络来发送日志的设施（包含了Linux或Windows服务器，路由器，交换机以及其他主机）--的中央日志。 通过设置一个syslog服务器，可以将不同设施/主机发送的日志，过滤和合并到一个独立的位置，这样使得你更容易地查看和获取重要的日志消息。

On most Linux distributions, **rsyslog** is the standard syslog daemon that comes pre-installed. Configured in a client/server architecture, **rsyslog** can play both roles; as a syslog server **rsyslog** can gather logs from other devices, and as a syslog client, **rsyslog** can transmit its internal logs to a remote syslog server.
**rsyslog** 被作为标准的syslog守护进程预装在了大多数的Linux发行版中。在客户端/服务器架构的配置下，**rsyslog**同时扮演了两种角色：1.作为一个syslog服务器，**rsyslog**可以收集来自其他设施的日志信息；2.作为一个syslog客户端，**rsyslog**可以将其内部的日志信息传输到远程的syslog服务器。


In this tutorial, we cover how to configure a centralized syslog server using **rsyslog** on Linux. Before we go into the details, it is instructive to go over syslog standard first.
在此，我们演示了在linux上如何通过**rsyslog**来配置一个中心化syslog服务器。 在进入详解之前，先温习一下syslog标准。

### Basic of Syslog Standard ###
### syslog标准基础###

When logs are collected with syslog mechanism, three important things must be taken into consideration:
当通过syslog机制来收集日志时，有3个必须要考虑到的重要事情：

- **Facility level**: what type of processes to monitor
- **设施层级**: 监听何种类型的进程

- **Severity (priority) level**: what type of log messages to collect
- **严重性 （优先） 级别**: 收集何种类型的日志消息

- **Destination**: where to send or record log messages 
- **目标**: 发送或记录日志消息到何处

Let's take a look at how the configuration is defined in more detail.
现在我们更加深入地了解一下配置是如何定义的。


The facility levels define a way to categorize internal system processes. Some of the common standard facilities in Linux are:
设施层级定义了一种用来对内部系统进程进行分类的方法，linux中的一些常见的设施包括:

- **auth**: messages related to authentication (login)
- **auth**: 身份验证相关的消息（登录时）
- **cron**: messages related to scheduled processes or applications
- **cron**: 进程或应用调度相关的消息
- **daemon**: messages related to daemons (internal servers)
- **daemon**: 守护进程相关的消息（内部服务器）
- **kernel**: messages related to the kernel
- **kernel**: 内核相关的消息
- **mail**: messages related to internal mail servers
- **mail**: 内部邮件服务器相关的消息
- **syslog**: messages related to the syslog daemon itself
- **syslog**: syslog 守护进程本身相关的消息
- **lpr**: messages related to print servers
- **lpr**: 打印服务相关的消息
- **local0 - local7**: messages defined by user (local7 is usually used by Cisco and Windows servers) 
- **local0 - local7**: 用户自定义的消息 （local7 通常被Cisco 和 Windows 服务器 使用）

The severity (priority) levels are standardized, and defined by using standard abbreviation and an assigned number with number 7 being the highest level of all. These levels are: 
严重性（优先）级别是通过标准的缩写和赋予的数字来进行定义和标准化的，其中的数字7具有最高的级别，这些级别包含了：

- emerg: Emergency（紧急）- 0
- alert: Alerts （报警）- 1
- crit: Critical (关键）- 2
- err: Errors （错误）- 3
- warn: Warnings （警告）- 4
- notice: Notification （通知）- 5
- info: Information （消息）- 6
- debug: Debugging （调试）- 7 

Finally, the destination statement enforces a syslog client to perform one of three following tasks: (1) save log messages on a local file, (2) route them to a remote syslog server over TCP/UDP, or (3) send them to stdout such as a console.
最后，目标语句迫使一个syslog客户端来执行以下3个任务中的一个：1.保存日志消息到一个本地文件；2. 通过TCP/UDP将消息路由到远程的syslog服务器中
；3.将其发送到一个标准输出中，例如控制台。

In rsyslog, syslog configuration is structured based on the following schema.
在rsyslog, syslog配置是基于以下模式进行结构化的。

    [facility-level].[severity-level]  [destination]

### Configure Rsyslog on Linux ###
### 在Linux中配置Rsyslog###

Now that we understand syslog, it's time to configure a Linux server as a central syslog server using rsyslog. We will also see how to configure a Windows based system as a syslog client to send internal logs to the syslog server.
在我们理解syslog之后，现在是时候来通过rsyslog来将一个Linux服务器配置为一个中心syslog服务器了，另外我们也将看到如何将基于Windows的系统配置为一个syslog客户端来发送内部日志到该syslog服务器中。

#### Step One: Initial System Requirements ####
### 第1步: 初始化系统需求 ###

To set up a Linux host as a central log server, we need to create a separate /var partition, and allocate a large enough disk size or create a LVM special volume group. That way, the syslog server will be able to sustain the exponential growth of collected logs over time.

#### Step Two: Enable Rsyslog Daemon ####

rsyslog daemon comes pre-installed on modern Linux distributions, but is not enabled by default. To enable rsyslog daemon to receive external messages, edit its configuration file located in /etc/rsyslog.conf.

Once the file is opened for editing, search and uncomment the below two lines by removing the # sign from the beginning of lines.

    $ModLoad imudp
    $UDPServerRun 514

This will enable rsyslog daemon to receive log messages on UDP port 514. UDP is way faster than TCP, but does not provide reliability on data flow the same way as TCP does. If you need to reliable delivery, you can enable TCP by uncommenting the following lines.

    $ModLoad imtcp
    $InputTCPServerRun 514 

Note that both TCP and UDP can be set on the server simultaneously to listen on TCP/UDP connections.

#### Step Three: Create a Template for Log Receipt ####

In the next step we need to create a template for remote messages, and tell rsyslog daemon how to record messages received from other client machines.

Open /etc/rsyslog.conf with a text editor, and append the following template before the GLOBAL DIRECTIVES block:

    $template RemoteLogs,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log" *
    *.*  ?RemoteLogs
    & ~

This template needs a little explanation. The $template RemoteLogs directive ("RemoteLogs" string can be changed to any other descriptive name) forces rsyslog daemon to write log messages to separate local log files in /var/log/, where log file names are defined based on the hostname of the remote sending machine as well as the remote application that generated the logs. The second line ("*.* ?RemoteLogs") implies that we apply RemoteLogs template to all received logs.

The "& ~" sign represents a redirect rule, and is used to tell rsyslog daemon to stop processing log messages further, and not write them locally. If this redirection is not used, all the remote messages would be also written on local log files besides the log files described above, which means they would practically be written twice. Another consequence of using this rule is that the syslog server's own log messages would only be written to dedicated files named after machine's hostname. 

If you want, you can direct log messages with a specific facility or severity level to this new template using the following schema.

    [facility-level].[severity-level]    ?RemoteLogs

For example:

Direct all internal authentication messages of all priority levels to RemoteLogs template:

    authpriv.*   ?RemoteLogs 

Direct informational messages generated by all system processes, except mail, authentication and cron messages to RemoteLogs template:

    *.info,mail.none,authpriv.none,cron.none    ?RemoteLogs

If we want all received messages from remote clients written to a single file named after their IP address, you can use the following template. We assign a new name "IpTemplate" to this template.

    $template IpTemplate,"/var/log/%FROMHOST-IP%.log" 
    *.*  ?IpTemplate 
    & ~ 

After we have enabled rsyslog daemon and edited its configuration file, we need to restart the daemon.

On Debian, Ubuntu or CentOS/RHEL 6:

    $ sudo service rsyslog restart 

On Fedora or CentOS/RHEL 7:

    $ sudo systemctl restart rsyslog 

We can verify that rsyslog daemon is functional by using netstat command.

     $ sudo netstat -tulpn | grep rsyslog 

The output should look like the following in case rsyslog daemon listens on UDP port. 

    udp     0 0    0.0.0.0:514    0.0.0.0:*      551/rsyslogd 
    udp6    0 0    :::514         :::*           551/rsyslogd 

If rsyslog daemon is set up to listen on TCP connections, the output should look like this.

    tcp     0 0     0.0.0.0:514   0.0.0.0:*     LISTEN    1891/rsyslogd 
    tcp6    0 0     :::514        :::*          LISTEN    1891/rsyslogd

#### Send Windows Logs to a Remote Rsyslog Server ####

To forward a Windows based client's log messages to our rsyslog server, we need a Windows syslog agent. While there are a multitude of syslog agents that can run on Windows, we can use [Datagram SyslogAgent][1], which is a freeware program.

After downloading and installing the syslog agent, we need to configure it to run as a service. Specify the protocol though which it will send data, the IP address and port of a remote rsyslog server, and what type of event logs should be transmitted as follows.

![](https://farm8.staticflickr.com/7509/15305930594_27b7f4440a_o.jpg)

After we have set up all the configurations, we can start the service and watch the log files on the central rsyslog server using tailf command line utility.

### Conclusion ###

By creating a central rsyslog server that can collect log files of local or remote hosts, we can get a better idea on what is going on internally in their systems, and can debug their problems more easily should any of them become unresponsive or crash.

--------------------------------------------------------------------------------

via: http://xmodulo.com/configure-syslog-server-linux.html

作者：[Caezsar M][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/caezsar
[1]:http://www.syslogserver.com/download.html
