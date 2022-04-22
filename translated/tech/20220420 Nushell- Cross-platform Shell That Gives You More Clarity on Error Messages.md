[#]: subject: "Nushell: Cross-platform Shell That Gives You More Clarity on Error Messages"
[#]: via: "https://itsfoss.com/nushell/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Nushell：让你更清楚地了解错误信息的跨平台 Shell
======

_**简介：** Nushell 是一个独特的 Shell，它提供易于阅读的错误信息并提供跨平台支持。在这里可以了解到更多关于它的信息。_

即使你对使用终端不感兴趣，Linux 终端也常常使一些繁重的工作变得更加轻松，并让你修复东西。因此，可以说，如果你知道自己在做什么，Linux 终端是相当强大的。

这也是事实！但是当你遇到错误时，问题就出现了。如果你没有足够的使用经验，你将不知道如何解决它。

虽然错误信息试图传达问题的最佳含义，但不是每个用户都能轻易理解修复。对于初学者来说，这通常需要进行一些研究。但是，如果错误能有更多的清晰度，用户就能更快地解决它。

不仅仅限于错误信息，例如，你在终端浏览文件时得到的输出结构，也不是最漂亮的。

![Terminal listing several files][1]

**你明白我的意思吗？**当然，当你有更多不同类型的文件时，这可能变得更加复杂。而且，你无法从基本的 ls 命令的输出中了解到文件的权限、组等。

这就是 Nushell 试图解决这个问题的地方。

### Nushell：一个默认提供用户友好输出的 Shell

![Nushell example screenshot][2]

Nushell 也被称为 Nu，它的理念和灵感来自于 [PowerShell][3]、函数式编程语言和现代 [CLI][4] 工具等项目。

让我给你举个例子，想象一下你只想列出类型与你主目录内的文件相同的输出，包括隐藏文件。那么，要实现这一点，只要输入下面的命令就可以了：

```

    ls -a | where type == 'file'

```

![Listing only files with Nushell][5]

观察一下它的语法是多么清晰和简单。现在想象一下，用 Nushell 查找进程和名称 ID，它的状态，以及 CPU 或内存消耗是多么容易。**这是它魔法的一部分！**。

它尽力为你输入的命令提供用户友好的特定组织的输出。

### Nushell 的特点

![Error messages in Nu, one of its primary highlights][6]

根据现有的官方信息，它的一些最受欢迎的功能包括：

  * **管道控制任何操作系统。**Nu 可以在 Linux、macOS 和 Windows 上工作。换句话说，作为一个灵活的跨平台 shell，具有现代感。
  * **一切都是数据。**Nu 管道使用结构化数据，所以你可以安全地选择、过滤和排序，每次都是同样的方式。
  * **强大的插件。**使用强大的插件系统，很容易扩展 Nu 的功能。
  * **容易阅读错误信息。**Nu 操作的是类型化的数据，所以它可以捕捉到其他 shell 所没有的 bug。当错误发生时，Nu 会告诉你确切的位置和原因。
  * 清晰的 IDE 支持。



你可以看看它的[官方文档][7]，以全面了解它的功能和用法。

### 在你的系统中安装 Nushell

不幸的是，如果你是一个像我一样的 Ubuntu 用户，你将找不到安装 Nushell 的 apt 仓库。但是，你可以按照它在 [GitHub][8] 上的说明，通过安装所需的依赖项来构建它。

幸运的是，有一种方法可以在任何发行版上安装它，使用 **Homebrew**。到它的官方网站去探索更多的安装选项。

[Nushell][9]

你可以参考我们关于[在 Linux 上安装和使用 Homebrew 包管理器][10]的教程。当你在 Linux 上成功设置了它，你需要输入以下命令来安装 Nushell：

```

    brew install nushell

```

![Installing nushell with Homebrew][11]

当这个过程完成后，只要输入 `nu` 就可以启动 Nushell shell。**这就完成了！**

如果你想把 Nushell 设置为你的默认 shell，你可以用命令 **chsh** 来做，但是记住，它仍然在开发中，这就是为什么我们不推荐它用于日常使用。

然而，在你决定尝试之前，你可以在其网站或 [GitHub 页面][8]上探索更多关于它的信息。

你对这个有趣的 shell 什么看法？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/nushell/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/wp-content/uploads/2022/04/Terminal-with-several-files-800x477.png
[2]: https://itsfoss.com/wp-content/uploads/2022/04/Nushell-example-800x475.jpg
[3]: https://itsfoss.com/microsoft-open-sources-powershell/
[4]: https://itsfoss.com/gui-cli-tui/
[5]: https://itsfoss.com/wp-content/uploads/2022/04/Listing-only-files-with-nushell-800x246.png
[6]: https://itsfoss.com/wp-content/uploads/2022/04/Error-messages-in-Nu-800x259.png
[7]: https://www.nushell.sh/book/
[8]: https://github.com/nushell/nushell
[9]: https://www.nushell.sh/
[10]: https://itsfoss.com/homebrew-linux/
[11]: https://itsfoss.com/wp-content/uploads/2022/04/Installing-nushell-with-brew-800x470.png
