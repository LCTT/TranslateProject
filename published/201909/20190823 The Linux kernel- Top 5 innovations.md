[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11368-1.html)
[#]: subject: (The Linux kernel: Top 5 innovations)
[#]: via: (https://opensource.com/article/19/8/linux-kernel-top-5-innovations)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Linux 内核的五大创新
======

> 想知道什么是 Linux 内核上真正的（不是那种时髦的）创新吗？

![](https://img.linux.net.cn/data/attachment/album/201909/21/093858no01oh78v111r3zt.jpg)

在科技行业，*创新*这个词几乎和*革命*一样到处泛滥，所以很难将那些夸张的东西与真正令人振奋的东西区分开来。Linux 内核被称为创新，但它又被称为现代计算中最大的奇迹，一个微观世界中的庞然大物。

撇开营销和模式不谈，Linux 可以说是开源世界中最受欢迎的内核，它在近 30 年的生命时光当中引入了一些真正的规则改变者。

### Cgroups（2.6.24）

早在 2007 年，Paul Menage 和 Rohit Seth 就在内核中添加了深奥的[控制组（cgroups）][2]功能（cgroups 的当前实现是由 Tejun Heo 重写的）。这种新技术最初被用作一种方法，从本质上来说，是为了确保一组特定任务的服务质量。

例如，你可以为与你的 WEB 服务相关联的所有任务创建一个控制组定义（cgroup），为例行备份创建另一个 cgroup ，再为一般操作系统需求创建另一个 cgroup。然后，你可以控制每个组的资源百分比，这样你的操作系统和 WEB 服务就可以获得大部分系统资源，而你的备份进程可以访问剩余的资源。

然而，cgroups 如今变得这么著名是因其作为驱动云技术的角色：容器。事实上，cgroups 最初被命名为[进程容器][3]。当它们被 [LXC][4]、[CoreOS][5] 和 Docker 等项目采用时，这并不奇怪。

就像闸门打开后一样，“容器” 一词就像成为了 Linux 的同义词一样，微服务风格的基于云的“应用”概念很快成为了规范。如今，已经很难摆脱 cgroups 了，它们是如此普遍。每一个大规模的基础设施（如果你运行 Linux 的话，可能还有你的笔记本电脑）都以一种合理的方式使用了 cgroups，这使得你的计算体验比以往任何时候都更加易于管理和灵活。

例如，你可能已经在电脑上安装了 [Flathub][6] 或 [Flatpak][7]，或者你已经在工作中使用 [Kubernetes][8] 和/或 [OpenShift][9]。不管怎样，如果“容器”这个术语对你来说仍然模糊不清，则可以 [通过 Linux 容器从背后][10]获得对容器的实际理解。

### LKMM（4.17）

2018 年，Jade Alglave、Alan Stern、Andrea Parri、Luc Maranget、Paul McKenney 以及其他几个人的辛勤工作的成果被合并到主线 Linux 内核中，以提供正式的内存模型。Linux 内核内存[一致性]模型（LKMM）子系统是一套描述 Linux 内存一致性模型的工具，同时也产生用于测试的用例（特别命名为 klitmus）。

随着系统在物理设计上变得越来越复杂（增加了更多的中央处理器内核，高速缓存和内存增长，等等)，它们就越难知道哪个中央处理器需要哪个地址空间，以及何时需要。例如，如果 CPU0 需要将数据写入内存中的共享变量，并且 CPU1 需要读取该值，那么 CPU0 必须在 CPU1 尝试读取之前写入。类似地，如果值是以一种顺序方式写入内存的，那么期望它们也以同样的顺序被读取，而不管哪个或哪些 CPU 正在读取。 

即使在单个处理器上，内存管理也需要特定的任务顺序。像 `x = y` 这样的简单操作需要处理器从内存中加载 `y` 的值，然后将该值存储在 `x` 中。在处理器从内存中读取值之前，是不能将存储在 `y` 中的值放入 `x` 变量的。此外还有地址依赖：`x[n] = 6` 要求在处理器能够存储值 `6` 之前加载 `n`。

LKMM 可以帮助识别和跟踪代码中的这些内存模式。它部分是通过一个名为 `herd` 的工具来实现的，该工具（以逻辑公式的形式）定义了内存模型施加的约束，然后列举了与这些约束一致性的所有可能的结果。

### 低延迟补丁（2.6.38）

很久以前，在 2011 年之前，如果你想[在 Linux 上进行多媒体工作][11]，你必须得有一个低延迟内核。这主要适用于[录音][12]时添加了许多实时效果（如对着麦克风唱歌和添加混音，以及在耳机中无延迟地听到你的声音）。有些发行版，如 [Ubuntu Studio][13]，可靠地提供了这样一个内核，所以实际上这没有什么障碍，这只不过是当艺术家选择发行版时的一个重要提醒。

然而，如果你没有使用 Ubuntu Studio，或者你需要在你的发行版提供之前更新你的内核，你必须跳转到 rt-patches 网页，下载内核补丁，将它们应用到你的内核源代码，编译，然后手动安装。

后来，随着内核版本 2.6.38 的发布，这个过程结束了。Linux 内核突然像变魔术一样默认内置了低延迟代码（根据基准测试，延迟至少降低了 10 倍)。不再需要下载补丁，不用编译。一切都很顺利，这都是因为 Mike Galbraith 编写了一个 200 行的小补丁。

对于全世界的开源多媒体艺术家来说，这是一个规则改变者。从 2011 年开始事情变得如此美好，到 2016 年我自己做了一个挑战，[在树莓派 v1（型号 B）上建造一个数字音频工作站（DAW）][14]，结果发现它运行得出奇地好。

### RCU（2.5）

RCU，即<ruby>读-拷贝-更新<rt>Read-Copy-Update</rt></ruby>，是计算机科学中定义的一个系统，它允许多个处理器线程从共享内存中读取数据。它通过延迟更新但也将它们标记为已更新来做到这一点，以确保数据读取为最新内容。实际上，这意味着读取与更新同时发生。

典型的 RCU 循环有点像这样：

1. 删除指向数据的指针，以防止其他读操作引用它。
2. 等待读操作完成它们的关键处理。
3. 回收内存空间。

将更新阶段划分为删除和回收阶段意味着更新程序会立即执行删除，同时推迟回收直到所有活动读取完成（通过阻止它们或注册一个回调以便在完成时调用）。

虽然 RCU 的概念不是为 Linux 内核发明的，但它在 Linux 中的实现是该技术的一个定义性的例子。

### 合作（0.01）

对于 Linux 内核创新的问题的最终答案永远是协作。你可以说这是一个好时机，也可以称之为技术优势，称之为黑客能力，或者仅仅称之为开源，但 Linux 内核及其支持的许多项目是协作与合作的光辉范例。

它远远超出了内核范畴。各行各业的人都对开源做出了贡献，可以说都是因为 Linux 内核。Linux 曾经是，现在仍然是[自由软件][15]的主要力量，激励人们把他们的代码、艺术、想法或者仅仅是他们自己带到一个全球化的、有生产力的、多样化的人类社区中。

### 你最喜欢的创新是什么？

这个列表偏向于我自己的兴趣：容器、非统一内存访问（NUMA）和多媒体。无疑，列表中肯定缺少你最喜欢的内核创新。在评论中告诉我。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-kernel-top-5-innovations

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://en.wikipedia.org/wiki/Cgroups
[3]: https://lkml.org/lkml/2006/10/20/251
[4]: https://linuxcontainers.org
[5]: https://coreos.com/
[6]: http://flathub.org
[7]: http://flatpak.org
[8]: http://kubernetes.io
[9]: https://www.redhat.com/sysadmin/learn-openshift-minishift
[10]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[11]: http://slackermedia.info
[12]: https://opensource.com/article/17/6/qtractor-audio
[13]: http://ubuntustudio.org
[14]: https://opensource.com/life/16/3/make-music-raspberry-pi-milkytracker
[15]: http://fsf.org
