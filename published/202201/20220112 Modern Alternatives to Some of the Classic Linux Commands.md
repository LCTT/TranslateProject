[#]: subject: "Modern Alternatives to Some of the Classic Linux Commands"
[#]: via: "https://itsfoss.com/legacy-linux-commands-alternatives/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14172-1.html"

一些经典 Linux 命令的现代替代品
======

![](https://img.linux.net.cn/data/attachment/album/202201/12/155211u6dwvwv66hwvzo8g.jpg)

当你 [开始学习 Linux][1] 时，最初学习的是一套标准的 Linux 命令，这些命令从 UNIX 时代就已经存在了。随着你作为一个 Linux 用户的年龄增长，你会不断地掌握这套标准命令。

但是，这些标准的、传统的命令是几十年前创建的，虽然它们完成了预定的工作，但是它们的功能还可以改进，结构还可以简化。

这就是为什么存在 “替代” 工具，以加强传统的 UNIX/Linux 命令。在这篇文章中，我将列出一些新的命令行工具，你可以用这些工具来代替旧式的经典 Linux 命令。

请注意，你不应该过分依赖这些替代品，特别是如果你管理（或计划管理）许多 Linux 服务器时。传统的 Linux 命令在所有的 Linux 发行版和 Linux 服务器上都可以找到。这些现代的替代方案很有可能在远程服务器上无法使用。

在你的个人能力范围内，你可以学习了解这些新的工具，以帮助你更有效率。

听起来不错？让我们看看你是否能在这里找到你下一个最喜欢的命令行工具。

### HTTPie: wget 和 curl 的替代品

[在终端下载文件][2] 时，`wget` 和 `curl` 是两个最常用的工具。有趣的是，并不是所有的发行版都默认安装了 `curl` 和 `wget`。

HTTPie（`http`）以一种更人性化的方式做同样的工作。你会看到彩色的、格式化的输出，这使得它更容易理解和调试。

![][3]

### 蝙蝠：猫的替代品

`cat` 命令可能是你最先学会的命令之一。它可以完成查看小型文本文件内容的工作。

但 [bat 命令][4] 更上一层楼，添加了语法高亮和 Git 集成等功能，并且还提供了分页选项。

![][5]

### ncdu: du 命令的替代品

Linux 中的 [du 命令][6] 用来检查一个目录的大小。这不是一个非常直观的命令，当然它的默认输出也不算非常好。

与此相比，`ncdu` 要好得多，它能及时提供相关信息。

![][7]

它还有其他一些功能，比如用图表显示磁盘使用情况，对显示进行排序，甚至可以交互式地删除目录。

它是基于 ncurses 的，因此 “nc” 这个前缀被加到 `du` 中。此外，还有一个类似的 CLI 工具：[gdu][8]，也是一个 `du` 的替代品，因为是使用 Go 编写的，这使得它的性能得到了提升。

### htop: top 命令的替代品

`top` 命令是 Linux 终端中的任务管理器。它是一个查看运行进程和资源消耗的好工具，但是 [理解和使用 top 命令][9] 可能很复杂。

另一方面，[htop][10] 有一个漂亮的彩色输出，并且界面比 `top` 命令更直观。你可以垂直和水平滚动，以图形方式配置显示的信息。你可以在 `htop` 的输出屏幕上交互式地杀死进程。

![][11]

### fd：find 命令的替代品

`find` 命令是最强大和最常用的 Linux 命令之一。不能想象一个系统管理员可以不使用 `find` 命令就能生存下去。

但是，`find` 命令的结构奇怪，如果你进行大量的查找操作，它可能会很慢。

一个更好、更快的替代方案是 [fd 命令][12]。`fd` 是用 Rust 编写的，它比其传统的竞争对手更简单、更快速。

![][13]

### exa：ls 命令的替代品

[exa][14] 命令行工具不止可以列出目录内容。它的默认设置更好，使用颜色来区分文件类型和元数据。`exa` 还可以显示一个文件的扩展属性，以及标准的文件系统信息，如 inode、块数，以及文件的各种日期和时间。

你可以使用树状视图来查看目录结构。它也有内置的 Git 支持，可以看到哪些文件被修改、提交和暂存等。

![][15]

### duf：df 命令的替代品

Linux 中的 [df 命令][16] 用来检查磁盘空间。虽然它在大多数情况下都不错，但一个更简单、更好的替代方法是 [duf][17]，这是一个用 Go 编写的工具。

它提供了一个所有挂载设备的概览，这很容易理解。你还可以指定一个目录/文件名并检查该挂载点的可用空间。

通过 `duf`，你可以对输出进行排序、列出 indoe 信息，甚至将输出保存为 JSON 格式。

![][18]

### 太长不读：男人的替代品

我知道对于纯粹主义者来说，[Linux 中的手册页][19] 是不二之选。但是，手册页有时会过于详细和复杂，难以阅读和理解。

这就是 `tldr` 登场的时机。“TLDR” 是流行的互联网行话，意思是“<ruby>太长不读<rt>to long didn't read</rt></ruby>”。这就是他们创建 `tldr` 的想法。如果你觉得手册页太长而不想阅读，[tldr 通过提供命令的实际例子而将其简化了][20]。

![][21]

### Neovim：Vim 的替代品

我希望我在这里没有冒犯谁，但更好的 Vim 不是 Emacs，而是 [Neovim][22]。

几年前，作为对传统的 Vi 编辑器的改进，Vim 出现了。又是几年过去了，Neovim 提出了将 Vim 扩展为一个 IDE 的想法。

它增加了现代终端的功能，如光标样式、焦点事件、括号内粘贴等，并内置了一个终端模拟器。最重要的是，你不需要忘却 Vim 的习惯就可以开始使用 Neovim。

### 你的选择呢？

再次强调，这些替代命令还不能完全替代原来的命令，特别是如果你管理许多 Linux 系统的话。你可能无法在所有的系统上找到并安装它们。只有你可以完全控制你的 Linux 机器时，它们才是好东西。

除此以外，你是否在这个列表中找到了一些好的替代命令行工具？是哪一个呢？另外，你知道其他一些可以 “替代” 传统 UNIX 命令的工具吗？为什么不在评论区与我们分享呢？

--------------------------------------------------------------------------------

via: https://itsfoss.com/legacy-linux-commands-alternatives/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://academy.itsfoss.com/
[2]: https://itsfoss.com/download-files-from-linux-terminal/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/httpie-screenshot.jpg?resize=800%2C399&ssl=1
[4]: https://github.com/sharkdp/bat
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/bat-command-example.png?resize=656%2C450&ssl=1
[6]: https://linuxhandbook.com/find-directory-size-du-command/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2022/01/ncdu-command-example-800x448.png?resize=800%2C448&ssl=1
[8]: https://itsfoss.com/gdu/
[9]: https://linuxhandbook.com/top-command/
[10]: https://htop.dev/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2022/01/htop-example-800x453.webp?resize=800%2C453&ssl=1
[12]: https://github.com/sharkdp/fd
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/fd-command.webp?resize=800%2C514&ssl=1
[14]: https://itsfoss.com/exa/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/04_exa_all_flags.webp?resize=800%2C600&ssl=1
[16]: https://linuxhandbook.com/df-command/
[17]: https://itsfoss.com/duf-disk-usage/
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-screenshot.jpg?resize=800%2C481&ssl=1
[19]: https://itsfoss.com/linux-man-page-guide/
[20]: https://itsfoss.com/tldr-linux-man-pages-simplified/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/tldr-example-800x594.png?resize=800%2C594&ssl=1
[22]: https://neovim.io/
