[#]: subject: "What is TTY in Linux?"
[#]: via: "https://itsfoss.com/what-is-tty-in-linux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux 中的 TTY 是什么？
======

谈到 Linux 和 UNIX 时，你一定听说过 "TTY" 这个术语，但是，这玩意是什么？

作为一个桌面用户，它对你有用吗？你需要它吗？你能用它做什么？

在本文中，让我向你介绍一切，帮助你熟悉 Linux 中的 TTY。

注意：这个问题没有明确的答案，但它与过去输入/输出设备的交互方式有关。因此，你必须了解一些历史，才能清楚地了解情况。

### "TTY" 背后的历史

一切始于 19 世纪 30 年代的电传打字机。

电传打字机可以让你通过有线发送或接受短信，它取代了摩尔斯电码通信，一种需要两个操作员才能有效地相互通信的方式。

一台电传打字机只需要一个操作员就可以轻松地传递信息。虽然它没有现代布局的键盘，但它的系统后来由 Donald Murray 在 1901 年改良，包括一个类似打字机的键盘。

穆雷码减少了操作员发送消息的工作量。这使得电传打字机在 1908 年有可能发展成为商业电传打字机。TTY 是电传打字机的缩写。

![二战期间在伦敦使用地实际电传打字机 | 图片来源于维基百科][1]

电传打字机和普通打字机的区别在于，电传打字机连接到通信设备，直接发送输入的消息。

[电传打字机使人类在没有计算机的情况下通过电线进行更快的通信成为可能][2]。

从这时起，"**TTY**" 一词就存在了。

### （相对）现代的概念

现在，你一定想知道，它是如何进入现代计算机和 Linux 的？

首先，当电传打字机进入市场时，几年后半导体晶体管发展起来，然后演变成微处理器，计算机成为可能。

最初的计算机没有键盘的概念，打孔卡是输入的方法。

![一种插入计算机而不是通过键盘（TTY）输入的打孔卡计算机程序 | 图片来源于维基百科][3]

随着计算机的发展，批量打孔卡最终被电传打字机取代，成为一种方便的输入/输出设备。

![1956 年的 LGP-30 计算机，附带 TTY][4]

随着技术的进步，电传打字机被电子技术“虚拟化”了。因此，你不需要一个物理的、机械的 TTY，而是一个虚拟的电子 TTY。

早期的计算机甚至没有视频屏幕。东西被打印在纸上而不是显示在屏幕上。因此，你会看到“打印”这个术语而不是“显示”。随着技术的进步，视频后来被添加到终端中。

换句话说，你可能听说过把它们称为视频终端。或者，你可以称它们为“物理”终端。

后来，它们演变成软件模拟终端，具有更强的能力和功能。

这就是所谓的“终端模拟器”。例如，GNOME 终端或 Konsole，或者其他[你为 Linux 找到的最佳终端模拟器][5]。

### 所以，Linux 中的 TTY 到底是什么？

在 Linux 或 UNIX 中，TTY 变为了一个抽象设备。有时它指的是一个物理输入设备，例如串口，有时它指的是一个允许用户和系统交互的虚拟 TTY（[参考][6]）。

TTY 是 Linux 或 UNIX 的一个子系统，它通过 TTY 驱动程序在内核级别实现进程管理、行编辑和会话管理。

对于编程，你需要深入研究。但是考虑到本文的范围，这可能是一个容易理解的定义。

如果你好奇的话，你可以查看一个旧资源（[TTY 揭秘][7]），它会使用一切技术细节来解释 Linux 和 UNIX 系统中的 TTY。

事实上，每当你在系统中启动一个终端模拟器或使用任何类型的 shell 时，它都会与虚拟 TTY（也被称为伪 TTY 或 PTY）进行交互。

你可以在终端模拟器中输入 TTY 来找到相关联的 PTY。

### 如何在 Linux 中访问 TTY？

![][8]

在 Linux 中很容易访问 TTY。事实上，当我不知道它是什么时，我不小心访问了它，于是对要做什么，即如何摆脱它感到恐慌。

在大多数 _发行版_ 中，你可以使用以下键盘快捷键来获得 TTY 屏幕：

**CTRL + ALT + F1** – 锁屏

**CTRL + ALT + F2** – 桌面环境

**CTRL + ALT + F3** – TTY3

**CTRL + ALT + F4** – TTY4

**CTRL + ALT + F5** – TT5

**CTRL + ALT + F6** – TTY6

你最多可以访问六个 TTY。但是，前两个快捷方式指向发行版的锁定屏幕和桌面环境。

![][9]

因此，其他快捷方式将会让你获得一个命令行界面。

### 什么时候应该使用 TTY?

TTY 不仅是一个技术宝藏，即使像我这样不是开发人员的用户，它也很有用。

在图形桌面环境冻结的情况下，它应该会派上用场。在某些情况下，从 TTY 重新安装桌面环境能帮助解决程序问题。

或者，你也可以选择在 TTY 中执行任务，例如更新 Linux 系统等。在这些情况下，你不希望它们中断你的进程。

最坏的情况是，如果图形用户界面失去响应，你可以进入 TTY 并重新启动计算机。

有些用户还喜欢在 TTY 的帮助下传输大文件（我不是其中之一）。

### Linux 中的 TTY 命令

![][10]

当你在终端模拟器中输入 TTY 时，它将打印连接到标准输入的终端文件名，就像 man 页面描述的一样。

换句话说，要知道你连接的 TTY 编号，只需输入 TTY。并且，如果有多个用户远程连接到 Linux 机器，你可以使用 who 命令来检查其他用户连接到什么。

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-is-tty-in-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/WACsOperateTeletype.jpg?resize=429%2C371&ssl=1
[2]: https://en.wikipedia.org/wiki/Teletype_Corporation#/media/File:What-is-teletype.jpg
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/punch-card-program.jpg?resize=600%2C274&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/LGP-30-early-computer-1956.jpg?resize=800%2C600&ssl=1
[5]: https://itsfoss.com/linux-terminal-emulators/
[6]: https://unix.stackexchange.com/questions/4126/what-is-the-exact-difference-between-a-terminal-a-shell-a-tty-and-a-con
[7]: https://www.linusakesson.net/programming/tty/index.php
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/ubuntu-tty.png?resize=800%2C449&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/ubuntu-tty4.png?resize=420%2C124&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/ubuntu-terminal-tty-command.png?resize=800%2C544&ssl=1
