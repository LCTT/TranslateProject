[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11008-1.html)
[#]: subject: (Exploring /run on Linux)
[#]: via: (https://www.networkworld.com/article/3403023/exploring-run-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

探索 Linux 上的 /run
======

> Linux 系统在运行时数据方面的工作方式发生了微小但重大的变化。

![](https://img.linux.net.cn/data/attachment/album/201906/23/092816aqczi984w30j8k12.jpg)

如果你没有密切关注，你可能没有注意到 Linux 系统在运行时数据方面的工作方式有一些小但重大的变化。 它重新组织了文件系统中可访问的方式和位置，而这个变化在大约八年前就开始了。虽然这种变化可能不足以让你的袜子变湿，但它在 Linux 文件系统中提供了更多一致性，值得进行一些探索。

要开始，请转到 `/run`。如果你使用 `df` 来检查它，你会看到这样的输出：

```
$ df -k .
Filesystem     1K-blocks  Used Available Use% Mounted on
tmpfs             609984  2604    607380   1% /run
```

它被识别为 “tmpfs”（临时文件系统），因此我们知道 `/run` 中的文件和目录没有存储在磁盘上，而只存储在内存中。它们表示保存在内存（或基于磁盘的交换空间）中的数据，它看起来像是一个已挂载的文件系统，这个可以使其更易于访问和管理。

`/run` 是各种各样数据的家园。例如，如果你查看 `/run/user`，你会注意到一组带有数字名称的目录。

```
$ ls /run/user
1000  1002  121
```

使用长文件列表可以发现这些数字的重要性。

```
$ ls -l
total 0
drwx------ 5 shs  shs  120 Jun 16 12:44 1000
drwx------ 5 dory dory 120 Jun 16 16:14 1002
drwx------ 8 gdm  gdm  220 Jun 14 12:18 121
```

我们看到每个目录与当前登录的用户或显示管理器 gdm 相关。数字代表他们的 UID。每个目录的内容都是运行中的进程所使用的文件。

`/run/user` 文件只是你在 `/run` 中找到的一小部分。还有很多其他文件。有一些文件包含了各种系统进程的进程 ID。

```
$ ls *.pid
acpid.pid  atopacctd.pid  crond.pid  rsyslogd.pid
atd.pid    atop.pid       gdm3.pid   sshd.pid
```

如下所示，上面列出的 `sshd.pid` 文件包含 ssh 守护程序（`sshd`）的进程 ID。

```
$ cat sshd.pid
1148
$ ps -ef | grep sshd
root      1148     1  0 Jun14 ?        00:00:00 /usr/sbin/sshd -D    <==
root     10784  1148  0 12:44 ?        00:00:00 sshd: shs [priv]
shs      10922 10784  0 12:44 ?        00:00:00 sshd: shs@pts/0
root     18109  1148  0 16:13 ?        00:00:00 sshd: dory [priv]
dory     18232 18109  0 16:14 ?        00:00:00 sshd: dory@pts/1
shs      19276 10923  0 16:50 pts/0    00:00:00 grep --color=auto sshd
```

`/run` 中的某些子目录只能使用 root 权限访问，例如 `/run/sudo`。例如，以 root 身份运行我们可以看到一些与真实或尝试使用 `sudo` 相关的文件：

```
/run/sudo/ts# ls -l
total 8
-rw------- 1 root dory 112 Jun 16 16:37 dory
-rw------- 1 root shs  168 Jun 17 08:33 shs
```

为了与 `/run` 的变化保持一致，一些运行时数据的旧位置现在是符号链接。`/var/run` 现在是指向 `/run` 的指针，`/var/lock` 指向 `/run/lock` 的指针，可以保证旧的引用按预期工作。

```
$ ls -l /var
total 52
drwxr-xr-x  2 root root     4096 Jun 17 07:36 backups
drwxr-xr-x 19 root root     4096 Apr 18 13:46 cache
drwxrwsrwt  2 root whoopsie 4096 Jun 13 07:39 crash
drwxr-xr-x 75 root root     4096 Jun  9 15:14 lib
drwxrwsr-x  2 root staff    4096 Oct 16  2017 local
lrwxrwxrwx  1 root root        9 May 14  2018 lock -> /run/lock
drwxrwxr-x 17 root syslog   4096 Jun 17 00:00 log
drwxrwsrwt  2 root mail     4096 Jun 13 12:10 mail
drwxrwsrwt  2 root whoopsie 4096 Jan  5  2018 metrics
drwxr-xr-x  2 root root     4096 Jan  5  2018 opt
lrwxrwxrwx  1 root root        4 May 14  2018 run -> /run
drwxr-xr-x  9 root root     4096 Jun 16  2018 snap
drwxr-xr-x  9 root root     4096 Jun  9 15:14 spool
drwxrwxrwt  8 root root     4096 Jun 17 00:00 tmp
drwxr-xr-x  3 root root     4096 Jan 19 12:14 www
```

虽然技术上的变化很小，但转换到使用 `/run` 只是为了在 Linux 文件系统中更好地组织运行时数据。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3403023/exploring-run-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/exploring_run-100799398-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
