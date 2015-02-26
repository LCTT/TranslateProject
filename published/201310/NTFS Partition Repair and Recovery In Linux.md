<<<<<<< HEAD
NTFS Partition Repair and Recovery In Linux
Linux下的NTFS分区修复与恢复
================================================================================
Once again we find ourselves in the unenviable position of bailing out one of our Windows friends/family/acquaintances/business associates or other assorted persons. Although we don’t have their particular day to day challenges, we do often find that we are the “go to” person when they have issues. Heaven forbid, we may have even had our own issues with our Windows partition/drive (after all, we have to game sometime and despite the efforts of Steam, Linux just isn’t a gamer’s dream yet). Let’s take a look at a couple of scenarios that may come up that we can fix with our handy Linux distribution and some of the NTFS partition recovery tools at our disposal.

当我们逃离我们的windows的朋友/家人/熟人/工作社交关系或者其他什么人的时候，我们再一次感到我们自己处在了一个尴尬的位置。尽管我们没有特别的日复一日挑战，但是我们会发现当他们发生什么事情的时候我们就像是一个局外人一样。尽管如此，我们自己也会出现windows分区/磁盘方面的突发事件（毕竟我们有时还要打打游戏，而且尽管付出了很大的努力，Linux也还不是一个游戏爱好者的最理想的选择）。现在让我们来瞥一眼可能会发生的场景，我们能够通过手头的Linux以及一些我们可以使用的NTFS分区恢复工具来进行修复。

**Just Fix It**
浅谈修复

Windows systems generally tolerate unscheduled “hard boots” (power outages, turning off the power strip or caused by the fingers of the resident little person) pretty well. In fact, to this day, often the most effective means of fixing a Windows desktop problem is to simply reboot the system. However, on occasion, the Windows partition will indicate that it needs the drive checked for consistency. Not doing so after a few reboots can cause whatever festering file system problem there is to get worse. Windows file system checks are notoriously slow and often have to be done multiple times before they clear the “dirty” flag on the filesystem.

Windows系统通常可以对非预定的“硬启动”（如电池耗完、关掉电源或小孩的手指）具有很好的容忍能力。实际上，现在最有效地修复windows桌面问题的方法就是简单地重启系统。然而，在某些时候，windows分区会显示其需要进行磁盘一致性检查。如果在几次重启之后不进行磁盘检查的话，会是的文件系统的问题更加恶化。众所周知，windows的文件系统检查很慢，而且在其清理文件系统上的“脏”标记之前经常需要进行多次检查。

Enter a little utility called ‘ntfsfix’ which can be downloaded for Debian based systems (i.e. Ubuntu) as follows:

在这里引入一个小巧而使用的工具“ntfsfix”，该工具可以在基于Debian的操作系统（如Ubuntu）上通过下面的方式进行下载：
    sudo apt-get install ntfsfix

or RPM based systems (i.e. Red Hat or CentOS):
而对于基于RPM的操作系统（如Red Hat或CentOS），采用以下方式：
    sudo yum install ntfsfix

The ‘ntfsfix’ utility will QUICKLY fix common errors and NTFS inconsistencies. The most common ones without any parameters. It will also report back items not fixed that we can address by passing in the following:

“ntfsfix”可以很快地修复常见的错误以及NTFS不一致问题，处理经常遇到的一些问题不需要任何参数。同时，在我们也可以通过传递下面的参数来让它反馈没有修复的项目使得可以进行定位：

- -b: clears bad sectors on the disk (can be used when cloning an older disk to a newer one)
  -b:清理掉磁盘上坏的扇区（在将旧的硬盘复制到新的磁盘时会用到）
- -d: clear the “dirty” flag, the most common reason that Linux may not mount a Windows partition, usually happens when Windows did not successfully shut down before being powered off
  -d:清理掉 “脏”标志，”脏“标志通常是Linux系统不能挂在windows分区问题的主要原因，一般在掉电之前没有成功关机时发生。
- -n: does nothing but display to standard out what it would have done (in other words, what repair needed to be made)
  -n:除了在屏幕上输出其将要完成的事情之外，没有做任何事情（换句话说，告诉你需要进行哪些修复）

I have had the NTFS Disk Check that starts before Windows take hours to simply get around to resetting the “dirty” flag on a drive during boot whereas ‘ntfsfix’ completes that activity in about three seconds.

 我曾在windows上进行NTFS磁盘检查时，仅仅在启动时重设”脏“标志就花费了几个小时，而”ntfsfix”完成这个活动只需要大约3秒。

**Deeper Dive**
深入修复

Unfortunately, not everything can be fixed quickly. In fact, there are a very large number of very expensive disk recovery software (often under the category of “disk forensics” since they are employed by investigators when sifting through damaged drives) for fixing drives that power up but won’t boot or provide file system access.

不幸的是，不是所有的问题都能够快速地修复。实际上，有大量的昂贵的磁盘修复软件通过提供文件访问或者在通电状态而不是启动时来修复磁盘。

