[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11007-1.html)
[#]: subject: (Bash Script to Monitor Memory Usage on Linux)
[#]: via: (https://www.2daygeek.com/linux-bash-script-to-monitor-memory-utilization-usage-and-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

用 Bash 脚本监控 Linux 上的内存使用情况
======

![](https://img.linux.net.cn/data/attachment/album/201906/23/085446setqkshf5zk0tn2x.jpg)

目前市场上有许多开源监控工具可用于监控 Linux 系统的性能。当系统达到指定的阈值限制时，它可以发送电子邮件警报。它可以监视 CPU 利用率、内存利用率、交换利用率、磁盘空间利用率等所有内容。

如果你只有很少的系统并且想要监视它们，那么编写一个小的 shell 脚本可以使你的任务变得非常简单。

在本教程中，我们添加了两个 shell 脚本来监视 Linux 系统上的内存利用率。当系统达到给定阈值时，它将给特定电子邮件地址发邮件。

### 方法-1：用 Linux Bash 脚本监视内存利用率并发送电子邮件

如果只想在系统达到给定阈值时通过邮件获取当前内存利用率百分比，请使用以下脚本。

这是个非常简单直接的单行脚本。在大多数情况下，我更喜欢使用这种方法。

当你的系统达到内存利用率的 80％ 时，它将触发一封电子邮件。

```
*/5 * * * * /usr/bin/free | awk '/Mem/{printf("RAM Usage: %.2f%\n"), $3/$2*100}' |  awk '{print $3}' | awk '{ if($1 > 80) print $0;}' | mail -s "High Memory Alert" 2daygeek@gmail.com
```

**注意：**你需要更改电子邮件地址而不是使用我们的电子邮件地址。此外，你可以根据你的要求更改内存利用率阈值。

**输出：**你将收到类似下面的电子邮件提醒。

```
High Memory Alert: 80.40%
```

我们过去添加了许多有用的 shell 脚本。如果要查看这些内容，请导航至以下链接。

 * [如何使用 shell 脚本自动执行日常活动？][1]

### 方法-2：用 Linux Bash 脚本监视内存利用率并发送电子邮件

如果要在邮件警报中获取有关内存利用率的更多信息。使用以下脚本，其中包括基于 `top` 命令和 `ps` 命令的最高内存利用率和进程详细信息。

这将立即让你了解系统的运行情况。

当你的系统达到内存利用率的 “80％” 时，它将触发一封电子邮件。

**注意：**你需要更改电子邮件地址而不是使用我们的电子邮件地址。此外，你可以根据你的要求更改内存利用率阈值。

```
# vi /opt/scripts/memory-alert.sh

#!/bin/sh
ramusage=$(free | awk '/Mem/{printf("RAM Usage: %.2f\n"), $3/$2*100}'| awk '{print $3}')

if [ "$ramusage" > 20 ]; then

  SUBJECT="ATTENTION: Memory Utilization is High on $(hostname) at $(date)"
  MESSAGE="/tmp/Mail.out"
  TO="2daygeek@gmail.com"
  echo "Memory Current Usage is: $ramusage%" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "Top Memory Consuming Process Using top command" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "$(top -b -o +%MEM | head -n 20)" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "Top Memory Consuming Process Using ps command" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "$(ps -eo pid,ppid,%mem,%Memory,cmd --sort=-%mem | head)" >> $MESSAGE
  mail -s "$SUBJECT" "$TO" < $MESSAGE
  rm /tmp/Mail.out
fi
```

最后添加一个 [cron 任务][2] 来自动执行此操作。它将每 5 分钟运行一次。

```
# crontab -e
*/5 * * * * /bin/bash /opt/scripts/memory-alert.sh
```

**注意：**由于脚本计划每 5 分钟运行一次，因此你将在最多 5 分钟后收到电子邮件提醒（但不是 5 分钟，取决于具体时间）。

比如说，如果你的系统达到 8.25 的给定限制，那么你将在 5 分钟内收到电子邮件警报。希望现在说清楚了。

**输出：**你将收到类似下面的电子邮件提醒。

```
Memory Current Usage is: 80.71%

+------------------------------------------------------------------+
Top Memory Consuming Process Using top command
+------------------------------------------------------------------+
top - 12:00:58 up 5 days,  9:03,  1 user,  load average: 1.82, 2.60, 2.83
Tasks: 314 total,   1 running, 313 sleeping,   0 stopped,   0 zombie
%Cpu0  :  8.3 us, 12.5 sy,  0.0 ni, 75.0 id,  0.0 wa,  0.0 hi,  4.2 si,  0.0 st
%Cpu1  : 13.6 us,  4.5 sy,  0.0 ni, 81.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu2  : 21.7 us, 21.7 sy,  0.0 ni, 56.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu3  : 13.6 us,  9.1 sy,  0.0 ni, 77.3 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu4  : 17.4 us,  8.7 sy,  0.0 ni, 73.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu5  : 20.8 us,  4.2 sy,  0.0 ni, 70.8 id,  0.0 wa,  0.0 hi,  4.2 si,  0.0 st
%Cpu6  :  9.1 us,  0.0 sy,  0.0 ni, 90.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu7  : 17.4 us,  4.3 sy,  0.0 ni, 78.3 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 16248588 total,  5015964 free,  6453404 used,  4779220 buff/cache
KiB Swap: 17873388 total, 16928620 free,   944768 used.  6423008 avail Mem 

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
17163 daygeek   20     2033204 487736 282888 S  10.0   3.0   8:26.07 /usr/lib/firefox/firefox -contentproc -childID 15 -isForBrowser -prefsLen 9408 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /u+
 1121 daygeek   20     4191388 419180 100552 S   5.0   2.6 126:02.84 /usr/bin/gnome-shell
 1902 daygeek   20     1701644 327216  82536 S  20.0   2.0 153:27.92 /opt/google/chrome/chrome
 2969 daygeek   20     1051116 324656  92388 S  15.0   2.0 149:38.09 /opt/google/chrome/chrome --type=renderer --field-trial-handle=10346122902703263820,11905758137655502112,131072 --service-pipe-token=1339861+
 1068 daygeek   20     1104856 309552 278072 S   5.0   1.9 143:47.42 /usr/lib/Xorg vt2 -displayfd 3 -auth /run/user/1000/gdm/Xauthority -nolisten tcp -background none -noreset -keeptty -verbose 3
27246 daygeek   20      907344 265600 108276 S  30.0   1.6  10:42.80 /opt/google/chrome/chrome --type=renderer --field-trial-handle=10346122902703263820,11905758137655502112,131072 --service-pipe-token=8587368+

+------------------------------------------------------------------+
Top Memory Consuming Process Using ps command
+------------------------------------------------------------------+
  PID  PPID %MEM %CPU CMD
 8223     1  6.4  6.8 /usr/lib/firefox/firefox --new-window
13948  1121  6.3  1.2 /usr/bin/../lib/notepadqq/notepadqq-bin
 8671  8223  4.4  7.5 /usr/lib/firefox/firefox -contentproc -childID 5 -isForBrowser -prefsLen 6999 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
17163  8223  3.0  0.6 /usr/lib/firefox/firefox -contentproc -childID 15 -isForBrowser -prefsLen 9408 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
 1121  1078  2.5  1.6 /usr/bin/gnome-shell
17937  8223  2.5  0.8 /usr/lib/firefox/firefox -contentproc -childID 16 -isForBrowser -prefsLen 9410 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
 8499  8223  2.2  0.6 /usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 6635 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
 8306  8223  2.2  0.8 /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -prefsLen 1 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
 9198  8223  2.1  0.6 /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -prefsLen 8604 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-bash-script-to-monitor-memory-utilization-usage-and-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
[2]: https://www.2daygeek.com/crontab-cronjob-to-schedule-jobs-in-linux/
