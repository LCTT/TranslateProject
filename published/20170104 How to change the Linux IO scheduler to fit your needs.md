如何更改 Linux I/O 调度器调整性能
============================================================

为了从 Linux 服务器榨取尽可能多的性能，请了解如何更改 I/O 调度器以满足你的需求。

 ![](http://tr1.cbsistatic.com/hub/i/r/2016/05/04/f765c3c7-ee08-4f3a-876a-66137ad4e6df/resize/770x/131c6931386ecf37104e8ada8d01e903/hackershero.jpg) 

Linux I/O 调度器（Linux I/O scheduler）控制内核提交读写请求给磁盘的方式。自从 2.6 内核以来，管理员已经能够更改这个调度器，所以他们可以自定义他们的平台以完全适合他们的需要。

有三个调度器可供选择，每个调度器都有其优点。这些调度器是：

*   **[CFQ （Completely Fair Scheduler（完全公平调度器））][7]（cfq）** ：它是许多 Linux 发行版的默认调度器；它将由进程提交的同步请求放到多个进程队列中，然后为每个队列分配时间片以访问磁盘。
*   **[Noop 调度器][8]（noop）** ： 基于先入先出（FIFO）队列概念的 Linux 内核里最简单的 I/O 调度器。此调度程序最适合于 SSD。
*   **[截止时间调度器][9]（deadline）** ： 尝试保证请求的开始服务时间。

当你想要让 Linux 机器发挥最佳性能时，这可能是你所要做的事情之一。幸运的是，更改 I/O 调度器非常简单。让我告诉你怎么做。

### 找出你有的调度器

你需要做的第一件事是找出哪个调度器正在处理你系统上的 I/O。这是从命令行完成的，你必须知道磁盘的名称。为简单起见，我假设磁盘是 sda。据此信息，打开终端窗口并输入以下命令：

```
cat /sys/block/sda/queue/scheduler
```

该命令的结果将显示当前运行的调度程序（下图）。

 ![Figure A](http://tr3.cbsistatic.com/hub/i/2017/01/03/abba7f22-3252-4b76-91c0-bb15630fd42c/6b4a6d971202b70926b2d991e6c9afe3/schedulera.jpg) 

*Elementary OS Loki 运行 deadline 调度器。*

### 更改你的调度器

你可以通过两种方式更改你的调度器：即时或永久。如果你即时更改调度器，它会在重启后恢复到之前的默认调度器。你可能希望首先进行即时更改，以查看哪个调度器能为你的需求带来最佳性能。

说到你要即时改到 noop 调度器。 为此，输入以下命令：

```
sudo echo noop > /sys/block/hda/queue/scheduler
```

你可以将 `noop` 更改为 `cfq`  或 `deadline`。

此更改可以在不重新启动计算机的情况下生效。 一旦更改，I/O 调度器将会切换，（希望）你能看到性能提高（再说一次，根据你的需要而定）。

如果要将调度器更改为永久，则必须在 GRUB 配置文件中执行此操作。 为此，请输入 `sudo nano /etc/default/grub`，然后修改下面的行：

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```

到

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash elevator=noop"
```

同样，你可以改变 `noop` 为任何你需要的调度器。如果你用的是即时修改，则不必重新启动以使新调度器生效。

这些就是修改调度器的方法了。

### 做出明智的选择

你应该做研究，找出什么调度器最适合你的特殊情况。要了解每个调度器的更多信息，请查看这些 Wiki 页面：[CFS][7]、[Noop][8]和 [Deadline][9]。

--------------------------------------------------------------------------------

via: http://www.techrepublic.com/article/how-to-change-the-linux-io-scheduler-to-fit-your-needs/

作者：[Jack Wallen][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.techrepublic.com/meet-the-team/us/jack-wallen/
[7]:https://en.wikipedia.org/wiki/Completely_Fair_Scheduler
[8]:https://en.wikipedia.org/wiki/Noop_scheduler
[9]:https://en.wikipedia.org/wiki/Deadline_scheduler
