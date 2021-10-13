[#]: subject: "How to Stop a Program in Linux Terminal"
[#]: via: "https://itsfoss.com/stop-program-linux-terminal/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13783-1.html"

如何在 Linux 终端中退出一个程序
======

![](https://img.linux.net.cn/data/attachment/album/202109/14/112410p18i9dsj813i1j4p.jpg)

有趣的是，当你刚接触一些东西时，最简单的事情也会变得复杂。

有一天，我发现我的朋友搞不清楚如何退出 `top` 命令。他没有中止这个命令，而是关闭了整个终端程序。

这不仅是不必要的，而且是一件不好的事情。

### 在 Linux 里中止程序

在 Linux 中，你可以使用 `Ctrl+C` 键来中止终端中的运行程序。这对 Ubuntu 和其他 Linux 发行版都适用。

以 `ping` 命令为例。如果你不中止它，它将持续显示结果。

按住 `Ctrl` 键并同时按下 `C` 键。它向正在运行的程序发送 [SIGINT 信号][1]以强制退出该命令。

![Stopping a program in the Linux terminal][2]

你看到 `^C` 了吗？这个插入符号（`^`）代表 `Ctrl`。所以基本上，终端将 `Ctrl+C` 的按键显示为 `^C`。

`Ctrl+C` 对于那些被设计为持续运行直到被打断的命令非常有效。你觉得你需要取消命令，就用 `Ctrl+C`。

在一个更复杂的方法中，你可以 [找到进程 ID 并杀死一个正在运行的进程][3]。这是更高级的东西，只有进程在后台或由其他用户运行或在另一个终端窗口运行时使用。

除此以外，还有一些其他的命令和命令行工具也有自己的退出命令。让我在这里简单地提一下其中的一些。

#### 如何退出 Vim 编辑器

[退出 Vim 编辑器][4] 在 Linux 世界里闹出了很多笑话。当你刚接触这个强大的基于命令行的文本编辑器时，是很难搞清楚的。在几种退出 `vim` 的方法中，最常见的是按 `Esc` 键，然后输入冒号（`:`），再输入 `q!` 表示不保存而强制退出，或者 `wq` 表示保存并退出。

![][5]

#### 如何退出 Nano 编辑器

退出 [Nano 编辑器][6]比退出 Vim 要简单一些。为什么？因为 Nano 在底部有快捷方式。如果你是新手，你可能不明白，但至少你下次就能搞清楚了。

要退出 Nano，按 `Ctrl+X`。它将询问你是否要保存对文件所做的修改。你可以输入你的选择。

![][7]

#### 如何退出 less 命令

`less` 是一个奇妙的命令，它可以让你在不像 `cat` 命令那样杂乱的终端屏幕上进行查看。如果你在 `less` 命令的视图内，使用 `q` 键来退出 `less`。

#### 如何退出终端

要退出终端本身，不是关闭终端，而是使用 `Ctrl+D` 键盘快捷键或输入退出命令：

```
exit
```

这实际上是让你从当前的 shell 中退出。当你[在 Ubuntu 或其他发行版中打开一个终端][8]，它会运行默认的 shell。当你从这个 shell 退出时，终端也会结束。`Ctrl+D` 是做同样事情的快捷方式，并退出终端。

我希望你觉得这个快速教程对你有帮助。我强烈建议你学习这些 [Linux 命令技巧][9]。

有问题或建议？请在下面留下评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/stop-program-linux-terminal/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/sigterm-vs-sigkill/#what-is-sigkill
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/stop-a-program-linux-terminal.png?resize=800%2C373&ssl=1
[3]: https://itsfoss.com/how-to-find-the-process-id-of-a-program-and-kill-it-quick-tip/
[4]: https://itsfoss.com/how-to-exit-vim/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2017/05/how-to-exit-vim.png?resize=737%2C422&ssl=1
[6]: https://itsfoss.com/nano-editor-guide/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/nano-editor-save-and-exit.png?resize=799%2C503&ssl=1
[8]: https://itsfoss.com/open-terminal-ubuntu/
[9]: https://itsfoss.com/linux-command-tricks/