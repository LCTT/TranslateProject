每日Ubuntu小技巧：Ubuntu下一款和Windows磁盘管理一样的工具
================================================================================

对于一些用惯了Windows的用户来说，刚开始接触Ubuntu的时候会面临这样的一个问题，这个问题在很多论坛里面也经常出现，前段时间也有位读者问到相同的问题：

>在 Ubuntu 中有和 Windows 下的磁盘管理一样的工具么？

对于那些不太清楚磁盘管理的用户，下面有个简单介绍。

磁盘管理是一个从 Windows XP 起就有的默认工具，其主要负责磁盘相关的任务，比如：创建和格式化磁盘、初始化磁盘，重新划分磁盘大小和指定分区号以及删除分区。

在 Windows 下用户使用和磁盘分区管理相关的命令行工具进行磁盘操作，这个工具很高大上。

问题是在 Ubuntu 系统下有这样的工具么，答案是肯定滴。

Ubuntu 下有个很相似的软件叫做 GNOME Disk Utility ，这个工具同样能尽心查看/管理你的磁盘分区，以及创建和恢复分区。你同样可以用它进行创建和格式化分区，挂载和卸载卷组以及其它相关的磁盘操作。

尽管这和Windows下的管理工具相似，但是它不允许用户重新定义分区和卷组大小，因为 ubuntu 不支持驱动器号。

所以，想在 Ubuntu 系统下使用类似 windows 下的磁盘管理工具，那就试试 GNOME Disk Utility 吧。

你可以在 Unity Dash 中搜索 **硬盘** ，打开时，它会自己识别你电脑上的外部硬盘和额外的硬盘驱动器。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/dropboxubuntumissingfolder3.png)

一旦驱动器被选择你就可以进行磁盘相关的操作了，比如：格式化、创建分区，管理驱动器。另外在磁盘访问超时情况下一些待机模式的操作。

需要注意的是，当你格式化一个磁盘让它既可以在 Windows 下又可以在 Ubuntu 下使用时，一定要选择 NTFS 文件系统。

那么，在 Ubuntu 下使用磁盘配置你的驱动器吧。

慢慢享用，新年快乐！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-windows-disk-management-equivalent-in-ubuntu/

译者：[Timeszoro](https://github.com/Timeszoro) 校对：[Caroline](https://github.com/carolinewuyan) 

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
