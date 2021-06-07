[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10935-1.html)
[#]: subject: (4 Ways to Run Linux Commands in Windows)
[#]: via: (https://itsfoss.com/run-linux-commands-in-windows/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Windows 中运行 Linux 命令的 4 种方法
======

> 想要使用 Linux 命令，但又不想离开 Windows ？以下是在 Windows 中运行 Linux bash 命令的几种方法。

如果你正在课程中正在学习 shell 脚本，那么需要使用 Linux 命令来练习命令和脚本。

你的学校实验室可能安装了 Linux，但是你自己没有安装了 [Linux 的笔记本电脑][1]，而是像其他人一样的 Windows 计算机。你的作业需要运行 Linux 命令，你或许想知道如何在 Windows 上运行 Bash 命令和脚本。

你可以[在双启动模式下同时安装 Windows 和 Linux][2]。此方法能让你在启动计算机时选择 Linux 或 Windows。但是，为了运行 Linux 命令而使用单独分区的麻烦可能不适合所有人。

你也可以[使用在线 Linux 终端][3]，但你的作业无法保存。

好消息是，有几种方法可以在 Windows 中运行 Linux 命令，就像其他常规应用一样。不是很酷吗？

### 在 Windows 中使用 Linux 命令

![](https://img.linux.net.cn/data/attachment/album/201906/04/093809hlz2tblfzt7mbwwl.jpg)

作为一个热心的 Linux 用户和推广者，我希望看到越来越多的人使用“真正的” Linux，但我知道有时候，这不是优先考虑的问题。如果你只是想练习 Linux 来通过考试，可以使用这些方法之一在 Windows 上运行 Bash 命令。

#### 1、在 Windows 10 上使用 Linux Bash Shell

你是否知道可以在 Windows 10 中运行 Linux 发行版？ [Windows 的 Linux 子系统 （WSL）][5] 能让你在 Windows 中运行 Linux。即将推出的 WSL 版本将在 Windows 内部使用真正 Linux 内核。

此 WSL 也称为 Bash on Windows，它作为一个常规的 Windows 应用运行，并提供了一个命令行模式的 Linux 发行版。不要害怕命令行模式，因为你的目的是运行 Linux 命令。这就是你所需要的。

![Ubuntu Linux inside Windows][6]

你可以在 Windows 应用商店中找到一些流行的 Linux 发行版，如 Ubuntu、Kali Linux、openSUSE 等。你只需像任何其他 Windows 应用一样下载和安装它。安装后，你可以运行所需的所有 Linux 命令。

![Linux distributions in Windows 10 Store][8]

请参考教程：[在 Windows 上安装 Linux bash shell][9]。

#### 2、使用 Git Bash 在 Windows 上运行 Bash 命令

你可能知道 [Git][10] 是什么。它是由 [Linux 创建者 Linus Torvalds][11] 开发的版本控制系统。

[Git for Windows][12] 是一组工具，能让你在命令行和图形界面中使用 Git。Git for Windows 中包含的工具之一是 Git Bash。

Git Bash 为 Git 命令行提供了仿真层。除了 Git 命令，Git Bash 还支持许多 Bash 程序，如 `ssh`、`scp`、`cat`、`find` 等。

![Git Bash][13]

换句话说，你可以使用 Git Bash 运行许多常见的 Linux/Bash 命令。

你可以从其网站免费下载和安装 Git for Windows 工具来在 Windows 中安装 Git Bash。

- [下载 Git for Windows][12]

#### 3、使用 Cygwin 在 Windows 中使用 Linux 命令

如果要在 Windows 中运行 Linux 命令，那么 Cygwin 是一个推荐的工具。Cygwin 创建于 1995 年，旨在提供一个原生运行于 Windows 中的 POSIX 兼容环境。Cygwin 是由 Red Hat 员工和许多其他志愿者维护的自由开源软件。

二十年来，Windows 用户使用 Cygwin 来运行和练习 Linux/Bash 命令。十多年前，我甚至用 Cygwin 来学习 Linux 命令。

![Cygwin][14]

你可以从下面的官方网站下载 Cygwin。我还建议你参考这个 [Cygwin 备忘录][15]来开始使用。

- [下载 Cygwin][16]

#### 4、在虚拟机中使用 Linux

另一种方法是使用虚拟化软件并在其中安装 Linux。这样，你可以在 Windows 中安装 Linux 发行版（带有图形界面）并像常规 Windows 应用一样运行它。

这种方法要求你的系统有大的内存，至少 4GB ，但如果你有超过 8GB 的内存那么更好。这里的好处是你可以真实地使用桌面 Linux。如果你喜欢这个界面，那么你可能会在以后决定[切换到 Linux][17]。

![Ubuntu Running in Virtual Machine Inside Windows][18]

有两种流行的工具可在 Windows 上创建虚拟机，它们是 Oracle VirtualBox 和 VMware Workstation Player。你可以使用两者中的任何一个。就个人而言，我更喜欢 VirtualBox。

你可以按照[本教程学习如何在 VirtualBox 中安装 Linux][20]。

### 总结

运行 Linux 命令的最佳方法是使用 Linux。当选择不安装 Linux 时，这些工具能让你在 Windows 上运行 Linux 命令。都试试看，看哪种适合你。

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-linux-commands-in-windows/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/get-linux-laptops/
[2]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[3]: https://itsfoss.com/online-linux-terminals/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/run-linux-commands-in-windows.png?resize=800%2C450&ssl=1
[5]: https://itsfoss.com/bash-on-windows/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2016/08/install-ubuntu-windows-10-linux-subsystem-10.jpeg?resize=800%2C268&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2016/08/install-ubuntu-windows-10-linux-subsystem-4.jpeg?resize=800%2C632&ssl=1
[9]: https://itsfoss.com/install-bash-on-windows/
[10]: https://itsfoss.com/basic-git-commands-cheat-sheet/
[11]: https://itsfoss.com/linus-torvalds-facts/
[12]: https://gitforwindows.org/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/git-bash.png?ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/cygwin-shell.jpg?ssl=1
[15]: http://www.voxforge.org/home/docs/cygwin-cheat-sheet
[16]: https://www.cygwin.com/
[17]: https://itsfoss.com/reasons-switch-linux-windows-xp/
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/ubuntu-running-in-virtual-machine-inside-windows.jpeg?resize=800%2C450&ssl=1
[20]: https://itsfoss.com/install-linux-in-virtualbox/
