[#]: subject: "A guide to the Linux terminal for beginners"
[#]: via: "https://opensource.com/article/21/8/linux-terminal"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux 终端新手指南
======
学习 Linux 终端命令、参数的区别，以及如何使用它们来控制你的计算机。
![橙色背景的终端命令提示符][1]

距离我的住处几条街远的地方，有一家咖啡馆，我在每个周日都会去那里参加固定的 “<ruby>龙与地下城<rt>Dungeons & Dragons, D&D</rt><ruby>” 游戏。他们有一份菜单，前几次我去点餐时，我总是要翻看好几分钟，才能确定要点些什么。熟悉了之后，我就不用看菜单了，因为我清楚地知道他们在卖什么，也清楚地知道自己想要什么。现在点餐对我来说很简单，只要说一声“老规矩”就好了，接下来就是等待一杯咖啡、一碗薯片和烤饼被送来（通常在我们 <ruby>做出决定<rt>roll for initiative</rt></ruby>「译者注：这是 D&D 玩家的黑话，它指的是在比赛开始前掷骰子的行为」的那一刻，员工都不大方便，但这也不是他们的问题）。

与餐厅的菜单类似，计算机的图形界面也为用户提供了操作选项。这里有图标、窗口和按钮，你可以搜索你想要的东西，点击项目，拖动其他项目，操纵图形界面，直到你的任务完成。不过，一段时间后，这可能会变得繁琐，甚至是效率低下。既然你清楚地知道需要做什么，那么，如果只需告诉计算机你想要发生什么，无需耗费大量的体力和脑力来搜索项目、舞动鼠标，就能达到目的，岂不是更好吗？

### Linux 终端是什么

Linux 终端是一个基于文本的交互界面，它是用来控制 Linux 计算机的。虽然它只是帮助 Linux 用户完成任何特定任务的众多工具之一，但是它被广泛地认为是最有效的方法。除了编写代码，这无疑是最直接的方法。事实上，它是如此受欢迎，以至于苹果公司将操作系统的基础改为 Unix，从而获得了 [Bash 和 Z shell][2]，而微软公司开发了它自己的开源命令行 [PowerShell][3]。

### What is a Linux command?
### Linux 命令是什么

**<ruby>命令<rt>commands</rt></ruby>** 是一种特殊的关键词，你可以在终端中使用它，告诉计算机去执行一个动作。大多数命令是很小的应用程序，它们与你的操作系统的其他部分一起安装。你可能没有意识到它们的存在，因为它们通常被保存在相对模糊的目录中，如 `/bin`、`/sbin`、`/usr/bin` 和 `/usr/sbin`，但你的终端知道在哪里可以找到它们（多亏了一个叫 [PATH][4] 的东西）。其他的命令是内置在终端中的。你不必担心一个命令是安装的还是内置的，无论是哪一种，终端都能执行。更棒的是，在大多数 Linux 发行版上，当终端找不到一个命令时，它会在互联网上搜索提供该命令的软件包，然后会主动为你提供安装软件包、运行该命令的服务。

下面是一个简单的命令：

```shell
$ ls
```

`ls` 命令是 "list" 的缩写，它会列出当前目录的内容。试一试吧！先打开一个终端窗口，然后打开一个文件管理器窗口（Linux 上叫 “<ruby>文件<rt>Files</rt></ruby>”，macOS 上叫 “<ruby>访达<rt>Finder</rt></ruby>”，Windows 上叫 “<ruby>资源管理器<rt>Windows Explorer</rt><ruby>”）。比较一下这两个窗口，它们是同一数据的两种不同表现方式。

### Linux 命令中的参数是什么

**<ruby>参数<rt>argument</rt></ruby>** 是命令中的任意一个“不是命令本身”的部分。例如，要列出一个特定目录的内容，你可以提供该目录的名称作为参数。

```shell
$ ls Documents
```

在这个例子中，`ls` 是命令，`Documents` 是参数。该命令将列出 `Documents` 目录的内容。

### Linux 命令中的选项是什么

命令的 **<ruby>选项<rt>options</rt></ruby>**，也叫 **<ruby>标志<rt>flags</rt></ruby>** 或 **<ruby>开关<rt>switches</rt></ruby>**，它是命令参数的一部分。命令参数是跟在命令后面的任何东西，而选项通常（但不总是）用<ruby>一个连接号<rt>-</rt></ruby>或<ruby>两个连接号<rt>--</rt></ruby>来划分。请看下面这个例子：


```shell
$ ls --classify Documents
```

在这个例子中，`--classify` 是一个选项。它也有一个简短的版本，因为终端用户更喜欢少打点字来提高效率。

```shell
$ ls -F Documents
```

短的选项通常可以合并。下面是一个 `ls` 命令，它将 `-l` 选项与 `--human-readable`、`--classify` 和 `--ignore-backups` 选项结合了起来：

```shell
$ ls -lhFB
```

一些选项本身可以带参数。例如，`ls` 的 `--format` 选项可以让你改变信息的呈现方式。默认情况下，目录的内容是以列的形式提供给你的，但如果你需要它们显示为逗号分隔的列表，你可以把 `--format` 设置为 `comma`。

```shell
$ ls --format=comma Documents
alluvial, android-info.txt, arduinoIntro, dmschema,
headers.snippet, twine, workshop.odt
```

等于号（`=`）是可选的，所以这样做也可以:

```shell
$ ls --format comma Documents
alluvial, android-info.txt, arduinoIntro, dmschema,
headers.snippet, twine, workshop.odt
```

### 学习使用 Linux 终端

学习如何使用终端可以提高工作效率和生产力，同时也可以使计算变得非常有趣。当我运行一个精心设计的命令时，我常常会坐下来，为我在空白屏幕上输入几个字就能实现的事情而惊叹。终端可是和很多东西相关 —— 编程、诗歌、拼图和实用主义，但无论你如何看待，它都是一个值得学习的持续创新。

  * [使用 Linux 终端查看你的计算机上有哪些文件][5]
  * [如何在 Linux 终端中打开和关闭目录][6]
  * [在 Linux 终端中进行导航][7]
  * [在 Linux 终端中移动一个文件][8]
  * [在 Linux 终端中重命名一个文件][9]
  * [在 Linux 终端中复制文件和文件夹][10]
  * [在 Linux 终端中删除文件和文件夹][11]

在阅读和练习了这些文章中的课程后，你可以下载我们的免费电子书 [系统管理员的 Bash 脚本指南][12]，在终端中获得更多乐趣。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://opensource.com/business/16/3/top-linux-shells
[3]: https://opensource.com/article/18/2/powershell-people
[4]: https://opensource.com/article/17/6/set-path-linux
[5]: https://opensource.com/article/21/7/linux-terminal-basics-see-what-files-are-your-computer
[6]: https://opensource.com/article/21/7/linux-terminal-basics-opening-and-closing-directories
[7]: https://opensource.com/article/21/7/terminal-basics-moving-around-your-computer
[8]: https://opensource.com/article/21/7/terminal-basics-moving-files-linux-terminal
[9]: https://opensource.com/article/21/7/terminal-basics-rename-file-linux-terminal
[10]: https://opensource.com/article/21/7/terminal-basics-copying-files-linux-terminal
[11]: https://opensource.com/article/21/7/terminal-basics-removing-files-and-folders-linux-terminal
[12]: https://opensource.com/downloads/bash-scripting-ebook