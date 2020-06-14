[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "5 ways to boost your Kubernetes knowledge"
[#]: via: "https://opensource.com/article/20/6/kubernetes-anniversary"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"

提升你 Kubernetes 技能的 5 种方式
======
值此周年纪念之际，来通过这些深耕的上手项目了解下 Kubernetes。
![Ship captain sailing the Kubernetes seas][1]

在云原生的成长期，开发者们发现把应用程序封装到一个微小的、原子的、最小粒度的 Linux 镜像里很方便，服务器可以与运行其上的镜像共享资源。这些小环境的定义被称为[容器][2]，专门基于内核的命名空间。随着容器技术的发展，系统管理员们很快意识到，有必要开发一套工具来帮助他们管理容器及其底层的虚拟基础设施。[Kubernetes][3] 应运而生。

Kubernetes 是一个用来管理容器的可扩展开源平台。它可以帮助管理员和开发者们管理工作负载、服务和容器间的处理。它促进了声明式配置，更容易实现自动化。在它相当短的生命周期中，它催生了大量公司和项目的涉及服务、支持和工具的迅速成长的生态系统。

如果你想对这项重要的云技术有更多的了解，这里有一些能帮忙你更深入学习的文章。下面的 5 个项目可以帮忙你把学到的东西付诸实践。

### 管理各个容器

2016 年，我们发布了[使用 Kubernetes 管理各个容器][4]，一篇由 Terry Ryan 写的关于 Kubernetes 如何帮助管理员和架构师们合理地管理容器的介绍性文章。如果你想找一篇从底层介绍容器是做什么的以及 Kubernetes 是如何实现容器管理的，那么你应该先读下本文。本文适合零基础的读者，解释了所有重要的概念，因此你能迅速了解相关技术。

阅读下 Jessica Cherry 写的 [Kubernetes 命令空间][5]，来从内核级别了解下发生了什么了。

### Kubernetes：你为什么需要它？

Kubernetes 提供了<ruby>基础设施即服务<rt>Infrastructure-as-a-Service</rt></ruby>（IaaS）解决方案（类似 OpenStack）和完全的<ruby>平台即服务<rt>Platform as a Service</rt></ruby>带来的便利。它能提供给你管理基础设施的抽象能力和用来在裸金属的最底层进行问题追踪的工具。如果你想使用单一的裸金属服务，你可能需要阅读下 Tim Potter 写的[你为什么需要 Kubernetes][6]。他的文章对比了 IaaS 和 PaaS，解释了为什么 Kubernetes 如此广泛地被使用。你可能并不是一定需要 Kubernetes 或容器，但是知道什么情况下需要它们是很重要的。

### 在树莓派上运行

自己动手去运行它，这样才是了解  Kubernetes 最好的方式。不幸的是，不是每个人都有自己能支配的云服务器（也没有足够的钱来租服务器）。而幸运的是，Chris Collins 提供了[在树莓派上运行 Kubernetes][7] 的教程。结合他的另外几篇关于 [Cloud-init][8] 和 [Cloud-init 服务][9]的教程（也是在树莓派上运行），你可以搭建喜欢的任何种类的家庭实验室，这样你就可以学习如何管理属于自己的开放混合云。

### Kubernetes 命令

当你运行起 Kubernetes 后，可以查阅下 Jessica Cherry 的文章，跟随着她的备忘清单来做，这个清单列出了所有的[基本的 Kubernetes 命令][10]。在她的文章中，她解释了 `kubectl` 命令的语法，简单讲述了每个命令和子命令是用来做什么的。

### 有趣的 Kubernetes 项目

掌握了某项技术但是不知道用来做什么是最令人沮丧的。例如，把你的树莓派放到桌面上是一回事，但是它的 CPU 应该用来做什么工作却完全是另一回事。我们发布了很多教程，来指导你完成你的 Kubernetes 之路的探索：

  * [Helm][11] 是一个 Kubernetes 的包管理器。你可以在它的帮助下，很快熟悉 Kubernetes 环境。
  * 学习下 [Operator SDK][12] 的所有内容，来熟悉 Kubernetes 的 object 和 operator。
  * [在 Kubernetes 之上搭建网络文件系统（NFS）][13]
  * 学习如何使用 [Skipper][14] 或 [Traefik.][15] 进行流量调度。



Most importantly, take the time to get comfortable with containers and Kubernetes. Whether you first embrace containerized apps on the server, cloud, or desktop, they're an important paradigm to understand, because they're a powerful construct that's made applications on Linux better, stronger, more robust, and easier. Invest time to learn more about them. You'll be glad you did.最重要的，花点时间来熟悉容器和 Kubernetes。不论你先把容器化的应用放到服务器、云上还是桌面，它们都是能帮助你理解的重要的范例，因为它们是让 Linux 的应用变得更好、更强壮、鲁棒性更好、更简单的一次强大的构建过程。一定要投入精力去学习它们，你不会后悔的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/kubernetes-anniversary

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek "Ship captain sailing the Kubernetes seas"
[2]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://opensource.com/life/16/9/containing-container-chaos-kubernetes
[5]: https://opensource.com/article/19/12/kubernetes-namespaces
[6]: https://opensource.com/article/17/6/introducing-kubernetes
[7]: https://opensource.com/article/20/6/kubernetes-raspberry-pi
[8]: https://opensource.com/article/20/5/cloud-init-raspberry-pi-homelab
[9]: https://opensource.com/article/20/5/create-simple-cloud-init-service-your-homelab
[10]: https://opensource.com/article/20/5/kubectl-cheat-sheet
[11]: https://opensource.com/article/20/2/kubectl-helm-commands
[12]: https://opensource.com/article/20/3/kubernetes-operator-sdk
[13]: https://opensource.com/article/20/6/kubernetes-nfs-client-provisioning
[14]: https://opensource.com/article/20/4/http-kubernetes-skipper
[15]: https://opensource.com/article/20/3/kubernetes-traefik
