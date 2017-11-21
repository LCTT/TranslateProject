## 很遗憾，我也不知道什么是容器！



**下图抽象的形容了 containers 容器和虚拟机是那么的相似，又是那么的不同！**（图片来自 opensource.com ）

![Alt 图片来自opensource.com](container.png)

在近期的一些会议和学术交流会上，我一直在讲述有关 DevOps（还有 DevSecOps ）的安全问题。通常，我首先都会问一个问题：“在座的各位有谁知道什么是 containers 容器？” 通常并没有很多人举手，所以我都会先简单介绍一下什么是 containers 容器，然后再进行深层次的讨论交流。

更准确的说，在运用 DevOps 或者 DevSecOps 的时候，containers 容器并不是必须的。但 containers 容器能很好的融于 DevOps 和 DevSecOps 方案中，结果就是，虽然不用 containers 便可以运用 DevOps ，但我还是假设大部分人依然会使用 containers 容器。

---

### 什么是 container 容器？

Linux Containers（译者注：LXC 容器工具）

* 什么是 Linux containers ?
* 什么是 Docker ？
* 什么是 Kubernetes ？
*  container 术语的简介

几个月前的一个会议上，一个同事正在 containers 容器上操作演示，因为大家都不是这个方面的专家，所以该同事就很简单的开始了他的演示。他说道：“在 Linux 内核源码中没有一处提及到 containers 。“ 事实上，在这样的特殊群体中，这种描述表达是很危险的。就在几秒钟内，我和我的老板（坐在我旁边）下载了最新版本的内核源代码并且查找统计了其中 ” container “ 单词出现的次数。很显然，这位同事的说法并不准确。更准确来说，我在旧版本内核（ 4.9.2 ）代码中发现有 15273 行代码包含” container “一词。我和我老板会面一笑，确认同事的说法有误，并在休息时纠正了他这个有误的描述。

后来我们搞清楚同事想表达的意思是 Linux 内核中并没有提及 container 容器这个概念。换句话说， container 容器使用了 Linux 内核中的一些概念、组件、工具以及机制，并没有什么特殊的东西；这些东西也可以用于其他目的。所以才有会说“从 Linux 内核角度来看，并没有 container 容器这样的东西。“

然后，什么是 container 容器呢？我有着虚拟化— hypervisor 以及虚拟机技术的背景，在我看来， containers 容器既像虚拟机（ VMs ）又不像虚拟机。我知道这种解释好像没什么用，不过请听我细细道来。

---

### container 容器和 VM 相似之处有哪些？

container 容器和 VM 相似的一个主要方面就是容器是一群可执行文件的合集单元。将文件打包生成可以在相关的主机平台上运行的镜像文件。和虚拟机一样，主机平台为容器的运行提供软件环境和硬件资源（诸如 CPU 资源、网络环境、存储资源等等），除此之外，主机还需要负责以下的任务：

1. 为每一个工作单元（这里指 VM 和 container ）提供保护机制，这样可以保证即使某一个工作单元出现恶意的、有害的以及不能写入的情况时不会影响其他的工作单元。
2. 主机保护自己不会受一些恶意运行或出现故障的工作单元影响。

VM 虚拟机和 container 容器实现以上功能的原理并不一样，虚拟机是对硬件资源虚拟划分，容器则是通过 Linux 内核在软件上实现的虚拟划分。这种软件控制机制通过不同的命名空间保证了每一个容器的文件、用户信息以及网络连接等互不可见，当然容器和主机之间也互不可见。像 SELinux 等软件都能提供类似的功能。

---

### container 容器和 VM 不同之处又有哪些？

以上描述有个问题，如果你对监控机制概念比较模糊，也许你会认为容器就是虚拟机，但它确实不是。

