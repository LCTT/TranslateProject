[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11678-1.html)
[#]: subject: (How to Find High CPU Consumption Processes in Linux)
[#]: via: (https://www.2daygeek.com/how-to-find-high-cpu-consumption-processes-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 中找出 CPU 占用高的进程
======

![](https://img.linux.net.cn/data/attachment/album/201912/15/152614cp9bjmfwpofwvsx1.jpg)

在之前的文章中我们已经讨论过 [如何在 Linux 中找出内存消耗最大的进程][1]。你可能也会遇到在 Linux 系统中找出 CPU 占用高的进程的情形。如果是这样，那么你需要列出系统中 CPU 占用高的进程列表来确定。我认为只有两种方法能实现：使用 [top 命令][2] 和 [ps 命令][3]。出于一些理由，我更倾向于用 `top` 命令而不是 `ps` 命令。但是两个工具都能达到你要的目的，所以你可以根据需求决定使用哪个。这两个工具都被 Linux 系统管理员广泛使用。

### 1) 怎样使用 top 命令找出 Linux 中 CPU 占用高的进程

在所有监控 Linux 系统性能的工具中，Linux 的 `top` 命令是最好的也是最知名的一个。`top` 命令提供了 Linux 系统运行中的进程的动态实时视图。它能显示系统的概览信息和 Linux 内核当前管理的进程列表。它显示了大量的系统信息，如 CPU 使用、内存使用、交换内存、运行的进程数、目前系统开机时间、系统负载、缓冲区大小、缓存大小、进程 PID 等等。默认情况下，`top` 命令的输出结果按 CPU 占用进行排序，每 5 秒中更新一次结果。如果你想要一个更清晰的视图来更深入的分析结果，[以批处理模式运行 top 命令][4] 是最好的方法。同时，你需要 [理解 top 命令输出结果的含义][5] ，这样才能解决系统的性能问题。

```
# top -b | head -50

top - 00:19:17 up 14:23,  1 user,  load average: 2.46, 2.18, 1.97
Tasks: 306 total,   1 running, 305 sleeping,   0 stopped,   0 zombie
%Cpu0  : 10.4 us,  3.0 sy,  0.0 ni, 83.9 id,  0.0 wa,  1.3 hi,  1.3 si,  0.0 st
%Cpu1  : 17.0 us,  3.0 sy,  0.0 ni, 78.7 id,  0.0 wa,  0.3 hi,  1.0 si,  0.0 st
%Cpu2  : 13.0 us,  4.0 sy,  0.0 ni, 81.3 id,  0.0 wa,  0.3 hi,  1.3 si,  0.0 st
%Cpu3  : 12.3 us,  3.3 sy,  0.0 ni, 82.5 id,  0.3 wa,  0.7 hi,  1.0 si,  0.0 st
%Cpu4  : 12.2 us,  3.0 sy,  0.0 ni, 82.8 id,  0.7 wa,  0.3 hi,  1.0 si,  0.0 st
%Cpu5  :  6.4 us,  2.7 sy,  0.0 ni, 89.2 id,  0.0 wa,  0.7 hi,  1.0 si,  0.0 st
%Cpu6  : 26.7 us,  3.4 sy,  0.0 ni, 68.6 id,  0.0 wa,  0.7 hi,  0.7 si,  0.0 st
%Cpu7  : 15.6 us,  4.0 sy,  0.0 ni, 78.8 id,  0.0 wa,  0.7 hi,  1.0 si,  0.0 st
KiB Mem : 16248556 total,  1448920 free,  8571484 used,  6228152 buff/cache
KiB Swap: 17873388 total, 17873388 free,        0 used.  4596044 avail Mem
PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 2179 daygeek   20     3106324 613584 327564 S  79.5   3.8  14:19.76 Web Content
 1714 daygeek   20     4603372 974600 403504 S  20.2   6.0  65:18.91 firefox
 1227 daygeek   20     4192012 376332 180348 S  13.9   2.3  20:43.26 gnome-shell
18324 daygeek   20     3296192 766040 127948 S   6.3   4.7   9:18.12 Web Content
 1170 daygeek   20     1008264 572036 546180 S   6.0   3.5  18:07.85 Xorg
 4684 daygeek   20     3363708   1.1g   1.0g S   3.6   7.2  13:49.92 VirtualBoxVM
 4607 daygeek   20     4591040   1.7g   1.6g S   3.0  11.0  14:09.65 VirtualBoxVM
 1211 daygeek    9 -11 2865268  21032  16588 S   2.0   0.1  10:46.37 pulseaudio
 4562 daygeek   20     1096888  28812  21044 S   1.7   0.2   4:42.93 VBoxSVC
 1783 daygeek   20     3123888 376896 134788 S   1.3   2.3  39:32.56 Web Content
 3286 daygeek   20     3089736 404088 184968 S   1.0   2.5  41:57.44 Web Content
```

上面的命令的各部分解释：

  * `top`：命令
  * `-b`：批次档模式
  * `head -50`：显示输出结果的前 50 个
  * `PID`：进程的 ID
  * `USER`：进程的归属者
  * `PR`：进程的等级
  * `NI`：进程的 NICE 值
  * `VIRT`：进程使用的虚拟内存
  * `RES`：进程使用的物理内存
  * `SHR`：进程使用的共享内存
  * `S`：这个值表示进程的状态: `S` = 睡眠，`R` = 运行，`Z` = 僵尸进程
  * `%CPU`：进程占用的 CPU 比例
  * `%MEM`：进程使用的 RAM 比例
  * `TIME+`：进程运行了多长时间
  * `COMMAND`：进程名字

如果你想看命令的完整路径而不是命令名字，以运行下面的格式 `top` 命令：

```
# top -c -b | head -50

top - 00:28:49 up 14:33,  1 user,  load average: 2.43, 2.49, 2.23
Tasks: 305 total,   1 running, 304 sleeping,   0 stopped,   0 zombie
%Cpu0  : 11.7 us,  3.7 sy,  0.0 ni, 82.3 id,  0.0 wa,  1.0 hi,  1.3 si,  0.0 st
%Cpu1  : 13.6 us,  3.3 sy,  0.0 ni, 81.1 id,  0.7 wa,  0.3 hi,  1.0 si,  0.0 st
%Cpu2  : 10.9 us,  2.6 sy,  0.0 ni, 85.1 id,  0.0 wa,  0.3 hi,  1.0 si,  0.0 st
%Cpu3  : 16.0 us,  2.6 sy,  0.0 ni, 80.1 id,  0.0 wa,  0.3 hi,  1.0 si,  0.0 st
%Cpu4  :  9.2 us,  3.6 sy,  0.0 ni, 85.9 id,  0.0 wa,  0.3 hi,  1.0 si,  0.0 st
%Cpu5  : 15.6 us,  2.9 sy,  0.0 ni, 80.5 id,  0.0 wa,  0.3 hi,  0.7 si,  0.0 st
%Cpu6  : 11.6 us,  4.3 sy,  0.0 ni, 82.7 id,  0.0 wa,  0.3 hi,  1.0 si,  0.0 st
%Cpu7  :  8.0 us,  3.0 sy,  0.0 ni, 87.3 id,  0.0 wa,  0.7 hi,  1.0 si,  0.0 st
KiB Mem : 16248556 total,  1022456 free,  8778508 used,  6447592 buff/cache
KiB Swap: 17873388 total, 17873388 free,        0 used.  4201560 avail Mem
PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
18527 daygeek   20     3151820 624808 325748 S  52.8   3.8  59:26.72 /usr/lib/firefox/firefox -contentproc -childID 18 -isForBrowser -prefsLen 10002 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /+
 1714 daygeek   20     4764668 910940 443228 S  21.5   5.6  68:59.33 /usr/lib/firefox/firefox --new-window
 1227 daygeek   20     4193108 377344 181404 S  11.6   2.3  21:47.36 /usr/bin/gnome-shell
 1170 daygeek   20     1008820 572700 546844 S   5.6   3.5  19:05.10 /usr/lib/Xorg vt2 -displayfd 3 -auth /run/user/1000/gdm/Xauthority -nolisten tcp -background none -noreset -keeptty -verbose 3
18324 daygeek   20     3300288 789344 127948 S   5.0   4.9   9:46.89 /usr/lib/firefox/firefox -contentproc -childID 16 -isForBrowser -prefsLen 10002 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /+
 4684 daygeek   20     3363708   1.1g   1.0g S   3.6   7.2  14:10.18 /usr/lib/virtualbox/VirtualBoxVM --comment CentOS7 --startvm 002f47b8-2af2-48f5-be1d-67b67e03514c --no-startvm-errormsgbox
 4607 daygeek   20     4591040   1.7g   1.6g S   3.0  11.0  14:28.86 /usr/lib/virtualbox/VirtualBoxVM --comment Ubuntu-18.04 --startvm e8c32dbb-8b01-41b0-977a-bf28b9db1117 --no-startvm-errormsgbox
 1783 daygeek   20     3132640 451924 132168 S   2.6   2.8  39:49.66 /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -prefsLen 1 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /usr/l+
 1211 daygeek    9 -11 2865268  21272  16828 S   2.0   0.1  11:01.29 /usr/bin/pulseaudio --daemonize=no
 4562 daygeek   20     1096888  28812  21044 S   1.7   0.2   4:49.33 /usr/lib/virtualbox/VBoxSVC --auto-shutdown
16865 daygeek   20     3073364 430596 124652 S   1.3   2.7   8:04.02 /usr/lib/firefox/firefox -contentproc -childID 15 -isForBrowser -prefsLen 10002 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /+
 2179 daygeek   20     2945348 429644 172940 S   1.0   2.6  15:20.90 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -prefsLen 7821 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /us+
```

### 2) 怎样使用 ps 命令找出 Linux 中 CPU 占用高的进程

`ps` 是<ruby>进程状态<rt>process status</rt></ruby>的缩写，它能显示系统中活跃的/运行中的进程的信息。它提供了当前进程及其详细信息，诸如用户名、用户 ID、CPU 使用率、内存使用、进程启动日期时间、命令名等等的快照。

```
# ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%cpu | head

  PID  PPID %MEM %CPU CMD
18527  1714  4.2 40.3 /usr/lib/firefox/firefox -contentproc -childID 18 -isForBrowser -prefsLen 10002 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1714 true tab
 1714  1152  5.6  8.0 /usr/lib/firefox/firefox --new-window
18324  1714  4.9  6.3 /usr/lib/firefox/firefox -contentproc -childID 16 -isForBrowser -prefsLen 10002 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1714 true tab
 3286  1714  2.0  5.1 /usr/lib/firefox/firefox -contentproc -childID 14 -isForBrowser -prefsLen 8078 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1714 true tab
 1783  1714  3.0  4.5 /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -prefsLen 1 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1714 true tab
 1227  1152  2.3  2.5 /usr/bin/gnome-shell
 1170  1168  3.5  2.2 /usr/lib/Xorg vt2 -displayfd 3 -auth /run/user/1000/gdm/Xauthority -nolisten tcp -background none -noreset -keeptty -verbose 3
16865  1714  2.5  2.1 /usr/lib/firefox/firefox -contentproc -childID 15 -isForBrowser -prefsLen 10002 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1714 true tab
 2179  1714  2.7  1.8 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -prefsLen 7821 -prefMapSize 213431 -parentBuildID 20191031132559 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1714 true tab
```

上面的命令的各部分解释：

  * `ps`：命令名字
  * `-e`：选择所有进程
  * `-o`：自定义输出格式
  * `–sort=-%cpu`：基于 CPU 使用率对输出结果排序
  * `head`：显示结果的前 10 行
  * `PID`：进程的 ID
  * `PPID`：父进程的 ID 
  * `%MEM`：进程使用的 RAM 比例
  * `%CPU`：进程占用的 CPU 比例
  * `Command`：进程名字

如果你只想看命令名字而不是命令的绝对路径，以运行下面的格式 `ps` 命令：

```
# ps -eo pid,ppid,%mem,%cpu,comm --sort=-%cpu | head

  PID  PPID %MEM %CPU COMMAND
18527  1714  4.1 40.4 Web Content
 1714  1152  5.7  8.0 firefox
18324  1714  4.9  6.3 Web Content
 3286  1714  2.0  5.1 Web Content
 1783  1714  3.0  4.5 Web Content
 1227  1152  2.3  2.5 gnome-shell
 1170  1168  3.5  2.2 Xorg
16865  1714  2.4  2.1 Web Content
 2179  1714  2.7  1.8 Web Content
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-find-high-cpu-consumption-processes-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-11542-1.html
[2]: https://www.2daygeek.com/linux-top-command-linux-system-performance-monitoring-tool/
[3]: https://www.2daygeek.com/linux-ps-command-find-running-process-monitoring/
[4]: https://www.2daygeek.com/linux-run-execute-top-command-in-batch-mode/
[5]: https://www.2daygeek.com/understanding-linux-top-command-output-usage/
