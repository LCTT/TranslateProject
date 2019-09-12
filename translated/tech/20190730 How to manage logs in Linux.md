[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manage logs in Linux)
[#]: via: (https://www.networkworld.com/article/3428361/how-to-manage-logs-in-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何在 Linux 中管理日志
======
Linux 系统上的日志文件包含了很多信息——比您有时间查看的还要多。以下是一些建议，告诉你如何正确的使用它们...而不是淹没在其中。
![Greg Lobinski \(CC BY 2.0\)][1]

在 Linux 系统上管理日志文件可能是非常容易，也可能是非常痛苦。这完全取决于您所说的日志管理是什么意思。

如果您的意思是如何确保日志文件不会耗尽您的 Linux 服务器上的所有磁盘空间，那么这个问题通常很简单。Linux 系统上的日志文件将自动覆盖，系统将只维护固定数量的覆盖日志。即便如此，浏览一下一组100个文件可能会让人不知所措。在这篇文章中，我们将看看循环日志是如何工作的，以及一些最相关的日志文件。

**[两分钟 Linux 技巧:[在这些两分钟视频教程中学习如何掌握大量 Linux 命令][2] ]**

### 自动日志轮换

日志文件经常是循环使用的。当前的日志会获得稍微不同的文件名，并建立一个新的日志文件。以系统日志文件为例。对于许多正常的系统消息来说，这个文件是一个包罗万象的东西。如果您 **cd** 转到 **/var/log** 并查看一下，您可能会看到一系列系统日志文件，如下所示:

```
$ ls -l syslog*
-rw-r----- 1 syslog adm 28996 Jul 30 07:40 syslog
-rw-r----- 1 syslog adm 71212 Jul 30 00:00 syslog.1
-rw-r----- 1 syslog adm  5449 Jul 29 00:00 syslog.2.gz
-rw-r----- 1 syslog adm  6152 Jul 28 00:00 syslog.3.gz
-rw-r----- 1 syslog adm  7031 Jul 27 00:00 syslog.4.gz
-rw-r----- 1 syslog adm  5602 Jul 26 00:00 syslog.5.gz
-rw-r----- 1 syslog adm  5995 Jul 25 00:00 syslog.6.gz
-rw-r----- 1 syslog adm 32924 Jul 24 00:00 syslog.7.gz
```

每天午夜将旧系统日志文件轮换使用，保留一周，然后删除最早的系统日志文件。syslog.7.gz 文件将被从系统中删除，syslog.6.gz 将被重命名为 syslog.7.gz。日志文件的其余部分将继续运行，直到 syslog 成 syslog.1 并创建一个新的系统日志文件。有些系统日志文件会比其他文件大，但是一般来说，没有一个文件可能会变得非常大，并且您永远不会看到超过八个。这给了你一个多星期的时间来回顾它们收集的任何数据。

为任何特定日志文件维护的文件数量取决于日志文件本身。对一些人来说，你可能有13个。请注意系统日志和 dpkg 的旧文件是如何压缩以节省空间的。可能是您对最近的日志最感兴趣。旧日志可以根据需要用 **gunzip** 解压。

```
# ls -t dpkg*
dpkg.log       dpkg.log.3.gz  dpkg.log.6.gz  dpkg.log.9.gz   dpkg.log.12.gz
dpkg.log.1     dpkg.log.4.gz  dpkg.log.7.gz  dpkg.log.10.gz
dpkg.log.2.gz  dpkg.log.5.gz  dpkg.log.8.gz  dpkg.log.11.gz
```

日志文件可以根据时间和大小进行轮换。检查日志文件时请记住这一点。

Log file rotation can be configured differently if you are so inclined, though the defaults work for most Linux sysadmins. Take a look at files like **/etc/rsyslog.conf** and **/etc/logrotate.conf** for some of the details.

尽管默认值适用于大多数 Linux 系统管理员，如果您愿意，可以对日志文件轮换进行不同的配置。查看这些文件，如 **/etc/rsyslog.conf** 和 **/etc/logrotate.conf** 。

### 利用您的日志文件

管理日志文件包括时不时的使用它们。使用日志文件第一步是每个日志文件可以告诉您的系统如何工作以及可能遇到的问题。从上到下读取日志文件几乎不是一个好的选择，但是当您想了解您的系统运行的情况或者需要跟踪一个问题时，知道如何从日志文件中获取信息会是有很大的好处。这也表明您对每个文件中存储的信息有一个大致的了解了。例如:

```
$ who wtmp | tail -10     show the most recent logins
$ who wtmp | grep shark show recent logins for a particular user
$ grep "sudo:" auth.log see who is using sudo
$ tail dmesg                    look at kernel messages
$ tail dpkg.log                 see recently installed and updated packages
$ more ufw.log                  see firewall activity (i.e., if you are using ufw)
```

您运行的一些命令也会从日志文件中提取信息。例如，如果您想查看系统重新启动的列表，可以使用如下命令:

```
$ last reboot
reboot   system boot  5.0.0-20-generic Tue Jul 16 13:19   still running
reboot   system boot  5.0.0-15-generic Sat May 18 17:26 - 15:19 (21+21:52)
reboot   system boot  5.0.0-13-generic Mon Apr 29 10:55 - 15:34 (18+04:39)
```

### 使用更高级的日志管理器

虽然您编写脚本来更容易地在日志文件中找到感兴趣的信息，但是您也应该知道有一些非常复杂的工具可用于日志文件分析。一些人把来自多个来源的信息联系起来，以便更全面地了解您的网络上发生了什么。它们也可以提供实时监控。这些工具，如[Solarwinds Log &amp; Event Manager][3]和[PRTG 网络监视器][4](包括日志监视)浮现在脑海中。

还有一些免费工具可以帮助分析日志文件。其中包括:

  * **Logwatch** — 用于扫描系统日志中感兴趣的行的程序
  * **Logcheck** — 系统日志分析器和报告器


在接下来的帖子中，我将提供一些关于这些工具的见解和帮助。

**[另请参阅:[排除 Linux 故障的宝贵技巧和诀窍][5] ]**

加入[Facebook][6] 和[LinkedIn][7] 上的网络世界社区，就您最关心的话题发表评论。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3428361/how-to-manage-logs-in-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/07/logs-100806633-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.esecurityplanet.com/products/solarwinds-log-event-manager-siem.html
[4]: https://www.paessler.com/prtg
[5]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
