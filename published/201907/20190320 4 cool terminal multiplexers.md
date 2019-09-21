[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11054-1.html)
[#]: subject: (4 cool terminal multiplexers)
[#]: via: (https://fedoramagazine.org/4-cool-terminal-multiplexers/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

4 款很酷的终端复用器
======

![][1]

Fedora 系统对很多用户来说都很舒适。它有一个令人惊叹的桌面，可以轻松地完成日常任务。而在这光鲜的表面之下是由 Linux 系统提供的支持，而终端是高级用户使用这些底层能力的最简单方法。默认的终端简单且功能有限。但是，*终端复用器*能让你的终端变得非常强大。本文展示了一些流行的终端多路复用器以及如何安装它们。

为什么要用它？嗯，首先，它可以让你注销你的系统，而同时*让你的终端会话不受干扰*。退出你的控制台，这样安全，在其他地方旅行时通过远程登录 SSH 继续之前的操作是非常有用的。这里有一些工具可以看下。

最古老和最知名的终端多路复用器之一是 `screen`。但是，由于其代码不再维护，本文将重点介绍最近的应用。 （“最近的”是相对而言的，其中一些已存在多年！）

### Tmux

`tmux` 是 `screen` 最广泛使用的替代品之一。它有高度可配置的接口。你可以根据需要对 `tmux` 进行编程以启动特定类型的会话。在前面发表的这篇文章中你会发现更多关于 tmux 的信息：

- [使用 tmux 实现更强大的终端][2]

已经是 `tmux` 用户？你可能会喜欢[这篇使你的 tmux 会话更有效的文章][3]。

要安装 `tmux`，由于你可能已经在终端中，请带上 `sudo` 使用 `dnf`：

```
$ sudo dnf install tmux
```

要开始学习，请运行 `tmux` 命令。单窗格窗口以你的默认 shell 启动。tmux 使用*修饰键*来表示接下来会发出命令。默认情况下，此键为 `Ctrl+B`。如果输入 `Ctrl+B, C`，你将创建一个带有 shell 的新窗口。

提示：使用 `Ctrl+B, ?` 进入帮助模式，会列出你可以使用的所有键。为了简单起见，你先查看 `bind-key -T prefix` 开头的行。这些是你可以在修饰键之后立即使用的键，可以用来配置你的 `tmux` 会话。你可以按 `Ctrl+C` 退出帮助模式回 `tmux`。

要完全退出 `tmux`，请使用标准 `exit` 命令或 `Ctrl+D` 退出所有 shell。

### Dvtm

你可能最近在 Fedroa Magzine 上看到过一篇 [dwm，一个动态窗口管理器][4]的文章。像 `dwm` 一样，`dvtm` 用于平铺窗口管理，但是是用在终端中。它的设计坚持 UNIX 的“做好一件事”的理念，在这里是管理终端中的窗口。

安装 `dvtm` 也很简单。但是，如果你想要前面提到的注销功能，你还需要 `abduco` 包来处理 dvtm 的会话管理。

```
$ sudo dnf install dvtm abduco
```

`dvtm` 已经映射了许多管理终端窗口的按键。默认情况下，它使用 `Ctrl+G` 作为其修饰键。这个按键告诉 `dvtm` 接下来的字符将成为它应该处理的命令。例如， `Ctrl+G, C` 创建一个新窗口，`Ctrl+G, X` 将其关闭。

有关使用 `dvtm` 的更多信息，请查看 `dvtm` 的[主页][5]，其中包含大量提示和入门信息。

### Byobu

虽然 `byobu` 本身并不是真正的多路复用器 —— 它封装了 `tmux` 甚至更老的 `screen` 来添加功能，但它也值得在这里一提。通过帮助菜单和窗口选项卡，以便更加容易地找到那些功能，`byobu` 使终端复用器更适合初学者。

当然它也可以在 Fedora 仓库中找到。要安装它，请使用以下命令：

```
$ sudo dnf install byobu
```

默认情况下，`byobu` 会在内部运行 `screen`，因此你可能希望运行 `byobu-tmux` 来封装 `tmux`。你可以使用 `F9` 键打开帮助菜单以获取更多信息，来帮助你入门。

### Mtm

`mtm` 是你可以找到的最小的复用器之一。事实上，它只有大约 1000 行代码！如果你处于受限的环境（例如旧硬件、最小容器等）中，你可能会发现它很有用。要开始使用，你需要安装一些包。

```
$ sudo dnf install git ncurses-devel make gcc
```

然后克隆 `mtm` 所在的仓库：

```
$ git clone https://github.com/deadpixi/mtm.git
```

进入 `mtm` 文件夹并构建程序：

```
$ make
```

你可能会收到一些警告，但完成后，你将会有一个非常小的 `mtm` 程序。使用以下命令运行它：

```
$ ./mtm
```

你可以在 [GitHub 页面][6]上找到该程序的所有文档。

这里只是一些终端复用器。你有想推荐的么？请在下面留下你的评论，享受在终端中创建窗口吧！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-terminal-multiplexers/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/08/tmuxers-4-816x345.jpg
[2]: https://fedoramagazine.org/use-tmux-more-powerful-terminal/
[3]: https://fedoramagazine.org/4-tips-better-tmux-sessions/
[4]: https://fedoramagazine.org/lets-try-dwm-dynamic-window-manger/
[5]: http://www.brain-dump.org/projects/dvtm/#why
[6]: https://github.com/deadpixi/mtm
[7]: https://unsplash.com/photos/48yI_ZyzuLo?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/windows?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
