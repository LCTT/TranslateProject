[#]: subject: "Folder or Directory? Here’s Why Folders are Called Directories in Linux"
[#]: via: "https://itsfoss.com/folder-directory-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14137-1.html"

为什么在 Linux 中“文件夹”被称为“目录”？
======

如果你最开始使用的是 Windows 电脑，你很可能会使用“<ruby>文件夹<rt>folder</rt></ruby>”这个术语。

但当你换到 Linux 时，你会发现文件夹通常被称为“<ruby>目录<rt>directory</rt></ruby>”。

这可能使一些新的 Linux 用户感到困惑。你应该叫它文件夹还是目录？它们有区别吗？

事情是这样的。如果你愿意，你可以叫它文件夹，如果你喜欢，也可以叫它目录。这没有什么区别。

但是，如果你想知道为什么文件夹在 Linux 中被称为目录，这里有一些解释。

### 为什么在 Linux 中文件夹被称为目录？

在我解释之前，让我们回顾一下文件夹和目录在现实世界中的用途。

在现实中，文件夹（封套）可以用来保存几个文件（或其他项目）。而目录则可以用来维护项目的索引，这样你就可以找到哪个项目位于哪里。

![文件夹和目录的示意][1]

现在，让我们回到目录。这个词甚至在 Linux 存在之前就已经存在了。它来自 UNIX 时代。Linux 继承了 UNIX 的很多东西，这只是其中的一个。

现在让我告诉你一些可能让你吃惊的事情。目录并不是真的把文件放在里面。目录是一个“特殊的文件”，它知道文件在存储中的位置（通过 [inode][2]）。

这就说明了为什么它被称为目录。目录用来保存项目的索引，而不用保存项目本身。Linux 和 UNIX 中的目录并不保存它里面的文件。它们只是记录文件位置的信息。

如果你想了解更多关于它的信息，我这篇关于 [硬链接][3] 的文章应该可以帮助你。

那么，为什么它被称为文件夹呢？依我看，这是视角的原因。当你在一个图形环境中时，你会将事物可视化。在这里，文件可以像页面一样被可视化，这些文件页面被存储在一个封套（文件夹）中。

当操作系统开始使用图形元素时，我认为一些术语也相应地发生了变化，目录 -> 文件夹就是其中之一。

### 你应该叫它文件夹还是目录？

这完全取决于你。你可以按你的习惯使用这两个术语。

然而，如果你正在学习 Linux 命令行或经常使用它，使用目录这个术语可能会有一点帮助。

有一些 Linux 命令，如 `mkdir`、`rmdir` 等，术语 “dir” 给出了一个提示，即这些命令与目录有关。

同样，许多 Linux 命令和 bash 脚本会使用选项 `-d` 表示目录，`-f` 表示文件。

甚至终端中的文件属性也会通过在目录前面加上字母 “d” 来区分文件和文件夹（目录）。

拿这个例子来说，我有一个名为 `some` 的文件和一个名为 `something` 的文件夹/目录。请注意各种 Linux 命令是如何用 “dir” 或 “d” 来区分文件和目录的。

![显示文件和目录操作之间区别的例子][4]

所有这些让我觉得，在使用 Linux 命令时，使用 “目录” 这个术语会有好处。你的潜意识会更容易将 “dir” 和 “d” 与目录联系起来。

再说一次，你想叫它文件夹或目录这完全取决于你。人们会明白你指的是什么。

我刚刚对目录一词的历史渊源做了一些分析，这应该会给你一些提示，为什么人们说 “在 Linux/UNIX 中，所有东西都是一个文件”。

现在我结束了我的胡言乱语，我请你对它进行评论。如果你发现任何技术上的不准确之处，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/folder-directory-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/folder-directory.png?resize=800%2C450&ssl=1
[2]: https://linuxhandbook.com/inode-linux/
[3]: https://linuxhandbook.com/hard-link/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/file-directory-commands-difference.png?resize=800%2C378&ssl=1
