[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Jargon Buster: What is Grub in Linux? What is it Used for?)
[#]: via: (https://itsfoss.com/what-is-grub/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux 术语克星：Linux 中的 Grub 是什么？它有什么用？
======

如果你曾经使用过 Linux 桌面，你一定见过这个屏幕。这就是所谓的 GRUB 屏幕。是的，它的字母全部都是大写的。

![Remember this screen? This is GRUB][1]

在 “<ruby>Linux 术语克星<rt>Linux Jargon Buster</rt></ruby>”系列的这一个章节中，我将告诉你 Grub 是什么，以及它有什么用处。此外，我还会简要地介绍一下配置和定制的部分。

### GRUB 是什么？

GRUB[2] 是一个用于加载和管理系统启动的完整程序。它是 Linux 发行版中最常见的引导程序。引导程序是计算机启动时运行的第一个软件。它加载 [操作系统的内核][3]，然后再由内核初始化操作系统的其他部分（包括 Shell、[显示管理器][4]、[桌面环境][5] 等等）。

### <ruby>引导程序<rt>boot loader</rt></ruby> 和 <ruby>引导管理器<rt>boot manager</rt></ruby>

我不想现在就把你搞糊涂，但是我认为这个话题是不可避免的。引导程序和引导管理器之间有着一条模糊的界限。

你已经知道了引导程序是什么。它会首先启动，然后将内核加载到内存中并执行它。引导管理器则允许你在不同的操作系统之间进行选择（如果你的电脑上不止一个操作系统的话）。引导管理器并不会直接加载系统。

With Linux kernel version 3.3, the [Linux kernel includes a built-in EFI bootloader][6]. In fact, any operating system that is capable of working [EFI system includes an EFI bootloader][7]. In EFI capable systems, the firmware reads the EFI System Partition (ESP) for the EFI files for boot information.
随着 Linux 内核 3.3 版本的推出，[Linux 内核包括了一个内置的 EFI 引导程序][6]。事实上，任何一个[支持 EFI 的系统都包括一个 EFI 引导程序][7]。在支持 EFI 的系统中，固件会读取 <ruby>EFI 系统分区<rt>EFI System Partition</rt></ruby>（ESP）中的 EFI 文件，从而获得启动信息。

这里插入一张图片，图中显示了带有 ESP 分区的分区表：

![][8]

GRUB 既是一个引导程序，也是一个引导管理器。一会儿我再来谈 GRUB。让我们先看看其他类似 GRUB 的程序。

> 小知识：GRUB 是 **GR**and **U**nified **B**ootloader 的首字母缩写。

### 还有哪些类似 GRUB 的引导管理器？

GRUB 是 Linux 中最流行的引导管理器。但它并不是唯一的一个。有一个高度可定制的引导管理器，名字叫做 [rEFInd boot manager][9]，它同样受到了一些 Linux 用户的喜爱。

![定制化的 rEFInd Boot Manager 屏幕 | 图片来源：kofler.info/pop_os][10]

还有一个基于文本的引导管理器，名字叫做 [systemd-boot][11]。你可以猜到这是专为基于 systemd 的 Linux 发行版准备的。有一些发行版正在使用 systemd-boot，比如 Pop OS。

![Pop OS 中的 systemd-boot | 图片来源：kofler.info/pop_os][12]

### 访问或编辑 GRUB

通常你看到的 GRUB 屏幕是它的菜单界面。如果你安装了一个以上的操作系统，它会允许你在其中选择一个来启动。如果你的 Linux 发行版安装了不止一个内核，你也可以选择加载不同的内核。

根据不同的 Linux 发行版的配置，你的 GRUB 菜单上可能会有一些其他选项。

你可以在 GRUB 菜单界面按 `e` 键来编辑菜单项。这样你就可以在内核加载前修改它的参数。例如，在某些情况下，[禁用内核提供的图形驱动可以帮助你解决 Linux 系统在启动时卡住的问题][13]。

![][14]

你也可以在 GRUB 菜单界面上按 `c` 键来进入 GRUB 的命令行菜单。

### GRUB 配置文件

你在菜单界面里对 GRUB 所做的任何改变都是暂时的。如果你想对 GRUB 做一些永久性的改变，比如改变默认的超时时间，你可以在 Linux 系统启动后修改 GRUB 配置文件。

默认的 GRUB 配置文件是 `/etc/default/grub`。还有一个 `/etc/default/grub.d` 目录，里面也存放一些配置。你可以直接编辑 `/etc/default/grub` 文件，但是我还是建议通过在这个目录中添加配置文件（`.cfg` 文件）进行额外的修改。

![默认的 GRUB 配置文件][15]

你必须 [更新 GRUB 才能使这些修改生效][16]。

### Ubuntu 中的 GRUB 定制器

如果你不太习惯 [在终端里使用文本编辑器编辑文件][17]，你可以 [使用一个叫做 GRUB 定制器的图形工具][18]。


![][19]

它允许你改变启动顺序、默认超时时间等等。你还可以用它来把 GRUB 的背景设置成一张自定义的墙纸。

遗憾的是，这个工具只适用于基于 Ubuntu 的 Linux 发行版。

### 总结

至此，本文几乎涉及到了所有与 GRUB 相关的简单内容。至于 EFI、引导加载和 GRUB 本身，它们都是详细而复杂的话题，因此不在本文的讨论范围之内。这篇文章旨在给你一个关于 GRUB 引导程序的总体概述。

或许我以后会写一篇关于 GRUB 的详细指南，解释它底层的一些细节。目前，如果你想了解更多关于 GRUB 的信息，你可以在你的 Linux 终端里使用 `info grub` 命令访问到 GRUB 文档。

![你可以在终端中访问 GRUB 手册][20]

我希望你现在对什么是 GRUB 有了一点点的了解。这里有一个 GIF 动图供你一乐。

![什么是 GRUB? UEFI 再也伤害不到我了 :)][21]

或许我没有回答你关于 GRUB 的所有疑问，但请随时在评论区告诉我。我可能会根据你的问题或建议来更新这篇文章。

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-is-grub/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/grub-screen-linux.png?resize=800%2C450&ssl=1
[2]: https://www.gnu.org/software/grub/
[3]: https://itsfoss.com/what-is-linux/
[4]: https://itsfoss.com/display-manager/
[5]: https://itsfoss.com/what-is-desktop-environment/
[6]: https://www.rodsbooks.com/efi-bootloaders/efistub.html
[7]: https://jdebp.eu/FGA/efi-boot-process.html
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/disk-partition-gparted.png?resize=744%2C385&ssl=1
[9]: https://www.rodsbooks.com/refind/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/refind-boot-manager.png?resize=800%2C602&ssl=1
[11]: https://wiki.gentoo.org/wiki/Systemd-boot
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/systemd-boot.png?resize=714%2C333&ssl=1
[13]: https://itsfoss.com/fix-ubuntu-freezing/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/editing-grub-to-fix-nvidia-issue.jpg?resize=800%2C343&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/default-grub-config-file.png?resize=759%2C437&ssl=1
[16]: https://itsfoss.com/update-grub/
[17]: https://itsfoss.com/command-line-text-editors-linux/
[18]: https://itsfoss.com/grub-customizer-ubuntu/
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2013/05/make-windows-default-grub-2.jpeg?resize=799%2C435&ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/grub-manual-Linux-terminal.png?resize=800%2C462&ssl=1
[21]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/what_is_GRUB.gif?resize=500%2C343&ssl=1
