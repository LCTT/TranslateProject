[#]: collector: (lujun9972)
[#]: translator: (lnrCoder)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11542-1.html)
[#]: subject: (How to Find Out Top Memory Consuming Processes in Linux)
[#]: via: (https://www.2daygeek.com/linux-find-top-memory-consuming-processes/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 中找出内存消耗最大的进程
======

![](https://img.linux.net.cn/data/attachment/album/201911/06/110149r81efjx12afjat7f.jpg)

很多次，你可能遇见过系统消耗了过多的内存。如果是这种情况，那么最好的办法是识别出 Linux 机器上消耗过多内存的进程。我相信，你可能已经运行了下文中的命令以进行检查。如果没有，那你尝试过哪些其他的命令？我希望你可以在评论中更新这篇文章，它可能会帮助其他用户。

使用 [top 命令][1] 和 [ps 命令][2] 可以轻松的识别这种情况。我过去经常同时使用这两个命令，两个命令得到的结果是相同的。所以我建议你从中选择一个喜欢的使用就可以。

### 1) 如何使用 ps 命令在 Linux 中查找内存消耗最大的进程

`ps` 命令用于报告当前进程的快照。`ps` 命令的意思是“进程状态”。这是一个标准的 Linux 应用程序，用于查找有关在 Linux 系统上运行进程的信息。

它用于列出当前正在运行的进程及其进程 ID（PID）、进程所有者名称、进程优先级（PR）以及正在运行的命令的绝对路径等。

下面的 `ps` 命令格式为你提供有关内存消耗最大进程的更多信息。

```
# ps aux --sort -rss | head

USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
mysql     1064  3.2  5.4 886076 209988 ?       Ssl  Oct25  62:40 /usr/sbin/mysqld
varnish  23396  0.0  2.9 286492 115616 ?       SLl  Oct25   0:42 /usr/sbin/varnishd -P /var/run/varnish.pid -f /etc/varnish/default.vcl -a :82 -T 127.0.0.1:6082 -S /etc/varnish/secret -s malloc,256M
named     1105  0.0  2.7 311712 108204 ?       Ssl  Oct25   0:16 /usr/sbin/named -u named -c /etc/named.conf
nobody   23377  0.2  2.3 153096 89432 ?        S    Oct25   4:35 nginx: worker process
nobody   23376  0.1  2.1 147096 83316 ?        S    Oct25   2:18 nginx: worker process
root     23375  0.0  1.7 131028 66764 ?        Ss   Oct25   0:01 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
nobody   23378  0.0  1.6 130988 64592 ?        S    Oct25   0:00 nginx: cache manager process
root      1135  0.0  0.9  86708 37572 ?        S    05:37   0:20 cwpsrv: worker process
root      1133  0.0  0.9  86708 37544 ?        S    05:37   0:05 cwpsrv: worker process
```

使用以下 `ps` 命令格式可在输出中仅展示有关内存消耗过程的特定信息。

```
# ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head

  PID  PPID %MEM %CPU CMD
 1064     1  5.4  3.2 /usr/sbin/mysqld
23396 23386  2.9  0.0 /usr/sbin/varnishd -P /var/run/varnish.pid -f /etc/varnish/default.vcl -a :82 -T 127.0.0.1:6082 -S /etc/varnish/secret -s malloc,256M
 1105     1  2.7  0.0 /usr/sbin/named -u named -c /etc/named.conf
23377 23375  2.3  0.2 nginx: worker process
23376 23375  2.1  0.1 nginx: worker process
 3625   977  1.9  0.0 /usr/local/bin/php-cgi /home/daygeekc/public_html/index.php
23375     1  1.7  0.0 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
23378 23375  1.6  0.0 nginx: cache manager process
 1135  3034  0.9  0.0 cwpsrv: worker process
```

如果你只想查看命令名称而不是命令的绝对路径，请使用下面的 `ps` 命令格式。

```
# ps -eo pid,ppid,%mem,%cpu,comm --sort=-%mem | head

  PID  PPID %MEM %CPU COMMAND
 1064     1  5.4  3.2 mysqld
23396 23386  2.9  0.0 cache-main
 1105     1  2.7  0.0 named
23377 23375  2.3  0.2 nginx
23376 23375  2.1  0.1 nginx
23375     1  1.7  0.0 nginx
23378 23375  1.6  0.0 nginx
 1135  3034  0.9  0.0 cwpsrv
 1133  3034  0.9  0.0 cwpsrv
```

### 2) 如何使用 top 命令在 Linux 中查找内存消耗最大的进程

Linux 的 `top` 命令是用来监视 Linux 系统性能的最好和最知名的命令。它在交互界面上显示运行的系统进程的实时视图。但是，如果要查找内存消耗最大的进程，请 [在批处理模式下使用 top 命令][3]。

你应该正确地 [了解 top 命令输出][4] 以解决系统中的性能问题。

```
# top -c -b -o +%MEM | head -n 20 | tail -15

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 1064 mysql     20   0  886076 209740   8388 S   0.0  5.4  62:41.20 /usr/sbin/mysqld
23396 varnish   20   0  286492 115616  83572 S   0.0  3.0   0:42.24 /usr/sbin/varnishd -P /var/run/varnish.pid -f /etc/varnish/default.vcl -a :82 -T 127.0.0.1:6082 -S /etc/varnish/secret -s malloc,256M
 1105 named     20   0  311712 108204   2424 S   0.0  2.8   0:16.41 /usr/sbin/named -u named -c /etc/named.conf
23377 nobody    20   0  153240  89432   2432 S   0.0  2.3   4:35.74 nginx: worker process
23376 nobody    20   0  147096  83316   2416 S   0.0  2.1   2:18.09 nginx: worker process
23375 root      20   0  131028  66764   1616 S   0.0  1.7   0:01.07 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
23378 nobody    20   0  130988  64592    592 S   0.0  1.7   0:00.51 nginx: cache manager process
 1135 root      20   0   86708  37572   2252 S   0.0  1.0   0:20.18 cwpsrv: worker process
 1133 root      20   0   86708  37544   2212 S   0.0  1.0   0:05.94 cwpsrv: worker process
 3034 root      20   0   86704  36740   1452 S   0.0  0.9   0:00.09 cwpsrv: master process /usr/local/cwpsrv/bin/cwpsrv
 1067 nobody    20   0 1356200  31588   2352 S   0.0  0.8   0:56.06 /usr/local/apache/bin/httpd -k start
  977 nobody    20   0 1356088  31268   2372 S   0.0  0.8   0:30.44 /usr/local/apache/bin/httpd -k start
  968 nobody    20   0 1356216  30544   2348 S   0.0  0.8   0:19.95 /usr/local/apache/bin/httpd -k start
```

如果你只想查看命令名称而不是命令的绝对路径，请使用下面的 `top` 命令格式。

```
# top -b -o +%MEM | head -n 20 | tail -15

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 1064 mysql     20   0  886076 210340   8388 S   6.7  5.4  62:40.93 mysqld
23396 varnish   20   0  286492 115616  83572 S   0.0  3.0   0:42.24 cache-main
 1105 named     20   0  311712 108204   2424 S   0.0  2.8   0:16.41 named
23377 nobody    20   0  153240  89432   2432 S  13.3  2.3   4:35.74 nginx
23376 nobody    20   0  147096  83316   2416 S   0.0  2.1   2:18.09 nginx
23375 root      20   0  131028  66764   1616 S   0.0  1.7   0:01.07 nginx
23378 nobody    20   0  130988  64592    592 S   0.0  1.7   0:00.51 nginx
 1135 root      20   0   86708  37572   2252 S   0.0  1.0   0:20.18 cwpsrv
 1133 root      20   0   86708  37544   2212 S   0.0  1.0   0:05.94 cwpsrv
 3034 root      20   0   86704  36740   1452 S   0.0  0.9   0:00.09 cwpsrv
 1067 nobody    20   0 1356200  31588   2352 S   0.0  0.8   0:56.04 httpd
  977 nobody    20   0 1356088  31268   2372 S   0.0  0.8   0:30.44 httpd
  968 nobody    20   0 1356216  30544   2348 S   0.0  0.8   0:19.95 httpd
```

### 3) 奖励技巧：如何使用 ps_mem 命令在 Linux 中查找内存消耗最大的进程

[ps_mem 程序][5] 用于显示每个程序（而不是每个进程）使用的核心内存。该程序允许你检查每个程序使用了多少内存。它根据程序计算私有和共享内存的数量，并以最合适的方式返回已使用的总内存。

它使用以下逻辑来计算内存使用量。总内存使用量 = sum(用于程序进程的专用内存使用量) + sum(用于程序进程的共享内存使用量)。

```
# ps_mem

 Private  +   Shared  =  RAM used    Program
128.0 KiB +  27.5 KiB = 155.5 KiB    agetty
228.0 KiB +  47.0 KiB = 275.0 KiB    atd
284.0 KiB +  53.0 KiB = 337.0 KiB    irqbalance
380.0 KiB +  81.5 KiB = 461.5 KiB    dovecot
364.0 KiB + 121.5 KiB = 485.5 KiB    log
520.0 KiB +  65.5 KiB = 585.5 KiB    auditd
556.0 KiB +  60.5 KiB = 616.5 KiB    systemd-udevd
732.0 KiB +  48.0 KiB = 780.0 KiB    crond
296.0 KiB + 524.0 KiB = 820.0 KiB    avahi-daemon (2)
772.0 KiB +  51.5 KiB = 823.5 KiB    systemd-logind
940.0 KiB + 162.5 KiB =   1.1 MiB    dbus-daemon
  1.1 MiB +  99.0 KiB =   1.2 MiB    pure-ftpd
  1.2 MiB + 100.5 KiB =   1.3 MiB    master
  1.3 MiB + 198.5 KiB =   1.5 MiB    pickup
  1.3 MiB + 198.5 KiB =   1.5 MiB    bounce
  1.3 MiB + 198.5 KiB =   1.5 MiB    pipe
  1.3 MiB + 207.5 KiB =   1.5 MiB    qmgr
  1.4 MiB + 198.5 KiB =   1.6 MiB    cleanup
  1.3 MiB + 299.5 KiB =   1.6 MiB    trivial-rewrite
  1.5 MiB + 145.0 KiB =   1.6 MiB    config
  1.4 MiB + 291.5 KiB =   1.6 MiB    tlsmgr
  1.4 MiB + 308.5 KiB =   1.7 MiB    local
  1.4 MiB + 323.0 KiB =   1.8 MiB    anvil (2)
  1.3 MiB + 559.0 KiB =   1.9 MiB    systemd-journald
  1.8 MiB + 240.5 KiB =   2.1 MiB    proxymap
  1.9 MiB + 322.5 KiB =   2.2 MiB    auth
  2.4 MiB +  88.5 KiB =   2.5 MiB    systemd
  2.8 MiB + 458.5 KiB =   3.2 MiB    smtpd
  2.9 MiB + 892.0 KiB =   3.8 MiB    bash (2)
  3.3 MiB + 555.5 KiB =   3.8 MiB    NetworkManager
  4.1 MiB + 233.5 KiB =   4.3 MiB    varnishd
  4.0 MiB + 662.0 KiB =   4.7 MiB    dhclient (2)
  4.3 MiB + 623.5 KiB =   4.9 MiB    rsyslogd
  3.6 MiB +   1.8 MiB =   5.5 MiB    sshd (3)
  5.6 MiB + 431.0 KiB =   6.0 MiB    polkitd
 13.0 MiB + 546.5 KiB =  13.6 MiB    tuned
 22.5 MiB +  76.0 KiB =  22.6 MiB    lfd - sleeping
 30.0 MiB +   6.2 MiB =  36.2 MiB    php-fpm (6)
  5.7 MiB +  33.5 MiB =  39.2 MiB    cwpsrv (3)
 20.1 MiB +  25.3 MiB =  45.4 MiB    httpd (5)
104.7 MiB + 156.0 KiB = 104.9 MiB    named
112.2 MiB + 479.5 KiB = 112.7 MiB    cache-main
 69.4 MiB +  58.6 MiB = 128.0 MiB    nginx (4)
203.4 MiB + 309.5 KiB = 203.7 MiB    mysqld
---------------------------------
                        775.8 MiB
=================================
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-find-top-memory-consuming-processes/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[lnrCoder](https://github.com/lnrCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-top-command-linux-system-performance-monitoring-tool/
[2]: https://www.2daygeek.com/linux-ps-command-find-running-process-monitoring/
[3]: https://linux.cn/article-11491-1.html
[4]: https://www.2daygeek.com/understanding-linux-top-command-output-usage/
[5]: https://www.2daygeek.com/ps_mem-report-core-memory-usage-accurately-in-linux/
