Chrony：一个类 Unix 系统上 NTP 客户端和服务器替代品
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/chrony-1-720x340.jpeg)

在这个教程中，我们会讨论如何安装和配置 **Chrony**，一个类 Unix 系统上 NTP 客户端和服务器的替代品。Chrony 可以更快的同步系统时钟，具有更好的时钟准确度，并且它对于那些不是一直在线的系统很有帮助。Chrony 是自由开源的，并且支持 GNU/Linux 和 BSD 衍生版（比如 FreeBSD、NetBSD）、macOS 和 Solaris 等。

### 安装 Chrony

Chrony 可以从大多数 Linux 发行版的默认软件库中获得。如果你使用的是 Arch Linux，运行下面的命令来安装它：

```
$ sudo pacman -S chrony
```

在 Debian、Ubuntu、Linux Mint 上：

```
$ sudo apt-get install chrony
```

在 Fedora 上：

```
$ sudo dnf install chrony
```

当安装完成后，如果之前没有启动过的话需启动 `chronyd.service` 守护进程：

```
$ sudo systemctl start chronyd.service
```

使用下面的命令让它每次重启系统后自动运行：

```
$ sudo systemctl enable chronyd.service
```

为了确认 `chronyd.service` 已经启动，运行：

```
$ sudo systemctl status chronyd.service
```

如果一切正常，你将看到类似下面的输出：

```
● chrony.service - chrony, an NTP client/server
Loaded: loaded (/lib/systemd/system/chrony.service; enabled; vendor preset: ena
Active: active (running) since Wed 2018-10-17 10:34:53 UTC; 3min 15s ago
Docs: man:chronyd(8)
man:chronyc(1)
man:chrony.conf(5)
Main PID: 2482 (chronyd)
Tasks: 1 (limit: 2320)
CGroup: /system.slice/chrony.service
└─2482 /usr/sbin/chronyd

Oct 17 10:34:53 ubuntuserver systemd[1]: Starting chrony, an NTP client/server...
Oct 17 10:34:53 ubuntuserver chronyd[2482]: chronyd version 3.2 starting (+CMDMON
Oct 17 10:34:53 ubuntuserver chronyd[2482]: Initial frequency -268.088 ppm
Oct 17 10:34:53 ubuntuserver systemd[1]: Started chrony, an NTP client/server.
Oct 17 10:35:03 ubuntuserver chronyd[2482]: Selected source 85.25.84.166
Oct 17 10:35:03 ubuntuserver chronyd[2482]: Source 85.25.84.166 replaced with 2403
Oct 17 10:35:03 ubuntuserver chronyd[2482]: Selected source 91.189.89.199
Oct 17 10:35:06 ubuntuserver chronyd[2482]: Selected source 106.10.186.200
```

可以看到，Chrony 服务已经启动并且正在工作！

### 配置 Chrony

NTP 客户端需要知道它要连接到哪个 NTP 服务器来获取当前时间。我们可以直接在该 NTP 配置文件中的 `server` 或者 `pool` 项指定 NTP 服务器。通常，默认的配置文件位于 `/etc/chrony/chrony.conf` 或者 `/etc/chrony.conf`，取决于 Linux 发行版版本。为了更可靠的同步时间，建议指定至少三个服务器。

下面几行是我的 Ubuntu 18.04 LTS 服务器上的一个示例。

```
[...]
# About using servers from the NTP Pool Project in general see (LP: #104525).
# Approved by Ubuntu Technical Board on 2011-02-08.
# See http://www.pool.ntp.org/join.html for more information.
pool ntp.ubuntu.com iburst maxsources 4
pool 0.ubuntu.pool.ntp.org iburst maxsources 1
pool 1.ubuntu.pool.ntp.org iburst maxsources 1
pool 2.ubuntu.pool.ntp.org iburst maxsources 2
[...]
```

从上面的输出中你可以看到，[NTP 服务器池项目][1] 已经被设置成为了默认的时间服务器。对于那些好奇的人，NTP 服务器池项目是一个时间服务器集群，用来为全世界千万个客户端提供 NTP 服务。它是 Ubuntu 以及其他主流 Linux 发行版的默认时间服务器。

在这里，
  * `iburst` 选项用来加速初始的同步过程
  * `maxsources` 代表 NTP 源的最大数量

请确保你选择的 NTP 服务器是同步的、稳定的、离你的位置较近的，以便使用这些 NTP 源来提升时间准确度。

