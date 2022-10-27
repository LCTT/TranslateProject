[#]: subject: (Set your path in FreeDOS)
[#]: via: (https://opensource.com/article/21/2/path-freedos)
[#]: author: (Kevin O'Brien https://opensource.com/users/ahuka)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13218-1.html)

在 FreeDOS 中设置你的路径
======

> 学习 FreeDOS 路径的知识，如何设置它，并且如何使用它。

![查看职业生涯地图][1]

你在开源 [FreeDOS][2] 操作系统中所做的一切工作都是通过命令行完成的。命令行以一个 _提示符_ 开始，这是计算机说法的方式，“我准备好了。请给我一些事情来做。”你可以配置你的提示符的外观，但是默认情况下，它是：

```
C:\>
```

从命令行中，你可以做两件事：运行一个内部命令或运行一个程序。外部命令是在你的 `FDOS` 目录中可找到的以单独文件形式存在的程序，以便运行程序包括运行外部命令。它也意味着你可以使用你的计算机运行应用程序软件来做一些东西。你也可以运行一个批处理文件，但是在这种情况下，你所做的全部工作就变成了运行批处理文件中所列出的一系列命令或程序。

### 可执行应用程序文件

FreeDOS 可以运行三种类型的应用程序文件：

  1. **COM** 是一个用机器语言写的，且小于 64 KB 的文件。
  2. **EXE** 也是一个用机器语言写的文件，但是它可以大于 64 KB 。此外，在 EXE 文件的开头部分有信息，用于告诉 DOS 系统该文件是什么类型的以及如何加载和运行。
  3. **BAT** 是一个使用文本编辑器以 ASCII 文本格式编写的 _批处理文件_ ，其中包含以批处理模式执行的 FreeDOS 命令。这意味着每个命令都会按顺序执行到文件的结尾。

如果你所输入的一个文件名称不能被 FreeDOS 识别为一个内部命令或一个程序，你将收到一个错误消息 “Bad command or filename” 。如果你看到这个错误，它意味着会是下面三种情况中的其中一种：

  1. 由于某些原因，你所给予的名称是错误的。你可能拼错了文件名称，或者你可能正在使用错误的命令名称。检查名称和拼写，并再次尝试。
  2. 可能你正在尝试运行的程序并没有安装在计算机上。请确认它已经安装了。
  3. 文件确实存在，但是 FreeDOS 不知道在哪里可以找到它。

在清单上的最后一项就是这篇文章的主题，它被称为路径。如果你已经习惯于使用 Linux 或 Unix ，你可能已经理解 [PATH 变量][3] 的概念。如果你是命令行的新手，那么路径是一个非常重要的足以让你舒适的东西。

### 路径

当你输入一个可执行应用程序文件的名称时，FreeDOS 必须能找到它。FreeDOS 会在一个具体指定的位置层次结构中查找文件：

  1. 首先，它查找当前驱动器的活动目录（称为 _工作目录_）。如果你正在目录 `C:\FDOS` 中，接着，你输入名称 `FOOBAR.EXE`，FreeDOS 将在 `C:\FDOS` 中查找带有这个名称的文件。你甚至不需要输入完整的名称。如果你输入 `FOOBAR` ，FreeDOS 将查找任何带有这个名称的可执行文件，不管它是 `FOOBAR.EXE`，`FOOBAR.COM`，或 `FOOBAR.BAT`。只要 FreeDOS 能找到一个匹配该名称的文件，它就会运行该可执行文件。
  2. 如果 FreeDOS 不能找到你所输入名称的文件，它将查询被称为 `PATH` 的一些东西。每当 DOS 不能在当前活动命令中找到文件时，会指示 DOS 检查这个列表中目录。

你可以随时使用 `path` 命令来查看你的计算机的路径。只需要在 FreeDOS 提示符中输入 `path` ，FreeDOS 就会返回你的路径设置：

```
C:\>path
PATH=C:\FDOS\BIN
```

第一行是提示符和命令，第二行是计算机返回的东西。你可以看到 DOS 第一个查看的位置就是位于 `C` 驱动器上的 `FDOS\BIN`。如果你想更改你的路径，你可以输入一个 `path` 命令以及你想使用的新路径：

```
C:\>path=C:\HOME\BIN;C:\FDOS\BIN
```

在这个示例中，我设置我的路径到我个人的 `BIN` 文件夹，我把它放在一个叫 `HOME` 的自定义目录中，然后再设置为 `FDOS/BIN`。现在，当你检查你的路径时：

```
C:\>path
PATH=C:\HOME\BIN;C:\FDOS\BIN
```

路径设置是按所列目录的顺序处理的。

你可能会注意到有一些字符是小写的，有一些字符是大写的。你使用哪一种都真的不重要。FreeDOS 是不区分大小写的，并且把所有的东西都作为大写字母对待。在内部，FreeDOS 使用的全是大写字母，这就是为什么你看到来自你命令的输出都是大写字母的原因。如果你以小写字母的形式输入命令和文件名称，在一个转换器将自动转换它们为大写字母后，它们将被执行。

输入一个新的路径来替换先前设置的路径。

### autoexec.bat 文件

你可能遇到的下一个问题的是 FreeDOS 默认使用的第一个路径来自何处。这与其它一些重要的设置一起定义在你的 `C` 驱动器的根目录下的 `AUTOEXEC.BAT` 文件中。这是一个批处理文件，它在你启动 FreeDOS 时会自动执行（由此得名）。你可以使用 FreeDOS 程序 `EDIT` 来编辑这个文件。为查看或编辑这个文件的内容，输入下面的命令：

```
C:\>edit autoexec.bat
```

这一行出现在顶部附近：

```
SET PATH=%dosdir%\BIN
```

这一行定义默认路径的值。

在你查看 `AUTOEXEC.BAT` 后，你可以通过依次按下面的按键来退出 EDIT 应用程序：

  1. `Alt`
  2. `f`
  3. `x`

你也可以使用键盘快捷键 `Alt+X`。

### 使用完整的路径

如果你在你的路径中忘记包含 `C:\FDOS\BIN` ，那么你将不能快速访问存储在这里的任何应用程序，因为 FreeDOS 不知道从哪里找到它们。例如，假设我设置我的路径到我个人应用程序集合：

```
C:\>path=C:\HOME\BIN
```

内置在命令行中应用程序仍然能正常工作：

```
C:\cd HOME
C:\HOME>dir
ARTICLES
BIN
CHEATSHEETS
GAMES
DND
```

不过，外部的命令将不能运行：

```
C:HOME\ARTICLES>BZIP2 -c example.txt
Bad command or filename - "BZIP2"
```

通过提供命令的一个 _完整路径_ ，你可以总是执行一个在你的系统上且不在你的路径中的命令：

```
C:HOME\ARTICLES>C:\FDOS\BIN\BZIP2 -c example.txt
C:HOME\ARTICLES>DIR
example.txb
```

你可以使用同样的方法从外部介质或其它目录执行应用程序。

### FreeDOS 路径

通常情况下，你很可能希望在路径中保留 `C:\PDOS\BIN` ，因为它包含所有使用 FreeDOS 分发的默认应用程序。

除非你更改 `AUTOEXEC.BAT` 中的路径，否则将在重新启动后恢复默认路径。

现在，你知道如何在 FreeDOS 中管理你的路径，你能够以最适合你的方式了执行命令和维护你的工作环境。

_致谢 [DOS 课程 5: 路径][4] (在 CC BY-SA 4.0 协议下发布) 为本文提供的一些信息。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/path-freedos

作者：[Kevin O'Brien][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ahuka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/career_journey_road_gps_path_map_520.png?itok=PpL6jJgY (Looking at a map for career journey)
[2]: https://www.freedos.org/
[3]: https://opensource.com/article/17/6/set-path-linux
[4]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-5-the-path/
