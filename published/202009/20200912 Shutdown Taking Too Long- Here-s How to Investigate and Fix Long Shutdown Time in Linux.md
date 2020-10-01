[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12635-1.html)
[#]: subject: (Shutdown Taking Too Long? Here’s How to Investigate and Fix Long Shutdown Time in Linux)
[#]: via: (https://itsfoss.com/long-shutdown-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

关机时间太长的调查和解决的方法
======

![](https://img.linux.net.cn/data/attachment/album/202009/20/233812o1kd114jzq11lq1l.jpg)

>  你的 Linux 系统关机时间太长么？以下是你可以采取的步骤，来找出导致延迟关机的原因并解决这个问题。

我希望你对 [sigterm 和 sigkill][1] 的概念有一点熟悉。

当你[关闭 Linux 系统][2]时，它会发送终止信号（sigterm），并礼貌地要求正在运行的进程停止。有些进程不符合该行为，它们会忽略终止信号并继续运行。

这可能会导致关机过程的延迟，因为你的系统会在一个预定义的时间段内等待运行的进程停止。在这个时间段之后，它会发送 `kill` 信号来强制停止所有剩余的运行进程并关闭系统。

事实上，在某些情况下，你会在黑屏上看到一个类似 “a stop job is running” 的信息。

如果你的系统关闭时间太长，你可以做以下工作：

  * 检查哪个进程/服务耗时过长，以及你是否能删除或重新配置它，使其正常运行。
  * 更改系统强制停止运行进程前的默认等待时间。（快速而不优雅的方式）

我的操作系统是使用 systemd 的 Ubuntu。这里的命令和步骤适用于任何使用 systemd 的 Linux 发行版（大多数发行版都是这样）。

![][3]

### 检查哪些进程会导致 Linux 的长时间关机

如果你想找出问题所在，你应该检查上次关机时发生了什么。使用这个命令来获得“我知道你上个会话做了什么”（I Know What You Did Last Summer 的双关语）的力量。

```
journalctl -rb -1
```

[journalctl 命令][4]能让你读取系统日志。使用选项 `-b -1` 可以过滤最后一次启动会话的日志。使用选项 `-r` 时，日志将按时间倒序显示。

换句话说，`journalctl -rb -1` 命令将显示最后一次关闭 Linux 系统之前的系统日志。这里就是你需要分析 Linux 系统长时间关机问题的地方。

#### 没有 journal 日志？下面是你应该做的。

如果没有 journal 日志，请确认你的发行版是否使用 systemd。

即使在一些使用 systemd 的 Linux 发行版上，journal 日志也没有被默认激活。

请确认 `/var/log/journal` 是否存在。如果不存在，请创建它：

```
sudo mkdir /var/log/journal
```

你还应该检查 `/etc/systemd/journald.conf` 文件的内容，并确保 `Storage` 的值被设置为自动（`auto`）或持久（`persistent`）。

你是否在日志中发现可疑的东西？是否有一个进程/服务拒绝停止？如果是，调查一下是否可以在没有副作用的情况下删除它，或者是否可以重新配置它。请不要在这里盲目地去删除东西。你应该对这个进程有所了解。

### 通过减少默认停止超时来加快 Linux 中的关机速度（快速修复）

关机的默认等待时间通常设置为 90 秒。在这个时间之后，你的系统会尝试强制停止服务。

如果你想让你的 Linux 系统快速关闭，你可以改变这个等待时间。

你可以在位于 `/etc/systemd/system.conf` 的配置文件中找到所有的 systemd 设置。这个文件中应该有很多以 `#` 开头的行。它们代表了文件中各条目的默认值。

在开始之前，最好先复制一份原始文件。

```
sudo cp /etc/systemd/system.conf /etc/systemd/system.conf.orig
```

在这里寻找 `DefaultTimeoutStopSec`。它可能被设置为 90 秒。

```
#DefaultTimeoutStopSec=90s
```

你得把这个值改成更方便的，比如 5 秒或 10 秒。

```
DefaultTimeoutStopSec=5s
```

如果你不知道如何在终端中编辑配置文件，可以使用这个命令在系统默认的文本编辑器（如 Gedit）中打开文件进行编辑：

```
sudo xdg-open /etc/systemd/system.conf
```

![Change Shutdown Time Settings Ubuntu][5]

不要忘记**删除 DefaultTimeoutStopSec 前的 `#` 号**。保存文件并重启系统。

这将帮助你减少 Linux 系统的关机延迟。

#### 看门狗问题！

Linux 有一个名为看门狗的模块，用于监控某些服务是否在运行。它可以被配置为在系统因软件错误而挂起时自动重启系统。

在桌面系统上使用看门狗是不常见的，因为你可以手动关闭或重启系统。它经常被用于远程服务器上。

首先检查看门狗是否在运行：

```
ps -af | grep watch*
```

如果你的系统正在运行看门狗，你可以在 systemd 配置文件 `/etc/systemd/system.conf` 中将 `ShutdownWatchdogSec` 的值从 10 分钟改为更低的值。

### 你能解决关机时间过长的问题吗？

希望本教程能帮助你解决系统长时间关机的问题。如果你成功解决了这个问题，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/long-shutdown-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/sigterm-vs-sigkill/
[2]: https://itsfoss.com/schedule-shutdown-ubuntu/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/troubleshoot-long-shutdown-linux.gif?resize=800%2C450&ssl=1
[4]: https://linuxhandbook.com/journalctl-command/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/change-shutdown-time-settings-ubuntu.png?resize=797%2C322&ssl=1
