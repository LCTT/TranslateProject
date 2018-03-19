在 Linux 上使用 NTP 保持精确的时间
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/usno-amc.jpg?itok=KA8HwI02)

如何保持正确的时间，如何使用 NTP 和 systemd 让你的计算机在不滥用时间服务器的前提下保持同步。

### 它的时间是多少？

让 Linux 来告诉你时间的时候，它是很奇怪的。你可能认为是使用 `time` 命令来告诉你时间，其实并不是，因为 `time` 只是一个测量一个进程运行了多少时间的计时器。为得到时间，你需要运行的是 `date` 命令，你想查看更多的日期，你可以运行 `cal` 命令。文件上的时间戳也是一个容易混淆的地方，因为根据你的发行版默认情况不同，它一般有两种不同的显示方法。下面是来自 Ubuntu 16.04 LTS 的示例：

```
$ ls -l
drwxrwxr-x 5 carla carla 4096 Mar 27 2017 stuff
drwxrwxr-x 2 carla carla 4096 Dec 8 11:32 things
-rw-rw-r-- 1 carla carla 626052 Nov 21 12:07 fatpdf.pdf
-rw-rw-r-- 1 carla carla 2781 Apr 18 2017 oddlots.txt
```

有些显示年，有些显示时间，这样的方式让你的文件更混乱。GNU 默认的情况是，如果你的文件在六个月以内，则显示时间而不是年。我想这样做可能是有原因的。如果你的 Linux 是这样的，尝试用 `ls -l --time-style=long-iso` 命令，让时间戳用同一种方式去显示，按字母顺序排序。请查阅 [如何更改 Linux 的日期和时间：简单的命令][1] 去学习 Linux 上管理时间的各种方法。

### 检查当前设置

NTP —— 网络时间协议，它是保持计算机正确时间的老式方法。`ntpd` 是 NTP 守护程序，它通过周期性地查询公共时间服务器来按需调整你的计算机时间。它是一个简单的、轻量级的协议，使用它的基本功能时设置非常容易。systemd 通过使用 `systemd-timesyncd.service` 已经越俎代庖地 “干了 NTP 的活”，它可以用作 `ntpd` 的客户端。

在我们开始与 NTP “打交道” 之前，先花一些时间来了检查一下当前的时间设置是否正确。

你的系统上（至少）有两个时钟：系统时间 —— 它由 Linux 内核管理，第二个是你的主板上的硬件时钟，它也称为实时时钟（RTC）。当你进入系统的 BIOS 时，你可以看到你的硬件时钟的时间，你也可以去改变它的设置。当你安装一个新的 Linux 时，在一些图形化的时间管理器中，你会被询问是否设置你的 RTC 为 UTC（<ruby>世界标准时间<rt>Coordinated Universal Time</rt></ruby>）时区，因为所有的时区和夏令时都是基于 UTC 的。你可以使用 `hwclock` 命令去检查：

```
$ sudo hwclock --debug
hwclock from util-linux 2.27.1
Using the /dev interface to the clock.
Hardware clock is on UTC time
Assuming hardware clock is kept in UTC time.
Waiting for clock tick...
...got clock tick
Time read from Hardware Clock: 2018/01/22 22:14:31
Hw clock time : 2018/01/22 22:14:31 = 1516659271 seconds since 1969
Time since last adjustment is 1516659271 seconds
Calculated Hardware Clock drift is 0.000000 seconds
Mon 22 Jan 2018 02:14:30 PM PST .202760 seconds
```

`Hardware clock is on UTC time` 表明了你的计算机的 RTC 是使用 UTC 时间的，虽然它把该时间转换为你的本地时间。如果它被设置为本地时间，它将显示 `Hardware clock is on local time`。

你应该有一个 `/etc/adjtime` 文件。如果没有的话，使用如下命令同步你的 RTC 为系统时间，

```
$ sudo hwclock -w
```

这个命令将生成该文件，内容看起来类似如下：

```
$ cat /etc/adjtime
0.000000 1516661953 0.000000
1516661953
UTC
```

新发明的 systemd 方式是去运行 `timedatectl` 命令，运行它不需要 root 权限：

```
$ timedatectl
 Local time: Mon 2018-01-22 14:17:51 PST
 Universal time: Mon 2018-01-22 22:17:51 UTC
 RTC time: Mon 2018-01-22 22:17:51
 Time zone: America/Los_Angeles (PST, -0800)
 Network time on: yes
NTP synchronized: yes
 RTC in local TZ: no
```

