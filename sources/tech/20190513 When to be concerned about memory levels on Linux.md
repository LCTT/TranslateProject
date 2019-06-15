[#]: collector: (lujun9972)
[#]: translator: (luuming)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (When to be concerned about memory levels on Linux)
[#]: via: (https://www.networkworld.com/article/3394603/when-to-be-concerned-about-memory-levels-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

When to be concerned about memory levels on Linux
======
Memory management on Linux systems is complicated. Seeing high usage doesn’t necessarily mean there’s a problem. There are other things you should also consider.
![Qfamily \(CC BY 2.0\)][1]

Running out of memory on a Linux system is generally _not_ a sign that there's a serious problem. Why? Because a healthy Linux system will cache disk activity in memory, basically gobbling memory that isn't being used, which is a very good thing.

In other words, it doesn't allow memory to go to waste. It uses the spare memory to increase disk access speed, and it does this _without_ taking memory away from running applications. This memory caching, as you might well imagine, is hundreds of times faster than working directly with the hard-disk drives (HDD) and significantly faster than solid-state drives. Full or near full memory normally means that a system is running as efficiently as it can — not that it's running into problems.

**[ Also see:[Must-know Linux Commands][2] ]**

### How caching works

Disk caching simply means that a system is taking advantage of unused resources (free memory) to speed up disk reads and writes. Applications don't lose anything and most of the time can acquire more memory whenever they need it. In addition, disk caching does not cause applications to resort to using swap. Instead, memory used for disk caching is always returned immediately when needed and disk content updated.

### Major and minor page faults

Linux systems allocate memory to processes by breaking physical memory into chunks called "pages" and then mapping those pages into process virtual memory. Pages that appear to no longer be used may be removed from memory — even if the related process is still running. When a process needs a page that is no longer mapped or no longer in memory, a fault is generated. So, "fault" does not mean "error" but instead means "unavailable," and faults play an important role in memory management.

A minor fault means the page is in memory but not allocated to the requesting process or not marked as present in the memory management unit. A major fault means the page in no longer in memory.

If you'd like to get a feel for how often minor and major page faults occur, try a **ps** command like this one. Note that we're asking for the fields related to page faults and the commands to be listed. Numerous lines were omitted from the output. The MINFL displays the number of minor faults, while MAJFL represents the number of major faults.

```
$ ps -eo min_flt,maj_flt,cmd
 MINFL  MAJFL CMD
230760    150 /usr/lib/systemd/systemd --switched-root --system --deserialize 18
     0      0 [kthreadd]
     0      0 [rcu_gp]
     0      0 [rcu_par_gp]
     0      0 [kworker/0:0H-kblockd]
   ...
   166     20 gpg-agent --homedir /var/lib/fwupd/gnupg --use-standard-socket --daemon
   525      1 /usr/libexec/gvfsd-trash --spawner :1.16 /org/gtk/gvfs/exec_spaw/0
  4966      4 /usr/libexec/gnome-terminal-server
  3617      0 bash
     0      0 [kworker/1:0H-kblockd]
   927      0 gdm-session-worker [pam/gdm-password]
```

To report on a single process, you might try a command like this:

```
$ ps -o min_flt,maj_flt 1
 MINFL  MAJFL
230064    150
```

You can also add other fields such as the process owner's UID and GID.

```
$ ps -o min_flt,maj_flt,cmd,args,uid,gid 1
 MINFL  MAJFL CMD                         COMMAND                       UID   GID
230064    150 /usr/lib/systemd/systemd -- /usr/lib/systemd/systemd --     0     0
```

### How full is full?

One way to get a better handle on how memory is being used is with the **free -m** command. The **-m** option reports the numbers in mebibytes (MiBs) instead of bytes.

```
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           3244        3069          35          49         140         667
Swap:          3535           0        3535
```

Note that "free" (unused) memory can be running low while "available" (available for starting new applications) might report a larger number. The distinction between these two fields is well worth paying attention to. Available means that it can be recovered and used when needed, while free means that it's available now.

### When to worry

If performance on a Linux systems appears to be good — applications are responsive, the command line shows no indications of a problem — chances are the system's in good shape. Keep in mind that some application might be slowed down for some reason that doesn't affect the overall system.

An excessive number of hard faults may indeed indicate a problem, but balance this with observed performance.

A good rule of thumb is to worry when available memory is close to zero or when the "swap used" field grows or fluctuates noticeably. Don't worry if the "available" figure is a reasonable percentage of the total memory available as it is in the example from above repeated here:

```
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           3244        3069          35          49         140         667
Swap:          3535           0        3535
```

### Linux performance is complicated

All that aside, memory on a Linux system can fill up and performance can slow down. Just don't take one report on memory usage as an indication that your system's in trouble.

Memory management on Linux systems is complicated because of the measures taken to ensure the best use of system resources. Don't let the initial appearance of full memory trick you into believing that your system is in trouble when it isn't.

**[ Two-Minute Linux Tips:[Learn how to master a host of Linux commands in these 2-minute video tutorials][3] ]**

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3394603/when-to-be-concerned-about-memory-levels-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/full-swimming-pool-100796221-large.jpg
[2]: https://www.networkworld.com/article/3391029/must-know-linux-commands.html
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
