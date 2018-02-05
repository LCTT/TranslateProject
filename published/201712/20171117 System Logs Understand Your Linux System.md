用系统日志了解你的 Linux 系统
============

本文摘自为 Linux 小白（或者非资深桌面用户）传授技巧的系列文章。该系列文章旨在为 LinuxMagazine 发布的第 30 期特别版 “[Linux 入门][2]” （基于 [openSUSE Leap][3] ）提供补充说明。

本文作者是 Romeo S.，她是一名基于 PDX 的企业 Linux 专家，专注于为创新企业提供富有伸缩性的解决方案。

Linux 系统日志非常重要。后台运行的程序（通常被称为守护进程或者服务进程）处理了你 Linux 系统中的大部分任务。当这些守护进程工作时，它们将任务的详细信息记录进日志文件中，作为它们做过什么的“历史”信息。这些守护进程的工作内容涵盖从使用原子钟同步时钟到管理网络连接。所有这些都被记录进日志文件，这样当有错误发生时，你可以通过查阅特定的日志文件来看出发生了什么。

![](https://www.suse.com/communities/blog/files/2017/11/markus-spiske-153537-300x450.jpg)

*Photo by Markus Spiske on Unsplash*

在你的 Linux 计算机上有很多不同的日志。历史上，它们一般以纯文本的格式存储到 `/var/log` 目录中。现在依然有很多日志这样做，你可以很方便的使用 `less` 来查看它们。

在新装的 openSUSE Leap 42.3 以及大多数现代操作系统上，重要的日志由 `systemd` 初始化系统存储。 `systemd`这套系统负责启动守护进程，并在系统启动时让计算机做好被使用的准备。由 `systemd` 记录的日志以二进制格式存储，这使得它们消耗的空间更小，更容易被浏览，也更容易被导出成其他各种格式，不过坏处就是你必须使用特定的工具才能查看。好在这个工具已经预安装在你的系统上了：它的名字叫 `journalctl`，而且默认情况下，它会将每个守护进程的所有日志都记录到一个地方。

只需要运行 `journalctl` 命令就能查看你的 `systemd` 日志了。它会用 `less` 分页器显示各种日志。为了让你有个直观的感受, 下面是 `journalctl` 中摘录的一条日志记录：

```
Jul 06 11:53:47 aaathats3as pulseaudio[2216]: [pulseaudio] alsa-util.c: Disabling timer-based scheduling because running inside a VM.
```

这条独立的日志记录以此包含了记录的日期和时间、计算机名、记录日志的进程名、记录日志的进程 PID，以及日志内容本身。

若系统中某个程序运行出问题了，则可以查看日志文件并搜索（使用 `/` 加上要搜索的关键字）程序名称。有可能导致该程序出问题的错误会记录到系统日志中。 有时，错误信息会足够详细到让你能够修复该问题。其他时候，你需要在 Web 上搜索解决方案。 Google 就很适合来搜索奇怪的 Linux 问题。不过搜索时请注意你只输入了日志的实际内容，行首的那些信息（日期、主机名、进程 ID) 对搜索来说是无意义的，会干扰搜索结果。

解决方法一般在搜索结果的前几个连接中就会有了。当然，你不能只是无脑得运行从互联网上找到的那些命令：请一定先搞清楚你要做的事情是什么，它的效果会是什么。据说，搜索系统日志中的特定条目要比直接描述该故障通用关键字要有用的多。因为程序出错有很多原因，而且同样的故障表现也可能由多种问题引发的。

比如，系统无法发声的原因有很多，可能是播放器没有插好，也可能是声音系统出故障了，还可能是缺少合适的驱动程序。如果你只是泛泛的描述故障表现，你会找到很多无关的解决方法，而你也会浪费大量的时间。而专门搜索日志文件中的实际内容，你也许会查询出其它人也有相同日志内容的结果。

你可以对比一下图 1 和图 2。

![](https://www.suse.com/communities/blog/files/2017/11/picture1-450x450.png)

图 1 搜索系统的故障表现只会显示泛泛的，不精确的结果。这种搜索通常没什么用。

![](https://www.suse.com/communities/blog/files/2017/11/picture2-450x450.png)

图 2 搜索特定的日志行会显示出精确的，有用的结果。这种搜索通常很有用。

也有一些系统不用 `journalctl` 来记录日志。在桌面系统中最常见的这类日志包括用于记录 openSUSE 包管理器的行为的 `/var/log/zypper.log`； 记录系统启动时消息的 `/var/log/boot.log` ，开机时这类消息往往滚动的特别快，根本看不过来；`/var/log/ntp` 用来记录 Network Time Protocol （NTP）守护进程同步时间时发生的错误。 另一个存放硬件故障信息的地方是 “Kernel Ring Buffer”（内核环状缓冲区），你可以输入 `demesg -H` 命令来查看（这条命令也会调用 `less` 分页器来查看）。“Kernel Ring Buffer” 存储在内存中，因此会在重启电脑后丢失。不过它包含了 Linux 内核中的重要事件，比如新增了硬件、加载了模块，以及奇怪的网络错误.

希望你已经准备好深入了解你的 Linux 系统了! 祝你玩的开心!

--------------------------------------------------------------------------------

via: https://www.suse.com/communities/blog/system-logs-understand-linux-system/

作者：[chabowski]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.suse.com/communities/blog/author/chabowski/
[2]:http://www.linux-magazine.com/Resources/Special-Editions/30-Getting-Started-with-Linux
[3]:https://en.opensuse.org/Portal:42.3
[4]:http://www.linux-magazine.com/
