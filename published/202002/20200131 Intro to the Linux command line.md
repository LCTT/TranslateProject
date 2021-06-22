[#]: collector: (lujun9972)
[#]: translator: (qianmingtian)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11864-1.html)
[#]: subject: (Intro to the Linux command line)
[#]: via: (https://www.networkworld.com/article/3518440/intro-to-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Linux 命令行简介
======

> 下面是一些针对刚开始使用 Linux 命令行的人的热身练习。警告：它可能会上瘾。

![](https://images.idgesg.net/images/article/2020/01/cmd_linux-control_linux-logo_-100828420-large.jpg)

如果你是 Linux 新手，或者从来没有花时间研究过命令行，你可能不会理解为什么这么多 Linux 爱好者坐在舒适的桌面前兴奋地输入命令来使用大量工具和应用。在这篇文章中，我们将快速浏览一下命令行的奇妙之处，看看能否让你着迷。

首先，要使用命令行，你必须打开一个命令工具（也称为“命令提示符”）。如何做到这一点将取决于你运行的 Linux 版本。例如，在 RedHat 上，你可能会在屏幕顶部看到一个 “Activities” 选项卡，它将打开一个选项列表和一个用于输入命令的小窗口（类似 “cmd” 为你打开的窗口）。在 Ubuntu 和其他一些版本中，你可能会在屏幕左侧看到一个小的终端图标。在许多系统上，你可以同时按 `Ctrl+Alt+t` 键打开命令窗口。

如果你使用 PuTTY 之类的工具登录 Linux 系统，你会发现自己已经处于命令行界面。

一旦你得到你的命令行窗口，你会发现自己坐在一个提示符面前。它可能只是一个 `$` 或者像 `user@system:~$` 这样的东西，但它意味着系统已经准备好为你运行命令了。

一旦你走到这一步，就应该开始输入命令了。下面是一些要首先尝试的命令，以及这里是一些特别有用的命令的 [PDF][4] 和适合打印和做成卡片的双面命令手册。


| 命令 |  用途 |
|---|---|
| `pwd` | 显示我在文件系统中的位置（在最初进入系统时运行将显示主目录） |
| `ls` | 列出我的文件 |
| `ls -a` | 列出我更多的文件（包括隐藏文件） |
| `ls -al` | 列出我的文件，并且包含很多详细信息（包括日期、文件大小和权限） |
| `who` | 告诉我谁登录了（如果只有你，不要失望） |
| `date` | 日期提醒我今天是星期几（也显示时间） |
| `ps` | 列出我正在运行的进程（可能只是你的 shell 和 `ps` 命令） |

一旦你从命令行角度习惯了 Linux 主目录之后，就可以开始探索了。也许你会准备好使用以下命令在文件系统中闲逛：

| 命令 |  用途 |
|---|---| 
| `cd /tmp` | 移动到其他文件夹（本例中，打开 `/tmp` 文件夹） |
| `ls` | 列出当前位置的文件 |
| `cd` | 回到主目录（不带参数的 `cd` 总是能将你带回到主目录） |
| `cat .bashrc` | 显示文件的内容（本例中显示 `.bashrc` 文件的内容） |
| `history` | 显示最近执行的命令 |
| `echo hello` | 跟自己说 “hello” |
| `cal` | 显示当前月份的日历 |

要了解为什么高级 Linux 用户如此喜欢命令行，你将需要尝试其他一些功能，例如重定向和管道。“重定向”是当你获取命令的输出并将其放到文件中而不是在屏幕上显示时。“管道”是指你将一个命令的输出发送给另一条将以某种方式对其进行操作的命令。这是可以尝试的命令：

| 命令 |  用途 |
|---|---|                                                           
| `echo "echo hello" > tryme` | 创建一个新的文件并将 “echo hello” 写入该文件 |
| `chmod 700 tryme` | 使新建的文件可执行 |
| `tryme` | 运行新文件（它应当运行文件中包含的命令并且显示 “hello” ）|
| `ps aux` | 显示所有运行中的程序 |
| `ps aux | grep $USER` | 显示所有运行中的程序，但是限制输出的内容包含你的用户名 |
| `echo $USER` | 使用环境变量显示你的用户名 |
| `whoami` | 使用命令显示你的用户名 |
| `who | wc -l` | 计数所有当前登录的用户数目 |

### 总结

一旦你习惯了基本命令，就可以探索其他命令并尝试编写脚本。 你可能会发现 Linux 比你想象的要强大并且好用得多.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3518440/intro-to-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[qianmingtian][c]
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[c]: https://github.com/qianmingtian
[1]: https://commons.wikimedia.org/wiki/File:Tux.svg
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.networkworld.com/article/3391029/must-know-linux-commands.html
[5]: https://www.networkworld.com/newsletters/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
