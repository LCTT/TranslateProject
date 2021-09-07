[#]: subject: "Check free disk space in Linux with ncdu"
[#]: via: "https://opensource.com/article/21/8/ncdu-check-free-disk-space-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13729-1.html"

用 ncdu 检查 Linux 中的可用磁盘空间
======

> 用 ncdu Linux 命令获得关于磁盘使用的交互式报告。

![](https://img.linux.net.cn/data/attachment/album/202108/29/095819e87oz4ox6p40t6q0.jpg)

计算机用户多年来往往积累了大量的数据，无论是重要的个人项目、数码照片、视频、音乐还是代码库。虽然现在的硬盘往往相当大，但有时你必须退一步，评估一下你在硬盘上实际存储了什么。经典的 Linux 命令 [df][2] 和 [du][3] 是快速了解硬盘上的内容的方法，它们提供了一个可靠的报告，易于解析和处理。这对脚本和处理来说是很好的，但人的大脑对数百行的原始数据并不总是反应良好。认识到这一点，`ncdu` 命令旨在提供一份关于你在硬盘上使用的空间的交互式报告。

### 在 Linux 上安装 ncdu

在 Linux 上，你可以从你的软件仓库安装 `ncdu`。例如，在 Fedora 或 CentOS 上：

```
$ sudo dnf install ncdu
```

在 BSD 上，你可以使用 [pkgsrc][4]。

在 macOS 上，你可以从 [MacPorts][5] 或 [HomeBrew][6] 安装。

另外，你也可以 [从源码编译 ncdu][7]。

### 使用 ncdu

`ncdu` 界面使用 ncurses 库，它将你的终端窗口变成一个基本的图形应用，所以你可以使用方向键来浏览菜单。

![ncdu interface][8]

这是 `ncdu` 的主要吸引力之一，也是它与最初的 `du` 命令不同的地方。

要获得一个目录的完整列表，启动 `ncdu`。它默认为当前目录。

```
$ ncdu
ncdu 1.16 ~ Use the arrow keys to navigate, press ? for help                                                                  
--- /home/tux -----------------------------------------------
   22.1 GiB [##################] /.var
   19.0 GiB [###############   ] /Iso
   10.0 GiB [########          ] /.local
    7.9 GiB [######            ] /.cache
    3.8 GiB [###               ] /Downloads
    3.6 GiB [##                ] /.mail
    2.9 GiB [##                ] /Code
    2.8 GiB [##                ] /Documents
    2.3 GiB [#                 ] /Videos
[...]
```

这个列表首先显示了最大的目录（在这个例子中，那是 `~/.var` 目录，塞满了很多的 flatpak 包）。

使用键盘上的方向键，你可以浏览列表，深入到一个目录，这样你就可以更好地了解什么东西占用了最大的空间。

### 获取一个特定目录的大小

你可以在启动 `ncdu` 时提供任意一个文件夹的路径：

```
$ ncdu ~/chromiumos
```

### 排除目录

默认情况下，`ncdu` 包括一切可以包括的东西，包括符号链接和伪文件系统，如 procfs 和 sysfs。你可以用 `--exclude-kernfs` 来排除这些。

你可以使用 `--exclude` 选项排除任意文件和目录，并在后面加上一个匹配模式。

```
$ ncdu --exclude ".var"
   19.0 GiB [##################] /Iso
   10.0 GiB [#########         ] /.local
    7.9 GiB [#######           ] /.cache
    3.8 GiB [###               ] /Downloads
[...]
```

另外，你可以在文件中列出要排除的文件和目录，并使用 `--exclude-from` 选项来引用该文件：

```
$ ncdu --exclude-from myexcludes.txt /home/tux
   10.0 GiB [#########         ] /.local
    7.9 GiB [#######           ] /.cache
    3.8 GiB [###               ] /Downloads
[...]
```

### 颜色方案

你可以用 `--color dark` 选项给 `ncdu` 添加一些颜色。

![ncdu color scheme][9]

### 包括符号链接

`ncdu` 输出按字面意思处理符号链接，这意味着一个指向 9GB 文件的符号链接只占用 40 个字节。

```
$ ncdu ~/Iso
    9.3 GiB [##################]  CentOS-Stream-8-x86_64-20210427-dvd1.iso                                                    
@   0.0   B [                  ]  fake.iso
```

你可以用 `--follow-symlinks` 选项强制 ncdu 跟踪符号链接：

```
$ ncdu --follow-symlinks ~/Iso
    9.3 GiB [##################]  fake.iso                                                                                    
    9.3 GiB [##################]  CentOS-Stream-8-x86_64-20210427-dvd1.iso
```

### 磁盘使用率

磁盘空间用完并不有趣，所以监控你的磁盘使用情况很重要。`ncdu` 命令使它变得简单和互动。下次当你对你的电脑上存储的东西感到好奇时，或者只是想以一种新的方式探索你的文件系统时，不妨试试 `ncdu`。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/ncdu-check-free-disk-space-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/du-splash.png?itok=nRLlI-5A (Check disk usage)
[2]: https://opensource.com/article/21/7/check-disk-space-linux-df
[3]: https://opensource.com/article/21/7/check-disk-space-linux-du
[4]: https://opensource.com/article/19/11/pkgsrc-netbsd-linux
[5]: https://opensource.com/article/20/11/macports
[6]: https://opensource.com/article/20/6/homebrew-mac
[7]: https://dev.yorhel.nl/ncdu
[8]: https://opensource.com/sites/default/files/ncdu.jpg (ncdu interface)
[9]: https://opensource.com/sites/default/files/ncdu-dark.jpg (ncdu color scheme)
