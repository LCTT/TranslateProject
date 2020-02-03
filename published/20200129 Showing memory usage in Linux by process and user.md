[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11849-1.html)
[#]: subject: (Showing memory usage in Linux by process and user)
[#]: via: (https://www.networkworld.com/article/3516319/showing-memory-usage-in-linux-by-process-and-user.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

查看 Linux 系统中进程和用户的内存使用情况
======

> 有一些命令可以用来检查 Linux 系统中的内存使用情况，下面是一些更好的命令。

![Fancycrave][1]

有许多工具可以查看 Linux 系统中的内存使用情况。一些命令被广泛使用，比如 `free`、`ps`。而另一些命令允许通过多种方式展示系统的性能统计信息，比如 `top`。在这篇文章中，我们将介绍一些命令以帮助你确定当前占用着最多内存资源的用户或者进程。

下面是一些按照进程查看内存使用情况的命令：

### 按照进程查看内存使用情况

#### 使用 top

`top` 是最好的查看内存使用情况的命令之一。为了查看哪个进程使用着最多的内存，一个简单的办法就是启动 `top`，然后按下 `shift+m`，这样便可以查看按照内存占用百分比从高到底排列的进程。当你按下了 `shift+m` ，你的 `top` 应该会得到类似于下面这样的输出结果：

```
$top
top - 09:39:34 up 5 days, 3 min,  3 users,  load average: 4.77, 4.43, 3.72
Tasks: 251 total,   3 running, 247 sleeping,   1 stopped,   0 zombie
%Cpu(s): 50.6 us, 35.9 sy,  0.0 ni, 13.4 id,  0.2 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   5944.4 total,    128.9 free,   2509.3 used,   3306.2 buff/cache
MiB Swap:   2048.0 total,   2045.7 free,      2.2 used.   3053.5 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  400 nemo      20   0 3309580 550188 168372 S   0.3   9.0   1:33.27 Web Content
32469 nemo      20   0 3492840 447372 163296 S   7.3   7.3   3:55.60 firefox
32542 nemo      20   0 2845732 433388 140984 S   6.0   7.1   4:11.16 Web Content
  342 nemo      20   0 2848520 352288 118972 S  10.3   5.8   4:04.89 Web Content
 2389 nemo      20   0 1774412 236700  90044 S  39.7   3.9   9:32.64 vlc
29527 nemo      20   0 2735792 225980  84744 S   9.6   3.7   3:02.35 gnome-shell
30497 nemo      30  10 1088476 159636  88884 S   0.0   2.6   0:11.99 update-manager
30058 nemo      20   0 1089464 140952  33128 S   0.0   2.3   0:04.58 gnome-software
32533 nemo      20   0 2389088 104712  79544 S   0.0   1.7   0:01.43 WebExtensions
 2256 nemo      20   0 1217884 103424  31304 T   0.0   1.7   0:00.28 vlc
 1713 nemo      20   0 2374396  79588  61452 S   0.0   1.3   0:00.49 Web Content
29306 nemo      20   0  389668  74376  54340 S   2.3   1.2   0:57.25 Xorg
32739 nemo      20   0  289528  58900  34480 S   1.0   1.0   1:04.08 RDD Process
29732 nemo      20   0  789196  57724  42428 S   0.0   0.9   0:00.38 evolution-alarm
 2373 root      20   0  150408  57000   9924 S   0.3   0.9  10:15.35 nessusd
```

注意 `%MEM` 排序。列表的大小取决于你的窗口大小，但是占据着最多的内存的进程将会显示在列表的顶端。

#### 使用 ps

`ps` 命令中的一列用来展示每个进程的内存使用情况。为了展示和查看哪个进程使用着最多的内存，你可以将 `ps` 命令的结果传递给 `sort` 命令。下面是一个有用的示例：

```
$ ps aux | sort -rnk 4 | head -5
nemo       400  3.4  9.2 3309580 563336 ?      Sl   08:59   1:36 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -prefsLen 9086 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo     32469  8.2  7.7 3492840 469516 ?      Sl   08:54   4:15 /usr/lib/firefox/firefox -new-window
nemo     32542  8.9  7.6 2875428 462720 ?      Sl   08:55   4:36 /usr/lib/firefox/firefox -contentproc -childID 2 -isForBrowser -prefsLen 1 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo       342  9.9  5.9 2854664 363528 ?      Sl   08:59   4:44 /usr/lib/firefox/firefox -contentproc -childID 5 -isForBrowser -prefsLen 8763 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo      2389 39.5  3.8 1774412 236116 pts/1  Sl+  09:15  12:21 vlc videos/edge_computing.mp4
```

在上面的例子中（文中已截断），`sort` 命令使用了 `-r` 选项（反转）、`-n` 选项（数字值）、`-k` 选项（关键字），使 `sort` 命令对 `ps` 命令的结果按照第四列（内存使用情况）中的数字逆序进行排列并输出。如果我们首先显示 `ps` 命令的标题，那么将会便于查看。

```
$ ps aux | head -1; ps aux | sort -rnk 4 | head -5
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
nemo       400  3.4  9.2 3309580 563336 ?      Sl   08:59   1:36 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -prefsLen 9086 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo     32469  8.2  7.7 3492840 469516 ?      Sl   08:54   4:15 /usr/lib/firefox/firefox -new-window
nemo     32542  8.9  7.6 2875428 462720 ?      Sl   08:55   4:36 /usr/lib/firefox/firefox -contentproc -childID 2 -isForBrowser -prefsLen 1 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo       342  9.9  5.9 2854664 363528 ?      Sl   08:59   4:44 /usr/lib/firefox/firefox -contentproc -childID 5 -isForBrowser -prefsLen 8763 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo      2389 39.5  3.8 1774412 236116 pts/1  Sl+  09:15  12:21 vlc videos/edge_computing.mp4
```

如果你喜欢这个命令，你可以用下面的命令为他指定一个别名，如果你想一直使用它，不要忘记把该命令添加到你的 `~/.bashrc` 文件中。

```
$ alias mem-by-proc="ps aux | head -1; ps aux | sort -rnk 4"
```

下面是一些根据用户查看内存使用情况的命令：

### 按用户查看内存使用情况

#### 使用 top

按照用户检查内存使用情况会更复杂一些，因为你需要找到一种方法把用户所拥有的所有进程统计为单一的内存使用量。

如果你只想查看单个用户进程使用情况，`top` 命令可以采用与上文中同样的方法进行使用。只需要添加 `-U` 选项并在其后面指定你要查看的用户名，然后按下 `shift+m` 便可以按照内存使用有多到少进行查看。

```
$ top -U nemo
top - 10:16:33 up 5 days, 40 min,  3 users,  load average: 1.91, 1.82, 2.15
Tasks: 253 total,   2 running, 250 sleeping,   1 stopped,   0 zombie
%Cpu(s): 28.5 us, 36.8 sy,  0.0 ni, 34.4 id,  0.3 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   5944.4 total,    224.1 free,   2752.9 used,   2967.4 buff/cache
MiB Swap:   2048.0 total,   2042.7 free,      5.2 used.   2812.0 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  400 nemo      20   0 3315724 623748 165440 S   1.0  10.2   1:48.78 Web Content
32469 nemo      20   0 3629380 607492 161688 S   2.3  10.0   6:06.89 firefox
32542 nemo      20   0 2886700 404980 136648 S   5.6   6.7   6:50.01 Web Content
  342 nemo      20   0 2922248 375784 116096 S  19.5   6.2   8:16.07 Web Content
 2389 nemo      20   0 1762960 234644  87452 S   0.0   3.9  13:57.53 vlc
29527 nemo      20   0 2736924 227260  86092 S   0.0   3.7   4:09.11 gnome-shell
30497 nemo      30  10 1088476 156372  85620 S   0.0   2.6   0:11.99 update-manager
30058 nemo      20   0 1089464 138160  30336 S   0.0   2.3   0:04.62 gnome-software
32533 nemo      20   0 2389088 102532  76808 S   0.0   1.7   0:01.79 WebExtensions
```

#### 使用 ps

你依旧可以使用 `ps` 命令通过内存使用情况来排列某个用户的进程。在这个例子中，我们将使用 `grep` 命令来筛选得到某个用户的所有进程。

```
$ ps aux | head -1; ps aux | grep ^nemo| sort -rnk 4 | more
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
nemo     32469  7.1 11.5 3724364 701388 ?      Sl   08:54   7:21 /usr/lib/firefox/firefox -new-window
nemo       400  2.0  8.9 3308556 543232 ?      Sl   08:59   2:01 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -prefsLen 9086 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni/usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo     32542  7.9  7.1 2903084 436196 ?      Sl   08:55   8:07 /usr/lib/firefox/firefox -contentproc -childID 2 -isForBrowser -prefsLen 1 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo       342 10.8  7.0 2941056 426484 ?      Rl   08:59  10:45 /usr/lib/firefox/firefox -contentproc -childID 5 -isForBrowser -prefsLen 8763 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo      2389 16.9  3.8 1762960 234644 pts/1  Sl+  09:15  13:57 vlc videos/edge_computing.mp4
nemo     29527  3.9  3.7 2736924 227448 ?      Ssl  08:50   4:11 /usr/bin/gnome-shell
```
### 使用 ps 和其他命令的搭配

如果你想比较某个用户与其他用户内存使用情况将会比较复杂。在这种情况中，创建并排序一个按照用户总的内存使用量是一个不错的方法，但是它需要做一些更多的工作，并涉及到许多命令。在下面的脚本中，我们使用 `ps aux | grep -v COMMAND | awk '{print $1}' | sort -u` 命令得到了用户列表。其中包含了系统用户比如 `syslog`。我们对每个任务使用 `awk` 命令以收集每个用户总的内存使用情况。在最后一步中，我们展示每个用户总的内存使用量（按照从大到小的顺序）。

```
#!/bin/bash

stats=””
echo "%   user"
echo "============"

# collect the data
for user in `ps aux | grep -v COMMAND | awk '{print $1}' | sort -u`
do
  stats="$stats\n`ps aux | egrep ^$user | awk 'BEGIN{total=0}; \
    {total += $4};END{print total,$1}'`"
done

# sort data numerically (largest first)
echo -e $stats | grep -v ^$ | sort -rn | head
```

这个脚本的输出可能如下：

```
$ ./show_user_mem_usage
%   user
============
69.6 nemo
5.8 root
0.5 www-data
0.3 shs
0.2 whoopsie
0.2 systemd+
0.2 colord
0.2 clamav
0 syslog
0 rtkit
```

在 Linux 有许多方法可以报告内存使用情况。可以通过一些用心设计的工具和命令，来查看并获得某个进程或者用户占用着最多的内存。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3516319/showing-memory-usage-in-linux-by-process-and-user.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/06/chips_processors_memory_cards_by_fancycrave_cc0_via_unsplash_1200x800-100760955-large.jpg
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
