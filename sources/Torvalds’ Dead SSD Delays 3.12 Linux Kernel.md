Torvalds’ SSD故障 延迟Linux 内核3.12发布
===========================================

前几周，总设计师Linus Torvalds SSD硬盘在其工作站突然故障导致[Linux 3.12 内核][1] 遭受失败.

在标题为’RIP-硬盘故障’的文章中，开源创始人说道，作者的补丁和请求还未整合到内核git仓库中.

Torvalds全部工作时间都在内核上，并保留最高权利去决定新代码的加入.

###固体继电器

“这简直糟透了，但它看起来在我的主工作站的SSD硬盘上刚刚故障,” [Torvalds 写到][2], 前几天刚刚结束为期两周的窗口合并.

![img](http://www.techweekeurope.co.uk/wp-content/uploads/2013/09/seagate_ssd_3.jpg)
seagate_ssd_3

“我试试，看看我是否可以恢复硬盘，但现在我的机器甚至拒绝我查看它的引导扇区，并试图从网络引导. 所以我并没有信心.”

开发者说他没有白费很多工作, 如果他们的请求在[git.kernel.org][3]的当前树上上传，由社区去检查 .

“万一出现最坏的情况, 在接下来的日子里我会合上笔记本电脑，去旅行,” Torvalds 对他的同事们保证.

Linux 内核3.12仍处于早期发展阶段，并且要经过适当的测试。一些变化包括改良的电源管理，新的KVM虚拟化功能，更好的声音驱动，EXT4文件系统和F2FS文件系统的新功能.


via: http://www.techweekeurope.co.uk/news/torvalds-dead-ssd-delays-3-12-linux-kernel-126895

[1]:http://www.techweekeurope.co.uk/comment/linux-kernel-greg-kroah-hartman-124957
[2]:http://lkml.indiana.edu/hypermail/linux/kernel/1309.1/01669.html
[3]:https://git.kernel.org/cgit/


