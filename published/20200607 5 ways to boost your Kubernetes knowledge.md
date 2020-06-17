[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12320-1.html"
[#]: subject: "5 ways to boost your Kubernetes knowledge"
[#]: via: "https://opensource.com/article/20/6/kubernetes-anniversary"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"

提升你 Kubernetes 技能的 5 种方式
======

> 值此周年纪念之际，来通过这些深度文章和实践项目了解下 Kubernetes。

![](https://img.linux.net.cn/data/attachment/album/202006/16/191023lqq0d5zv5vggr2vg.png)

在云原生的成长期，开发者们发现在一个小型的、原子化的、精简的 Linux 镜像里编写应用程序很方便，这些镜像与它们所运行的服务器共享资源。从技术上讲，这些基于内核命名空间的小环境定义被称为[容器][2]。随着容器的激增，系统管理员们很快意识到，开发一个不仅能帮助他们管理容器，还能帮助他们管理下面的虚拟化基础设施的工具变得至关重要。于是，[Kubernetes][3] 应运而生。

Kubernetes 是一个可扩展开源平台，用于管理容器。它可以帮助管理员和开发者们围绕容器管理工作负载、服务和进程。它促进了声明式配置，更容易实现自动化。在它相对较短的生命周期中，它已经催生了一个迅速成长的生态系统，其中包括来自大量公司和项目的服务、支持和工具。

如果你想对这项重要的云技术有更多的了解，这里有一些能帮忙你更深入学习的文章。还有 5 个项目可以帮你把学到的东西付诸实践。

### 遏制容器乱象

2016 年，我们发布了《[使用 Kubernetes 遏制容器乱象][4]》，这是一篇由 Terry Ryan 写的关于 Kubernetes 的介绍性文章，讲述了 Kubernetes 如何帮助管理员和架构师们努力应对容器。如果你想找一篇从底层介绍容器是做什么的以及 Kubernetes 是如何实现容器管理的，那么你应该先读下本文。本文适合零基础的读者，解释了所有重要的概念，因此你能迅速了解相关技术。

如果想进阶了解内核层面发生的一些神奇的事情，请阅读 Jessica Cherry 对 [Kubernetes 命名空间][5]的解释。

延伸阅读：

- [一文了解 Kubernetes 是什么？](https://linux.cn/article-8800-1.html)
- [Kubernetes 是什么？](https://linux.cn/article-8858-1.html)

### Kubernetes：为什么它很重要？

Kubernetes 提供了<ruby>基础设施即服务<rt>Infrastructure-as-a-Service</rt></ruby>（IaaS）解决方案（类似 OpenStack）的便利和一个完整的<ruby>平台即服务<rt>Platform as a Service</rt></ruby>（PaaS）。它为你提供了管理基础设施的抽象能力，以及在裸金属基础层面进行故障排除所需的工具。如果你执着于使用单一的裸金属服务器，你可能需要阅读下 Tim Potter 写的《[你为什么需要 Kubernetes][6]》。他的文章对比了 IaaS 和 PaaS，解释了为什么 Kubernetes 如此广泛地被使用。你可能并不是一定需要 Kubernetes 或容器，但是重要的是知道什么情况下需要。

延伸阅读：

- [使用 Kubernetes 的 5 个理由](https://linux.cn/article-10973-1.html)
- [你（多半）不需要 Kubernetes](https://linux.cn/article-10469-1.html)

### 在树莓派上运行 Kubernetes

熟悉 Kubernetes 的最好方法莫过于自己运行它。不幸的是，不是每个人都有一个云服务基层设施（或者有足够的钱来租用一个）可供其支配。而幸运的是，Chris Collins 提供了《[在树莓派上运行 Kubernetes][7]》的教程。结合他的另外几篇关于《[Cloud-init][8]》和《[Cloud-init 服务][9]》的教程（也是在树莓派上运行），你可以搭建任何你想要的家庭实验室，这样你就可以学习如何管理属于自己的开放混合云。

### Kubernetes 命令

一旦你运行起 Kubernetes 后，可以看看 Jessica Cherry 的文章和附带的备忘清单，这个清单列出了所有的[基本的 Kubernetes 命令][10]。在她的文章中，她解释了 `kubectl` 命令的语法，简单讲述了每个命令和子命令是用来做什么的。

### 有趣的 Kubernetes 项目

没有什么比拥有技术却不知道该怎么用它更令人沮丧的了。例如，在你的办公桌上有一个树莓派是一回事，但是决定它的 CPU 应该用来做什么工作却完全是另一回事。我们发布了很多教程，来指导你完成你的 Kubernetes 之路的探索：

  * [Helm][11] 是一个 Kubernetes 的包管理器。你可以在它的帮助下，很快熟悉 Kubernetes 环境。
  * 学习下 [Operator SDK][12] 的所有内容，来熟悉 Kubernetes 的对象和操作器。
  * [在 Kubernetes 之上搭建网络文件系统（NFS）][13]
  * 学习如何使用 [Skipper][14] 或 [Traefik][15] 进行流量调度。

最重要的，花点时间来熟悉容器和 Kubernetes。不论你先把容器化的应用放到服务器、云上还是桌面，它们都是能帮助你理解的重要的范例，因为它们是一个强大的构造，可以让 Linux 的应用变得更好、更健壮、鲁棒性更好、更简单。一定要投入精力去学习它们，你不会后悔的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/kubernetes-anniversary

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek "Ship captain sailing the Kubernetes seas"
[2]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://opensource.com/life/16/9/containing-container-chaos-kubernetes
[5]: https://linux.cn/article-11749-1.html
[6]: https://linux.cn/article-8902-1.html
[7]: https://linux.cn/article-8499-1.html
[8]: https://opensource.com/article/20/5/cloud-init-raspberry-pi-homelab
[9]: https://opensource.com/article/20/5/create-simple-cloud-init-service-your-homelab
[10]: https://opensource.com/article/20/5/kubectl-cheat-sheet
[11]: https://linux.cn/article-12007-1.html
[12]: https://opensource.com/article/20/3/kubernetes-operator-sdk
[13]: https://opensource.com/article/20/6/kubernetes-nfs-client-provisioning
[14]: https://opensource.com/article/20/4/http-kubernetes-skipper
[15]: https://opensource.com/article/20/3/kubernetes-traefik
