[#]: subject: (Get started with FreeDOS)
[#]: via: (https://opensource.com/article/21/6/get-started-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13492-1.html)

FreeDOS 入门
======

> 它看起来像复古计算，但它是一个现代的操作系统，你可以用它来完成任务。

![](https://img.linux.net.cn/data/attachment/album/202106/16/123557an8ybzgnqg833vz4.jpg)

在整个 1980 年代和 1990 年代，我主要是一个 DOS 用户。我喜欢 DOS 提供的命令行环境，它随着每一个连续的版本变得更加强大。我甚至学会了如何用 C 语言编写自己的 DOS 程序，这样我就可以扩展 DOS 命令行，并为标准的 DOS 命令编写更强大的替代程序。我曾经试验过微软的 Windows，但如果你记得当时的 Windows 3，你就会知道它很慢，而且容易崩溃。但无论如何我更喜欢命令行，所以我坚持使用 DOS。

这一切在 1994 年发生了变化。流行的技术杂志谈到了即将到来的 Windows 版本，它将完全废除 DOS。我不想被迫使用 Windows。在我访问的 Usenet 讨论区中，其他人也有同样的感觉。所以在 [1994 年 6 月 29 日][2]，我认为如果我们想保留 DOS，我们需要自己编写。所以在 6 月 29 日，我宣布了一个小项目，这个项目后来成为 [FreeDOS 项目][3]。

从那时起，我们已经发布了几个完整的 FreeDOS 发行版。我们从 1994 年到 1997 年的 alpha 系列开始，再到 1998 年到 2005 年的 beta 系列，最后在 2006 年发布了 FreeDOS 1.0 版本。从那时起，进展是缓慢但稳定的。在 1.0 之后，我们并没有真正急于发布每个新版本，因为 DOS 在 1995 年不再是一个变动的目标。

从 1.0 开始的每一个 FreeDOS 发行版都是对现代 DOS 的不断重新想象。我们已经包括了很多编译器和汇编器，供开发人员编写软件。我们还提供了许多“强大工具”，以便你可以做真正的工作。我们还提供了各种编辑器，因为每个人都有自己的最爱。

我们最近发布了 FreeDOS 1.3 RC4 发行版。从技术上讲，这是我们即将推出的 FreeDOS 1.3 发行版的候选版本，但它是一个全功能的发行版。我对 FreeDOS 1.3 RC4 的所有功能感到非常兴奋。

### 无需安装 FreeDOS 即可运行 FreeDOS

在我们以前所有的 FreeDOS 发行版中，我们把重点放在 _安装_ FreeDOS 到电脑上。但我们认识到，大多数用户实际上已经不在实际硬件上运行 FreeDOS 了。他们在 [像 QEMU 或 VirtualBox 这样的虚拟机][4] 中运行 FreeDOS。所以在 FreeDOS 1.3 RC4 中，我们改进了 “LiveCD” 环境。

通过 FreeDOS 1.3 RC4，你可以在你喜欢的虚拟机中启动 LiveCD 镜像，并立即开始使用 FreeDOS。这就是我现在运行 FreeDOS 的方式。我有一个小的虚拟硬盘镜像，我把所有的文件都放在那里，但我从 LiveCD 启动并运行 FreeDOS。

![Booting the FreeDOS 1.3 RC4 LiveCD on QEMU][5]

*启动 FreeDOS 1.3 RC4 LiveCD （Jim Hall, [CC-BY SA 4.0][6]）*

### 安装真的很简单

如果你不想从 LiveCD 上运行 FreeDOS，你也可以在你的硬盘上安装它。我们更新了 FreeDOS 的安装程序，所以它本身并不是一个真正的“程序”，而是一个非常聪明的 DOS “批处理”文件，它可以检测到各种情况并采取适当的行动，例如在没有 FreeDOS 分区的情况下为其创建一个新的磁盘分区。

旧的 FreeDOS 发行版会提示你各种问题，甚至选择个别程序来安装。新的安装程序非常精简。它只问你几个问题就开始了，然后就自己做其他事情。在一个空的虚拟机上安装 FreeDOS 只需要几分钟时间。

![Installing FreeDOS 1.3 RC4][7]

*安装FreeDOS 1.3 RC4 （Jim Hall, [CC-BY SA 4.0][6]）*

### 你可以从软盘安装它

不是每个人都喜欢在虚拟机中运行 FreeDOS。现在有一个复古计算社区，他们收集并精心修复经典的 PC 硬件，如 Pentium 或 486 系统。你甚至可以在那里找到一些 XT（8088）或 AT（80286）系统，它由一个专门的用户社区运营。

虽然我们认为 FreeDOS 是一个现代的 DOS，但如果我们不在旧的 PC 硬件上运行，我们就不是 “DOS” 了。因此，在 FreeDOS 1.3 中，我们包含了一个纯软盘版！这个版本可以运行在任何硬件上。这个版本应该可以在任何可以运行 FreeDOS 的硬件上运行，并且有 EGA 或更好的图形。

你在运行 286 或其他没有 CD-ROM 驱动器的经典系统吗？从这些软盘安装 FreeDOS。你是否只有一个硬盘而没有 CD 或软盘驱动器？只要把软盘的内容复制到一个临时目录，然后从那里运行安装程序。想执行“无交互外设方式”安装到不同的 DOS 目录吗？用命令行选项就可以了。

纯软盘版使用一个完全不同的安装程序，并包含一套有限的 FreeDOS 程序，它们在经典的 PC 硬件上更有用。

![Installing the FreeDOS Floppy-Only Edition][8]

*安装FreeDOS纯软盘版 （Jim Hall, [CC-BY SA 4.0][6]）*

### 充满了开源应用和游戏

如果 FreeDOS 是一个闭源的 DOS，它就不是一个 _自由_ 的 DOS。我们希望每个人都能使用和研究 FreeDOS，包括其源代码。当我们计划 FreeDOS 1.3 发行版时，我们仔细检查了每个软件包中的每一个许可证，并专注于只包括 _开源_ 程序。（在以前的 FreeDOS 发行版中，有几个程序并不完全“开源”，还有一两个程序没有包括源码，但是可以“自由使用和发布”。在这个版本中，所有的东西都是开源的，以“开源定义”作为我们的模型。）

而且，这是一个多么棒的开源应用和游戏的集合。游戏是 FreeDOS 1.3 RC4 中我最喜欢的内容。许多人使用 FreeDOS 来玩经典的 DOS 游戏，但我们想提供我们自己的开源游戏给人们玩。

你可以发现 LiveCD 中已经安装了两个游戏：Simple Senet（可以追溯到古埃及的棋盘游戏）和 Floppy Bird（Flappy Bird 游戏的一个版本）。如果你安装了 FreeDOS，你还会发现很多其他游戏可以尝试，包括 Sudoku86（一个数独游戏）、Wing（一个太空射击游戏）和 Bolitaire（单人纸牌游戏）。

![Playing the Floppy Bird game][9]

*玩 Floppy Bird 游戏 （Jim Hall, [CC-BY SA 4.0][6]）*

![The ancient game of Senet][10]

*古老的 Senet 游戏 （Jim Hall, [CC-BY SA 4.0][6]）*

### 现在就试试 FreeDOS 1.3 RC4

你可以在 FreeDOS 的 [下载][11] 页面上找到新的 FreeDOS 1.3 RC4。要安装 FreeDOS，你需要至少 20MB 的可用磁盘空间：20MB 用来安装一个普通的 FreeDOS 系统，或者 250MB 用来安装所有，包括应用和游戏。要安装源码，你将需要高达 450MB 的可用空间。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/get-started-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/retro_old_unix_computer.png?itok=SYAb2xoW (Old UNIX computer)
[2]: https://groups.google.com/g/comp.os.msdos.apps/c/oQmT4ETcSzU/m/O1HR8PE2u-EJ
[3]: https://www.freedos.org/
[4]: https://opensource.com/article/20/8/virt-tools
[5]: https://opensource.com/sites/default/files/freedos-livecd.png (Booting the FreeDOS 1.3 RC4 LiveCD)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/install6.png (Installing FreeDOS 1.3 RC4)
[8]: https://opensource.com/sites/default/files/freedos-floppy.png (Installing the FreeDOS Floppy-Only Edition)
[9]: https://opensource.com/sites/default/files/floppy-bird.png (Playing the Floppy Bird game)
[10]: https://opensource.com/sites/default/files/simple-senet.png (The ancient game of Senet)
[11]: https://www.freedos.org/download/
