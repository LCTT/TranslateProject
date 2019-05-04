[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Install And Configure Chrony As NTP Client?)
[#]: via: (https://www.2daygeek.com/configure-ntp-client-using-chrony-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何正确安装和配置Chrony作为NTP客户端？
======

NTP服务器和NTP客户端运行我们通过网络来同步时钟。

在过去，我们已经撰写了一篇关于 **[NTP服务器和NTP客户端的安装与配置][1]** 的文章。

如果你想看这些内容，点击上述的URL访问。

### 什么是Chrony客户端?

Chrony是NTP客户端的替代品。

它能以更精确的时间和更快的速度同步时钟，并且它对于那些不是全天候在线的系统非常有用。

chronyd更小、更省电，它占用更少的内存且仅当需要时它才唤醒CPU。

即使网络拥塞较长时间，它也能很好地运行。

它支持Linux上的硬件时间戳，允许在本地网络进行极其准确的同步。

它提供下列两个服务。

  * **`chronyc:`** Chrony的命令行接口。
  * **`chronyd:`** Chrony守护进程服务。



### 如何在Linux上安装和配置Chrony？

由于安装包在大多数发行版的官方仓库中可用，因此直接使用包管理器去安装它。

对于 **`Fedora`** 系统, 使用 **[DNF 命令][2]** 去安装chrony.

```
$ sudo dnf install chrony
```

对于 **`Debian/Ubuntu`** 系统, 使用 **[APT-GET 命令][3]** 或者 **[APT 命令][4]** 去安装chrony.

```
$ sudo apt install chrony
```

对基于 **`Arch Linux`** 的系统, 使用 **[Pacman 命令][5]** 去安装chrony.

```
$ sudo pacman -S chrony
```

对于 **`RHEL/CentOS`** 系统, 使用 **[YUM 命令][6]** 去安装chrony.

```
$ sudo yum install chrony
```

对于**`openSUSE Leap`** 系统, 使用 **[Zypper 命令][7]** 去安装chrony.

```
$ sudo zypper install chrony
```

在这篇文章中，我们将使用下列设置去测试。

  * **`NTP服务器:`** 主机名: CentOS7.2daygeek.com, IP:192.168.1.5, OS:CentOS 7
  * **`Chrony客户端:`** 主机名: Ubuntu18.2daygeek.com, IP:192.168.1.3, OS:Ubuntu 18.04


导航到 **[在Linux上安装和配置NTP服务器][1]** 的URL。


我已经在`CentOS7.2daygeek.com`这台主机上安装和配置了NTP服务器，因此，将其附加到所有的客户端机器上。此外，还包括其他所需信息。

`chrony.conf`文件的位置根据你的发行版不同而不同。

对基于RHEL的系统，它位于`/etc/chrony.conf`。

对基于Debian的系统，它位于`/etc/chrony/chrony.conf`。

```
# vi /etc/chrony/chrony.conf

server CentOS7.2daygeek.com prefer iburst
keyfile /etc/chrony/chrony.keys
driftfile /var/lib/chrony/chrony.drift
logdir /var/log/chrony
maxupdateskew 100.0
makestep 1 3
cmdallow 192.168.1.0/24
```

更新配置后需要重启Chrony服务。

对于sysvinit系统。基于RHEL的系统需要去运行`chronyd`而不是chrony。

```
# service chronyd restart

# chkconfig chronyd on
```

对于systemctl系统。 基于RHEL的系统需要去运行`chronyd`而不是chrony。

```
# systemctl restart chronyd

# systemctl enable chronyd
```

使用像tacking，sources和sourcestats这样的命令去检查chrony的同步细节。

去检查chrony的跟踪状态。


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

运行sources命令去显示当前时间源的信息。

```
# chronyc sources
210 Number of sources = 1
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^* CentOS7.2daygeek.com          2   6    17    62    +36us[+1230us] +/- 1111ms
```

sourcestats命令显示有关chronyd当前正在检查的每个源的漂移率和偏移估计过程的信息。

```
# chronyc sourcestats
210 Number of sources = 1
Name/IP Address            NP  NR  Span  Frequency  Freq Skew  Offset  Std Dev
==============================================================================
CentOS7.2daygeek.com        5   3    71    -97.314     78.754   -469us   441us
```

当chronyd配置为NTP客户端或对等端时，你就能通过chronyc ntpdata命令向每一个NTP源发送和接收时间戳模式和交错模式报告。

```
# chronyc ntpdata

Remote address  : 192.168.1.5 (C0A80105)
Remote port     : 123
Local address   : 192.168.1.3 (C0A80103)
Leap status     : Normal
Version         : 4
Mode            : Server
Stratum         : 2
Poll interval   : 6 (64 seconds)
Precision       : -23 (0.000000119 seconds)
Root delay      : 0.108994 seconds
Root dispersion : 0.076523 seconds
Reference ID    : 85F3EEF4 ()
Reference time  : Thu Mar 28 06:43:35 2019
Offset          : +0.000160221 seconds
Peer delay      : 0.000664478 seconds
Peer dispersion : 0.000000178 seconds
Response time   : 0.000243252 seconds
Jitter asymmetry: +0.00
NTP tests       : 111 111 1111
Interleaved     : No
Authenticated   : No
TX timestamping : Kernel
RX timestamping : Kernel
Total TX        : 46
Total RX        : 46
Total valid RX  : 46
```

最后运行`date`命令。

```
# date
Thu Mar 28 03:08:11 CDT 2019
```

为了立即切换系统时钟，通过转换绕过任何正在进行的调整，请以root身份发出以下命令（手动调整系统时钟）。
To step the system clock immediately, bypassing any adjustments in progress by slewing, issue the following command as root (To adjust the system clock manually).

```
# chronyc makestep
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/configure-ntp-client-using-chrony-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[arrowfeng](https://github.com/arrowfeng)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-configure-ntp-server-ntp-client-in-linux/
[2]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
