Linux 有问必答：如何在 Linux 中统计一个进程的线程数 
================================================================================
> **问题**: 我正在运行一个程序，它在运行时会派生出多个线程。我想知道程序在运行时会有多少线程。在 Linux 中检查进程的线程数最简单的方法是什么？

如果你想看到 Linux 中每个进程的线程数，有以下几种方法可以做到这一点。

### 方法一: /proc ###

proc 伪文件系统，它驻留在 /proc 目录，这是最简单的方法来查看任何活动进程的线程数。 /proc 目录以可读文本文件形式输出，提供现有进程和系统硬件相关的信息如 CPU、中断、内存、磁盘等等.

    $ cat /proc/<pid>/status

上面的命令将显示进程 \<pid> 的详细信息，包括过程状态（例如, sleeping, running)，父进程 PID，UID，GID，使用的文件描述符的数量，以及上下文切换的数量。输出也包括**进程创建的总线程数**如下所示。

    Threads: <N>

例如，检查 PID 20571进程的线程数：

    $ cat /proc/20571/status

![](https://farm6.staticflickr.com/5649/20341236279_f4a4d809d2_b.jpg)

输出表明该进程有28个线程。

或者，你可以在 /proc/<pid>/task 中简单的统计子目录的数量，如下所示。

    $ ls /proc/<pid>/task | wc

这是因为，对于一个进程中创建的每个线程，在 `/proc/<pid>/task` 中会创建一个相应的目录，命名为其线程 ID。由此在 `/proc/<pid>/task` 中目录的总数表示在进程中线程的数目。

### 方法二: ps ###

如果你是功能强大的 ps 命令的忠实用户，这个命令也可以告诉你一个进程（用“H”选项）的线程数。下面的命令将输出进程的线程数。“h”选项需要放在前面。

    $ ps hH p <pid> | wc -l

如果你想监视一个进程的不同线程消耗的硬件资源（CPU & memory），请参阅[此教程][1]。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/number-of-threads-process-linux.html

作者：[Dan Nanni][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://linux.cn/article-5633-1.html
