[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Showing memory usage in Linux by process and user)
[#]: via: (https://www.networkworld.com/article/3516319/showing-memory-usage-in-linux-by-process-and-user.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Showing memory usage in Linux by process and user
======
There are several commands for checking up on memory usage in a Linux system, and here are some of the better ones.
[Fancycrave][1] [(CC0)][2]

There are a lot of tools for looking at memory usage on Linux systems. Some are commonly used commands like **free** and **ps** while others are tools like **top** that allow you to display system performance stats in various ways. In this post, we’ll look at some commands that can be most helpful in identifying the users and processes that are using the most memory.

Here are some that address memory usage by process.

### Using top

One of the best commands for looking at memory usage is **top**. One extremely easy way to see what processes are using the most memory is to start **top** and then press **shift+m** to switch the order of the processes shown to rank them by the percentage of memory each is using. Once you’ve entered **shift+m**, your top output should reorder the task entries to look something like this:

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

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

Notice the **%MEM** ranking. The list will be limited by your window size, but the most significant processes with respect to memory usage will show up at the top of the process list.

### Using ps

The **ps** command includes a column that displays memory usage for each process. To get the most useful display for viewing the top memory users, however, you can pass the **ps** output from this command to the **sort** command. Here’s an example that provides a very useful display:

```
$ ps aux | sort -rnk 4 | head -5
nemo       400  3.4  9.2 3309580 563336 ?      Sl   08:59   1:36 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -prefsLen 9086 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo     32469  8.2  7.7 3492840 469516 ?      Sl   08:54   4:15 /usr/lib/firefox/firefox -new-window
nemo     32542  8.9  7.6 2875428 462720 ?      Sl   08:55   4:36 /usr/lib/firefox/firefox -contentproc -childID 2 -isForBrowser -prefsLen 1 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo       342  9.9  5.9 2854664 363528 ?      Sl   08:59   4:44 /usr/lib/firefox/firefox -contentproc -childID 5 -isForBrowser -prefsLen 8763 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo      2389 39.5  3.8 1774412 236116 pts/1  Sl+  09:15  12:21 vlc videos/edge_computing.mp4
```

In the example above (truncated for this post), sort is being used with the **-r** (reverse), the **-n** (numeric) and the **-k** (key) options which are telling the command to sort the output in reverse numeric order based on the fourth column (memory usage) in the output from **ps**. If we first display the heading for the **ps** output, this is a little easier to see.

```
$ ps aux | head -1; ps aux | sort -rnk 4 | head -5
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
nemo       400  3.4  9.2 3309580 563336 ?      Sl   08:59   1:36 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -prefsLen 9086 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo     32469  8.2  7.7 3492840 469516 ?      Sl   08:54   4:15 /usr/lib/firefox/firefox -new-window
nemo     32542  8.9  7.6 2875428 462720 ?      Sl   08:55   4:36 /usr/lib/firefox/firefox -contentproc -childID 2 -isForBrowser -prefsLen 1 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo       342  9.9  5.9 2854664 363528 ?      Sl   08:59   4:44 /usr/lib/firefox/firefox -contentproc -childID 5 -isForBrowser -prefsLen 8763 -prefMapSize 210653 -parentBuildID 20200107212822 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 32469 true tab
nemo      2389 39.5  3.8 1774412 236116 pts/1  Sl+  09:15  12:21 vlc videos/edge_computing.mp4
```

If you like this command, you can set it up as an alias with a command like the one below. Don't forget to add it to your ~/.bashrc file if you want to make it permanent.

```
$ alias mem-by-proc="ps aux | head -1; ps aux | sort -rnk 4"
```

Here are some commands that reveal memory usage by user.

### Using top

Examining memory usage by user is somewhat more complicated because you have to find a way to group all of a user’s processes into a single memory-usage total.

If you want to home in on a single user, **top** can be used much in the same way that it was used above. Just add a username with the -U option as shown below and press the **shift+m** keys to order by memory usage:

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

### Using ps

You can also use a **ps** command to rank an individual user's processes by memory usage. In this example, we do this by selecting a single user's processes with a **grep** command:

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

### Using ps along with other commands

What gets complicated is when you want to compare users' memory usages with each other. In that case, creating a by-user total and ranking them is a good technique, but it requires a little more work and uses a number of commands. In the script below, we get a list of users with the **ps aux | grep -v COMMAND | awk '{print $1}' | sort -u** command. This includes system users like **syslog**. We then collect stats for each user and total the memory usage stat for each task with **awk**. As a last step, we display each user's memory usage sum in numerical (largest first) order.

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

Output from this script might look like this:

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

There are a lot of ways to report on memory usage on Linux. Focusing on which processes and users are consuming the most memory can benefit from a few carefully crafted tools and commands.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3516319/showing-memory-usage-in-linux-by-process-and-user.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[mengxinayan](https://github.com/mengxinayan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/37LPYOkEE2o
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
