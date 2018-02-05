LinuxKit：在容器中运行容器
============================================================

一些令人振奋的消息引发了我对今年 DockerCon 的兴趣，在这次会议中，无可争议的容器巨头公司 Docker 发布了一个新的操作系统：LinuxKit。

这家容器巨头宣布的是一个灵活的、可扩展的操作系统，而为了可移植性，系统服务也是运行在容器之中。甚至，令人惊讶的是，就连 Docker 运行时环境也是运行在容器内！

在本文中，我们将简要介绍一下 LinuxKit 中所承诺的内容，以及如何自己尝试一下这个不断精简、优化的容器。

### 少即是多

不可否认的是，用户一直在寻找一个可以运行他们的微服务的精简版本的 Linux 。通过容器化，你会尽可能地最小化每个应用程序，使其成为一个适合于运行在其自身容器内的独立进程。但是，由于你需要对那些驻留容器的宿主机出现的问题进行修补，因此你不断地在宿主机间移动容器。实际上，如果没有像 Kubernetes 或 Docker Swarm 这样的编排系统，容器编排几乎总是会导致停机。

不用说，这只是让你保持操作系统尽可能小的原因之一。

我曾多次在不同场合重复过的最喜爱的名言，来自荷兰的天才程序员 Wietse Zweitze，他为我们提供了重要的 Email 软件 Postfix 和 TCP Wrappers 等知名软件。

在 [Postfix 网站][10] 指出，即使你编码和 Wietse 一样小心，“每 1000 行[你]就会在 Postfix 中引入一个额外的 bug”。从我的专业的 DevSecOps 角度看，这里提到的“bug” 可以将其大致看做安全问题。

从安全的角度来看，正是由于这个原因，代码世界中“少即是多”。简单地说，使用较少的代码行有很多好处，即安全性、管理时间和性能。对于初学者来说，这意味着安全漏洞较少，更新软件包的时间更短，启动时间更快。

### 深入观察

考虑下在容器内部运行你的程序。

一个好的起点是 [Alpine Linux][1]，它是一个苗条、精简的操作系统，通常比那些笨重的系统更受喜欢，如 Ubuntu 或 CentOS 等。Alpine 还提供了一个 miniroot 文件系统（用于容器内），最近我看到的大小是惊人的 1.8M。事实上，这个完整的 Linux 操作系统下载后有 80M。

如果你决定使用 Alpine Linux 作为 Docker 基础镜像，那么你可以在 Docker Hub 上[找到][2]一个， 它将其描述为：“一个基于 Alpine Linux 的最小 Docker 镜像，具有完整的包索引，大小只有5 MB！”

据说无处不在的 “Window 开始菜单” 文件也是大致相同的大小！我没有验证过，也不会进一步评论。

讲真，希望你去了解一下这个创新的类 Unix 操作系统（如 Alpine Linux）的强大功能。

### 锁定一切

再说一点，Alpine Linux 是（并不惊人）基于 [BusyBox][3]，这是一套著名的打包了 Linux 命令的集合，许多人不会意识到他们的宽带路由器、智能电视，当然还有他们家庭中的物联网设备就有它。

Alpine Linux 站点的“[关于][4]”页面的评论中指出：

> “Alpine Linux 的设计考虑到安全性。内核使用 grsecurity/PaX 的非官方移植进行了修补，所有用户态二进制文件都编译为具有堆栈保护的地址无关可执行文件（PIE）。 这些主动安全特性可以防止所有类别的零日漏洞和其它漏洞利用。”

换句话说，这些捆绑在 Alpine Linux 中的精简二进制文件提供的功能通过了那些行业级安全工具筛选，以缓解缓冲区溢出攻击所带来的危害。

### 多出一只袜子

你可能会问，为什么当我们谈及 Docker 的新操作系统时，容器的内部结构很重要？

那么，你可能已经猜到，当涉及容器时，他们的目标是精简。除非绝对必要，否则不包括任何东西。所以你可以放心地清理橱柜、花园棚子、车库和袜子抽屉了。

Docker 的确因为它们的先见而获得声望。据报道，2 月初，Docker 聘请了 Alpine Linux 的主要推动者 Nathaniel Copa，他帮助将默认的官方镜像库从 Ubuntu 切换到 Alpine。Docker Hub 从新近精简镜像节省的带宽受到了赞誉。

并且最新的情况是，这项工作将与最新的基于容器的操作系统相结合：Docker 的 LinuxKit。

要说清楚的是 LinuxKit 注定不会代替 Alpine，而是位于容器下层，并作为一个完整的操作系统出现，你可以高兴地启动你的运行时守护程序（在这种情况下，是生成你的容器的Docker 守护程序 ）。

### 金发女郎的 Atomic

经过精心调试的宿主机绝对不是一件新事物（以前提到过嵌入式 Linux 的家用设备）。在过去几十年中一直在优化 Linux 的天才在某个时候意识到底层的操作系统才是快速生产含有大量容器主机的关键。

