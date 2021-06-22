[#]: subject: (How FreeDOS boots)
[#]: via: (https://opensource.com/article/21/6/freedos-boots)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13503-1.html)

FreeDOS 如何启动
======

> 概述你的计算机如何引导和启动一个像 FreeDOS 这样的简单操作系统。

![](https://img.linux.net.cn/data/attachment/album/202106/20/140809fpkrcnow8npnow8p.jpg)

在使用 DOS 计算机的过程中，我很欣赏的一点是，引导过程相对容易理解。在 DOS 中没有太多的变动组件。而今天，我想和大家分享一下电脑是如何引导和启动像 FreeDOS 这样的简单操作系统的概况。

### 初始引导

当你打开计算机的电源时，系统会进行一些自我检查，如验证内存和其他组件。这被称为<ruby>开机自检<rt>Power On Self Test</rt></ruby>（POST）。POST 之后，计算机使用一个硬编码指令，告诉它在哪里找到加载操作系统的指令。这就是“<ruby>引导加载程序<rt>boot loader</rt></ruby>”，通常它将试图找到硬盘上的<ruby>主引导记录<rt>Master Boot Record</rt></ruby>（MBR）。然后，MBR 加载主操作系统，在这里就是 FreeDOS。

这个定位一个信息以便计算机能够加载操作系统的下一个部分的过程被称为“<ruby>引导<rt>bootstrapping</rt></ruby>”，来自于“<ruby>通过你自己的努力振作起来<rt>picking yourself up by your bootstraps</rt></ruby>”的古老说法。正是从这个用法中，我们采用了“<ruby>引导<rt>boot</rt></ruby>”一词来表示启动你的计算机。

### 内核

当计算机加载 FreeDOS 内核时，内核所做的第一件事就是识别用户所表示要使用的任何参数。它被保存在一个叫做 `FDCONFIG.SYS` 的文件中，与内核保存在同一个根目录下。如果 `FDCONFIG.SYS` 不存在，那么 FreeDOS 的内核就会寻找一个叫做 `CONFIG.SYS` 的替代文件。

如果你在 20 世纪 80 年代或 90 年代使用过 DOS，你可能对 `CONFIG.SYS` 文件很熟悉。从 1999 年起，FreeDOS 首先寻找 `FDCONFIG.SYS`，以防你的 DOS 系统与其他 DOS（如 MS-DOS）做了 _双启动_。请注意，MS-DOS 只使用 `CONFIG.SYS` 文件。因此，如果你用同一个硬盘同时启动 FreeDOS 和 MS-DOS，MS-DOS 使用 `CONFIG.SYS` 来配置自己，而 FreeDOS 则使用 `FDCONFIG.SYS`。这样一来，双方都可以使用自己的配置。

`FDCONFIG.SYS` 可以包含一些配置设置，其中之一是 `SHELL=` 或 `SHELLHIGH=`。任何一个都会指示内核加载这个程序作为用户的交互式 shell。

如果 `FDCONFIG.SYS` 和 `CONFIG.SYS` 都不存在，那么内核就会假定几个默认值，包括在哪里找到 shell。如果你在启动 FreeDOS 系统时看到 “Bad or missing Command Interpreter” 的信息，这意味着 `SHELL=` 或 `SHELLHIGH=` 指向了一个在你系统中不存在的 shell 程序。

![Bad or missing Command Interpreter][2]

你可以通过查看 `SHELL=` 或 `SHELLHIGH=` 行来调试这个问题。如果做不到这一点，请确保你在 FreeDOS 系统的根目录下有一个名为 `COMMAND.COM` 的程序。它就是 _shell_，我接下来会讲到它。

### shell

在 DOS 系统中，“shell” 一词通常是指一个命令行解释器：一个交互式程序，它从用户那里读取指令，然后执行它们。在这里，FreeDOS 的 shell 与 Linux 的 Bash shell 相似。

除非你用 `SHELL=` 或 `SHELLHIGH=` 要求内核加载一个不同的 shell，否则 DOS 上的标准命令行 shell 被称为 `COMMAND.COM`。当 `COMMAND.COM` 启动时，它也寻找一个文件来配置自己。默认情况下，`COMMAND.COM` 会在根目录下寻找一个名为 `AUTOEXEC.BAT` 的文件。`AUTOEXEC.BAT` 是一个“批处理文件”，它包含一组启动时运行的指令，大致类似于 Linux 上 Bash 启动时读取的 `~/.bashrc` “资源文件”。

你可以在 `FDCONFIG.SYS` 文件中用 `SHELL=` 或 `SHELLHIGH=` 改变 shell 以及 shell 的启动文件。FreeDOS 1.3 RC4 安装程序将系统设置为读取 `FDAUTO.BAT` 而不是 `AUTOEXEC.BAT`。这与内核读取另一个配置文件的原因相同；你可以在硬盘上用另一个 DOS 双启动 FreeDOS。FreeDOS 将使用 `FDAUTO.BAT` 而 MS-DOS 将使用 `AUTOEXEC.BAT`。

如果没有像 `AUTOEXEC.BAT` 这样的启动文件，shell 将简单地提示用户输入日期和时间。

![Without AUTOEXEC.BAT, the shell will prompt for date and time][3]

就是这些了。当 FreeDOS 加载了内核，而内核也加载了 shell，FreeDOS 就准备好让用户输入命令了。

![FreeDOS is ready for you to enter your first command][4]

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-boots

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 (Code going into a computer.)
[2]: https://opensource.com/sites/default/files/uploads/bad-missing-command.png (Bad or missing Command Interpreter)
[3]: https://opensource.com/sites/default/files/uploads/no-autoexec.png (Without AUTOEXEC.BAT, the shell will prompt for date and time)
[4]: https://opensource.com/sites/default/files/uploads/freedos-boot.png (FreeDOS is ready for you to enter your first command)
