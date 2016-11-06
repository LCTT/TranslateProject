4 个最好的 Linux 引导程序
==================

当你打开你的机器，开机自检（POST）成功完成后，BIOS（基本输入输出系统）立即定位所配置的引导介质，并从 MBR（主引导记录）或 GUID（全局唯一标识符）分区表读取一些命令，这是引导介质的最前面 512 个字节内容。主引导记录（MBR）中包含两个重要的信息集合，第一个是引导程序，第二个是分区表。

### 什么是引导程序？

引导程序（Boot Loader）是存储在 MBR（主引导记录）或 GUID（全局唯一标识符）分区表中的一个小程序，用于帮助把操作系统装载到内存中。如果没有引导程序，那么你的操作系统将不能够装载到内存中。

有一些我们可以随同 Linux 安装到系统上的引导程序，在这篇文章里，我将简要地谈论几个最好的可以与 Linux 一同工作的 Linux 引导程序。

### 1. GNU GRUB

GNU GRUB 是一个非常受欢迎，也可能是用的最多的具有多重引导能力的 Linux 引导程序，它以原始的 Eirch Stefan Broleyn 发明的 GRUB（GRand Unified Bootlader）为基础。GNU GRUB 增强了原来的 GRUB，带来了一些改进、新的特性和漏洞修复。

重要的是，GRUB 2 现在已经取代了 GRUB。值得注意的是，GRUB 这个名字被重新命名为 GRUB Legacy，但没有活跃开发，不过，它可以用来引导老的系统，因为漏洞修复依然继续。

GRUB 具有下面一些显著的特性：

- 支持多重引导
- 支持多种硬件结构和操作系统，比如 Linux 和 Windows
- 提供一个类似 Bash 的交互式命令行界面，从而用户可以运行 GRUB 命令来和配置文件进行交互
- 允许访问 GRUB 编辑器
- 支持设置加密口令以确保安全
- 支持从网络进行引导，以及一些次要的特性

访问主页: <https://www.gnu.org/software/grub/>

### 2. LILO（Linux 引导程序（LInux LOader））

LILO 是一个简单但强大且非常稳定的 Linux 引导程序。由于 GRUB 有很大改善和增加了许多强大的特性，越来越受欢迎，因此 LILO 在 Linux 用户中已经不是很流行了。

当 LILO 引导的时候，单词“LILO”会出现在屏幕上，并且每一个字母会在一个特定的事件发生前后出现。然而，从 2015 年 12 月开始，LILO 的开发停止了，它有许多特性比如下面列举的：

- 不提供交互式命令行界面
- 支持一些错误代码
- 不支持网络引导（LCTT 译注：其变体 ELILO 支持 TFTP/DHCP 引导）
- 所有的文件存储在驱动的最开始 1024 个柱面上
- 面临 BTFS、GTP、RAID 等的限制

访问主页: <http://lilo.alioth.debian.org/>

### 3. BURG - 新的引导程序

基于 GRUB，BURG 是一个相对来说比较新的引导程序（LCTT 译注：已于 2011 年停止了开发）。由于 BURG 起源于 GRUB, 所以它带有一些 GRUB 主要特性。尽管如此, BURG 也提供了一些出色的特性，比如一种新的对象格式可以支持包括 Linux、Windows、Mac OS、 FreeBSD 等多种平台。

另外，BURG 支持可高度配置的文本和图标模式的引导菜单，计划增加的“流”支持未来可以不同的输入/输出设备一同工作。

访问主页: <https://launchpad.net/burg>

### 4. Syslinux

Syslinux 是一种能从光盘驱动器、网络等进行引导的轻型引导程序。Syslinux 支持诸如 MS-DOS 上的 FAT、 Linux 上的 ext2、ext3、ext4 等文件系统。Syslinux 也支持未压缩的单一设备上的 Btrfs。

注意由于 Syslinux 仅能访问自己分区上的文件，因此不具备多重文件系统引导能力。

访问主页: <http://www.syslinux.org/wiki/index.php?title=The_Syslinux_Project>

### 结论

一个引导程序允许你在你的机器上管理多个操作系统，并在某个的时间选择其中一个使用。没有引导程序，你的机器就不能够装载内核以及操作系统的剩余部分。

我们是否遗漏了任何一流的 Linux 引导程序？如果有请让我们知道，请在下面的评论表中填入值得推荐的 Linux 系统引导程序。


--------------------------------------------------------------------------------

via: http://www.tecmint.com/best-linux-boot-loaders/

作者：[Aaron Kili][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/best-linux-boot-loaders/
