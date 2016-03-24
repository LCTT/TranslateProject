如何在 CentOS 中设置 NTP 服务器
================================================================================

网络时间协议(NTP)用来同步网络上不同主机的系统时间。你管理的所有主机都可以和一个指定的被称为 NTP 服务器的时间服务器同步它们的时间。而另一方面，一个 NTP 服务器会将它的时间和任意公共 NTP 服务器，或者你选定的服务器同步。由 NTP 管理的所有系统时钟都会同步精确到毫秒级。

在公司环境中，如果他们不想为 NTP 传输打开防火墙，就有必要设置一个内部 NTP 服务器，然后让员工使用内部服务器而不是公共 NTP 服务器。在这个指南中，我们会介绍如何将一个 CentOS 系统配置为 NTP 服务器。在介绍详细内容之前，让我们先来简单了解一下 NTP 的概念。

### 为什么我们需要 NTP? ###

由于制造工艺多种多样，所有的(非原子)时钟并不按照完全一致的速度行走。有一些时钟走的比较快而有一些走的比较慢。因此经过很长一段时间以后，一个时钟的时间慢慢的和其它的发生偏移，这就是常说的 “时钟漂移” 或 “时间漂移”。为了将时钟漂移的影响最小化，使用 NTP 的主机应该周期性地和指定的 NTP 服务器交互以保持它们的时钟同步。

在不同的主机之间进行时间同步对于计划备份、[入侵检测][1]记录、[分布式任务调度][2]或者事务订单管理来说是很重要的事情。它甚至应该作为日常任务的一部分。

### NTP 的层次结构 ###

NTP 时钟以层次模型组织。层级中的每层被称为一个 *stratum（阶层）*。stratum 的概念说明了一台机器到授权的时间源有多少 NTP 跳。

![](https://farm8.staticflickr.com/7590/16645732413_3b7af58186_c.jpg)

Stratum 0 由没有时间漂移的时钟组成，例如原子时钟。这种时钟不能在网络上直接使用。Stratum N (N > 1) 层服务器从 Stratum N-1 层服务器同步时间。Stratum N 时钟能通过网络和彼此互联。

NTP 支持多达 15 个 stratum 的层级。Stratum 16 被认为是未同步的，不能使用的。

### 准备 CentOS 服务器 ###

现在让我们来开始在 CentOS 上设置 NTP 服务器。

首先，我们需要保证正确设置了服务器的时区。在 CentOS 7 中，我们可以使用 timedatectl 命令查看和更改服务器的时区(比如，"Australia/Adelaide"，LCTT 译注：中国可设置为 Asia/Shanghai )

    # timedatectl list-timezones | grep Australia
    # timedatectl set-timezone Australia/Adelaide
    # timedatectl

![](https://farm8.staticflickr.com/7605/16645732463_db75a0bdcd_o.png)

继续并使用 yum 安装需要的软件

    # yum install ntp

然后我们会添加全球 NTP 服务器用于同步时间。

    # vim /etc/ntp.conf

----------

    server 0.oceania.pool.ntp.org
    server 1.oceania.pool.ntp.org
    server 2.oceania.pool.ntp.org
    server 3.oceania.pool.ntp.org

默认情况下，NTP 服务器的日志保存在 /var/log/messages。如果你希望使用自定义的日志文件，那也可以指定。

    logfile /var/log/ntpd.log

如果你选择自定义日志文件，确保更改了它的属主和 SELinux 环境。

    # chown ntp:ntp /var/log/ntpd.log
    # chcon -t ntpd_log_t /var/log/ntpd.log

现在初始化 NTP 服务并确保把它添加到了开机启动。

    # systemctl restart ntp
    # systemctl enable ntp

### 验证 NTP Server 时钟 ###

我们可以使用 ntpq 命令来检查本地服务器的时钟如何通过 NTP 同步。

![](https://farm9.staticflickr.com/8713/16645732513_1823736ca8_b.jpg)

下面的表格解释了输出列。

<table id="content">
<tbody><tr>
<td>remote</td>
<td>源在 ntp.conf 中定义。‘*’ 表示当前使用的，也是最好的源；‘+’ 表示这些源可作为 NTP 源；‘-’ 标记的源是不可用的。</td>
</tr>
<tr>
<td>refid</td>
<td>用于和本地时钟同步的远程服务器的 IP 地址。</td>
</tr>
<tr>
<td>st</td>
<td>Stratum（阶层）</td>
</tr>
<tr>
<td>t</td>
<td>类型。 'u' 表示单播(unicast)。其它值包括本地(local)、多播(multicast)、广播(broadcast)。</td>
</tr>
<tr>
<td>when</td>
<td>自从上次和服务器交互后经过的时间(以秒数计)。</td>
</tr>
<tr>
<td>poll</td>
<td>和服务器的轮询间隔，以秒数计。</td>
</tr>
<tr>
<td>reach</td>
<td>表示和服务器交互是否有任何错误的八进制数。值 337 表示 100% 成功（即十进制的255）。</td>
</tr>
<tr>
<td>delay</td>
<td>服务器和远程服务器来回的时间。</td>
</tr>
<tr>
<td>offset</td>
<td>我们服务器和远程服务器的时间差异，以毫秒数计。</td>
</tr>
<tr>
<td>jitter</td>
<td>两次取样之间平均时差，以毫秒数计。</td>
</tr>
</tbody></table>

### 控制到 NTP 服务器的访问 ###

默认情况下，NTP 服务器允许来自所有主机的查询。如果你想过滤进来的 NTP 同步连接，你可以在你的防火墙中添加规则过滤流量。

    # iptables -A INPUT -s 192.168.1.0/24 -p udp --dport 123 -j ACCEPT
    # iptables -A INPUT -p udp --dport 123 -j DROP

该规则允许从 192.168.1.0/24 来的 NTP 流量(端口 UDP/123)，任何其它网络的流量会被丢弃。你可以根据需要更改规则。

### 配置 NTP 客户端 ###

#### 1. Linux ####

NTP 客户端主机需要 ntpupdate 软件包来和服务器同步时间。可以轻松地使用 yum 或 apt-get 安装这个软件包。安装完软件包之后，用服务器的 IP 地址运行下面的命令。

    # ntpdate <server-IP-address>

基于 RHEL 和 Debian 的系统命令都相同。

#### 2. Windows ####

如果你正在使用 Windows，在日期和时间设置(Date and Time settings)下查找网络时间(Internet Time)。

#### 3. Cisco 设备 ####

如果你想要同步 Cisco 设备的时间，你可以在全局配置模式下使用下面的命令。

    # ntp server <server-IP-address>

来自其它厂家的支持 NTP 的设备有自己的用于网络时间的参数。如果你想将设备和 NTP服务器同步时间，请查看设备的说明文档。

### 结论 ###

总而言之，NTP 是在你的所有主机上同步时钟的一个协议。我们已经介绍了如何设置 NTP 服务器并使支持 NTP 的设备和服务器同步时间。

希望能对你有所帮助。

--------------------------------------------------------------------------------

via: http://xmodulo.com/setup-ntp-server-centos.html

作者：[Sarmed Rahman][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://xmodulo.com/how-to-compile-and-install-snort-from-source-code-on-ubuntu.html
[2]:http://xmodulo.com/how-to-install-hdfs-and-hadoop-using.html