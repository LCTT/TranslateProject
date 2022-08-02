[#]: subject: "Check disk usage in Linux"
[#]: via: "https://opensource.com/article/22/7/check-disk-usage-linux"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14823-1.html"

检查 Linux 磁盘使用情况
======

> du 和 ncdu 两个命令提供了相同信息的两种不同视图，便于我们跟踪存储在计算机上的内容。

![](https://img.linux.net.cn/data/attachment/album/202207/13/111729faleyal2gmappykc.jpg)

无论你有多少存储空间，了解文件占用了多少磁盘空间都是一个重要的考虑事项。我的笔记本有一个相对较小的 250GB NVME 驱动器，大多数时候都没什么问题，但几年前我开始探索 Linux 上的游戏，情况变得有所不同，安装 Steam 和其他游戏使存储管理更加重要。

### du 命令

检查磁盘驱动器上剩余存储空间最简单的方法是 [du 命令][2]。它会估计文件空间使用情况，像其他所有 Linux 工具一样，`du` 非常强大，但学会如何根据你的特定需求使用它会很有帮助。我总是查阅手册页来掌握实用程序的用法。`du` 有几个选项，可以为你提供文件存储的最佳快照，以及它们在系统上消耗多少空间。

`du` 命令有很多选项，以下是一些常见的：

* `-a` - 包括文件夹和文件在内的存储信息
* `--apparent-size` - 打印自身大小而不是占用磁盘量
* `-h` - 人类可读的格式
* `-b` - 以字节为单位
* `-c` - 总计
* `-k` - 以块为单位
* `-m` - 以兆字节为单位的大小

务必查看 `du` 手册页获取完整帮助列表。

#### 显示所有文件

你可以选择的第一个选项是 `du -a`，它可以显示系统上所有文件及其存储目录的大小。这个命令让我知道了我的主目录中存储了 11555168 个字节。使用 `du -a` 可以快速递归地查看我的存储系统。如果我想要一个更有意义的数字，并且我想深入到目录中查看大文件的位置，该怎么办？

我认为在 `Downloads` 目录下有一些大文件，所以我输入 `du -a /home/don/Downloads` 来查看。

```
$ du -a ~/Downloads
4923    ./UNIX_Driver_5-0/UNIX Driver 50
4923    ./UNIX_Driver_5-0
20      ./epel-release-latest-9.noarch.rpm
12      ./rpmfusion-free-release-9.noarch.rpm
2256    ./PZO9297 000 Cover.pdf
8       ./pc.md
2644    ./geckodriver-v0.31.0-linux64.tar.gz
466468
```

最左边的数字是以字节为单位的文件大小。我想要一些对我更有帮助的东西，所以我将人类可读格式的选项添加到命令中，结果是 456M（兆字节），这对我来说是一种更有用的数字格式。

```
$ du -ah ~/Downloads
4.9M    ./UNIX_Driver_5-0/UNIX Driver 50
4.9M    ./UNIX_Driver_5-0
20K    ./epel-release-latest-9.noarch.rpm
12K    ./rpmfusion-free-release-9.noarch.rpm
2.2M    ./PZO9297 000 Cover.pdf
8.0K    ./pc.md
2.6M    ./geckodriver-v0.31.0-linux64.tar.gz
456M    .
```

与大多数 Linux 命令一样，你可以组合选项，要以人类可读的格式查看 `Downloads` 目录，使用 `du -ah ~/Downloads` 命令。

#### 总和

`-c` 选项在最后一行提供了磁盘使用总和。我可以使用 `du -ch /home/don` 来显示主目录中的每个文件和目录。这里有很多信息，我只想知道最后一行的信息，所以我将 `du` 命令通过管道传输给 `tail` 来显示最后几行。命令是 `du -ch /home/don | tail`。（LCTT 校注：可以使用 `tail -1` 来仅显示最后一行汇总行。）

![将 du 命令输出通过管道传输到 tail][4]

### ncdu 命令

对存储在驱动器上内容感兴趣的 Linux 用户，另一个选择是 [ncdu 命令][5]，它代表 “NCurses 磁盘使用情况”。基于你的 Linux 发行版，你可能需要下载并安装它。

在 Linux Mint、Elementary、Pop_OS! 或其它基于 Debian 的发行版上：

```
$ sudo apt install ncdu
```

在 Fedora、Mageia 或 CentOS 上：

```
$ sudo dnf install ncdu
```

在 Arch、Manjar 或者类似发行版上：

```
$ sudo pacman -S ncdu
```

安装后，你可以使用 `ncdu` 来分析你的文件系统。以下是在我的主目录中发出 `ncdu` 后的示例输出。`ncdu` 的手册页指出 “ncdu（NCurses Disk Usage）是众所周知的 `du` 基于 curses 的版本，它提供了一种快速查看哪些目录正在使用磁盘空间的方法。”

![du 命令输出][6]

我可以使用方向键上下导航，按下回车键进入目录。有趣的是，`du` 报告我的主目录中的总磁盘使用量为 12GB，而 `ncdu` 显示为 11GB。你可以在 `ncdu` 手册页中找到更多信息。

你可以将 `ncdu` 指向某个目录来探索特定目录。例如，`ncdu /home/don/Downloads`。

![ncdu 命令输出][7]

按 `?` 键显示帮助菜单。

![ncdu 帮助][8]

### 总结

`du` 和 `ncdu` 两个命令提供了相同信息的两种不同视图，便于我们跟踪存储在计算机上的内容。

如果你不习惯使用终端，或者想寻找此类信息的另一种查看方式，可以看看 [GNOME 磁盘使用分析器][9]。如果你的系统上还没有它，你可以轻松安装和使用它。检查你的发行版是否有 baobab 开发的这个软件，如果你想试试，那就去安装它吧。

（文内图片来自于 Don Watkins, CC BY-SA 4.0）

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/check-disk-usage-linux

作者：[Don Watkins][a]
选题：[lkxed][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/data_stack_blue_disks.png
[2]: https://opensource.com/article/21/7/check-disk-space-linux-du
[3]: https://opensource.com/article/18/7/how-check-free-disk-space-linux
[4]: https://opensource.com/sites/default/files/2022-06/1-du-tail.png
[5]: https://opensource.com/article/21/8/ncdu-check-free-disk-space-linux
[6]: https://opensource.com/sites/default/files/2022-06/2home.png
[7]: https://opensource.com/sites/default/files/2022-06/3downloads.png
[8]: https://opensource.com/sites/default/files/2022-06/4ncdu.png
[9]: https://help.gnome.org/users/baobab/stable/