There is a fantastic, and free, utility (and fully bootable rescue CD if it is inside your local computer) for recovering your Windows NTFS partition (and it can do EXT2/3/4, FAT/FAT32/exFAT, HFS and SunFS filesystems too). This utility is called [TestDisk][1] and is available in Debian and CentOS repositories under that name. Red Hat does not make this utility available in their repositories, however, it can easily be installed.

有一个非常出色而且免费的实用工具（而且完全可以启动的拯救CD盘）来对你的Windows分区进行恢复（而且它同样能够适用于EXT2/3/4、FAT/FAT32/exFAT、HFS和SunFS文件系统）。这个工具的名称为‘TestDisk’，在Debian和CentOS软件库中的那个名称下可以使用。Red Hat 没有将这个工具引入到其软件库中，然而可以很简单地进行安装。
在基于Debian系统中，通过以下命令进行安装：
    sudo apt-get install testdisk
在基于RPM系统中（如Red Hat 或 CentOS），可以通过下面的方式进行安装：
or RPM based systems (i.e. Red Hat or CentOS):

    sudo yum install testdisk

I cannot say enough good things about this utility. If the drive powers on and spins up, even if it has physical damage, odds are this little baby will get some of your files off of it. You start it up by issuing a plain old “sudo testdisk /dev/sdX” where ‘X’ is your drive and then you will see something like this:

对于该工具的好处我怎么说都说不完，如果磁盘通电之后快速自转，尽管有物理损坏，奇怪的是这个小家伙会将一些你的文件从其中取出来。你通过发出一个纯旧式的“sudo testdisk /dev/sdX”命令来启动它，就会看到像下面东东：
![](http://blog.linuxacademy.com/wp-content/uploads/2013/08/testdisk2.jpg)

*TestDisk Running in a Terminal*
终端中运行testdisk

Use of the tool is as simple as following the menu prompts. This is interactive, it will scan whatever partition you indicate and then present you with the rebuilt directory and file list which you can then mark and restore to another disk/partition. I have successfully recovered files from Windows, OSX and Linux partitions that were either unbootable for one reason or another or had the dreaded “click of doom” that indicates your drive is not long for this world.

通过利用菜单提示的方式来使用这个工具可以非常简单。这是一个交互式的，可以扫描你指定的任何分区，而且为你展示重构之后的目录和文件列表，这样你可以标记和另存到另外一个磁盘或分区中。我成功从对于windows，osx和linux 分区由于一个又一个原因导致的不能启动或可怕的“末日点击”显示你的磁盘不再属于这个世界等状态进行了恢复。

In all fairness, you cannot expect 100% recovery rate especially if you drive has damage, but anything is better than nothing and it doesn’t cost as much (read: nothing) as sending it to a recovery specialist. Get this tool now if you have drive problems.

平心而论，你不可能要求能够恢复100%，特别在你的磁盘已经损坏的情况下，但是有总比没有要好，而且找一个恢复专家也不会有太多成本。如果你有磁盘问题，带上这个小家伙吧。

**Final Thoughts**
最后的思索

Drive recovery is a lot easier, and certainly a lot cheaper when you use Linux, either connecting to the drive in question using a USB cradle or booting from a Live CD with the rescue tools installed on CD. Everything we talked about in this article is freely available and under active development (updated). Leave us a comment below and indicate what tools you have had to use to recover from your drive problems.

当你使用linux时，无论是通过将其通过USB连接问题磁盘还是通过启动安装有恢复工具的Live CD,磁盘恢复变得非常简单而且便宜。本文中所讨论的所有事情都是可以随手可得的而且不断地积极开发的（不断更新的）。最后将你在回复磁盘问题中所使用的的工具通过评论告诉我们。
=======
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

<<<<<<< HEAD:translated/NTFS Partition Repair and Recovery In Linux.md
>>>>>>> upstream/master
=======
当你使用Linux的时候，磁盘修复要容易得多，当然也便宜的多，要么用USB转接器连接有问题的磁盘，要么从一个LiveCD启动，然后用CD里面的修复工具。本文中我们谈到的所有的工具都是免费使用，而且是在持续开发（更新）中。您可以在下面留言，谈一下你曾经不得不使用什么工具来从您磁盘的问题中恢复。

---
>>>>>>> ceb65922fa430335b090705fa1013365267f6abd:published/201310/NTFS Partition Repair and Recovery In Linux.md

via: http://blog.linuxacademy.com/linux/ntfs-partition-repair-and-recovery-in-linux/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

<<<<<<< HEAD
译者：[桂生][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.cgsecurity.org/wiki/TestDisk
=======
译者：[younel0925][] 校对：[jasminepeng][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[younel0925]:http://linux.cn/space/younel0925
[jasminepeng]:http://linux.cn/space/jasminepeng

[1]:http://www.cgsecurity.org/wiki/TestDisk
>>>>>>> upstream/master
