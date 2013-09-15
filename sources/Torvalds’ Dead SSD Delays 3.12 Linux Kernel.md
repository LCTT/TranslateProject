Torvalds’ SSD故障 延迟Linux 内核3.12发布
===========================================

本周的前几天，总设计师Linus Torvalds的SDD硬盘在其工作站的突然故障，导致[Linux 3.12 内核][1]开发受挫。

在一篇标题为“RIP-硬盘坏死”的文中，开源操作系统的创始人要求贡献者重新发送补丁以及还未整合到内核Git仓库的请求。

Torvalds全身心投入到内核工作中，并保留最高权利去决定新代码的加入。

###固体继电器

就在为期两周的窗口合并结束前的几天，[Torvalds 写到][2]“这时间简直糟透了，看起来似乎我主工作站的SSD硬盘坏掉了。”

![img](http://www.techweekeurope.co.uk/wp-content/uploads/2013/09/seagate_ssd_3.jpg)
seagate_ssd_3

“我会试一试，看看是否能够恢复硬盘，但是现在我的机子甚至拒绝我查看它的引导扇区，我试着从网络引导，所以我并不是信心十足。”

开发者说他的很多工作没有白费, 并请社区去检查是否他们的请求在git.kernel.org的当前树状上传。

Torvalds 对他的同事们保证“万一出现最坏的情况，我会在我的笔记本上做最后几天的窗口合并，无论如何我都计划着把它完成，因为接下来我就要踏上我的旅行。”

Linux 内核3.12仍处于早期发展阶段，并且要经过适当的测试。一些变化包括改良的电源管理，新的KVM虚拟化功能，更好的声音驱动，EXT4文件系统和F2FS文件系统的新功能.


via: http://www.techweekeurope.co.uk/news/torvalds-dead-ssd-delays-3-12-linux-kernel-126895

[1]:http://www.techweekeurope.co.uk/comment/linux-kernel-greg-kroah-hartman-124957
[2]:http://lkml.indiana.edu/hypermail/linux/kernel/1309.1/01669.html
[3]:https://git.kernel.org/cgit/


