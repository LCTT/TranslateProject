并行文件系统 BeeGFS 现已开源
==================================================

![](http://insidehpc.com/wp-content/uploads/2015/08/beegfs.jpg)

2月23日 ThinkParQ 宣布完整的 [BeeGFS 并行文件系统][1] 的源码现已开源。由于 BeeGFS 是专为要求性能的环境开发的，所以它在开发时十分注重安装的简易性以及高度灵活性，包括融合了在存储服务器同时做计算任务时需要的设置。随着系统中的服务器以及存储设备的增加，文件系统的容量以及性能将是需求的拓展点，无论是小型集群还是多达上千个节点的企业级系统。

官方第一次声明开放 BeeGFS 的源码是在 2013 年的国际超级计算大会上发布的。这个声明是在欧洲的百亿亿次级超算项目 [DEEP-ER][2] 的背景下做出的，在这个项目里为了得到更好的 I/O 要求，做出了一些新的改进。对于运算量高达百亿亿次的系统，不同的软硬件必须有效的协同工作才能得到最佳的拓展性。因此，开源 BeeGFS 是让一个百亿亿次的集群的所有组成部分高效的发挥作用的一步。

“当我们的一些用户对于 BeeGFS 十分容易安装并且不用费心管理而感到高兴时，另外一些用户则想要知道它是如何运行的以便于更好的优化他们的应用，使得他们可以监控它或者把它移植到其他的平台上，比如 BSD，” Sven Breuner 说道，他是 ThinkParQ （BeeGFS 背后的公司）的 CEO，“而且，把 BeeGFS 移植到其他的非 X86 架构，比如 ARM 或者 Power，也是社区即将要做的一件事。”

对于未来的采购来说，ARM 技术的稳步发展确实使得它成为了一个越来越有趣的技术。因此， BeeGFS 的团队也参与了 [ExaNeSt][3]，一个来自欧洲的新的百亿亿次级超算计划，这个计划致力于使 ARM 的生态能为高性能的工作负载做好准备。“尽管现在 BeeGFS 在 ARM 处理器上可以算是开箱即用，这个项目也将给我们机会来证明我们在这个架构上也能完全发挥其性能。”， Bernd Lietzow ， BeeGFS 中 ExaNeSt 的领导者补充道。

作为一个有着 25 K 行 C++ 代码的元数据服务以及约 15 K 行存储服务的项目，BeeGFS 相对比较容易理解和拓展，不只是对于大神，对于对文件系统有兴趣的大学生也是这样。在 GitHub 上已经有很多的为 BeeGFS 写的项目，比如基于浏览器的监控或者 Docker 一体化。
 
 有关新闻显示， [BeeGFS 用户大会][4]将于 5 月 18-19 日在德国凯泽斯劳滕举行。
 
 -----------------------------------------------------------------------------------------

via: http://insidehpc.com/2016/02/beegfs-parallel-file-system-now-open-source/

作者：[staff][a]
译者：[name1e5s](https://github.com/name1e5s)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://insidehpc.com/author/staff/
[1]: http://www.beegfs.com/
[2]: http://www.deep-project.eu/deep-project/EN/Home/home_node.html
[3]: http://www.exanest.eu/
[4]: http://www.beegfs.com/content/user-meeting-2016/
