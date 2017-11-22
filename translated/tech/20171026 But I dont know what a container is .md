很遗憾，我也不知道什么是容器！
========================


![But I dont know what a container is!](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/container-ship.png?itok=pqZYgQ7K "But I don't know what a container is")

> 题图抽象的形容了容器和虚拟机是那么的相似，又是那么的不同！

在近期的一些会议和学术交流会上，我一直在讲述有关 DevOps 的安全问题（亦称为 DevSecOps）^注1 。通常，我首先都会问一个问题：“在座的各位有谁知道什么是容器吗？” 通常并没有很多人举手^注2 ，所以我都会先简单介绍一下什么是容器^注3 ，然后再进行深层次的讨论交流。

更准确的说，在运用 DevOps 或者 DevSecOps 的时候，容器并不是必须的。但容器能很好的融于 DevOps 和 DevSecOps 方案中，结果就是，虽然不用容器便可以运用 DevOps ，但我还是假设大部分人依然会使用容器。

### 什么是容器

几个月前的一个会议上，一个同事正在容器上操作演示，因为大家都不是这个方面的专家，所以该同事就很简单的开始了他的演示。他说了诸如“在 Linux 内核源码中没有一处提及到<ruby>容器<rt>container</rt></ruby>。“之类的话。事实上，在这样的特殊群体中，这种描述表达是很危险的。就在几秒钟内，我和我的老板（坐在我旁边）下载了最新版本的内核源代码并且查找统计了其中 “container” 单词出现的次数。很显然，这位同事的说法并不准确。更准确来说，我在旧版本内核（4.9.2）代码中发现有 15273 行代码包含 “container” 一词^注4 。我和我老板会心一笑，确认同事的说法有误，并在休息时纠正了他这个有误的描述。

后来我们搞清楚同事想表达的意思是 Linux 内核中并没有明确提及容器这个概念。换句话说，容器使用了 Linux 内核中的一些概念、组件、工具以及机制，并没有什么特殊的东西；这些东西也可以用于其他目的^注 5 。所以才有会说“从 Linux 内核角度来看，并没有容器这样的东西。”

然后，什么是容器呢？我有着虚拟化（<ruby>管理器<rt>hypervisor</rt></ruby>和虚拟机）技术的背景，在我看来， 容器既像虚拟机（VM）又不像虚拟机。我知道这种解释好像没什么用，不过请听我细细道来。

### 容器和虚拟机相似之处有哪些？

容器和虚拟机相似的一个主要方面就是它是一个可执行单元。将文件打包生成镜像文件，然后它就可以运行在合适的主机平台上。和虚拟机一样，它运行于主机上，同样，它的运行也受制于该主机。主机平台为容器的运行提供软件环境和硬件资源（诸如 CPU 资源、网络环境、存储资源等等），除此之外，主机还需要负责以下的任务：

1. 为每一个工作单元（这里指虚拟机和容器）提供保护机制，这样可以保证即使某一个工作单元出现恶意的、有害的以及不能写入的情况时不会影响其他的工作单元。
2. 主机保护自己不会受一些恶意运行或出现故障的工作单元影响。

虚拟机和容器实现这种隔离的原理并不一样，虚拟机的隔离是由管理器对硬件资源划分，而容器的隔离则是通过 Linux 内核提供的软件功能实现的^注6 。这种软件控制机制通过不同的“命名空间”保证了每一个容器的文件、用户以及网络连接等互不可见，当然容器和主机之间也互不可见。这种功能也能由 SELinux 之类软件提供，它们提供了进一步隔离容器的功能。

### 容器和虚拟机不同之处又有哪些？

以上描述有个问题，如果你对<ruby>管理器<rt>hypervisor</rt></ruby>机制概念比较模糊，也许你会认为容器就是虚拟机，但它确实不是。

首先，最为重要的一点^注7 ，容器是一种包格式。也许你会惊讶的反问我“什么，你不是说过容器是某种可执行文件么？” 对，容器确实是可执行文件，但容器如此迷人的一个主要原因就是它能很容易的生成比虚拟机小很多的实体化镜像文件。由于这些原因，容器消耗很少的内存，并且能非常快的启动与关闭。你可以在几分钟或者几秒钟（甚至毫秒级别）之内就启动一个容器，而虚拟机则不具备这些特点。

正因为容器是如此轻量级且易于替换，人们使用它们来创建微服务——应用程序拆分而成的最小组件，它们可以和一个或多个其它微服务构成任何你想要的应用。假使你只在一个容器内运行某个特定功能或者任务，你也可以让容器变得很小，这样丢弃旧容器创建新容器将变得很容易。我将在后续的文章中继续跟进这个问题以及它们对安全性的可能影响，当然，也包括 DevSecOps 。

希望这是一次对容器的有用的介绍，并且能带动你有动力去学习 DevSecOps 的知识（如果你不是，假装一下也好）。

---

- 注 1：我觉得 DevSecOps 读起来很奇怪，而 DevOpsSec 往往有多元化的理解，然后所讨论的主题就不一样了。
- 注 2：我应该注意到这不仅仅会被比较保守、不太喜欢被人注意的英国听众所了解，也会被加拿大人和美国人所了解，他们的性格则和英国人不一样。
- 注 3：当然，我只是想讨论 Linux 容器。我知道关于这个问题，是有历史根源的，所以它也值得注意，而不是我故弄玄虚。
- 注 4：如果你感兴趣的话，我使用的是命令 `grep -ir container linux-4.9.2 | wc -l`
- 注 5：公平的说，我们快速浏览一下，一些用途与我们讨论容器的方式无关，我们讨论的是 Linux 容器，它是抽象的，可以用来包含其他元素，因此在逻辑上被称为容器。
- 注 6：也有一些巧妙的方法可以将容器和虚拟机结合起来以发挥它们各自的优势，那个不在我今天的主题范围内。
- 注 7：很明显，除了我们刚才介绍的执行位。

*原文来自 [Alice, Eve, and Bob—a security blog][7] ，转载请注明*

（题图： opensource.com ）

---

**作者简介**：

原文作者 Mike Bursell 是一名居住在英国、喜欢威士忌的开源爱好者， Red Hat 首席安全架构师。其自从 1997 年接触开源世界以来，生活和工作中一直使用 Linux （尽管不是一直都很容易）。更多信息请参考作者的博客 https://aliceevebob.com ，作者会不定期的更新一些有关安全方面的文章。



---

via:  https://opensource.com/article/17/10/what-are-containers

作者：[Mike Bursell][a]
译者：[jrglinux](https://github.com/jrglinux)
校对：[wxy](https://github.com/wxy)

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









