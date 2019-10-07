[#]: collector: (lujun9972)
[#]: translator: (way-ww)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Run the Top Command in Batch Mode)
[#]: via: (https://www.2daygeek.com/linux-run-execute-top-command-in-batch-mode/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Run the Top Command in Batch Mode
======

The **[Linux Top command][1]** is the best and most well known command that everyone uses to **[monitor Linux system performance][2]**.

You probably already know most of the options available, except for a few options, and if I’m not wrong, “batch more” is one of the options.

Most script writer and developers know this because this option is mainly used when writing the script.

If you’re not sure about this, don’t worry we’re here to explain this.

### What is “Batch Mode” in the Top Command

The “Batch Mode” option allows you to send top command output to other programs or to a file.

In this mode, top will not accept input and runs until the iterations limit you’ve set with the “-n” command-line option.

If you want to fix any performance issues on the Linux server, you need to **[understand the top command output][3]** correctly.

### 1) How to Run the Top Command in Batch Mode

By default, the top command sort the results based on CPU usage, so when you run the below top command in batch mode, it does the same and prints the first 35 lines.

```
# top -bc | head -35

top - 06:41:14 up 8 days, 20:24,  1 user,  load average: 0.87, 0.77, 0.81
Tasks: 139 total,   1 running, 136 sleeping,   0 stopped,   2 zombie
%Cpu(s):  0.0 us,  3.2 sy,  0.0 ni, 96.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3880940 total,  1595932 free,   886736 used,  1398272 buff/cache
KiB Swap:  1048572 total,   514640 free,   533932 used.  2648472 avail Mem

PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
     1 root      20   0  191144   2800   1596 S   0.0  0.1   5:43.63 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
     2 root      20   0       0      0      0 S   0.0  0.0   0:00.32 [kthreadd]
     3 root      20   0       0      0      0 S   0.0  0.0   0:28.10 [ksoftirqd/0]
     5 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kworker/0:0H]
     7 root      rt   0       0      0      0 S   0.0  0.0   0:33.96 [migration/0]
     8 root      20   0       0      0      0 S   0.0  0.0   0:00.00 [rcu_bh]
     9 root      20   0       0      0      0 S   0.0  0.0  63:05.12 [rcu_sched]
    10 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [lru-add-drain]
    11 root      rt   0       0      0      0 S   0.0  0.0   0:08.79 [watchdog/0]
    12 root      rt   0       0      0      0 S   0.0  0.0   0:08.82 [watchdog/1]
    13 root      rt   0       0      0      0 S   0.0  0.0   0:44.27 [migration/1]
    14 root      20   0       0      0      0 S   0.0  0.0   1:22.45 [ksoftirqd/1]
    16 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kworker/1:0H]
    18 root      20   0       0      0      0 S   0.0  0.0   0:00.01 [kdevtmpfs]
    19 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [netns]
    20 root      20   0       0      0      0 S   0.0  0.0   0:01.35 [khungtaskd]
    21 root       0 -20       0      0      0 S   0.0  0.0   0:00.02 [writeback]
    22 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kintegrityd]
    23 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [bioset]
    24 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kblockd]
    25 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [md]
    26 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [edac-poller]
    33 root      20   0       0      0      0 S   0.0  0.0   1:19.07 [kswapd0]
    34 root      25   5       0      0      0 S   0.0  0.0   0:00.00 [ksmd]
    35 root      39  19       0      0      0 S   0.0  0.0   0:12.80 [khugepaged]
    36 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [crypto]
    44 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kthrotld]
    46 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kmpath_rdacd]
```

### 2) How to Run the Top Command in Batch Mode and Sort the Output Based on Memory Usage

Run the below top command to sort the results based on memory usage in batch mode.

```
# top -bc -o +%MEM | head -n 20

top - 06:42:00 up 8 days, 20:25,  1 user,  load average: 0.66, 0.74, 0.80
Tasks: 146 total,   1 running, 145 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3880940 total,  1422044 free,  1059176 used,  1399720 buff/cache
KiB Swap:  1048572 total,   514640 free,   533932 used.  2475984 avail Mem

 PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 18105 mysql     20   0 1453900 156096   8816 S   0.0  4.0   2:12.98 /usr/sbin/mysqld --daemonize --pid-file=/var/run/mysqld/mysqld.pid
  1841 root      20   0  228980 107036   5360 S   0.0  2.8   0:05.56 /usr/local/cpanel/3rdparty/perl/528/bin/perl -T -w /usr/local/cpanel/3rdparty/bin/spamd --max-children=3 --max-spare=1 --allowed-ips=127.0.0.+
  4301 root      20   0  230208 104608   1816 S   0.0  2.7   0:03.77 spamd child
  8139 nobody    20   0  257000  27108   3408 S   0.0  0.7   0:00.04 /usr/sbin/httpd -k start
  7961 nobody    20   0  256988  26912   3160 S   0.0  0.7   0:00.05 /usr/sbin/httpd -k start
  8190 nobody    20   0  256976  26812   3140 S   0.0  0.7   0:00.05 /usr/sbin/httpd -k start
  8353 nobody    20   0  256976  26812   3144 S   0.0  0.7   0:00.04 /usr/sbin/httpd -k start
  8629 nobody    20   0  256856  26736   3108 S   0.0  0.7   0:00.02 /usr/sbin/httpd -k start
  8636 nobody    20   0  256856  26712   3100 S   0.0  0.7   0:00.03 /usr/sbin/httpd -k start
  8611 nobody    20   0  256844  25764   2228 S   0.0  0.7   0:00.01 /usr/sbin/httpd -k start
  8451 nobody    20   0  256844  25760   2220 S   0.0  0.7   0:00.04 /usr/sbin/httpd -k start
  8610 nobody    20   0  256844  25748   2224 S   0.0  0.7   0:00.01 /usr/sbin/httpd -k start
  8632 nobody    20   0  256844  25744   2216 S   0.0  0.7   0:00.03 /usr/sbin/httpd -k start
```

**Details of the above command:**

  * **-b :** Batch mode operation
  * **-c :** To print the absolute path of the running process
  * **-o :** To specify fields for sorting processes
  * **head :** Output the first part of files
  * **-n :** To print the first “n” lines



### 3) How to Run the Top Command in Batch Mode and Sort the Output Based on a Specific User Process

If you want to sort results based on a specific user, run the below top command.

```
# top -bc -u mysql | head -n 10

top - 06:44:58 up 8 days, 20:27,  1 user,  load average: 0.99, 0.87, 0.84
Tasks: 140 total,   1 running, 137 sleeping,   0 stopped,   2 zombie
%Cpu(s): 13.3 us,  3.3 sy,  0.0 ni, 83.3 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3880940 total,  1589832 free,   885648 used,  1405460 buff/cache
KiB Swap:  1048572 total,   514640 free,   533932 used.  2649412 avail Mem

 PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 18105 mysql     20   0 1453900 156888   8816 S   0.0  4.0   2:16.42 /usr/sbin/mysqld --daemonize --pid-file=/var/run/mysqld/mysqld.pid
```

### 4) How to Run the Top Command in Batch Mode and Sort the Output Based on the Process Age

Use the below top command to sort the results based on the age of the process in batch mode. It shows the total CPU time the task has used since it started.

But if you want to check how long a process has been running on Linux, go to the following article.

  * **[Five Ways to Check How Long a Process Has Been Running in Linux][4]**



```
# top -bc -o TIME+ | head -n 20

top - 06:45:56 up 8 days, 20:28,  1 user,  load average: 0.56, 0.77, 0.81
Tasks: 148 total,   1 running, 146 sleeping,   0 stopped,   1 zombie
%Cpu(s):  0.0 us,  3.1 sy,  0.0 ni, 96.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3880940 total,  1378664 free,  1094876 used,  1407400 buff/cache
KiB Swap:  1048572 total,   514640 free,   533932 used.  2440332 avail Mem

 PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
     9 root      20   0       0      0      0 S   0.0  0.0  63:05.70 [rcu_sched]
   272 root      20   0       0      0      0 S   0.0  0.0  16:12.13 [xfsaild/vda1]
  3882 root      20   0  229832   6212   1220 S   0.0  0.2   9:00.84 /usr/sbin/httpd -k start
     1 root      20   0  191144   2800   1596 S   0.0  0.1   5:43.75 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
  3761 root      20   0   68784   9820   2048 S   0.0  0.3   5:09.67 tailwatchd
  3529 root      20   0  404380   3472   2604 S   0.0  0.1   3:24.98 /usr/sbin/rsyslogd -n
  3520 root      20   0  574208    572    164 S   0.0  0.0   3:07.74 /usr/bin/python2 -Es /usr/sbin/tuned -l -P
   444 dbus      20   0   58444   1144    612 S   0.0  0.0   2:23.90 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
 18105 mysql     20   0 1453900 157152   8816 S   0.0  4.0   2:17.29 /usr/sbin/mysqld --daemonize --pid-file=/var/run/mysqld/mysqld.pid
   249 root       0 -20       0      0      0 S   0.0  0.0   1:28.83 [kworker/0:1H]
    14 root      20   0       0      0      0 S   0.0  0.0   1:22.46 [ksoftirqd/1]
    33 root      20   0       0      0      0 S   0.0  0.0   1:19.07 [kswapd0]
   342 root      20   0   39472   2940   2752 S   0.0  0.1   1:18.17 /usr/lib/systemd/systemd-journald
```

### 5) How to Run the Top Command in Batch Mode and Save the Output to a File

If you want to share the output of the top command to someone for troubleshooting purposes, redirect the output to a file using the following command.

```
# top -bc | head -35 > top-report.txt

# cat top-report.txt

top - 06:47:11 up 8 days, 20:30,  1 user,  load average: 0.67, 0.77, 0.81
Tasks: 133 total,   4 running, 129 sleeping,   0 stopped,   0 zombie
%Cpu(s): 59.4 us, 12.5 sy,  0.0 ni, 28.1 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3880940 total,  1596268 free,   843284 used,  1441388 buff/cache
KiB Swap:  1048572 total,   514640 free,   533932 used.  2659084 avail Mem

 PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
  9686 daygeekc  20   0  406132  62184  43448 R  94.1  1.6   0:00.34 /opt/cpanel/ea-php56/root/usr/bin/php-cgi
  9689 nobody    20   0  256588  24428   1184 S   5.9  0.6   0:00.01 /usr/sbin/httpd -k start
     1 root      20   0  191144   2800   1596 S   0.0  0.1   5:43.79 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
     2 root      20   0       0      0      0 S   0.0  0.0   0:00.32 [kthreadd]
     3 root      20   0       0      0      0 S   0.0  0.0   0:28.11 [ksoftirqd/0]
     5 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kworker/0:0H]
     7 root      rt   0       0      0      0 S   0.0  0.0   0:33.96 [migration/0]
     8 root      20   0       0      0      0 S   0.0  0.0   0:00.00 [rcu_bh]
     9 root      20   0       0      0      0 R   0.0  0.0  63:05.82 [rcu_sched]
    10 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [lru-add-drain]
    11 root      rt   0       0      0      0 S   0.0  0.0   0:08.79 [watchdog/0]
    12 root      rt   0       0      0      0 S   0.0  0.0   0:08.82 [watchdog/1]
    13 root      rt   0       0      0      0 S   0.0  0.0   0:44.28 [migration/1]
    14 root      20   0       0      0      0 S   0.0  0.0   1:22.46 [ksoftirqd/1]
    16 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kworker/1:0H]
    18 root      20   0       0      0      0 S   0.0  0.0   0:00.01 [kdevtmpfs]
    19 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [netns]
    20 root      20   0       0      0      0 S   0.0  0.0   0:01.35 [khungtaskd]
    21 root       0 -20       0      0      0 S   0.0  0.0   0:00.02 [writeback]
    22 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kintegrityd]
    23 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [bioset]
    24 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [kblockd]
    25 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [md]
    26 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [edac-poller]
    33 root      20   0       0      0      0 S   0.0  0.0   1:19.07 [kswapd0]
    34 root      25   5       0      0      0 S   0.0  0.0   0:00.00 [ksmd]
    35 root      39  19       0      0      0 S   0.0  0.0   0:12.80 [khugepaged]
    36 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 [crypto]
```

### How to Sort Output Based on Specific Fields

In the latest version of the top command release, press the **“f”** key to sort the fields via the field letter.

To sort with a new field, use the **“up/down”** arrow to select the correct selection, and then press **“s”** to sort it. Finally press **“q”** to exit from this window.

```
Fields Management for window 1:Def, whose current sort field is %CPU
    Navigate with Up/Dn, Right selects for move then  or Left commits,
    'd' or  toggles display, 's' sets sort.  Use 'q' or  to end!
 PID     = Process Id             nsUTS   = UTS namespace Inode
 USER    = Effective User Name    LXC     = LXC container name
 PR      = Priority               RSan    = RES Anonymous (KiB)
 NI      = Nice Value             RSfd    = RES File-based (KiB)
 VIRT    = Virtual Image (KiB)    RSlk    = RES Locked (KiB)
 RES     = Resident Size (KiB)    RSsh    = RES Shared (KiB)
 SHR     = Shared Memory (KiB)    CGNAME  = Control Group name
 S       = Process Status         NU      = Last Used NUMA node
 %CPU    = CPU Usage
 %MEM    = Memory Usage (RES)
 TIME+   = CPU Time, hundredths
 COMMAND = Command Name/Line
 PPID    = Parent Process pid
 UID     = Effective User Id
 RUID    = Real User Id
 RUSER   = Real User Name
 SUID    = Saved User Id
 SUSER   = Saved User Name
 GID     = Group Id
 GROUP   = Group Name
 PGRP    = Process Group Id
 TTY     = Controlling Tty
 TPGID   = Tty Process Grp Id
 SID     = Session Id
 nTH     = Number of Threads
 P       = Last Used Cpu (SMP)
 TIME    = CPU Time
 SWAP    = Swapped Size (KiB)
 CODE    = Code Size (KiB)
 DATA    = Data+Stack (KiB)
 nMaj    = Major Page Faults
 nMin    = Minor Page Faults
 nDRT    = Dirty Pages Count
 WCHAN   = Sleeping in Function
 Flags   = Task Flags
 CGROUPS = Control Groups
 SUPGIDS = Supp Groups IDs
 SUPGRPS = Supp Groups Names
 TGID    = Thread Group Id
 OOMa    = OOMEM Adjustment
 OOMs    = OOMEM Score current
 ENVIRON = Environment vars
 vMj     = Major Faults delta
 vMn     = Minor Faults delta
 USED    = Res+Swap Size (KiB)
 nsIPC   = IPC namespace Inode
 nsMNT   = MNT namespace Inode
 nsNET   = NET namespace Inode
 nsPID   = PID namespace Inode
 nsUSER  = USER namespace Inode
```

For older version of the top command, press the **“shift+f”** or **“shift+o”** key to sort the fields via the field letter.

To sort with a new field, select the corresponding sort **field letter**, and then press **“Enter”** to sort it.

```
Current Sort Field:  N  for window 1:Def
 Select sort field via field letter, type any other key to return
  a: PID        = Process Id
  b: PPID       = Parent Process Pid
  c: RUSER      = Real user name
  d: UID        = User Id
  e: USER       = User Name
  f: GROUP      = Group Name
  g: TTY        = Controlling Tty
  h: PR         = Priority
  i: NI         = Nice value
  j: P          = Last used cpu (SMP)
  k: %CPU       = CPU usage
  l: TIME       = CPU Time
  m: TIME+      = CPU Time, hundredths
* N: %MEM       = Memory usage (RES)
  o: VIRT       = Virtual Image (kb)
  p: SWAP       = Swapped size (kb)
  q: RES        = Resident size (kb)
  r: CODE       = Code size (kb)
  s: DATA       = Data+Stack size (kb)
  t: SHR        = Shared Mem size (kb)
  u: nFLT       = Page Fault count
  v: nDRT       = Dirty Pages count
  w: S          = Process Status
  x: COMMAND    = Command name/line
  y: WCHAN      = Sleeping in Function
  z: Flags      = Task Flags
 Note1:
   If a selected sort field can't be
   shown due to screen width or your
   field order, the '<' and '>' keys
   will be unavailable until a field
   within viewable range is chosen.
 Note2:
   Field sorting uses internal values,
   not those in column display.  Thus,
   the TTY & WCHAN fields will violate
   strict ASCII collating sequence.
   (shame on you if WCHAN is chosen)
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-run-execute-top-command-in-batch-mode/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-top-command-linux-system-performance-monitoring-tool/
[2]: https://www.2daygeek.com/category/system-monitoring/
[3]: https://www.2daygeek.com/understanding-linux-top-command-output-usage/
[4]: https://www.2daygeek.com/how-to-check-how-long-a-process-has-been-running-in-linux/
