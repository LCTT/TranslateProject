在 Linux 中怎么运行 MS-DOS 游戏和程序
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/dosbox-720x340.png)

你是否想过尝试一些经典的 MS-DOS 游戏和像 Turbo C++ 这样的废弃的 C++ 编译器？这篇教程将会介绍如何使用 DOSBox 在 Linux 环境下运行 MS-DOS 的游戏和程序。DOSBox 是一个 x86 平台的 DOS 模拟器，可以用来运行经典的 DOS 游戏和程序。 DOSBox 可以模拟带有声音、图形、鼠标、操纵杆和调制解调器等的因特尔 x86 电脑，它允许你运行许多旧的 MS-DOS 游戏和程序，这些游戏和程序根本无法在任何现代 PC 和操作系统上运行，例如 Microsoft Windows XP 及更高版本、Linux 和FreeBSD。 DOSBox 是免费的，使用 C++ 编程语言编写并在 GPL 下分发。

### 在 Linux 上安装 DOSBox

DOSBox 在大多数 Linux 发行版的默认仓库中都能找的到。

在 Arch Linux 及其衍生版如 Antergos、Manjaro Linux 上：

```
$ sudo pacman -S dosbox
```

在 Debian、Ubuntu、Linux Mint 上：

```
$ sudo apt-get install dosbox
```

在 Fedora 上：

```
$ sudo dnf install dosbox
```

### 配置 DOSBox

DOSBox 是一个开箱即用的软件，它不需要进行初始化配置。它的配置文件位于 `~/.dosbox` 文件夹中，名为 `dosbox-x.xx.conf`。 在此配置文件中，你可以编辑/修改各种设置，例如以全屏模式启动 DOSBox，全屏使用双缓冲，设置首选分辨率，鼠标灵敏度，启用或禁用声音，扬声器，操纵杆等等。如前所述，默认设置即可正常工作。你可以不用进行任何更改。

### 在 Linux 中运行 MS-DOS 上的游戏和程序

在终端运行以下命令启动 DOSBox：

```
$ dosbox
```

下图就是 DOSBox 的界面

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt.png)

正如你所看到的，DOSBox 带有自己的类似 DOS 的命令提示符和一个虚拟的 `Z:\` 的驱动器，如果你熟悉 MS-DOS 的话，你会发现在 DOSBox 环境下工作不会有任何问题。

这是 `dir` 命令（在 Linux 中等同于 `ls` 命令）的输出：

![](http://www.ostechnix.com/wp-content/uploads/2018/09/dir-command-output.png)

如果你是第一次使用 DOSBox，你可以通过在 DOSBox 提示符中输入以下命令来查看关于 DOSBox 的简介：

```
intro
```

在介绍部分按回车进入下一页。

要查看 DOS 中最常用命令的列表，请使用此命令:

```
help
```

要查看 DOSBox 中所有支持的命令的列表，请键入：

```
help /all
```

记好了这些命令应该在 DOSBox 提示符中使用，而不是在 Linux 终端中使用。

DOSBox 还支持一些实用的键盘组合键。下图是能有效使用 DOSBox 的默认键盘快捷键。

![](http://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-keyboard-shortcuts.png)

要退出 DOSBox，只需键入如下命令并按回车：

```
exit
```

默认情况下，DOSBox 开始运行时的正常屏幕窗口大小如上所示。

要直接在全屏启动 DOSBox，请编辑 `dosbox-x.xx.conf` 文件并将`fullscreen` 变量的值设置为 `enable`。 之后，DOSBox 将以全屏模式启动。 如果要返回正常屏幕，请按 `ALT+ENTER`。

希望你掌握了 DOSBox 的这些基本用法。

让我们继续安装一些 DOS 程序和游戏。

首先，我们需要在 Linux 系统中创建目录来保存程序和游戏。我将创建两个名为 `~/dosprograms` 和 `~/dosgames` 的目录，第一个用于存储程序，后者用于存储游戏。

```
$ mkdir ~/dosprograms ~/dosgames
```

出于本指南的目的，我将向你展示如何安装 Turbo C++ 程序和 Mario 游戏。我们首先将看到如何安装 Turbo。

下载最后版本的 Turbo C++ 编译器并将其解压到 `~/dosprograms` 目录中。 我已经将 Turbo C++ 保存在在我的 `~/dosprograms/TC/` 目录中了。

```
$ ls dosprograms/tc/

BGI BIN CLASSLIB DOC EXAMPLES FILELIST.DOC INCLUDE LIB README README.COM
```

运行 DOSBox:

```
$ dosbox
```

将 `~/dosprograms` 目录挂载为 DOSBox 中的虚拟驱动器 `C:\`

```
Z:\>mount c ~/dosprograms
```

你会看到类似下面的输出：

```
Drive C is mounted as local directory /home/sk/dosprograms.
```


![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-1.png)

现在，使用命令切换到 C 盘：

```
Z:\>c:
```

然后切换到 `tc/bin` 目录：

```
Z:\>cd tc/bin
```

最后，运行 Turbo C++ 可执行文件：

```
Z:\>tc.exe
```

**备注：**只需输入前几个字母，然后按回车键可以自动填充文件名。

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-4.png)

你现在将进入 Turbo C++ 控制台。

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-5.png)

创建新文件（`ATL + F`）并开始编程：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-6.png)

你可以同样安装和运行其他经典 DOS 程序。

**故障排除：**

运行 Turbo C++ 或其他任何 DOS 程序时，你可能会遇到以下错误：

```
DOSBox switched to max cycles, because of the setting: cycles=auto. If the game runs too fast try a fixed cycles amount in DOSBox's options. Exit to error: DRC64:Unhandled memory reference
```

要解决此问题，编辑 `~/.dosbox/dosbox-x.xx.conf` 文件：

```
$ nano ~/.dosbox/dosbox-0.74.conf
```

找到以下变量：

```
core=auto
```

并更改其值为：

```
core=normal
```

现在，让我们看看如何运行基于DOS的游戏，例如 **Mario Bros VGA**。

从 [这里][1] 下载 Mario 游戏，并将其解压到 Linux 中的 `~/dosgames` 目录。

运行 DOSBox：

```
$ dosbox
```

我们刚才使用了虚拟驱动器 `C:` 来运行 DOS 程序。现在让我们使用  `D:` 作为虚拟驱动器来运行游戏。

在 DOSBox 提示符下，运行以下命令将 `~/dosgames` 目录挂载为虚拟驱动器 `D`：

```
Z:\>mount d ~/dosgames
```

进入驱动器 `D:`：

```
Z:\>d:
```

然后进入 mario 游戏目录并运行 `mario.exe` 文件来启动游戏。

```
D:\>cd mario
D:\>mario.exe
```

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-7.png)

开始玩游戏：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Mario-game-in-dosbox.png)

你可以同样像上面所说的那样运行任何基于 DOS 的游戏。 [点击这里] [2]查看可以使用 DOSBox 运行的游戏的完整列表。

### 总结

尽管 DOSBox 并不能作为 MS-DOS 的完全替代品，并且还缺少 MS-DOS 中的许多功能，但它足以安装和运行大多数的 DOS 游戏和程序。

有关更多详细信息，请参阅官方 [DOSBox手册][3]。

这就是全部内容。希望这对你有用。更多优秀指南即将到来。 敬请关注！

干杯!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-run-ms-dos-games-and-programs-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[way-ww](https://github.com/way-ww)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.dosgames.com/game/mario-bros-vga
[2]: https://www.dosbox.com/comp_list.php
[3]: https://www.dosbox.com/DOSBoxManual.html
