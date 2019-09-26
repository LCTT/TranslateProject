[#]: collector: (lujun9972)
[#]: translator: (luuming)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11067-1.html)
[#]: subject: (When to be concerned about memory levels on Linux)
[#]: via: (https://www.networkworld.com/article/3394603/when-to-be-concerned-about-memory-levels-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

何时需要关注 Linux 的内存用量？
======

> Linux 上的内存管理很复杂。尽管使用率高但未必存在问题。你也应当关注一些其他的事情。

![](https://img.linux.net.cn/data/attachment/album/201907/06/173913n6rjbxwj6bfrjxwx.jpg)

在 Linux 上用光内存通常并不意味着存在严重的问题。为什么？因为健康的 Linux 系统会在内存中缓存磁盘活动，基本上占用掉了未被使用的内存，这显然是一件好事情。

换句话说，它不让内存浪费掉。使用空闲的内存增加磁盘访问速度，并且不占用运行中应用程序的内存。你也能够想到，使用这种内存缓存比起直接访问硬盘驱动器（HDD）快上数百倍，也比明显快于直接访问固态硬盘驱动。内存占满或几乎占满通常意味着系统正在尽可能高效地运行当中 —— 并不是运行中遇到了问题。

### 缓存如何工作

磁盘缓存简单地意味着系统充分利用未使用的资源（空闲内存）来加速磁盘读取与写入。应用程序不会失去任何东西，并且大多数时间里能够按需求获得更多的内存。此外，磁盘缓存不会导致应用程序转而使用交换分区。反而，用作磁盘缓存的内存空间当被需要时会立即归还，并且磁盘内容会被更新。

### 主要和次要的页故障

Linux 系统通过分割物理内存来为进程分配空间，将分割成的块称为“页”，并且映射这些页到每个进程的虚拟内存上。不再会用到的页也许会从内存中移除，尽管相关的进程还在运行。当进程需要一个没有被映射或没在内存中页时，故障便会产生。所以，这个“<ruby>故障<rt>fault</rt></ruby>”并不意味着“<ruby>错误<rt>error</rt></ruby>”而是“<ruby>不可用<rt>unavailables</rt></ruby>”，并且故障在内存管理中扮演者一个重要的角色。

次要故障意味着在内存中的页未分配给请求的进程，或未在内存管理单元中标记为出现。主要故障意味着页没有保留在内存中。

如果你想切身感受一下次要页故障和主要页故障出现的频率，像这样试一下 `ps` 命令。注意我们要的是与页故障和产生它的命令相关的项。输出中省略了很多行。`MINFL` 显示出次要故障的数目，而 `MAJFL` 表示了主要故障的数目。

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

汇报单一进程，你可以尝试这样的命令（LCTT 译注：参数里面的 `1` 是要查看的进程的 PID）：

```
$ ps -o min_flt,maj_flt 1
 MINFL  MAJFL
230064    150
```

你也可以添加其他的显示字段，例如进程所有者的 UID 和 GID。

```
$ ps -o min_flt,maj_flt,cmd,args,uid,gid 1
 MINFL  MAJFL CMD                         COMMAND                       UID   GID
230064    150 /usr/lib/systemd/systemd -- /usr/lib/systemd/systemd --     0     0
```

### 多少才算满？

一种较好的方法来掌握内存究竟使用了多少是用 `free -m` 命令。`-m` 选项指定了数字的单位是 <ruby>MiB<rt>mebibyte</rt></ruby> 而不是字节。

```
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           3244        3069          35          49         140         667
Swap:          3535           0        3535
```

注意 `free`（未使用）的内存可能会不足，而 `available`（可用于启动新的应用）会显示更大的数量。这两者的区别值得我们去关注。<ruby>可用<rt>available</rt></ruby>意味着它可以在需要时恢复使用，而<ruby>空闲<rt>free</rt></ruby>意味着现在就能够使用。

### 什么时候要担心

如果 Linux 系统上的性能表现良好 —— 应用程序响应度高，命令行没有显示出问题 —— 很可能系统状况良好。记住，一些应用也许会出于某种原因而变慢，但它不影响整个系统。

过多的硬故障也许表明确实存在问题，但要将其与观察到的性能相比较。

一个好的方法是当可用内存接近 0 或者“<ruby>用作交换<rt>swap used</rt></ruby>”项显著增长或波动时开始担心。如果“可用”项占总内存可用量的百分比合理，那么就无需担心，就像下面的例子那样：

```
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           3244        3069          35          49         140         667
Swap:          3535           0        3535
```

### Linux 性能很复杂

抛开这些不说，Linux 系统上的内存可能会变满，并且性能可能会降低。当系统出现问题时不要仅将单一的内存使用报告作为指标。

Linux 系统的内存管理很复杂，因为它采取的措施需要确保系统资源得到最好的利用。不要受到一开始内存占满的欺骗，使你认为系统存在问题，但实际上并没有。


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3394603/when-to-be-concerned-about-memory-levels-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/full-swimming-pool-100796221-large.jpg
[2]: https://www.networkworld.com/article/3391029/must-know-linux-commands.html
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
