[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10951-1.html)
[#]: subject: (How To Verify NTP Setup (Sync) is Working or Not In Linux?)
[#]: via: (https://www.2daygeek.com/check-verify-ntp-sync-is-working-or-not-in-linux-using-ntpq-ntpstat-timedatectl/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 下确认 NTP 是否同步？
======

![](https://img.linux.net.cn/data/attachment/album/201906/08/215622oqdhiuhocsndijlu.jpg)

NTP 意即<ruby>网络时间协议<rt>Network Time Protocol</rt></ruby>，它通过网络同步计算机系统之间的时钟。NTP 服务器可以使组织中的所有服务器保持同步，以准确时间执行基于时间的作业。NTP 客户端会将其时钟与 NTP 服务器同步。

我们已经写了一篇关于 NTP 服务器和客户端安装和配置的文章。如果你想查看这些文章，请导航至以下链接。

  * [如何在 Linux 上安装、配置 NTP 服务器和客户端？][1]
  * [如何安装和配置 Chrony 作为 NTP 客户端？][2]

我假设我你经使用上述链接设置了 NTP 服务器和 NTP 客户端。现在，如何验证 NTP 设置是否正常工作？

Linux 中有三个命令可用于验证 NTP 同步情况。详情如下。在本文中，我们将告诉您如何使用所有这些命令验证 NTP 同步。

  * `ntpq`：ntpq 是一个标准的 NTP 查询程序。
  * `ntpstat`：显示网络世界同步状态。
  * `timedatectl`：它控制 systemd 系统中的系统时间和日期。

### 方法 1：如何使用 ntpq 命令检查 NTP 状态？

`ntpq` 实用程序用于监视 NTP 守护程序 `ntpd` 的操作并确定性能。

该程序可以以交互模式运行，也可以使用命令行参数进行控制。它通过向服务器发送多个查询来打印出连接的对等项列表。如果 NTP 正常工作，你将获得类似于下面的输出。

```
# ntpq -p

     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*CentOS7.2daygee 133.243.238.163  2 u   14   64   37    0.686    0.151  16.432
```

细节：

* `-p`：打印服务器已知的对等项列表以及其状态摘要。

### 方法 2：如何使用 ntpstat 命令检查 NTP 状态？

`ntpstat` 将报告在本地计算机上运行的 NTP 守护程序（`ntpd`）的同步状态。如果发现本地系统与参考时间源保持同步，则 `ntpstat` 将报告大致的时间精度。

`ntpstat` 命令根据 NTP 同步状态返回三种状态码。详情如下。

* `0`：如果时钟同步则返回 0。
* `1`：如果时钟不同步则返回 1。
* `2`：如果时钟状态不确定，则返回 2，例如 ntpd 不可联系时。

```
# ntpstat

synchronised to NTP server (192.168.1.8) at stratum 3
   time correct to within 508 ms
   polling server every 64 s
```

### 方法 3：如何使用 timedatectl 命令检查 NTP 状态？

[timedatectl 命令][3]用于查询和更改系统时钟及其在 systmed 系统中的设置。

```
# timedatectl
或
# timedatectl status

      Local time: Thu 2019-05-30 05:01:05 CDT
  Universal time: Thu 2019-05-30 10:01:05 UTC
        RTC time: Thu 2019-05-30 10:01:05
       Time zone: America/Chicago (CDT, -0500)
     NTP enabled: yes
NTP synchronized: yes
 RTC in local TZ: no
      DST active: yes
 Last DST change: DST began at
                  Sun 2019-03-10 01:59:59 CST
                  Sun 2019-03-10 03:00:00 CDT
 Next DST change: DST ends (the clock jumps one hour backwards) at
                  Sun 2019-11-03 01:59:59 CDT
                  Sun 2019-11-03 01:00:00 CST
```

### 更多技巧

Chrony 是一个 NTP 客户端的替代品。它可以更快地同步系统时钟，时间精度更高，对于一直不在线的系统尤其有用。

chronyd 较小，它使用较少的内存，只在必要时才唤醒 CPU，这样可以更好地节省电能。即使网络拥塞较长时间，它也能很好地运行。

你可以使用以下任何命令来检查 Chrony 状态。

检查 Chrony 跟踪状态。

```
# chronyc tracking

Reference ID    : C0A80105 (CentOS7.2daygeek.com)
Stratum         : 3
Ref time (UTC)  : Thu Mar 28 05:57:27 2019
System time     : 0.000002545 seconds slow of NTP time
Last offset     : +0.001194361 seconds
RMS offset      : 0.001194361 seconds
Frequency       : 1.650 ppm fast
Residual freq   : +184.101 ppm
Skew            : 2.962 ppm
Root delay      : 0.107966967 seconds
Root dispersion : 1.060455322 seconds
Update interval : 2.0 seconds
Leap status     : Normal
```

运行 `sources` 命令以显示有关当前时间源的信息。

```
# chronyc sources

210 Number of sources = 1
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^* CentOS7.2daygeek.com          2   6    17    62    +36us[+1230us] +/- 1111ms
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-verify-ntp-sync-is-working-or-not-in-linux-using-ntpq-ntpstat-timedatectl/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10811-1.html
[2]: https://linux.cn/article-10820-1.html
[3]: https://www.2daygeek.com/change-set-time-date-and-timezone-on-linux/
