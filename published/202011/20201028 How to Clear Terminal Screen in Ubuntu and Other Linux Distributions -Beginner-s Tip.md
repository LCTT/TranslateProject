[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12806-1.html)
[#]: subject: (How to Clear Terminal Screen in Ubuntu and Other Linux Distributions [Beginner’s Tip])
[#]: via: (https://itsfoss.com/clear-terminal-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何清除 Ubuntu 和其他 Linux 发行版的终端屏幕
======

![][2]

在终端上工作时，通常会发现终端屏幕上显示了太多的命令及其输出。

你可能需要清除终端屏幕并专注于要执行的下一个任务。相信我，清除 Linux 终端屏幕会很有帮助。

### 使用 clear 命令清除 Linux 终端

那么，如何清除 Linux 中的终端？最简单，最常见的方法是使用 `clear` 命令：

```
clear
```

`clear` 命令无需选项。就是这么简单，但是你还需要了解其他一些内容。

![][1]

`clear` 命令和其他清除屏幕的方法可能取决于你使用的终端模拟器。终端模拟器是用于访问 Linux Shell（命令行）的终端应用。

如果你在带有 GNOME 终端的 Ubuntu 上使用 `clear` 命令，它将清除屏幕，并且你将无法看到之前屏幕上的内容。

在许多其他终端模拟器或 Putty 中，它可能只清除一页屏幕。如果使用鼠标或 `PageUp` 和 `PageDown` 键滚动，那么仍然可以看到以前的屏幕输出。

坦白说，这取决于你的需要。如果你突然意识到需要引用以前运行的命令的输出，那么也许可以使用该方式。

### 在 Linux 中清除终端屏幕的其他方法

`clear` 命令不是清除终端屏幕的唯一方法。

你可以在 Linux 中使用 `Ctrl+L` [键盘快捷键][3]来清除屏幕。它适用于大多数终端模拟器。

```
Ctrl+L
```

如果你在 GNOME 终端（Ubuntu 中默认）中使用 `Ctrl+L` 和 `clear` 命令，那么你会注意到它们的影响有所不同。`Ctrl+L` 将屏幕向下移动一页，给人一种干净的错觉，但是你仍然可以通过向上滚动来访问命令输出历史。

**某些其他终端模拟器将此键盘快捷键设置为 `Ctrl+Shift+K`**。

你也可以使用 `reset` 命令清除终端屏幕。实际上，此命令执行完整的终端重新初始化。但是，它可能比 `clear` 命令要花费更长的时间。

```
reset
```

当你想完全清除屏幕时，还有几种其他复杂的方法可以清除屏幕。但是由于命令有点复杂，所以最好将它作为 [Linux 中的别名][4]：

```
alias cls='printf "\033c"'
```

你可以将此别名添加到你的 bash 配置文件中，以便作为命令使用。

我知道这是一个非常基本的主题，大多数 Linux 用户可能已经知道了，但这对于为新 Linux 用户介绍基本主题并没有什么坏处。是不是？

在清除终端屏幕上有些秘密提示​​吗？为什么不与我们分享呢？

--------------------------------------------------------------------------------

via: https://itsfoss.com/clear-terminal-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/clear-command-linux.gif?resize=800%2C432&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/clear-terminal-screen-linux.png?resize=800%2C450&ssl=1
[3]: https://linuxhandbook.com/linux-shortcuts/
[4]: https://linuxhandbook.com/linux-alias-command/