首先，最为重要的一点就是容器是管理包形式的。也许你会惊讶的反问我“什么，你不是说过容器是某种可执行文件么？” 对，容器确实是可执行文件，但容器主要的一个迷人之处就是它能很容易的生成比虚拟机小很多的实体化镜像文件。由于这些原因，容器消耗很少的内存，并且能快速的启动与关闭。你可以在几分钟或者几秒钟（甚至微妙级别）之内就启动一个容器，而虚拟机则不具备这些特点。

正因为容器是如此轻量级且易于替换，人们正在使用它们创建微型任务—应用程序拆分成一些可以互相调用的微型任务以便构建任何你想要的任务。假使你只在一个容器内运行某个特定功能或者任务，那么你可以让容器变得很小，并且丢弃旧容器创建新容器将变得很容易。我将在后续的文章中继续跟进这个问题以及它们对安全性的可能影响，当然，也包括 DevSecOps 。

希望这是一次对容器的有用的介绍，并且能带动你有动力去学习 DevSecOps 的知识（如果你不是，假装一下也好）。

---

我觉得 DevSecOps 读起来很奇怪，而 DevOpsSec 往往有多元化的理解，然后你所讨论的主题就不一样了。

我应该注意到这不仅仅会被比较保守、不太喜欢被人注意的英国听众所了解，也会被加拿大人和美国人所了解，他们的性格则和英国人不一样。

当然，我只是想讨论 Linux 容器。我知道关于这个问题，是有历史根源的，所以它也值得注意，而不是我故弄玄虚。

在你感兴趣的案例中，使用命令 ` grep -ir container linux-4.9.2 | wc -l `

公平的说，我们快速浏览一下，这些用途与我们讨论容器的方式无关，我们讨论的是Linux容器，它是抽象的，可以用来包含其他元素，因此在逻辑上被称为容器。

也有一些巧妙的方法可以将容器和虚拟机结合起来以发挥他们各自的优势，那个不在我今天的主题范围内。

很明显，除了我们刚才介绍的执行位。

*原文来自  Alice, Eve, and Bob—a security blog ，转载请注明*

---

**作者简介**：

原文作者 Mike Bursell 是一名居住在英国、喜欢威士忌的开源爱好者， Red Hat 首席安全架构师。其自从 1997 年接触开源世界以来，生活和工作中一直使用 Linux （尽管不是一直都很容易）。更多信息请参考作者的博客 https://aliceevebob.com，作者会不定期的更新一些有关安全方面的文章。



---

原文链接:  https://opensource.com/article/17/10/what-are-containers

作者：[Mike Bursell][a]
译者：[jrglinux](https://github.com/jrglinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[1]: https://opensource.com/resources/what-are-linux-containers?utm_campaign=containers&amp;intcmp=70160000000h1s6AAA
[2]: https://opensource.com/resources/what-docker?utm_campaign=containers&amp;intcmp=70160000000h1s6AAA
[3]: https://opensource.com/resources/what-is-kubernetes?utm_campaign=containers&amp;intcmp=70160000000h1s6AAA
[4]: https://developers.redhat.com/blog/2016/01/13/a-practical-introduction-to-docker-container-terminology/?utm_campaign=containers&amp;intcmp=70160000000h1s6AAA
[5]: https://opensource.com/article/17/10/what-are-containers?rate=sPHuhiD4Z3D3vJ6ZqDT-wGp8wQjcQDv-iHf2OBG_oGQ
[6]: https://opensource.com/article/17/10/what-are-containers#*******
[7]: https://aliceevebob.wordpress.com/2017/07/04/but-i-dont-know-what-a-container-is/
[8]: https://opensource.com/user/105961/feed
[9]: https://opensource.com/article/17/10/what-are-containers#*
[10]: https://opensource.com/article/17/10/what-are-containers#**
[11]: https://opensource.com/article/17/10/what-are-containers#***
[12]: https://opensource.com/article/17/10/what-are-containers#******
[13]: https://opensource.com/article/17/10/what-are-containers#*****
[14]: https://opensource.com/users/mikecamel
[15]: https://opensource.com/users/mikecamel
[16]: https://opensource.com/article/17/10/what-are-containers#****









