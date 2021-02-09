[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to examine processes running on Linux)
[#]: via: (https://www.networkworld.com/article/3543232/how-to-examine-processes-running-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to examine processes running on Linux
======

Thinkstock

There are quite a number of ways to look at running processes on Linux systems – to see what’s running, the resources that processes are using, how the system is affected by the load and how memory is being used. Each command gives you a different view, and the range of details is considerable. In this post, we’ll run through a series of commands that can help you view process details in a number of different ways.

### ps

While the **ps** command is the most obvious command for examining processes, the arguments that you use when running **ps** will make a big difference in how much information will be provided. With no arguments, **ps** will only show processes associated with your current login session. Add a **-u** and you'll see extended details.

Here is a comparison:

```
nemo$ ps
    PID TTY          TIME CMD
  45867 pts/1    00:00:00 bash
  46140 pts/1    00:00:00 ps
nemo$ ps -u
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
nemo       45867  0.0  0.0  11232  5636 pts/1    Ss   19:04   0:00 -bash
nemo       46141  0.0  0.0  11700  3648 pts/1    R+   19:16   0:00 ps -u
```

Using **ps -ef** will display details on all of the processes running on the system but **ps -eF** will add some additional details.

```
$ ps -ef | head -2
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 May10 ?        00:00:06 /sbin/init splash
$ ps -eF | head -2
UID          PID    PPID  C    SZ   RSS PSR STIME TTY          TIME CMD
root           1       0  0 42108 12524   0 May10 ?        00:00:06 /sbin/init splash
```

Both commands show who is running the process, the process and parent process IDs, process start time, accumulated run time and the task being run. The additional fields shown when you use **F** instead of **f** include:

  * SZ: the process **size** in physical pages for the core image of the process
  * RSS: the **resident set size** which shows how much memory is allocated to those parts of the process in RAM. It does not include memory that is swapped out, but does include memory from shared libraries as long as the pages from those libraries are currently in memory. It also includes stack and heap memory.
  * PSR: the **processor** the process is using



##### ps -fU

You can list processes for some particular user with a command like "ps -ef | grep USERNAME", but with **ps -fU** command, you’re going to see considerably more data. This is because details of processes that are being run on the user's behalf are also included. In fact, nearly all these processes shown have been kicked off by system simply to support this user’s online session. Nemo has only just logged in and is not yet running any commands or scripts.

```
$ ps -fU nemo
UID          PID    PPID  C STIME TTY          TIME CMD
nemo       45726       1  0 19:04 ?        00:00:00 /lib/systemd/systemd --user
nemo       45732   45726  0 19:04 ?        00:00:00 (sd-pam)
nemo       45738   45726  0 19:04 ?        00:00:00 /usr/bin/pulseaudio --daemon
nemo       45740   45726  0 19:04 ?        00:00:00 /usr/libexec/tracker-miner-f
nemo       45754   45726  0 19:04 ?        00:00:00 /usr/bin/dbus-daemon --sessi
nemo       45829   45726  0 19:04 ?        00:00:00 /usr/libexec/gvfsd
nemo       45856   45726  0 19:04 ?        00:00:00 /usr/libexec/gvfsd-fuse /run
nemo       45862   45706  0 19:04 ?        00:00:00 sshd: nemo@pts/1
nemo       45864   45726  0 19:04 ?        00:00:00 /usr/libexec/gvfs-udisks2-vo
nemo       45867   45862  0 19:04 pts/1    00:00:00 -bash
nemo       45878   45726  0 19:04 ?        00:00:00 /usr/libexec/gvfs-afc-volume
nemo       45883   45726  0 19:04 ?        00:00:00 /usr/libexec/gvfs-goa-volume
nemo       45887   45726  0 19:04 ?        00:00:00 /usr/libexec/goa-daemon
nemo       45895   45726  0 19:04 ?        00:00:00 /usr/libexec/gvfs-mtp-volume
nemo       45896   45726  0 19:04 ?        00:00:00 /usr/libexec/goa-identity-se
nemo       45903   45726  0 19:04 ?        00:00:00 /usr/libexec/gvfs-gphoto2-vo
nemo       45946   45726  0 19:04 ?        00:00:00 /usr/libexec/gvfsd-metadata
```

Note that the only process with an assigned TTY is Nemo's shell and that the parent of all of the other processes is **systemd**.

You can supply a comma-separated list of usernames instead of a single name. Just be prepared to be looking at quite a bit more data.

#### top and ntop

The **top** and **ntop** commands will help when you want to get an idea which processes are using the most resources and allow you to reorder your view depending on what criteria you want to use to rank the processes (e.g., highest CPU or memory use).

```
top - 11:51:27 up 1 day, 21:40,  1 user,  load average: 0.08, 0.02, 0.01
Tasks: 211 total,   1 running, 210 sleeping,   0 stopped,   0 zombie
%Cpu(s):  5.0 us,  0.5 sy,  0.0 ni, 94.3 id,  0.2 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   5944.4 total,   3527.4 free,    565.1 used,   1851.9 buff/cache
MiB Swap:   2048.0 total,   2048.0 free,      0.0 used.   5084.3 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
    999 root      20   0  394660  14380  10912 S   8.0   0.2   0:46.54 udisksd
  65224 shs       20   0  314268   9824   8084 S   1.7   0.2   0:00.34 gvfs-ud+
   2034 gdm       20   0  314264   9820   7992 S   1.3   0.2   0:06.25 gvfs-ud+
  67909 root      20   0       0      0      0 I   0.3   0.0   0:00.09 kworker+
      1 root      20   0  168432  12532   8564 S   0.0   0.2   0:09.93 systemd
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.02 kthreadd
```

Use **shift+m** to sort by memory use and **shift+p** to go back to sorting by CPU usage (the default).

#### /proc

A tremendous amount of information is available on running processes in the **/proc** directory. In fact, if you haven't visited **/proc** quite a few times, you might be astounded by the amount of details available. Just keep in mind that **/proc** is a very different kind of file system. As an interface to kernel data, it provides a view of process details that are currently being used by the system.

Some of the more useful **/proc** files for viewing include **cmdline**, **environ**, **fd**, **limits** and **status**. The following views provide some samples of what you might see.

The **status** file shows the process that is running (bash), its status, the user and group ID for the person running bash, a full list of the groups the user is a member of and the process ID and parent process ID.

```
$ head -11 /proc/65333/status
Name:   bash
Umask:  0002
State:  S (sleeping)
Tgid:   65333
Ngid:   0
Pid:    65333
PPid:   65320
TracerPid:      0
Uid:    1000    1000    1000    1000
Gid:    1000    1000    1000    1000
FDSize: 256
Groups: 4 11 24 27 30 46 118 128 500 1000
...
```

The **cmdline** file shows the command line used to start the process.

```
$ cat /proc/65333/cmdline
-bash
```

The **environ** file shows the environment variables that are in effect.

```
$ cat environ
USER=shsLOGNAME=shsHOME=/home/shsPATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/gamesSHELL=/bin/bashTERM=xtermXDG_SESSION_ID=626XDG_RUNTIME_DIR=/run/user/1000DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/busXDG_SESSION_TYPE=ttyXDG_SESSION_CLASS=userMOTD_SHOWN=pamLANG=en_US.UTF-8SSH_CLIENT=192.168.0.19 9385 22SSH_CONNECTION=192.168.0.19 9385 192.168.0.11 22SSH_TTY=/dev/pts/0$
```

The **fd** file shows the file descriptors. Note how they reflect the pseudo-tty that is being used (pts/0).

```
$ ls -l /proc/65333/fd
total 0
lrwx------ 1 shs shs 64 May 12 09:45 0 -> /dev/pts/0
lrwx------ 1 shs shs 64 May 12 09:45 1 -> /dev/pts/0
lrwx------ 1 shs shs 64 May 12 09:45 2 -> /dev/pts/0
lrwx------ 1 shs shs 64 May 12 09:56 255 -> /dev/pts/0
$ who
shs      pts/0        2020-05-12 09:45 (192.168.0.19)
```

The **limits** file contains information about the limits imposed on the process.

```
$ cat limits
Limit                     Soft Limit           Hard Limit           Units
Max cpu time              unlimited            unlimited            seconds
Max file size             unlimited            unlimited            bytes
Max data size             unlimited            unlimited            bytes
Max stack size            8388608              unlimited            bytes
Max core file size        0                    unlimited            bytes
Max resident set          unlimited            unlimited            bytes
Max processes             23554                23554                processes
Max open files            1024                 1048576              files
Max locked memory         67108864             67108864             bytes
Max address space         unlimited            unlimited            bytes
Max file locks            unlimited            unlimited            locks
Max pending signals       23554                23554                signals
Max msgqueue size         819200               819200               bytes
Max nice priority         0                    0
Max realtime priority     0                    0
Max realtime timeout      unlimited            unlimited            us
```

#### pmap

The **pmap** command takes you in an entirely different direction when it comes to memory use. It provides a detailed map of a process’s memory usage. To make sense of this, you need to keep in mind that processes do not run entirely on their own. Instead, they make use of a wide range of system resources. The truncated **pmap** output below shows a portion of the memory map for a single user’s bash login along with some memory usage totals at the bottom.

```
$ pmap -x 43120
43120:   -bash
Address           Kbytes     RSS   Dirty Mode  Mapping
000055887655b000     180     180       0 r---- bash
0000558876588000     708     708       0 r-x-- bash
0000558876639000     220     148       0 r---- bash
0000558876670000      16      16      16 r---- bash
0000558876674000      36      36      36 rw--- bash
000055887667d000      40      28      28 rw---   [ anon ]
0000558876b96000    1328    1312    1312 rw---   [ anon ]
00007f0bd9a7e000      28      28       0 r---- libpthread-2.31.so
00007f0bd9a85000      68      68       0 r-x-- libpthread-2.31.so
00007f0bd9a96000      20       0       0 r---- libpthread-2.31.so
00007f0bd9a9b000       4       4       4 r---- libpthread-2.31.so
00007f0bd9a9c000       4       4       4 rw--- libpthread-2.31.so
00007f0bd9a9d000      16       4       4 rw---   [ anon ]
00007f0bd9aa1000      20      20       0 r---- libnss_systemd.so.2
00007f0bd9aa6000     148     148       0 r-x-- libnss_systemd.so.2
...
ffffffffff600000       4       0       0 --x--   [ anon ]
---------------- ------- ------- -------
total kB           11368    5664    1656

Kbytes: size of map in kilobytes
RSS: resident set size in kilobytes
Dirty: dirty pages (both shared and private) in kilobytes
```
```

```

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3543232/how-to-examine-processes-running-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
