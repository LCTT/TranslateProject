[#]: subject: "How to Monitor Log Files in Real Time in Linux [Desktop and Server]"
[#]: via: "https://www.debugpoint.com/monitor-log-files-real-time/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14947-1.html"

如何在 Linux 中实时监控日志文件
======

![](https://img.linux.net.cn/data/attachment/album/202208/19/194609f1njqu096uhy919i.jpg)

> 本教程介绍了如何实时监控 Linux 日志文件（桌面、服务器或应用）以进行诊断和故障排除。

当你在 Linux 桌面、服务器或任何应用中遇到问题时，你首先会查看单独的日志文件。日志文件通常是文本流和来自应用的带有时间戳的消息。它可以帮助你缩小特定问题的范围，并使你能够找到问题的原因。它还可以帮助从网络获得帮助。

一般来说，所有的日志文件都位于 `/var/log`。此目录包含特定应用和服务的扩展名为 `.log` 的日志文件，它还包含了其他含有日志的独立目录。

![log files in var-log][1]

所以，如果你想监控一堆日志文件或特定的一个，这里有一些方法可以做到。

### Linux 实时监控日志文件

#### 使用 tail 命令

`tail` 命令是实时跟踪日志文件的最基本方式。特别是如果你在只有终端而没有 GUI 的服务器中。这很有帮助。

基本语法如下：

```
tail /path/to/log/file
```

用法：

![Monitoring multiple log files via tail][2]

可以使用开关 `-f` 跟踪实时更新的日志文件。例如，如果要关注 syslog，可以使用以下命令。

```
tail -f /var/log/syslog
```

你可以使用单个命令监控多个日志文件：

```
tail -f /var/log/syslog /var/log/dmesg
```

如果要监视 HTTP 或 sftp 或任何服务器，可以在此命令中使用它们各自的日志文件。

请记住，上述命令需要管理员权限。

#### 使用 lnav（日志文件浏览器）

![lnav Running][3]

`lnav` 是一个出色的程序，你可以用它来用彩色编码的信息以更有条理的方式监控日志文件。在 Linux 系统中，这个工具不是默认安装的。你可以用下面的命令来安装它：

Ubuntu：

```
sudo apt install lnav
```

Fedora：

```
sudo dnf install lnav
```

lnav 的好处在于，如果你不想安装它，你可以下载其预编译的可执行文件并在任何地方运行它，甚至可以从 U 盘上运行。无需设置，并加载了功能。使用 lnav，你可以通过 SQL 查询日志文件，以及其他很酷的功能，你可以在其[官方网站][4]上学习。

安装后，你可以在具有管理员权限的终端上运行 `lnav`，它会默认显示 `/var/log` 中的所有日志并开始实时监控。

#### 关于 systemd 的 journalctl 的一个说明

当今所有现代 Linux 发行版都主要使用 systemd。 systemd 提供了运行 Linux 操作系统的基本框架和组件。 systemd 通过 `journalctl` 提供日志服务，这有助于管理来自所有 systemd 服务的日志。你还可以使用以下命令实时监控各个 systemd 服务和日志。

```
journalctl -f
```

以下是一些特定的 `journalctl` 命令，可用于多种情况。你可以将这些与上面的 `-f` 选项结合使用以开始实时监控。

对于紧急系统消息，请使用：

```
journalctl -p 0
```

显示带有解释的错误：

```
journalctl -xb -p 3
```

使用时间控制过滤：

```
journalctl --since "2022-12-04 06:00:00"
journalctl --since "2022-12-03" --until "2022-12-05 03:00:00"
journalctl --since yesterday
journalctl --since 09:00 --until "1 hour ago"
```

如果你想了解更多关于 journalctl 的详细信息，我已经在这写了份 [指南][5]。

### 结束语

我希望这些命令和技巧可以帮助你找到桌面或服务器中问题/错误的根本原因。有关更多详细信息，你可以随时参考手册页并使用各种选项。如果你对本文有任何意见或想法，请使用下面的评论栏告诉我。

干杯。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/monitor-log-files-real-time/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2021/08/log-files-in-var-log-1024x312.jpeg
[2]: https://www.debugpoint.com/wp-content/uploads/2021/08/Monitoring-multiple-log-files-via-tail.jpeg
[3]: https://www.debugpoint.com/wp-content/uploads/2021/08/lnav-Running.jpeg
[4]: https://lnav.org/features
[5]: https://www.debugpoint.com/2020/12/systemd-journalctl/
