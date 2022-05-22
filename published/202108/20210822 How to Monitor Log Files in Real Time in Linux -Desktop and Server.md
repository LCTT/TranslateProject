[#]: subject: "How to Monitor Log Files in Real Time in Linux [Desktop and Server]"
[#]: via: "https://www.debugpoint.com/2021/08/monitor-log-files-real-time/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13733-1.html"

如何在 Linux 中实时监控日志文件
======

> 本教程解释了如何实时监控 Linux 日志文件（桌面、服务器或应用），以进行诊断和故障排除。

![](https://img.linux.net.cn/data/attachment/album/202108/30/082607bmf6nlud6sdy49rm.jpg)

当你在你的 Linux 桌面、服务器或任何应用中遇到问题时，你会首先查看各自的日志文件。日志文件通常是来自应用的文本和信息流，上面有一个时间戳。它可以帮助你缩小具体的实例，并帮助你找到任何问题的原因。它也可以帮助从网络上获得援助。

一般来说，所有的日志文件都位于 `/var/log` 中。这个目录包含以 `.log` 为扩展名的特定应用、服务的日志文件，它还包含单独的其他目录，这些目录包含其日志文件。

![log files in var-log][1]

所以说，如果你想监控一堆日志文件或特定的日志文件。这里有一些你可以做到方法。

### 实时监控 Linux 日志文件

#### 使用 tail 命令

使用 `tail` 命令是实时跟踪日志文件的最基本方法。特别是，如果你所在的服务器只有一个终端，没有 GUI。这是很有帮助的。

比如：

```
tail /path/to/log/file
```

![Monitoring multiple log files via tail][2]

使用开关 `-f` 来跟踪日志文件，它是实时更新的。例如，如果你想跟踪 `syslog`，你可以使用以下命令：

```
tail -f /var/log/syslog
```

你可以用一个命令监控多个日志文件，使用：

```
tail -f /var/log/syslog /var/log/dmesg
```

如果你想监控 http 或 sftp 或任何服务器，你也可以在这个命令中监控它们各自的日志文件。

记住，上述命令需要管理员权限。

#### 使用 lnav（日志文件浏览器）

![lnav Running][3]

`lnav` 是一个很好的工具，你可以用它来通过彩色编码的信息以更有条理的方式监控日志文件。在 Linux 系统中，它不是默认安装的。你可以用下面的命令来安装它：

```
sudo apt install lnav ### Ubuntu
sudo dnf install lnav ### Fedora
```

好的是，如果你不想安装它，你可以直接下载其预编译的可执行文件，然后在任何地方运行。甚至从 U 盘上也可以。它不需要设置，而且有很多功能。使用 `lnav`，你可以通过 SQL 查询日志文件，以及其他很酷的功能，你可以在它的 [官方网站][4] 上了解。

一旦安装，你可以简单地用管理员权限从终端运行 `lnav`，它将默认显示 `/var/log` 中的所有日志并开始实时监控。

#### 关于 systemd 的 journalctl 说明

今天所有的现代 Linux 发行版大多使用 systemd。systemd 提供了运行 Linux 操作系统的基本框架和组件。systemd 通过 `journalctl` 提供日志服务，帮助管理所有 systemd 服务的日志。你还可以通过以下命令实时监控各个 systemd 服务和日志。

```
journalctl -f
```

下面是一些具体的 `journalctl` 命令，可以在一些情况下使用。你可以将这些命令与上面的 `-f` 开关结合起来，开始实时监控。

  * 对紧急系统信息，使用：
    ```
    journalctl -p 0
    ```
  * 显示带有解释的错误：
    ```
    journalctl -xb -p 3
    ```
  * 使用时间控制来过滤输出：
    ```
    journalctl --since "2020-12-04 06:00:00"
    journalctl --since "2020-12-03" --until "2020-12-05 03:00:00"
    journalctl --since yesterday
    journalctl --since 09:00 --until "1 hour ago"
    ```

如果你想了解更多关于 `journalctl` 的细节，我已经写了一个 [指南][6]。

### 结束语

我希望这些命令和技巧能帮助你找出桌面或服务器问题/错误的根本原因。对于更多的细节，你可以随时参考手册，摆弄各种开关。如果你对这篇文章有什么意见或看法，请在下面的评论栏告诉我。

加油。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/monitor-log-files-real-time/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/log-files-in-var-log-1024x312.jpeg
[2]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/Monitoring-multiple-log-files-via-tail-1024x444.jpeg
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/lnav-Running-1024x447.jpeg
[4]: https://lnav.org/features
[6]: https://www.debugpoint.com/2020/12/systemd-journalctl/