例如，强大的红帽长期以来一直在出售已经贡献给 [Project Atomic][6] 的 [红帽 Atomic][5]。后者继续解释：

> “基于 Red Hat Enterprise Linux 或 CentOS 和 Fedora 项目的成熟技术，Atomic Host 是一个轻量级的、不可变的平台，其设计目的仅在于运行容器化应用程序。”

将底层的、不可变的 Atomic OS 作为红帽的 OpenShift PaaS（平台即服务）产品推荐有一个很好理由：它最小化、高性能、尖端。

### 特性

在 Docker 关于 LinuxKit 的公告中，“少即是多”的口号是显而易见的。实现 LinuxKit 愿景的项目显然是不小的事业，它由 Docker 老将和 [Unikernel][7] 的主管 Justin Cormack 指导，并与 HPE、Intel、ARM、IBM 和 Microsoft LinuxKit 合作，可以运行在从大型机到基于物联网的冰柜之中。

LinuxKit 的可配置性、可插拔性和可扩展性将吸引许多寻求建立其服务基准的项目。通过开源项目，Docker 明智地邀请每个人全身心地投入其功能开发，随着时间的推移，它会像好的奶酪那样成熟。

### 布丁作证

按照该发布消息中所承诺的，那些急于使用新系统的人不用再等待了。如果你准备着手 LinuxKit，你可以从 GitHub 中开始：[LinuxKit][11]。

在 GitHub 页面上有关于如何启动和运行一些功能的指导。

时间允许的话我准备更加深入研究 LinuxKit。对有争议的 Kubernetes 与 Docker Swarm 编排功能对比会是有趣的尝试。此外，我还想看到内存占用、启动时间和磁盘空间使用率的基准测试。

如果该承诺可靠，则作为容器运行的可插拔系统服务是构建操作系统的迷人方式。Docker 在[博客][12]）中提到：“因为 LinuxKit 是原生容器，它有一个非常小的尺寸 - 35MB，引导时间非常小。所有系统服务都是容器，这意味着可以删除或替换所有的内容。”

我不知道你觉得怎么样，但这非常符合我的胃口。

### 呼叫警察

除了我站在 DevSecOps 角度看到的功能，我会看看其对安全的承诺。

Docker 在他们的博客上引用来自 NIST（[国家标准与技术研究所] [8]）的话：

> “安全性是最高目标，这与 NIST 在其《应用程序容器安全指南》草案中说明的保持一致：‘使用容器专用操作系统而不是通用操作系统来减少攻击面。当使用专用容器操作系统时，攻击面通常比通用操作系统小得多，因此攻击和危及专用容器操作系统的机会较少。’”

可能最重要的容器到主机和主机到容器的安全创新是将系统容器（系统服务）完全地沙箱化到自己的非特权空间中，而只给它们需要的外部访问。

通过<ruby>内核自我保护项目<rt>Kernel Self Protection Project</rt></ruby>（[KSPP][9]）的协作来实现这一功能，我很满意 Docker 开始专注于一些非常值得的东西上。对于那些不熟悉的 KSPP 的人而言，它存在理由如下：

> “启动这个项目的的假设是内核 bug 的存在时间很长，内核必须设计成可以防止这些缺陷的危害。”

KSPP 网站进一步表态：

> “这些努力非常重要并还在进行，但如果我们要保护我们的十亿 Android 手机、我们的汽车、国际空间站，还有其他运行 Linux 的产品，我们必须在上游的 Linux 内核中建立积极的防御性技术。我们需要内核安全地出错，而不只是安全地运行。”

而且，如果 Docker 最初只是在 LinuxKit 前进了一小步，那么随着时间的推移，成熟度带来的好处可能会在容器领域中取得长足的进步。

### 离终点还远

像 Docker 这样不断发展壮大的巨头无论在哪个方向上取得巨大的飞跃都将会用户和其他软件带来益处。

我鼓励所有对 Linux 感兴趣的人密切关注这个领域。

--------------------------------------------------------------------------------

via: http://www.devsecops.cc/devsecops/containers.html

作者：[Chris Binnie][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.devsecops.cc/
[1]:https://alpinelinux.org/downloads/
[2]:https://hub.docker.com/_/alpine
[3]:https://busybox.net/
[4]:https://www.alpinelinux.org/about/
[5]:https://www.redhat.com/en/resources/red-hat-enterprise-linux-atomic-host
[6]:http://www.projectatomic.io/
[7]:https://en.wikipedia.org/wiki/Unikernel
[8]:https://www.nist.gov/
[9]:https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project
[10]:http://www.postfix.org/TLS_README.html
[11]:https://github.com/linuxkit/linuxkit
[12]:https://blog.docker.com/2017/04/introducing-linuxkit-container-os-toolkit
