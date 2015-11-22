Linux内核4.0功能：实时内核补丁，支持PS3 
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/10/tuxtuxtux.jpeg)

**Linux Torvalds 在Linux内核邮件列表里[发布][1]了Linux内核新的稳定版。**

Linux 4.0，代号为‘Hurr durr I’m a sheep’，带来了一小系列新硬件支持，驱动改进，性能调整，错误修复等。

但是其实没有太多的更新的必要，Torvalds 写到：

> 功能方面，4.0 并没有那么多特别的。虽然在内核补丁设施上做了很多工作，但事实上[...] 我们在其它版本中有更大的改变。所以这仅仅是一次“按部就班”的发布。

Linus 补充说Linux 4.1 可能是一个“大版本”。 

### Linux内核4.0新功能 ###

**无需重启安装内核更新**

你肯定遇到过内核更新需要重启你的Linux系统而被打断工作，这并不是你一个人遇到的问题。这对于桌面操作系统来说是个小小的不便，对于服务器来说却是大问题。

![内核更新无需重启](http://www.omgubuntu.co.uk/wp-content/uploads/2012/10/update.jpg)

*内核更新无需重启*

实时给Linux内核安装/使用安全补丁而不需要重启，多年来一直是Linux爱好者希望实现的事情。

一些第三方项目，例如[Oracle 的 KSplice][2]和红帽的 Kpatch，已经为一些特定的发行版提供实时补丁的功能。

对于服务器，企业单位以及关键任务正常运行，实现实时内核补丁是一个相当大的问题。

好消息是Linux 4.0 使得重启系统以完成内核更新成为了过去。

如果不是完全不需要重启，也是基本不需要。

在最新的发行版中，实现了支持免重启安装补丁的最初基础，为有经验的系统管理员发挥 Linux 4.0的优势做好了准备。

桌面Linux发行版也应该能够利用这个功能的优势（但考虑到在最终用户端配置免重启功能会比较复杂而有一些路要走）。

在以后的4.x系列中，这个基础功能会持续完善和改进。我希望我们能更多听到它的一些信息。

#### 其它改进 ####

尽管被认为是一次小版本的发布，最新的Linux内核还是带来了一系列的硬件改进，新的驱动以及性能调整。
它们包括：

- 针对Intel ‘Skylake’ 平台的改进
- 支持Intel Quark SoC
- 改善Linux在Playstation 3上运行的系列补丁
- TOpen-source AMD Radeon驱动支持DisplayPort音频
- 各种HID驱动调整，包括Lenovo紧凑型键盘，Wacom Cintiq 27QHD
- 东芝电源设置驱动器增加了USB睡眠/充电功能，快速充电，睡眠/音乐等
- 文件系统调整，包括F2FS, BtrfFS等

### 在Ubuntu上安装Linux内核4.0 ###

尽管被归为稳定版本，但目前而言，**桌面用户和新用户没有必要去升级**。

如果从[Canonical的主线内核文档][3]抓取合适的安装包或者冒着第三方PPA库的风险在Ubuntu 15.04测试版安装Linux4.0，那么这种急躁或者不娴熟可能会带来问题。

Ubuntu 15.04 Vivid Vervet 将在本月晚些时候发布并会附带Ubuntu内核 3.19(Ubuntu的内核是由Linux内核以及一些上游发行版还没有接受的 Ubuntu 特定的补丁组成)。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/04/linux-kernel-4-0-new-features

作者：[Joey-Elijah Sneddon][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://linux.cn/article-5259-1.html
[2]:http://www.omgubuntu.co.uk/2009/10/how-to-install-kernel-updates-without-rebooting
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D
