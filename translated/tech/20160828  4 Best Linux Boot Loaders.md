

4 个最好的 Linux 引导程序
====

当你打开你的机器，开机自检成功完成后，BIOS（基本输入输出系统）立即定位配置引导介质，并从主引导记录（MBR）或 GUID（全局唯一标识符）分区表读取一些命令，这是引导介质的最前面 512 个字节内容。MBR（主引导记录）包含两个重要的信息集合，第一个是引导程序，第二个是分区表。
### 什么是引导程序？

引导程序是存储在 MBR（主引导记录）或 GUID（全局唯一标识符）分区表中的一个小程序，它可以帮助把操作系统装载到内存中。如果没有引导程序，那么你的操作系统将不能够装载到内存中。

有一些引导程序我们可以同时安装在 Linux 系统上，在这篇文章里，我将简要地谈论几个最好的 Linux 引导程序。
### 1. GNU GRUB

GNU GRUB 是一个非常受欢迎并且用得最多的具有多重引导能力的 Linux 引导程序，它以原始的 Eirch Stefan Broleyn 发明的 GRUB（GRand Unified Bootlader）为基础。GNU GRUB 的到来伴随着一些改进，新的特性和漏洞修复作为原始 GRUB 程序的增强。

重要的是，GRUB 2 现在已经取代了 GRUB。值得注意的是，GRUB 这个名字被重新命名给了 GRUB Legacy, 但没有积极发展，然而，它可以用来引导老的系统因为漏洞修复依然还在工作。

GRUB 具有下面一些显著的特性：

- 支持多重引导
- 支持多重硬件结构和操作系统比如 Linux 和 Windows
- 提供一个类似 Bash 的交互式命令行界面从而用户可以和配置文件进行交互来运行 GRUB 命令。
- 允许访问 GRUB 编辑器。
- 支持通过安全加密设置密码
- 支持从由一些次要特性组成的网络进行引导
访问主页: <https://www.gnu.org/software/grub/>

### 2. LILO（Linux 载入程序）

LILO 是一个简单但强大且非常稳定的 Linux 引导程序。由于 GRUB 有很大改善和增加了许多强大的特性，越来越受欢迎，因此 LILO 在 Linux 用户中已经不是很受欢迎。

当 LILO 引导的时候，单词 "LILO" 会出现在频幕上并且每一个字母在一个特别的事件发生之前或之后出现。然而，从 2015 年 12 月开始，LILO 的发展停止了，它有许多特性比如下面列举的：

- 不提供交互式命令行界面
- 支持一些错误代码
- 提供无支持的网络引导
- 所有的文件存储在驱动的最开始 1024 个柱面上
- 面临 BTFS, GTP, RAID 等的限制
访问主页: <http://lilo.alioth.debian.org/>

### 3. BURG - 新的引导程序

以 GRUB 为基础, BURG 是一个相对来说很新的引导程序。由于 BURG 起源于 GRUB, 所以它装载有一些原始的 GRUB 特性。尽管如此, BURG 也提供了一些显著的特性，比如一种新的对象格式可以支持包括 Linux, Windows, Mac OS, FreeBSD 等多重平台。

另外，BURG 支持高配置文本和图标模式引导菜单，stream plus 计划未来针对它进行改进从而和不同的输入输出设备一同工作。
访问主页: <https://launchpad.net/burg>

### 4. Syslinux

Syslinux 是一种能从光盘驱动器、网络等进行引导的轻型引导程序。Syslinux 支持文件系统，比如 MS-DOS 上的 FAT, Linux 上的 ext2, ext3, ext4。Syslinux 也支持未压缩的单独设备 Btrfs。
注意由于 Syslinux 仅能访问自己分区上的文件，因此不具备多重文件系统引导能力。
访问主页: <http://www.syslinux.org/wiki/index.php?title=The_Syslinux_Project>

### 结论

一个引导程序允许你在你的机器上管理多重操作系统并在特定的时间选择其中一个使用。没有引导程序，你的机器就不能狗装载内核以及剩余部分的操作系统文件。

我们是否遗漏了任何一流的 Linux 引导程序？如果有，在下面的评论表中填入值得赞扬的 Linux 系统引导程序，从而让我们知道。


--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Aaron Kili][a]
译者：[译者ucasFL](https://github.com/ucasFL)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/best-linux-boot-loaders/
