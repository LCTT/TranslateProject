[#]: collector: (lujun9972)
[#]: translator: (FYJNEVERFOLLOWS)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14570-1.html)
[#]: subject: (8 tips for the Linux command line)
[#]: via: (https://opensource.com/article/21/1/linux-commands)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

分享 8 篇使用 Linux 命令行的技巧
======

> 要好好利用无所不能的 Linux 命令行提供的所有功能

![](https://img.linux.net.cn/data/attachment/album/202205/10/084827v23ia3wlkdirr6r5.jpg)

Linux 命令行是极其灵活的。无论你是管理服务器还是在桌面系统上启动终端窗口，都可以通过命令行无所不包的工具包来更新文件、调整系统性能或者管理进程。命令行里发生的事情是非常有趣的。

我们发布了许多关于如何充分利用系统的优秀文章，证明了命令行的流行。以下是 8 篇关于 Linux 命令阅读量最高的文章：

### 《使用这些技巧让 Bash 命令历史更加有用》

> **[文章地址][2]**

Bash 是大多数 Linux 系统上的默认命令行 Shell。Seth Kenlon 编写了该指南，用于帮助你了解 Bash 命令历史。修改 Bash 命令历史通常没有听起来那么危险，特别是当你带有目的地修改它的时候。告诉 Bash 你希望它记住什么，甚至还可以直接通过删除你不想要或不需要的条目来重写命令历史。根据需要使用你的历史会话，明智地行使你对命令历史的权力。
  
### 《如何在 Linux 终端中兼顾特性和性能》

> **[文章地址][3]**

Ricardo Gerardi 非常喜欢命令行应用程序，他花了很多时间在终端上工作。Ricardo 投入了一些时间，把命令行变成了一个令人愉快的工作环境。你可以通过了解如何自定义终端应用程序、主题和提示符，来创建一个功能丰富、易于使用系统资源的终端。

### 《放弃 Bash 转投拥有更优美配置的 fish》

> **[文章地址][4]**

Matt Broberg 最近放弃了默认的命令行解释器 —— Bash，转而支持 fish。fish 自豪地宣称自己是 “90 年代的命令行 shell”。这个以鱼为主题的 “友好的交互式 shell” 为命令行创造了更愉快的体验。阅读 Matt 的文章来进一步了解如何充分利用 fish。如果你不想再对你的终端修修补补，换一个更漂亮的默认 shell，把更多精力放在代码上，不妨试一试 fish。

### 《分析 Linux 里二进制文件的 10 种方式》

> **[文章地址][5]**

我们每天都在和二进制文件打交道，但我们对它们的了解甚少。Linux 提供了一组丰富的工具，使分析二进制文件变得轻而易举！这些简单的命令和工具可以帮助你顺利完成分析二进制文件的任务。无论你的工作角色是什么，了解这些工具的基本知识将帮助你更好地了解你的 Linux 系统。Gaurav Kamathe 介绍了一些最流行的用于管理二进制文件的 Linux 工具和命令，包括 `file`、`nm`、`strings` 和 `hexdump`。

### 《可用于 Linux 命令行的 4 种 Markdown 工具》

> **[文章地址][6]**

当涉及使用 Markdown 格式的文件时，命令行工具占据了主导地位。它们轻巧、快速、强大而又灵活，其中大多数遵循 Unix “把一件事情做好”的哲学。Scott Nesbitt 回顾了 4 种命令行实用工具，它们可以帮助你更高效地处理 Markdown 文件。

### 《禁用 atime 来提高 Linux 系统性能》

> **[文章地址][7]**

每当我在为家里的电脑升级 Linux 时，我都会把我通常要做的任务列出来。这些年来，它们已经成为了习惯：备份文件、还原系统、重新安装、恢复文件，然后重新安装额外的我最喜欢的应用程序。我还会对系统进行了一些调整。其中一个调整就是 `atime`，它是 Linux 里每个文件的三个时间戳之一。关掉 `atime` 是一种简单但有效的提升系统性能的方法。下面是关于 atime` 的介绍，以及为什么它会有影响。

### 《使用 fstrim 延长固态硬盘的寿命》

> **[文章地址][8]**

在过去的十年中，固态硬盘（SSD）带来了一种全新的管理存储的方式。相比传统的机械硬盘，固态硬盘具有一些优点，比如安静、更酷的操作和更快的接口规格。当然，新技术带来了新的维护和管理方法。Alan Formy-Duval 写了一个新的 systemd 服务让你更容易管理固态硬盘。

### 《Linux 命令行工具的 5 种新式替代品》

> **[文章地址][9]**

在我们日常使用的 Linux 或 Unix 系统中，我们会使用许多命令行工具来完成我们的工作，并帮助我们更好地了解和管理我们的系统。多年来，这些工具已经现代化并移植到了不同的系统中。然而，总的来讲，它们仍然保持着最初的想法、外观和感觉。近年来，开源社区已经开发出了提供额外好处的替代工具。Ricardo Gerardi 向我们展示了如何通过这 5 种新的替代品改进旧的命令行工具来获得新的好处。

### 总结

把这些文章作为跳板，寻找你自己关于命令行的技巧和花招吧！这份清单里还缺少什么吗？请在下方评论，或者提交一篇你自己的文章！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/linux-commands

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[FYJNEVERFOLLOWS](https://github.com/FYJNEVERFOLLOWS)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://linux.cn/article-12344-1.html
[3]: https://opensource.com/article/20/7/performance-linux-terminal
[4]: https://opensource.com/article/20/3/fish-shell
[5]: https://linux.cn/article-12187-1.html
[6]: https://linux.cn/article-12048-1.html
[7]: https://opensource.com/article/20/6/linux-noatime
[8]: https://linux.cn/article-11959-1.html
[9]: https://opensource.com/article/20/6/modern-linux-command-line-tools
