Xen的十年：从恐龙进化到鸟类
================================================================================
Xen Hypervisor 项目原来是上世纪90年代末[剑桥大学][1] [Xenoserver][2] 项目的子项目。Xenoserver 有一个宏大的目标：

这个宏大目标就是建立一个大规模的分布式计算系统的公共基础框架。想像一下，当 Xenoserver 执行平台布署在全世界范围内，所有人都可以共享可执行代码，代码贡献者可以按代码被执行时产生的硬件消耗收取一定的费用。这将会鼓励负载均衡、消除单点瓶颈，甚至可以在这个平台上实现营利。

在今天，这种模式被称为“云计算”。而 Xen Hypervisor （确切来说是现在的 Xen Hypervisor）是最大的云平台。不仅亚马逊 Web 服务（AWS）和 Rackspace 公有云是基于 Xen 的，就连最近的大规模云平台[Verizon公有云][3]也将 Xen 作为他们的服务供应基础。

### 10周岁生日快乐 ###

2003年10月21日，Xen Hypervisor 在[第19届 ACM 计算机原理研讨会][4]上作为一个开源项目首次出现在大众眼前。距今已经10年，在这里祝 Xen 项目生日快乐！

### 业界第一的劣势：像恐龙一样，不适者淘汰 ###

有时候在自己领域内成为第一个开源项目是一个劣势，为什么这样说？缺少与同行的交流会导致项目失去控制。简单的例子是，缺乏竞争会引发自满情绪，而这种情况已经在 Xen 项目内部发生了！开始几年 Xen 项目未受到任何约束，变得狭隘，不再寻求突破，致使用户和开发者不再对它感兴趣。当它的第一个竞争对手 KVM 出现并壮大，Xen 社区甚至对此反应迟缓。

这种反应带来的后果是，用户难以加入这个项目，并且这个项目不能很好地与 Linux 内核、QEMU及 Linux 发布版共处。然后，Xen 社区名声变坏。然后，Canonical 和 RedHat 抛弃 Xen，投向 KVM 怀抱。Xen 项目向这个不断改变的世界宣告了自己的失败。名声不断变臭，到后来它被视为开源社区界的恐龙，被彻底淘汰只是时间问题。

### 快速转型：从恐龙进化到鸟类 ###

像 Xen 一样能够从众多错误中回过神来的开源项目并不多，而 Xen 通过一系列措施做到了这一点。提出有效的管理方法、努力与其他开源项目合作、重启市场营销力量、踏踏实实与用户和开发者一起工作，这些努力终于让 Xen 获得新生。换句话说，Xen 已经完成从恐龙到鸟类的进化。如果你想知道我们是如何做到这点的，何不加入到我的 Linux 大会欧洲站的课题[Xen 项目：收获的教训][5]？其他你可能感兴趣的课题还有[加强你的 Xen 云的安全][6]和[Xen：专为云设计的开源虚拟机管理程序][7]。

![](http://www.linux.com/images/stories/41373/Xen-flying-Panda.jpg)

*展翅高飞（或者说，给 Xen 这只行动缓慢的熊猫插上翅膀）*

### 展望未来：虚拟化技术的新领域 ###

如果你正在搜索 Xen 项目，你会发现它的社区形式多样并且还在发展。从很多方面来说，它甚至比从前巅峰时期发展得更好。

现在 Xen 社区正在发生一些有意思的事情，一些 Xen 项目下的软件被用于非传统虚拟化技术。这也相应地为 Linux 社区增加了企业用户。在本周晚些时候开始的[Xen 项目开发者峰会][8]中我们将会见到两个安卓虚拟机如何运行在基于 Xen 的 Nexus 10 中，也会见到首次将 Xen 用于车载信息娱乐系统以及汽车应用系统中，同时我们还能见到 Xen 如何为诸如防火墙和NAT服务器这些中间体提供高性能应用。

当然，服务器虚拟化和云计算还有很长的路要走。展翅高飞吧（或者说，给 Xen 这只行动缓慢的熊猫插上翅膀）。

--------------------------------------------------------------------------------

via: http://www.linux.com/news/enterprise/cloud-computing/743330-10-years-of-xen-transforming-a-dinosaur-into-a-bird/

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.cl.cam.ac.uk/research/srg/netos/xen/index.html
[2]:http://www.cl.cam.ac.uk/research/srg/netos/xeno/
[3]:http://www.techweekeurope.co.uk/news/verizon-public-cloud-launch-128724
[4]:http://www.cs.rochester.edu/meetings/sosp2003/papers.shtml
[5]:http://linuxconcloudopeneu2013.sched.org/event/68003c370760bcc2da7e3e8b59b6b50f
[6]:http://linuxconcloudopeneu2013.sched.org/event/37ecfe02561cf264a02061d1927da26c
[7]:http://linuxconcloudopeneu2013.sched.org/event/bdca1274d9799646cdf2934dbde94ccd
[8]:http://www.linux.com/news/software/applications/742053-a-great-line-up-of-speakers-at-xen-project-developer-summit
