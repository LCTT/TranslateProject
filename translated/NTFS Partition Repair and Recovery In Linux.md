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

via: http://blog.linuxacademy.com/linux/ntfs-partition-repair-and-recovery-in-linux/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[桂生][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.cgsecurity.org/wiki/TestDisk
