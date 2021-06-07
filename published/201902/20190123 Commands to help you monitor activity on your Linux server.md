[#]: collector: (lujun9972)
[#]: translator: (dianbanjiu)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10498-1.html)
[#]: subject: (Commands to help you monitor activity on your Linux server)
[#]: via: (https://www.networkworld.com/article/3335200/linux/how-to-monitor-activity-on-your-linux-server.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

监控 Linux 服务器活动的几个命令  
======

> `watch`、`top` 和 `ac` 命令为我们监视 Linux 服务器上的活动提供了一些十分高效的途径。  

![](https://images.idgesg.net/images/article/2019/01/owl-face-100785829-large.jpg)

为了在获取系统活动时更加轻松，Linux 系统提供了一系列相关的命令。在这篇文章中，我们就一起来看看这些对我们很有帮助的命令吧。  

### watch 命令

`watch` 是一个用来轻松地重复检测 Linux 系统中一系列数据命令，例如用户活动、正在运行进程、登录、内存使用等。这个命令实际上是重复地运行一个特定的命令，每次都会重写之前显示的输出，它提供了一个比较方便的方式用以监测在你的系统中发生的活动。  

首先以一个基础且不是特别有用的命令开始，你可以运行 `watch -n 5 date`，然后你可以看到在终端中显示了当前的日期和时间，这些数据会每五秒更新一次。你可能已经猜到了，`-n 5` 选项指定了运行接下来一次命令需要等待的秒数。默认是 2 秒。这个命令将会一直运行并按照指定的时间更新显示，直到你使用 `^C` 停下它。

```
Every 5.0s: date                             butterfly: Wed Jan 23 15:59:14 2019

Wed Jan 23 15:59:14 EST 2019
```

下面是一个更有趣的命令实例，你可以监控一个在服务器中登录用户的列表，该列表会按照指定的时间定时更新。就像下面写到的，这个命令会每 10 秒更新一次这个列表。登出的用户将会从当前显示的列表中消失，那些新登录的将会被添加到这个表格当中。如果没有用户再登录或者登出，这个表格跟之前显示的将不会有任何不同。  

```
$ watch -n 10 who

Every 10.0s: who                             butterfly: Tue Jan 23 16:02:03 2019

shs      :0           2019-01-23 09:45 (:0)
dory     pts/0        2019-01-23 15:50 (192.168.0.5)
nemo     pts/1        2019-01-23 16:01 (192.168.0.15)
shark    pts/3        2019-01-23 11:11 (192.168.0.27)
```

如果你只是想看有多少用户登录进来，可以通过 `watch` 调用 `uptime` 命令获取用户数和负载的平均水平，以及系统的工作状况。

```
$ watch uptime

Every 2.0s: uptime                           butterfly: Tue Jan 23 16:25:48 2019

 16:25:48 up 22 days,  4:38,  3 users,  load average: 1.15, 0.89, 1.02
```

如果你想使用 `watch` 重复一个包含了管道的命令，就需要将该命令用引号括起来，就比如下面这个每五秒显示一次有多少进程正在运行的命令。  

```
$ watch -n 5 'ps -ef | wc -l'

Every 5.0s: ps -ef | wc -l butterfly: Tue Jan 23 16:11:54 2019

245
```

要查看内存使用，你也许会想要试一下下面的这个命令组合：  

```
$ watch -n 5 free -m

Every 5.0s: free -m butterfly: Tue Jan 23 16:34:09 2019

Every 5.0s: free -m                          butterfly: Tue Jan 23 16:34:09 2019

              total        used        free      shared  buff/cache   available
Mem:           5959         776        3276          12        1906        4878
Swap:          2047           0        2047
```

你可以在 `watch` 后添加一些选项查看某个特定用户下运行的进程，不过 `top` 为此提供了更好的选择。  

### top 命令

如果你想查看某个特定用户下的进程，`top` 命令的 `-u` 选项可以很轻松地帮你达到这个目的。  

```
$ top -u nemo
top - 16:14:33 up 2 days,  4:27,  3 users,  load average: 0.00, 0.01, 0.02
Tasks: 199 total,   1 running, 198 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.2 sy,  0.0 ni, 99.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   5959.4 total,   3277.3 free,    776.4 used,   1905.8 buff/cache
MiB Swap:   2048.0 total,   2048.0 free,      0.0 used.   4878.4 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
23026 nemo      20   0   46340   7820   6504 S   0.0   0.1   0:00.05 systemd
23033 nemo      20   0  149660   3140     72 S   0.0   0.1   0:00.00 (sd-pam)
23125 nemo      20   0   63396   5100   4092 S   0.0   0.1   0:00.00 sshd
23128 nemo      20   0   16836   5636   4284 S   0.0   0.1   0:00.03 zsh
```

你可能不仅可以看到某个用户下的进程，还可以查看每个进程所占用的资源，以及系统总的工作状况。  

### ac 命令

如果你想查看系统中每个用户登录的时长，可以使用 `ac` 命令。运行该命令之前首先需要安装 `acct`（Debian 等）或者 `psacct`（RHEL、Centos 等）包。  

`ac` 命令有一系列的选项，该命令从 `wtmp` 文件中拉取数据。这个例子展示的是最近用户登录的总小时数。  

```
$ ac
        total     1261.72
```

这个命令显示了用户登录的总的小时数：  

```
$ ac -p
        shark                                5.24
        nemo                                 5.52
        shs                               1251.00
        total     1261.76
```

这个命令显示了每天登录的用户小时数：  

```
$ ac -d | tail -10

Jan 11  total        0.05
Jan 12  total        1.36
Jan 13  total       16.39
Jan 15  total       55.33
Jan 16  total       38.02
Jan 17  total       28.51
Jan 19  total       48.66
Jan 20  total        1.37
Jan 22  total       23.48
Today   total        9.83
```

### 总结

Linux 系统上有很多命令可以用于检查系统活动。`watch` 命令允许你以重复的方式运行任何命令，并观察输出有何变化。`top` 命令是一个专注于用户进程的最佳选项，以及允许你以动态方式查看进程的变化，还可以使用 `ac` 命令检查用户连接到系统的时间。   

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3335200/linux/how-to-monitor-activity-on-your-linux-server.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
