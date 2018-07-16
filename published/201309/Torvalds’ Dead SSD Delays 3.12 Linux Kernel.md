Torvalds的SSD硬盘故障 延迟Linux 内核3.12发布
===========================================

本周的前几天，Linux的首席架构师Linus Torvalds的工作站的SSD硬盘突然发生了故障，导致[Linux 3.12 内核][1]开发受到了影响。

在一份标题为“RIP-硬盘故障”的消息中，Linux的创始人要求贡献者们重新发送补丁和发起尚未合并到GIT版本库的拉取请求。

Torvalds是全职工作在内核的开发工作中，并保留了决定是否接受新代码的最高权利。

###固态延迟（Solid State Delay，嘲讽SSD固态硬盘）

就在为期两周的合并期结束前的几天，[Torvalds 写到][2]“这段时间简直糟透了，看起来似乎我主工作站的SSD硬盘坏掉了。”

![img](http://www.techweekeurope.co.uk/wp-content/uploads/2013/09/seagate_ssd_3.jpg)
seagate_ssd_3

“我会试一试，看看是否能够恢复硬盘，但是现在我的机子甚至拒绝我查看它的引导扇区，我试着从网络引导，但我并不是很有信心。”

他说他的很多工作并没有白费, 并请社区去检查他们的拉取请求是否已经放到了在git.kernel.org的分支里面。

Torvalds 对他的小伙伴们保证，“万一出现最坏的情况，我会在我的笔记本上做最后几天的合并，无论如何我都计划着把它完成，因为接下来我就旅行去了。”

Linux 内核3.12仍处于早期开发阶段，并且还需要经过适当的测试。这些新改变包括改良的电源管理、新的KVM虚拟化功能、更好的声音驱动、EXT4文件系统以及F2FS文件系统的新功能。


本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/portal.php) 荣誉推出。

译者：[vito](http://linux.cn/space/vito) 校对：[Caroline](http://linux.cn/space/caroline)，[wxy](http://linux.cn/space/wxy)

via: http://www.techweekeurope.co.uk/news/torvalds-dead-ssd-delays-3-12-linux-kernel-126895

[1]:http://www.techweekeurope.co.uk/comment/linux-kernel-greg-kroah-hartman-124957
[2]:http://lkml.indiana.edu/hypermail/linux/kernel/1309.1/01669.html
[3]:https://git.kernel.org/cgit/