### 在命令行中管理 Chronyd

chrony 有一个命令行工具叫做 `chronyc` 用来控制和监控 chrony 守护进程（`chronyd`）。

为了检查是否 chrony 已经同步，我们可以使用下面展示的 `tracking` 命令。

```
$ chronyc tracking
Reference ID : 6A0ABAC8 (t1.time.sg3.yahoo.com)
Stratum : 3
Ref time (UTC) : Wed Oct 17 11:48:51 2018
System time : 0.000984587 seconds slow of NTP time
Last offset : -0.000912981 seconds
RMS offset : 0.007983995 seconds
Frequency : 23.704 ppm slow
Residual freq : +0.006 ppm
Skew : 1.734 ppm
Root delay : 0.089718960 seconds
Root dispersion : 0.008760406 seconds
Update interval : 515.1 seconds
Leap status : Normal
```

我们可以使用命令确认现在 chrony 使用的时间源：

```
$ chronyc sources
210 Number of sources = 8
MS Name/IP address Stratum Poll Reach LastRx Last sample
===============================================================================
^- chilipepper.canonical.com 2 10 377 296 +102ms[ +104ms] +/- 279ms
^- golem.canonical.com 2 10 377 302 +105ms[ +107ms] +/- 290ms
^+ pugot.canonical.com 2 10 377 297 +36ms[ +38ms] +/- 238ms
^- alphyn.canonical.com 2 10 377 279 -43ms[ -42ms] +/- 238ms
^- dadns.cdnetworks.co.kr 2 10 377 1070 +40ms[ +42ms] +/- 314ms
^* t1.time.sg3.yahoo.com 2 10 377 169 -13ms[ -11ms] +/- 80ms
^+ sin1.m-d.net 2 10 275 567 -9633us[-7826us] +/- 115ms
^- ns2.pulsation.fr 2 10 377 311 -75ms[ -73ms] +/- 250ms
```

`chronyc` 工具可以对每个源进行统计，比如使用 `sourcestats` 命令获得漂移速率和进行偏移估计。

```
$ chronyc sourcestats
210 Number of sources = 8
Name/IP Address NP NR Span Frequency Freq Skew Offset Std Dev
==============================================================================
chilipepper.canonical.com 32 16 89m +6.293 14.345 +30ms 24ms
golem.canonical.com 32 17 89m +0.312 18.887 +20ms 33ms
pugot.canonical.com 32 18 89m +0.281 11.237 +3307us 23ms
alphyn.canonical.com 31 20 88m -4.087 8.910 -58ms 17ms
dadns.cdnetworks.co.kr 29 16 76m -1.094 9.895 -83ms 14ms
t1.time.sg3.yahoo.com 32 16 91m +0.153 1.952 +2835us 4044us
sin1.m-d.net 29 13 83m +0.049 6.060 -8466us 9940us
ns2.pulsation.fr 32 17 88m +0.784 9.834 -62ms 22ms
```

如果你的系统没有连接到互联网，你需要告知 Chrony 系统没有连接到 互联网。为了这样做，运行：

```
$ sudo chronyc offline
[sudo] password for sk:
200 OK
```

为了确认你的 NTP 源的状态，只需要运行：

```
$ chronyc activity
200 OK
0 sources online
8 sources offline
0 sources doing burst (return to online)
0 sources doing burst (return to offline)
0 sources with unknown address
```

可以看到，我的所有源此时都是离线状态。

一旦你连接到互联网，只需要使用命令告知 Chrony 你的系统已经回到在线状态：

```
$ sudo chronyc online
200 OK
```

为了查看 NTP 源的状态，运行：

```
$ chronyc activity
200 OK
8 sources online
0 sources offline
0 sources doing burst (return to online)
0 sources doing burst (return to offline)
0 sources with unknown address
```

所有选项和参数的详细解释，请参考其帮助手册。

```
$ man chronyc
$ man chronyd
```

这就是文章的所有内容。希望对你有所帮助。在随后的教程中，我们会看到如何使用 Chrony 启动一个本地的 NTP 服务器并且配置客户端来使用这个服务器同步时间。

保持关注！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/chrony-an-alternative-ntp-client-and-server-for-unix-like-systems/

作者：[SK][a]
选题：[lujun9972][b]
译者：[zianglei](https://github.com/zianglei)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ntppool.org/en/
