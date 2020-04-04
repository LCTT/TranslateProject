[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12038-1.html)
[#]: subject: (Manually rotating log files on Linux)
[#]: via: (https://www.networkworld.com/article/3531969/manually-rotating-log-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 系统中手动滚动日志
======

![](https://img.linux.net.cn/data/attachment/album/202003/25/223932xqibwq5fafx5ao3f.jpg)

<ruby>日志滚动<rt>log rotation</rt></ruby>在 Linux 系统上是再常见不过的一个功能了，它为系统监控和故障排查保留必要的日志内容，同时又防止过多的日志造成单个日志文件太大。

日志滚动的过程是这样的：在一组日志文件之中，编号最大的（最旧的）一个日志文件会被删除，其余的日志文件编号则依次增大并取代较旧的日志文件，而较新的文件则取代它作为当前的日志文件。这一个过程很容易就可以实现自动化，在细节上还能按需作出微调。

使用 `logrotate` 命令可以手动执行日志滚动的操作。本文将要介绍的就是手动进行日志滚动的方法，以及预期产生的结果。

文中出现的示例适用于 Ubuntu 等 Linux 系统，对于其它类型的系统，日志文件和配置文件可能会有所不同，但日志滚动的过程是大同小异的。

### 为什么需要滚动日志

一般情况下，无需手动旋转日志文件。Linux 系统会每隔一天（或间隔更长的时间）或根据日志文件的大小自动进行一次日志滚动。如果你需要滚动日志以释放存储空间，又或者将某一部分日志从当前的活动中分割出来，这很容易做到，具体要取决于文件滚动规则。

### 一点背景介绍

在 Linux 系统安装完成后就已经有很多日志文件被纳入到日志滚动的范围内了。另外，一些应用程序在安装时也会为自己产生的日志文件设置滚动规则。一般来说，日志滚动的配置文件会放置在 `/etc/logrotate.d`。如果你想了解日志滚动的详细实现，可以参考[这篇以前的文章][4]。

在日志滚动的过程中，活动日志会以一个新名称命名，例如 `log.1`，之前被命名为 `log.1` 的文件则会被重命名为 `log.2`，依此类推。在这一组文件中，最旧的日志文件（假如名为 `log.7`）会从系统中删除。日志滚动时文件的命名方式、保留日志文件的数量等参数是由 `/etc/logrotate.d` 目录中的配置文件决定的，因此你可能会看到有些日志文件只保留少数几次滚动，而有些日志文件的滚动次数会到 7 次或更多。

例如 `syslog` 在经过日志滚动之后可能会如下所示（注意，行尾的注释部分只是说明滚动过程是如何对文件名产生影响的）：

```
$ ls -l /var/log/syslog*
-rw-r----- 1 syslog adm  128674 Mar 10 08:00 /var/log/syslog      <== 新文件
-rw-r----- 1 syslog adm 2405968 Mar  9 16:09 /var/log/syslog.1    <== 之前的 syslog
-rw-r----- 1 syslog adm  206451 Mar  9 00:00 /var/log/syslog.2.gz <== 之前的 syslog.1
-rw-r----- 1 syslog adm  216852 Mar  8 00:00 /var/log/syslog.3.gz <== 之前的 syslog.2.gz
-rw-r----- 1 syslog adm  212889 Mar  7 00:00 /var/log/syslog.4.gz <== 之前的 syslog.3.gz
-rw-r----- 1 syslog adm  219106 Mar  6 00:00 /var/log/syslog.5.gz <== 之前的 syslog.4.gz
-rw-r----- 1 syslog adm  218596 Mar  5 00:00 /var/log/syslog.6.gz <== 之前的 syslog.5.gz
-rw-r----- 1 syslog adm  211074 Mar  4 00:00 /var/log/syslog.7.gz <== 之前的 syslog.6.gz
```

你可能会发现，除了当前活动的日志和最新一次滚动的日志文件之外，其余的文件都已经被压缩以节省存储空间。这样设计的原因是大部分系统管理员都只需要查阅最新的日志文件，其余的日志文件压缩起来，需要的时候可以解压查阅，这是一个很好的折中方案。

### 手动日志滚动

你可以这样执行 `logrotate` 命令进行手动日志滚动：

```
$ sudo logrotate -f /etc/logrotate.d/rsyslog
```

值得一提的是，`logrotate` 命令使用 `/etc/logrotate.d/rsyslog` 这个配置文件，并通过了 `-f` 参数实行“强制滚动”。因此，整个过程将会是：

- 删除 `syslog.7.gz`，
- 将原来的 `syslog.6.gz` 命名为 `syslog.7.gz`，
- 将原来的 `syslog.5.gz` 命名为 `syslog.6.gz`，
- 将原来的 `syslog.4.gz` 命名为 `syslog.5.gz`，
- 将原来的 `syslog.3.gz` 命名为 `syslog.4.gz`，
- 将原来的 `syslog.2.gz` 命名为 `syslog.3.gz`，
- 将原来的 `syslog.1.gz` 命名为 `syslog.2.gz`，
- 但新的 `syslog` 文件不一定必须创建。

你可以按照下面的几条命令执行操作，以确保文件的属主和权限正确：

```
$ sudo touch /var/log/syslog
$ sudo chown syslog:adm /var/log/syslog
$ sudo chmod 640 /var/log/syslog
```

你也可以把以下这一行内容添加到 `/etc/logrotate.d/rsyslog` 当中，由 `logrotate` 来帮你完成上面三条命令的操作：

```
create 0640 syslog adm
```

整个配置文件的内容是这样的：

```
/var/log/syslog
{
rotate 7
daily
missingok
notifempty
create 0640 syslog adm           <==
delaycompress
compress
postrotate
/usr/lib/rsyslog/rsyslog-rotate
endscript
}
```

下面是手动滚动记录用户登录信息的 `wtmp` 日志的示例。由于 `/etc/logrotate.d/wtmp` 中有 `rotate 2` 的配置，因此系统中只保留了两份 `wtmp` 日志文件。

滚动前：

```
$ ls -l wtmp*
-rw-r----- 1 root utmp  1152 Mar 12 11:49 wtmp
-rw-r----- 1 root utmp   768 Mar 11 17:04 wtmp.1
```

执行滚动命令：

```
$ sudo logrotate -f /etc/logrotate.d/wtmp
```

滚动后：

```
$ ls -l /var/log/wtmp*
-rw-r----- 1 root utmp     0 Mar 12 11:52 /var/log/wtmp
-rw-r----- 1 root utmp  1152 Mar 12 11:49 /var/log/wtmp.1
-rw-r----- 1 root adm  99726 Feb 21 07:46 /var/log/wtmp.report
```

需要知道的是，无论发生的日志滚动是自动滚动还是手动滚动，最近一次的滚动时间都会记录在 `logrorate` 的状态文件中。

```
$ grep wtmp /var/lib/logrotate/status
"/var/log/wtmp" 2020-3-12-11:52:57
```

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3531969/manually-rotating-log-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/klif/4244284159/in/photolist-7t44P6-oPFpsr-a8c5W-gWNZ6-32EEo4-cjdxqy-diHaq9-8DYZWf-gWNWM-bgLApc-hBt94C-cj71kY-PMESV-dZBcCU-pSqgNM-51eKHq-EecbfS-osGNau-KMUx-nFaWEL-cj71PE-HFVXn-gWNWs-85HueR-8QpDh8-kV1dEc-76qYSV-5YnxuS-gWNXr-dYoQ5w-dzj1j3-3AJyd-mHbaWF-q2fTri-e9bFa6-nJyvfR-4PnMyH-gWNZr-8VUtGS-gWNWZ-ajzUd4-2hAjMk-gWW3g-gWP11-dwYbH5-4XMew-cj71B1-ica9kJ-5RonM6-8z5tGL
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3218728/how-log-rotation-works-with-logrotate.html
[5]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
