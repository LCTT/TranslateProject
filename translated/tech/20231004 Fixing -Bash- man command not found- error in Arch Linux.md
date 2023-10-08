[#]: subject: "Fixing 'Bash: man command not found' error in Arch Linux"
[#]: via: "https://itsfoss.com/man-command-not-found/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

修复 Arch Linux 中的 “Bash: man command not found” 错误
======

多年后，我再次尝试 Arch Linux。我忘记了 [pacman 命令的用法][1]，所以我尝试访问它的手册页。

接下来发生的事情让我震惊（是的！我一直在阅读 BuzzFeed 😜）。它向我展示了这个错误：

**bash: man: command not found**

当然，这不仅是 pacman，所有命令都是这样。

![][2]

这让我感到困惑，因为我以前从未遇到过无法使用 man 命令的情况。

如果你发现自己处于找不到 man 命令的类似情况，我向你保证，修复很简单：

   * 安装 `man-db` 包（安装手册页）
   * 更新 `mandb` 缓存（用于索引所有命令的手册页）



让我们更详细地看看它。

### 在 Linux 中安装手册页

我从未想过我必须明确安装手册页。但是 [Arch Linux][3] 将你带入未知领域。这在某种程度上是件好事，因为你会发现以前从未遇到过的事情。

**这里的关键是安装手册页的包名为 `man-db`**。这对我来说也是一个发现。

你可以使用发行版的包管理器来安装它。

[对于 Arch 和 Manjaro][4]，使用：

````

     sudo pacman -S man-db

````

![][5]

对于 Ubuntu 和 Debian，请使用：

````

     sudo apt install man-db

````

对于 Fedora，请使用：

````

     sudo dnf install man-db

````

对于 Red Hat Linux，请使用：

````

     sudo yum install man-db

````

**你明白了要点**。为手册页构建缓存也是明智的一步。

### 构建手册页缓存

要刷新或构建手册页缓存，请运行 [mandb 命令][6]：

````

     sudo mandb

````

它将在不同位置查找手册页并构建缓存，以便你可以快速访问手册页。

![][7]

完成后，我就可以像往常一样使用 man 命令。

＃＃＃ 结论

这确实让我感到震惊，因为我一直认为手册页是 Linux 的核心部分。从未想过我必须安装它们。

我应该将其添加到[安装 Arch Linux 后要做的事情列表][8]吗？ 我还没有把握。

也许我是在 Arch 中遇到这个缺少 man 命令问题的极少数用户之一。也许不是。如果你遇到过这样的“意外错误”，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/man-command-not-found/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/pacman-command/
[2]: https://itsfoss.com/content/images/2023/10/bash-man-command-not-found-error.png
[3]: https://archlinux.org/
[4]: https://itsfoss.com/manjaro-vs-arch-linux/
[5]: https://itsfoss.com/content/images/2023/10/installing-man-command-arch-linux.png
[6]: https://www.man7.org/linux/man-pages/man8/mandb.8.html
[7]: https://itsfoss.com/content/images/2023/10/updating-man-command-database-linux.png
[8]: https://itsfoss.com/things-to-do-after-installing-arch-linux/