`RTC in local TZ: no` 表明它使用 UTC 时间。那么怎么改成使用本地时间？这里有许多种方法可以做到。最简单的方法是使用一个图形配置工具，比如像 openSUSE 中的 YaST。你也可使用 `timedatectl`：

```
$ timedatectl set-local-rtc 0
```

或者编辑 `/etc/adjtime`，将 `UTC` 替换为 `LOCAL`。

### systemd-timesyncd 客户端

现在，我已经累了，但是我们刚到非常精彩的部分。谁能想到计时如此复杂？我们甚至还没有了解到它的皮毛；阅读 `man 8 hwclock` 去了解你的计算机如何保持时间的详细内容。

systemd 提供了 `systemd-timesyncd.service` 客户端，它可以查询远程时间服务器并调整你的本地系统时间。在 `/etc/systemd/timesyncd.conf` 中配置你的（时间）服务器。大多数 Linux 发行版都提供了一个默认配置，它指向他们维护的时间服务器上，比如，以下是 Fedora 的：

```
[Time]
#NTP=
#FallbackNTP=0.fedora.pool.ntp.org 1.fedora.pool.ntp.org
```

你可以输入你希望使用的其它时间服务器，比如你自己的本地 NTP 服务器，在 `NTP=` 行上输入一个以空格分隔的服务器列表。（别忘了取消这一行的注释）`NTP=` 行上的任何内容都将覆盖掉 `FallbackNTP` 行上的配置项。

如果你不想使用 systemd 呢？那么，你将需要 NTP 就行。

### 配置 NTP 服务器和客户端

配置你自己的局域网 NTP 服务器是一个非常好的实践，这样你的网内计算机就不需要不停查询公共 NTP 服务器。在大多数 Linux 上的 NTP 都来自  `ntp` 包，它们大多都提供 `/etc/ntp.conf` 文件去配置时间服务器。查阅 [NTP 时间服务器池][2] 去找到你所在的区域的合适的 NTP 服务器池。然后在你的 `/etc/ntp.conf` 中输入 4 - 5 个服务器，每个服务器用单独的一行：

```
driftfile /var/ntp.drift
logfile /var/log/ntp.log
server 0.europe.pool.ntp.org
server 1.europe.pool.ntp.org
server 2.europe.pool.ntp.org
server 3.europe.pool.ntp.org
```

`driftfile` 告诉 `ntpd` 它需要保存用于启动时使用时间服务器快速同步你的系统时钟的信息。而日志也将保存在他们自己指定的目录中，而不是转储到 syslog 中。如果你的 Linux 发行版默认提供了这些文件，请使用它们。

现在去启动守护程序；在大多数主流的 Linux 中它的命令是 `sudo systemctl start ntpd`。让它运行几分钟之后，我们再次去检查它的状态：

```
$ ntpq -p
 remote refid st t when poll reach delay offset jitter
==============================================================
+dev.smatwebdesi 192.168.194.89 3 u 25 64 37 92.456 -6.395 18.530
*chl.la 127.67.113.92 2 u 23 64 37 75.175 8.820 8.230
+four0.fairy.mat 35.73.197.144 2 u 22 64 37 116.272 -10.033 40.151
-195.21.152.161 195.66.241.2 2 u 27 64 37 107.559 1.822 27.346
```

我不知道这些内容是什么意思，但重要的是，你的守护程序已经与时间服务器开始对话了，而这正是我们所需要的。你可以去运行 `sudo systemctl enable ntpd` 命令，永久启用它。如果你的 Linux 没有使用 systemd，那么，给你留下的家庭作业就是找出如何去运行 `ntpd`。

现在，你可以在你的局域网中的其它计算机上设置 `systemd-timesyncd`，这样它们就可以使用你的本地 NTP 服务器了，或者，在它们上面安装 NTP，然后在它们的 `/etc/ntp.conf` 上输入你的本地 NTP 服务器。

NTP 服务器会受到攻击，而且需求在不断增加。你可以通过运行你自己的公共 NTP 服务器来提供帮助。下周我们将学习如何运行你自己的公共服务器。

通过来自 Linux 基金会和 edX 的免费课程 [“Linux 入门”][3] 来学习更多 Linux 的知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/1/keep-accurate-time-linux-ntp

作者：[CARLA SCHRODER][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/how-change-linux-date-and-time-simple-commands
[2]:http://support.ntp.org/bin/view/Servers/NTPPoolServers
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
