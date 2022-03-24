[#]: subject: "Xonsh Shell Combines the Best of Bash Shell and Python in Linux Terminal"
[#]: via: "https://itsfoss.com/xonsh-shell/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14390-1.html"

Xnosh Shell：在 Linux 终端结合 Bash Shell 和 Python 的最佳特性
======

![](https://img.linux.net.cn/data/attachment/album/202203/24/111824ufw1815lyvclnsr2.jpg)

最受欢迎的 shell 是什么？我猜你会回答 bash 或者 zsh，没错，的确如此。

UNIX 和 Linux 系统上有许多可用的 shell，包括 Bash、Ksh、Zsh、Fish 等等。

最近，我碰到了另外一个 shell，它结合了 Python 和 bash，还蛮特别的。

### Xonsh shell，为喜爱 Python 的 Linux 用户而打造 

[Xonsh][1] 是一个使用 Python 编写的跨平台 shell 语言和命令提示符。

它结合了 Python 和 Bash shell，因此你可以在这个 shell 中直接运行 Python 命令（语句）。你甚至可以把 Python 命令和 shell 命令混合起来使用。

![][2]

听起来不错吧？如果你是一个 Python 程序员的话，你应该会更加兴奋。

### 在 Linux 上安装 Xonsh shell

有多种方式可以在 Linux 系统上安装 Xonsh shell。

你可以使用软件包管理器安装它（主要的 Linux 发行版的仓库中都有 Xonsh shell）。

在 Ubuntu 和 Debian 上，你可以尝试运行：

```
sudo apt install xonsh
```

因为它本质上是一个 Python 应用，所以你总是可以使用 Pip 来安装（如果你的系统已经安装了的话）。或者，你也可以使用 Conda 来安装 Xonsh。同时，它还提供了 AppImage 格式和 Docker 镜像。

你可以自由选择你喜欢的安装方式。

### Xonsh shell 初体验

如果你不熟悉 Linux 的“多 shell”概念和终端的相关知识，我推荐你阅读 [我写的一篇终端入门的文章][3]。这篇文章会帮助 Linux 新手弄清楚很多东西。

我在这里简单介绍一下。你的终端运行着一个默认的 shell（通常是 bash shell）。如果你在系统上安装了其他的 shell，你可以 [轻松地切换这些 shell][4]。

要进入 Xonsh shell，只需运行一条命令：

```
xonsh
```

![][5]

它会建议你运行一个设置向导，然后创建一个 Xonsh shell 的自定义 `rc` 配置文件。这是可选的，你也可以晚些时候再做。

一旦你开始使用它，你就立刻会感觉到一些不同。

当你开始输入一条命令时，Xonsh 会自动建议历史记录中的最后一条匹配命令。你可以按下右箭头键确认使用这条自动建议的命令。你也可以按下上、下箭头键来选择历史记录中的其他匹配命令。

![Xonsh shell automatically suggests last matching command from the history as you type][6]

不仅如此，它还支持交互式的 Tab 补全。当你开始输入命令，并按下 `tab` 键，它会显示一个类似于下拉式的交互式菜单。你可以在这个菜单中选择可用的命令。

![Tab completion in Xonsh shell][7]

你可以混合使用 Python 和 bash 命令，并且直接在 shell 中运行它们。

如果你对 [终端定制][8] 感兴趣，你可以花点时间和精力，根据自己的喜好来定制 Tab 补全、按键绑定和颜色样式。

它同时拥有一个叫做 [Xontrib][9] 的用户自定义插件系统，你可以使用这些插件来扩展 Xonsh shell 的功能。

如果你是一个终端爱好者，并渴望学习更多终端知识，你可以浏览它的 [丰富的文档系统][10]。

### 最后

大多数用户坚持使用默认的 Bash shell，这很正常。有一些开发者和系统管理员会选择使用 Zsh，因为它有很多附加特性。而 Xonsh 完全聚焦在 Python 上，对于 Python 使用者来说，它或许具有吸引力。对于其余的人来说，Bash 已经足够好了。

你使用过 Xonsh 或者其他的 shell 吗？你用它来代替 Bash 的原因是什么呢？欢迎在评论区留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/xonsh-shell/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://xon.sh/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xonsh-shell-combines-python-bash.png?resize=800%2C470&ssl=1
[3]: https://itsfoss.com/basic-terminal-tips-ubuntu/
[4]: https://linuxhandbook.com/change-shell-linux/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xonsh-shell.png?resize=800%2C451&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/auto-suggestions-from-history-in-xonsh-shell.png?resize=800%2C258&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/tab-completion-xonsh-shell.png?resize=800%2C354&ssl=1
[8]: https://itsfoss.com/customize-linux-terminal/
[9]: https://github.com/topics/xontrib
[10]: https://xon.sh/tutorial.html
