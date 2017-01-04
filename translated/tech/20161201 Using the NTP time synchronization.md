使用 NTP 进行时间同步
==========

NTP 是通过网络来同步时间的一种 TCP/IP 协议。通常客户端向服务器请求当前的时间，并根据结果来设置其时钟。

这个描述是挺简单的，实现这一功能是极为复杂的——首先要有多层 NTP 服务器，其中的第一次链接着原子时钟，第二层、第三层则担起负载均衡的责任，以处理因特网传来的所有请求。并且，客户端可能也超乎你想象的复杂——时间同步存在着通讯延迟，使用一种方法来调整时间并不能使用所有运行在服务器中进程的到同步设置。幸运的是，所有的这些复杂性都进行了封装，你是不可见也不需要见到的。

在 Ubuntu 中，是使用 ntpdate 和 ntpd 来同步时间的。

* [timedatectl](#timedatectl)
* [timesyncd](#timesyncd)
* [ntpdate](#ntpdate)
* [timeservers](#timeservers)
* [ntpd](#ntpd)
* [安装](#installation)
* [配置](#configuration)
* [View status](#status)
* [PPS Support](#Support)
* [参考资料](#reference)

### <sapan id="timedatectl">timedatectl</sapan>

在最新的 Ubuntu 版本中，timedatectl 替代了老旧的 ntpdate。默认情况下，timedatectl 在系统启动的时候会立刻同步时间，同时还开启 socket 以便恢复网络之后进行同步。

如果已安装 ntpdate / ntp，timedatectl 会让你使用之前的设置。这样确保了在有两个时间同步服务的时候不会相互冲突，同时在你进行的时候还保留原本的配置。但这也意味着升级时旧版本的 ntp / ntpdate 仍会安装，迁移到新的 systemd 服务是默认禁用的。

### <sapan id="timesyncd">timesyncd</sapan>

在最新的 Ubuntu 版本中，timesyncd 替代了 ntpd 的客户端的部分，它默认情况下会定期检测并同步时间。它还会在本地存储时间更新计划，以便在系统重启时做时间单步递增调整。

通过 timedatectl 和 timesyncd 设置的当前的时间状态和时间配置，现在可以使用 timedatectl status 命令来进行确认。

```
timedatectl status
      Local time: Fri 2016-04-29 06:32:57 UTC
  Universal time: Fri 2016-04-29 06:32:57 UTC
        RTC time: Fri 2016-04-29 07:44:02
       Time zone: Etc/UTC (UTC, +0000)
 Network time on: yes
NTP synchronized: no
 RTC in local TZ: no
```

如果安装了 NTP，并用它替代 timedatectl 来同步时间，则 "NTP synchronized" 是 "yes"。

timedatectl 和 timesyncd 用以同步时间的 nameserver 可以通过 /etc/systemd/timesyncd.conf 来指定，另外还有一个非常灵活的配置目录 /etc/systemd/timesyncd.conf.d/。

### <sapan id="ntpdate">ntpdate</sapan>

由于 timedatectl 的存在，各发行版已经弃用了 ntpdate，所有默认不在进行安装。如果你安装了，它会在系统启动的时候根据 Ubuntu 的 NTP 服务器来设置你电脑的时间。之后的任意时刻中，它会有一个接口用来重新尝试同步时间——在这期间只要其涵盖的时间增量不是太大，它就会慢慢偏移时间。该行为可以通过 -B/-b 开关来进行控制。

```
ntpdate ntp.ubuntu.com
```

### <sapan id="timeservers">timeservers</sapan>

默认情况下，基于 systemd 的工具都是从 ntp.ubuntu.com 请求时间同步的。经典的 ntpd 服务基本上都是使用的 [0-3].ubuntu.pool.ntp.org 池，这等同于 ntp.ubuntu.com，并且需要的话还支持 IPv6。如果说你想强制使用 IPv6，可以使用 ipv6.ntp.ubuntu.com，当然这并非默认配置。

### <sapan id="ntpd">ntpd</sapan>

ntp 的守护进程 ntpd 会计算你的系统时钟的时间偏移量并且持续的进行调整，所以不会出现时间差距较大的更正，以保证不会导致不连续的日志。该进程只花费少量的进程资源和内存，但对于现代的服务器来说实在是微不足道的了。

### <sapan id="installation">安装</sapan>

打开终端命令行来安装 ntpd：

```
sudo apt install ntp
```

### <sapan id="configuration">配置</sapan>

编辑 /etc/ntp.conf ——增加/移除 server 行。默认配置有一下服务器：

```
# Use servers from the NTP Pool Project. Approved by Ubuntu Technical Board
# on 2011-02-08 (LP: #104525). See http://www.pool.ntp.org/join.html for
# more information.
server 0.ubuntu.pool.ntp.org
server 1.ubuntu.pool.ntp.org
server 2.ubuntu.pool.ntp.org
server 3.ubuntu.pool.ntp.org
```

修改配置文件之后，你需要重新加载 ntpd：

```
sudo systemctl reload ntp.service
```

### <sapan id="status">查看状态</sapan>

使用 ntpq 来查看更多信息：

```
# sudo ntpq -p
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
+stratum2-2.NTP. 129.70.130.70    2 u    5   64  377   68.461  -44.274 110.334
+ntp2.m-online.n 212.18.1.106     2 u    5   64  377   54.629  -27.318  78.882
*145.253.66.170  .DCFa.           1 u   10   64  377   83.607  -30.159  68.343
+stratum2-3.NTP. 129.70.130.70    2 u    5   64  357   68.795  -68.168 104.612
+europium.canoni 193.79.237.14    2 u   63   64  337   81.534  -67.968  92.792
```

### <sapan id="Support">PPS Support</sapan>

从 Ubuntu 16.04 开始，ntp 支持 PPS 规范，增强了本地时间资源已提供更高的精度。查看下边列出的链接来获取更多信息。

### <sapan id="reference">参考资料</sapan>

* 参考 [Ubuntu Time][1] wiki 页来获取更多信息

* [ntp.org，网络时间协议项目主页][2]

* [ntp.org,关于配置 PPS 的 FAQ][3]

--------------------------------------------------------------------------------

via: https://help.ubuntu.com/lts/serverguide/NTP.html

作者：[Ubuntu][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://help.ubuntu.com/lts/serverguide/NTP.html
[1]:https://help.ubuntu.com/community/UbuntuTime
[2]:http://www.ntp.org/
[3]:http://www.ntp.org/ntpfaq/NTP-s-config-adv.htm#S-CONFIG-ADV-PPS
