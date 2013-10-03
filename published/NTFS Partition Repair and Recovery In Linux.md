Linux下NTFS分区的修复和恢复
=========================

我们时不时需要帮助我们的朋友、家人、熟人、商业伙伴或者其他杂七杂八的人摆脱使用Windows的时候遇到的困境。尽管我们不像他们一样日常遇到各种问题，却经常是在他们有难的时候会求助的人。此外,甚至我们自己的Windows分区/驱动器也会出现问题（毕竟，有时候我们还是需要玩儿会儿游戏，而且，尽管Steam在努力，但Linux还不是游戏玩家的梦想之地），但愿不会如此。下面让我们看一两个我们可能会遇到的状况，那时我们可以用手边的Linux环境和一些NTFS分区恢复工具来修复它们。

###简单修复

Windows 系统通常能很好的处理异常的“冷重启”（断电，关闭插线板的电源，或家里的小人儿手指随意按导致关机)。事实上，至今为止，最有效的修复Windows桌面问题的方法就是简单的重启系统。但是，Windows分区偶尔会显示系统需要进行驱动器一致性检测。不这么做的话，在几次重启后可能会引起文件系统状况恶化而使系统变得更糟。众所周知，Windows文件系统检查超级慢，而且经常不得不做好几次才能清理掉文件系统的“脏（dirty）”标志。

下面介绍一个叫“ntfsfix”的小工具，在基于Debian的系统（如 Ubuntu）可以通过下面的命令下载：

    sudo apt-get install ntfsfix

或者在基于RPM的系统（如 Red Hat 或 CentOS）中通过下面的命令下载:

    sudo yum install ntfsfix

这个‘ntfsfix’工具能快速的修复常见的错误以及NTFS分区不一致的问题。最常用的命令不用带任何参数。 它也可以报出来那些没有修复掉的项，然后我们能通过以下选项来修复它们：

* -b: 清除磁盘上的坏的扇区 (可以在从一个旧磁盘往新的磁盘上克隆之后使用)
* -d: 清除“脏”标志。“脏”标志是Linux不能挂载一个Windows分区的最常见的原因，通常发生在Windows断电前没有正常关机的情况。
* -n: 除了在标准输出上显示它要完成的(换句话说，就是需要修复哪些)之外不做任何事。

过去Windows在启动前，用NTFS Disk Check来重置“脏”标志，常常要花几个小时。而‘ntfsfix’完成这个仅仅只需要大约三秒的时。

###深度修复

不幸的是, 并非所有的问题都能被快速修复。事实上，有非常多的昂贵的磁盘恢复软件（通常属于“磁盘取证”类的软件，因为是在筛选损坏磁盘的时候调查人员使用的）用来修复那些加电但不能启动或者不能访问文件系统的磁盘。

有一个神奇的工具，免费而强大（而且如果在你本地电脑使用的话，可以放到一个可引导的救援Live CD里面）可以用来恢复你的Windows NTFS分区（而且，也能恢复EXT2/3/4，FAT/FAT32、exFAT、HFS和SunFS文件系统）。这个工具叫做[TestDisk][1]，在Debian和CentOS 的软件仓库中可用。Red Hat的软件仓库中并没有这个软件，但是安装它很容易。

    sudo apt-get install testdisk

在基于 RPM 的系统（如 Red Hat 或 CentOS）：

    sudo yum install testdisk

这个工具简直无与伦比。如果驱动器加电并且运转了，甚至当驱动器有物理损坏时，这个小工具仍会奇迹般的取出一些文件来。 你可以通过一个旧式风格的命令“sudo testdisk /dev/sdX”来启动它，这里‘X’是你的驱动器号，之后你会看到下面的界面：

![](http://blog.linuxacademy.com/wp-content/uploads/2013/08/testdisk2.jpg)

*TestDisk在终端中运行*

这个工具使用起来很简单，只需要根据菜单提示进行操作，而且它是交互式的。它会扫描你指定的某个分区，然后把重建的目录和文件显示出来，然后你可以标记，并存到另外一磁盘或者分区里面。我已经成功地从Windows，OSX和linux分区里面恢复过文件，这些分区要么因为这种或那种原因不能启动，要么害怕启动之后可能彻底完蛋，总之，这些分区用不了多久就会彻底完蛋了。

说句实在的，你不能期望文件系统100%的恢复，尤其是你的驱动器已经有损坏了，不过至少聊胜于无吧，而且不用像去请专业人员处理那样花很多钱（实际上一分也不用花）。所以如果你的驱动器现在有问题了，那你可以用下这个工具。

###结束语

当你使用Linux的时候，磁盘修复要容易得多，当然也便宜的多，要么用USB转接器连接有问题的磁盘，要么从一个LiveCD启动，然后用CD里面的修复工具。本文中我们谈到的所有的工具都是免费使用，而且是在持续开发（更新）中。您可以在下面留言，谈一下你曾经不得不使用什么工具来从您磁盘的问题中恢复。

---

via: http://blog.linuxacademy.com/linux/ntfs-partition-repair-and-recovery-in-linux/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[younel0925][] 校对：[jasminepeng][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[younel0925]:http://linux.cn/space/younel0925
[jasminepeng]:http://linux.cn/space/jasminepeng

[1]:http://www.cgsecurity.org/wiki/TestDisk