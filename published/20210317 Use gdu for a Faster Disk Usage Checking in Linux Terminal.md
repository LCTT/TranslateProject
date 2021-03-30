[#]: subject: (Use gdu for a Faster Disk Usage Checking in Linux Terminal)
[#]: via: (https://itsfoss.com/gdu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13234-1.html)

使用 gdu 进行更快的磁盘使用情况检查
======

![](https://img.linux.net.cn/data/attachment/album/202103/24/233818dkfvi4fviiysn8o9.jpg)

在 Linux 终端中有两种常用的 [检查磁盘使用情况的方法][1]：`du` 命令和 `df` 命令。[du 命令更多的是用来检查目录的使用空间][2]，`df` 命令则是提供文件系统级别的磁盘使用情况。

还有更友好的 [用 GNOME “磁盘” 等图形工具在 Linux 中查看磁盘使用情况的方法][3]。如果局限于终端，你可以使用像 [ncdu][5] 这样的 [TUI][4] 工具，以一种图形化的方式获取磁盘使用信息。

### gdu: 在 Linux 终端中检查磁盘使用情况

[gdu][6] 就是这样一个用 Go 编写的工具（因此是 gdu 中的 “g”）。gdu 开发者的 [基准测试][7] 表明，它的磁盘使用情况检查速度相当快，特别是在 SSD 上。事实上，gdu 主要是针对 SSD 的，尽管它也可以在 HDD 上工作。

如果你在使用 `gdu` 命令时没有使用任何选项，它就会显示你当前所在目录的磁盘使用情况。

![][8]

由于它具有文本用户界面（TUI），你可以使用箭头浏览目录和磁盘。你也可以按文件名或大小对结果进行排序。

你可以用它做到：

  * 向上箭头或 `k` 键将光标向上移动
  * 向下箭头或 `j` 键将光标向下移动
  * 回车选择目录/设备
  * 左箭头或 `h` 键转到上级目录
  * 使用 `d` 键删除所选文件或目录
  * 使用 `n` 键按名称排序
  * 使用 `s` 键按大小排序
  * 使用 `c` 键按项目排序

你会注意到一些条目前的一些符号。这些符号有特定的意义。

![][9]

  * `!` 表示读取目录时发生错误。
  * `.` 表示在读取子目录时发生错误，大小可能不正确。
  * `@` 表示文件是一个符号链接或套接字。
  * `H` 表示文件已经被计数（硬链接）。
  * `e` 表示目录为空。

要查看所有挂载磁盘的磁盘利用率和可用空间，使用选项 `d`：

```
gdu -d
```

它在一屏中显示所有的细节：

![][10]

看起来是个方便的工具，对吧？让我们看看如何在你的 Linux 系统上安装它。

### 在 Linux 上安装 gdu

gdu 是通过 [AUR][11] 提供给 Arch 和 Manjaro 用户的。我想，作为一个 Arch 用户，你应该知道如何使用 AUR。

它包含在即将到来的 Ubuntu 21.04 的 universe 仓库中，但有可能你现在还没有使用它。这种情况下，你可以使用 Snap 安装它，这可能看起来有很多条 `snap` 命令：

```
snap install gdu-disk-usage-analyzer
snap connect gdu-disk-usage-analyzer:mount-observe :mount-observe
snap connect gdu-disk-usage-analyzer:system-backup :system-backup
snap alias gdu-disk-usage-analyzer.gdu gdu
```

你也可以在其发布页面找到源代码：

- [下载 gdu 的源代码][12]

我更习惯于使用 `du` 和 `df` 命令，但我觉得一些 Linux 用户可能会喜欢 gdu。你是其中之一吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/gdu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/df-command/
[2]: https://linuxhandbook.com/find-directory-size-du-command/
[3]: https://itsfoss.com/check-free-disk-space-linux/
[4]: https://itsfoss.com/gui-cli-tui/
[5]: https://dev.yorhel.nl/ncdu
[6]: https://github.com/dundee/gdu
[7]: https://github.com/dundee/gdu#benchmarks
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/gdu-disk-utilization.png?resize=800%2C471&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/gdu-entry-symbols.png?resize=800%2C302&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/gdu-disk-utilization-for-all-drives.png?resize=800%2C471&ssl=1
[11]: https://itsfoss.com/aur-arch-linux/
[12]: https://github.com/dundee/gdu/releases
