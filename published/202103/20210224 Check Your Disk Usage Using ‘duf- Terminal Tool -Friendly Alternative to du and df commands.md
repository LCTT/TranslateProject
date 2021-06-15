[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13165-1.html)
[#]: subject: (Check Your Disk Usage Using ‘duf’ Terminal Tool [Friendly Alternative to du and df commands])
[#]: via: (https://itsfoss.com/duf-disk-usage/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

使用 duf 终端工具检查你的磁盘使用情况
======

![](https://img.linux.net.cn/data/attachment/album/202103/01/091533qkx95xomkzfmsdxo.jpg)

> `duf` 是一个终端工具，旨在增强传统的 Linux 命令 `df` 和 `du`。它可以让你轻松地检查可用磁盘空间，对输出进行分类，并以用户友好的方式呈现。

### duf：一个用 Golang 编写的跨平台磁盘使用情况工具

![][1]

在我知道这个工具之前，我更喜欢使用像 [Stacer][2] 这样的 GUI 程序或者预装的 GNOME 磁盘使用情况程序来 [检查可用的磁盘空间][3] 和系统的磁盘使用量。

不过，[duf][4] 似乎是一个有用的终端工具，可以检查磁盘使用情况和可用空间，它是用 [Golang][5] 编写的。Abhishek 建议我试一试它，但我对它很感兴趣，尤其是考虑到我目前正在学习 Golang，真是太巧了!

无论你是终端大师还是只是一个对终端不适应的初学者，它都相当容易使用。当然，它比 [检查磁盘空间利用率命令 df][6] 更容易理解。

在你把它安装到你的系统上之前，让我重点介绍一下它的一些主要功能和用法。

### duf 的特点

![][7]

  * 提供所有挂载设备的概览且易于理解。
  * 能够指定目录/文件名并检查该挂载点的可用空间。
  * 更改/删除输出中的列。
  * 列出 [inode][8] 信息。
  * 输出排序。
  * 支持 JSON 输出。
  * 如果不能自动检测终端的主题，可以指定主题。

### 在 Linux 上安装和使用 duf

你可以在 [AUR][9] 中找到一个 Arch Linux 的软件包。如果你使用的是 [Nix 包管理器][10]，也可以找到一个包。

对于基于 Debian 的发行版和 RPM 包，你可以去它的 [GitHub 发布区][11] 中获取适合你系统的包。

它也适用于 Windows、Android、macOS 和 FreeBSD。

在我这里，我需要 [安装 DEB 包][12]，然后就可以使用了。安装好后，使用起来很简单，你只要输入：

```
duf
```

这应该会给你提供所有本地设备、已挂载的任何云存储设备以及任何其他特殊设备（包括临时存储位置等）的详细信息。

如果你想一目了然地查看所有 `duf` 的可用命令，你可以输入：

```
duf --help
```

![][13]

例如，如果你只想查看本地连接设备的详细信息，而不是其他的，你只需要输入：

```
duf --only local
```

另一个例子是根据大小按特定顺序对输出进行排序，下面是你需要输入的内容：

```
duf --sort size
```

输出应该是像这样的：

![][14]

你可以探索它的 [GitHub 页面][4]，以获得更多关于额外命令和安装说明的信息。

- [下载 duf][4]

### 结束语

我发现终端工具 `duf` 相当方便，可以在不需要使用 GUI 程序的情况下，随时查看可用磁盘空间或使用情况。

你知道有什么类似的工具吗？欢迎在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/duf-disk-usage/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-screenshot.jpg?resize=800%2C481&ssl=1
[2]: https://itsfoss.com/optimize-ubuntu-stacer/
[3]: https://itsfoss.com/check-free-disk-space-linux/
[4]: https://github.com/muesli/duf
[5]: https://golang.org/
[6]: https://linuxhandbook.com/df-command/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-local.jpg?resize=800%2C195&ssl=1
[8]: https://linuxhandbook.com/inode-linux/
[9]: https://itsfoss.com/aur-arch-linux/
[10]: https://github.com/NixOS/nixpkgs
[11]: https://github.com/muesli/duf/releases
[12]: https://itsfoss.com/install-deb-files-ubuntu/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-commands.jpg?resize=800%2C443&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-sort-example.jpg?resize=800%2C365&ssl=1
