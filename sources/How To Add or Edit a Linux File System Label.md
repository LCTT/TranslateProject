如何添加或编辑文件系统标签
==========================

为了拥有一个正常运作的Linux操作系统，文件系统标签不是必须的，但当你有几个磁盘分区时文件系统标签可以使你的电脑更容易去定位。在这篇文章中我将展示如何在ext2,ext3和ext4磁盘分区中添加或**编辑Linux文件系统标签**。

我的上网本装有3个操作系统;Windows XP, Linux Mint, 和Xubuntu。有时我想要在其它操作系统上去查看一个文件系统的文件位置，这时候[文件系统标签][1]是非常方便的，因此，我知道该打开哪个文件系统来找到所需文件。

###查看Linux文件系统标签

首先让我们看一下哪些文件系统已经有了一个标签，哪些还没有。你可以用**blkid**命令来查看你的文件系统信息。运行这个命令去查看你的文件系统全部信息可能需要root权限。

	sudo blkid -c /dev/null

在我的上网本里输出的信息是这样。

	/dev/sda1: LABEL="WINRE" UUID="80AE-9D55" TYPE="vfat"
	/dev/sda2: LABEL="OS_Install" UUID="E468676968673A06" TYPE="ntfs"
	/dev/sda3: UUID="012ff341-f854-4c4f-8bbd-bbc810121fe6" TYPE="ext4"
	/dev/sda5: UUID="ec0fe4d1-e21c-407d-8374-aa4b470519da" TYPE="ext3"
	/dev/sda6: UUID="ee275431-64b2-4f55-b958-4055147cdf4e" TYPE="swap"
	/dev/sda7: UUID="99feb5c5-25a6-47a3-aa2c-6d466c0094ab" TYPE="ext4"

现在我用**lsblk**命令同样可以检查挂载在我当前系统上的某一个文件系统。

	lsblk

在我的Linux Mint 系统上输出的信息是这样。

    NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
    sda      8:0    0 149.1G  0 disk 
    |-sda1   8:1    0   3.9G  0 part 
    |-sda2   8:2    0  39.1G  0 part 
    |-sda3   8:3    0   9.3G  0 part /
    |-sda4   8:4    0     1K  0 part 
    |-sda5   8:5    0    86G  0 part /home
    |-sda6   8:6    0   1.4G  0 part [SWAP]
    |-sda7   8:7    0   9.3G  0 part

正如你看到的,在**blkid**和**lsblk**命令输出信息上，只有我的Windows分区是有标签的，浏览我的文件管理器可以看到每一个分区都有一个通用的名称。

无标签的分区

###用e2label编辑Linux文件系统标签

查找**lsblk**命令的输出我可以看到我的Linux Mint安装在/dev/sda3分区上，我的/home分区是在/dev/sda5分区上，和我的Xubuntu安装在/dev/sda7分区上。我在root权限下用[e2label][2]命令给在这些分区分配标签。

    sudo e2label /dev/sda3 Mint
    sudo e2label /dev/sda5 Home
    sudo e2label /dev/sda7 Xubuntu

如果我现在查看**blkid**命令的输出，

sudo blkid -c /dev/null

    /dev/sda1: LABEL="WINRE" UUID="80AE-9D55" TYPE="vfat" 
    /dev/sda2: LABEL="OS_Install" UUID="E468676968673A06" TYPE="ntfs" 
    /dev/sda3: UUID="012ff341-f854-4c4f-8bbd-bbc810121fe6" TYPE="ext4" LABEL="Mint" 
    /dev/sda5: UUID="ec0fe4d1-e21c-407d-8374-aa4b470519da" TYPE="ext3" LABEL="Home" 
    /dev/sda6: UUID="ee275431-64b2-4f55-b958-4055147cdf4e" TYPE="swap" 
    /dev/sda7: UUID="99feb5c5-25a6-47a3-aa2c-6d466c0094ab" TYPE="ext4" LABEL="Xubuntu"

我可以看到标签已经被应用了。检查我的文件管理器我同样可以看到我10.0GB的分区现在显示的是Xubuntu标签。

###提示

你同样可以用**e2label**命令来查看单独的分区标签，如查看分区5.

	sudo e2label /dev/sda5

删除分区5的标签

	sudo e2label /dev/sda5 ""

这个教程写自[Linerd][3]和最初发表在[Tux Tweaks][4]上http://tuxtweaks.com/2013/08/edit-a-linux-file-system-label/

via: http://tuxtweaks.com/2013/08/edit-a-linux-file-system-label/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Luny][] 校对：[Caroline][]


[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Luny]:http://linux.cn/space/14455/
[校对者ID]:http://linux.cn/space/校对者ID
