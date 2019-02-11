[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to determine how much memory is installed, used on Linux systems)
[#]: via: (https://www.networkworld.com/article/3336174/linux/how-much-memory-is-installed-and-being-used-on-your-linux-systems.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to determine how much memory is installed, used on Linux systems
======
![](https://images.idgesg.net/images/article/2019/02/memory-100787327-large.jpg)

There are numerous ways to get information on the memory installed on Linux systems and view how much of that memory is being used. Some commands provide an overwhelming amount of detail, while others provide succinct, though not necessarily easy-to-digest, answers. In this post, we'll look at some of the more useful tools for checking on memory and its usage.

Before we get into the details, however, let's review a few details. Physical memory and virtual memory are not the same. The latter includes disk space that configured to be used as swap. Swap may include partitions set aside for this usage or files that are created to add to the available swap space when creating a new partition may not be practical. Some Linux commands provide information on both.

Swap expands memory by providing disk space that can be used to house inactive pages in memory that are moved to disk when physical memory fills up.

One file that plays a role in memory management is **/proc/kcore**. This file looks like a normal (though extremely large) file, but it does not occupy disk space at all. Instead, it is a virtual file like all of the files in /proc.

```
$ ls -l /proc/kcore
-r--------. 1 root root 140737477881856 Jan 28 12:59 /proc/kcore
```

Interestingly, the two systems queried below do _not_ have the same amount of memory installed, yet the size of /proc/kcore is the same on both. The first of these two systems has 4 GB of memory installed; the second has 6 GB.

```
system1$ ls -l /proc/kcore
-r--------. 1 root root 140737477881856 Jan 28 12:59 /proc/kcore
system2$ ls -l /proc/kcore
-r-------- 1 root root 140737477881856 Feb 5 13:00 /proc/kcore
```

Explanations that claim the size of this file represents the amount of available virtual memory (maybe plus 4K) don't hold much weight. This number would suggest that the virtual memory on these systems is 128 terrabytes! That number seems to represent instead how much memory a 64-bit systems might be capable of addressing — not how much is available on the system. Calculations of what 128 terrabytes and that number, plus 4K would look like are fairly easy to make on the command line:

```
$ expr 1024 \* 1024 \* 1024 \* 1024 \* 128
140737488355328
$ expr 1024 \* 1024 \* 1024 \* 1024 \* 128 + 4096
140737488359424
```

Another and more human-friendly command for examining memory is the **free** command. It gives you an easy-to-understand report on memory.

```
$ free
              total        used        free      shared  buff/cache   available
Mem:        6102476      812244     4090752       13112     1199480     4984140
Swap:       2097148           0     2097148
```

With the **-g** option, free reports the values in gigabytes.

```
$ free -g
              total        used        free      shared  buff/cache   available
Mem:              5           0           3           0           1           4
Swap:             1           0           1
```

With the **-t** option, free shows the same values as it does with no options (don't confuse -t with terrabytes!) but by adding a total line at the bottom of its output.

```
$ free -t
              total        used        free      shared  buff/cache   available
Mem:        6102476      812408     4090612       13112     1199456     4983984
Swap:       2097148           0     2097148
Total:      8199624      812408     6187760
```

And, of course, you can choose to use both options.

```
$ free -tg
              total        used        free      shared  buff/cache   available
Mem:              5           0           3           0           1           4
Swap:             1           0           1
Total:            7           0           5
```

You might be disappointed in this report if you're trying to answer the question "How much RAM is installed on this system?" This is the same system shown in the example above that was described as having 6GB of RAM. That doesn't mean this report is wrong, but that it's the system's view of the memory it has at its disposal.

The free command also provides an option to update the display every X seconds (10 in the example below).

```
$ free -s 10
              total        used        free      shared  buff/cache   available
Mem:        6102476      812280     4090704       13112     1199492     4984108
Swap:       2097148           0     2097148

              total        used        free      shared  buff/cache   available
Mem:        6102476      812260     4090712       13112     1199504     4984120
Swap:       2097148           0     2097148
```

With **-l** , the free command provides high and low memory usage.

```
$ free -l
              total        used        free      shared  buff/cache   available
Mem:        6102476      812376     4090588       13112     1199512     4984000
Low:        6102476     2011888     4090588
High:             0           0           0
Swap:       2097148           0     2097148
```

Another option for looking at memory is the **/proc/meminfo** file. Like /proc/kcore, this is a virtual file and one that gives a useful report showing how much memory is installed, free and available. Clearly, free and available do not represent the same thing. MemFree seems to represent unused RAM. MemAvailable is an estimate of how much memory is available for starting new applications.

```
$ head -3 /proc/meminfo
MemTotal: 6102476 kB
MemFree: 4090596 kB
MemAvailable: 4984040 kB
```

If you only want to see total memory, you can use one of these commands:

```
$ awk '/MemTotal/ {print $2}' /proc/meminfo
6102476
$ grep MemTotal /proc/meminfo
MemTotal: 6102476 kB
```

The **DirectMap** entries break information on memory into categories.

```
$ grep DirectMap /proc/meminfo
DirectMap4k: 213568 kB
DirectMap2M: 6076416 kB
```

DirectMap4k represents the amount of memory being mapped to standard 4k pages, while DirectMap2M shows the amount of memory being mapped to 2MB pages.

The **getconf** command is one that will provide quite a bit more information than most of us want to contemplate.

```
$ getconf -a | more
LINK_MAX 65000
_POSIX_LINK_MAX 65000
MAX_CANON 255
_POSIX_MAX_CANON 255
MAX_INPUT 255
_POSIX_MAX_INPUT 255
NAME_MAX 255
_POSIX_NAME_MAX 255
PATH_MAX 4096
_POSIX_PATH_MAX 4096
PIPE_BUF 4096
_POSIX_PIPE_BUF 4096
SOCK_MAXBUF
_POSIX_ASYNC_IO
_POSIX_CHOWN_RESTRICTED 1
_POSIX_NO_TRUNC 1
_POSIX_PRIO_IO
_POSIX_SYNC_IO
_POSIX_VDISABLE 0
ARG_MAX 2097152
ATEXIT_MAX 2147483647
CHAR_BIT 8
CHAR_MAX 127
--More--
```

Pare that output down to something specific with a command like the one shown below, and you'll get the same kind of information provided by some of the commands above.

```
$ getconf -a | grep PAGES | awk 'BEGIN {total = 1} {if (NR == 1 || NR == 3) total *=$NF} END {print total / 1024" kB"}'
6102476 kB
```

That command calculates memory by multiplying the values in the first and last lines of output like this:

```
PAGESIZE 4096 <==
_AVPHYS_PAGES 1022511
_PHYS_PAGES 1525619 <==
```

Calculating that independently, we can see how that value is derived.

```
$ expr 4096 \* 1525619 / 1024
6102476
```

Clearly that's one of those commands that deserves to be turned into an alias!

Another command with very digestible output is **top**. In the first five lines of top's output, you'll see some numbers that show how memory is being used.

```
$ top
top - 15:36:38 up 8 days, 2:37, 2 users, load average: 0.00, 0.00, 0.00
Tasks: 266 total, 1 running, 265 sleeping, 0 stopped, 0 zombie
%Cpu(s): 0.2 us, 0.4 sy, 0.0 ni, 99.4 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
MiB Mem : 3244.8 total, 377.9 free, 1826.2 used, 1040.7 buff/cache
MiB Swap: 3536.0 total, 3535.7 free, 0.3 used. 1126.1 avail Mem
```

And finally a command that will answer the question "So, how much RAM is installed on this system?" in a succinct fashion:

```
$ sudo dmidecode -t 17 | grep "Size.*MB" | awk '{s+=$2} END {print s / 1024 "GB"}'
6GB
```

Depending on how much detail you want to see, Linux systems provide a lot of options for seeing how much memory is installed on your systems and how much is used and available.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3336174/linux/how-much-memory-is-installed-and-being-used-on-your-linux-systems.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
