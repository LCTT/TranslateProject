[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Find High CPU Consumption Processes in Linux)
[#]: via: (https://www.2daygeek.com/how-to-find-high-cpu-consumption-processes-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Find High CPU Consumption Processes in Linux
======

We have already described in our previous article **[how to find high memory consumption processes in Linux][1]**.

There are situations where you might see more CPU usage on a Linux system.

If so, you should identify a list of processes that consume more CPU on the system.

I believe there are only two ways for you to check this.

This can be done using the **[top command][2]** and the **[ps command][3]**.

I’d like to go with the top command for most reasons instead of ps.

But both will give you the same results, so you can choose the one you like.

Both of these options are widely used by Linux administrators.

### 1) How to Find High CPU Consumption Process in Linux Using the top Command

The Linux top command is the best and most well known command that everyone uses to monitor Linux system performance.

The top command provides a dynamic real-time view of the running process on a Linux system.

It display system summary information, the list of processes currently being managed by the Linux kernel.

It displays various system information such as CPU usage, Memory usage, Swap Memory, Number of running processes, system uptime, system load, Buffer Size, Cache Size, Process PID, etc.

By default, it sorts the top output with the CPU usage and updates the top command data every 5 seconds.

If you want to see a clear view of the top command output for further analysis, this is a best way to **[run the top command in the batch mode][4]**.

Also, you need to **[understand the top command output][5]** to fix the performance problem on the system.

```
# top -c -b | head -50

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

Details of the above command:

  * **top :** This is a command.
  * **-b :** Batch mode.
  * **head -50:** Display first 50 lines in the output.
  * **PID :** Unique ID of the process.
  * **USER :** Owner of the process.
  * **PR :** priority of the process.
  * **NI :** The NICE value of the process.
  * **VIRT :** How much virtual memory used by the process.
  * **RES :** How much physical memory used by the process.
  * **SHR :** How much shared memory used by the process.
  * **S :** This indicates the status of the process: S=sleep R=running Z=zombie.
  * **%CPU :** The percentage of CPU used by the process.
  * **%MEM :** The percentage of RAM used by the process.
  * **TIME+ :** How long the process being running.
  * **COMMAND :** Name of the process.



If you want to see the full path of the command instead of the command name, run the following top command format.

```
# top -b | head -50

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

### 2) How to Find High CPU Consumption Process in Linux Using the ps Command

ps stands for processes status, it display the information about the active/running processes on the system.

It provides a snapshot of the current processes along with detailed information like username, user id, cpu usage, memory usage, process start date and time command name etc.

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

Details of the above command:

  * **ps :** This is a command.
  * **-e :** Select all processes.
  * **-o :** To customize a output format.
  * **–sort=-%cpu :** Sort the ouput based on CPU usage.
  * **head :** To display first 10 lines of the output
  * **PID :** Unique ID of the process.
  * **PPID :** Unique ID of the parent process.
  * **%MEM :** The percentage of RAM used by the process.
  * **%CPU :** The percentage of CPU used by the process.
  * **Command :** Name of the process.



If you only want to see the command name instead of the absolute path of the command, use the ps command format below.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-find-top-memory-consuming-processes/
[2]: https://www.2daygeek.com/linux-top-command-linux-system-performance-monitoring-tool/
[3]: https://www.2daygeek.com/linux-ps-command-find-running-process-monitoring/
[4]: https://www.2daygeek.com/linux-run-execute-top-command-in-batch-mode/
[5]: https://www.2daygeek.com/understanding-linux-top-command-output-usage/
