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

For an advanced look into some of the magic happening at the kernel level, read Jessica Cherry's explanation of [Kubernetes namespaces][5].

### Kubernetes：你为什么需要它？

Kubernetes provides the benefits of an Infrastructure-as-a-Service (IaaS) solution (like OpenStack) and a full Platform as a Service (PaaS). It gives you abstractions for managing infrastructure and the tools you need to troubleshoot at the base level of bare metal. If you have the impulse to cling to a single bare-metal server, you might want to read Tim Potter's take on [why Kubernetes matters][6]. His article compares IaaS and PaaS and gives his perspective on why Kubernetes has been so widely adopted. You don't always need Kubernetes or containers, but it's important to know when you do.Kubernetes 提供了<ruby>基础设施即服务<rt>Infrastructure-as-a-Service</rt></ruby>（IaaS）解决方案（类似 OpenStack）和完全的<ruby>平台即服务<rt>Platform as a Service</rt></ruby>带来的便利。它能提供给你管理基础设施的抽象能力和用来在裸金属的最底层进行问题追踪的工具。

### Run it on a Raspberry Pi

There's no better way to get familiar with Kubernetes than to run it yourself. Unfortunately, not everyone has a cloud (nor the money to rent time on one) at their disposal. Luckily, Chris Collins has provided a guide for running [Kubernetes on a Pi][7]. Combined with his equally elucidating tutorials about [Cloud-init][8] and [Cloud-init services][9] (also on a Pi), you can build whatever kind of homelab you want so that you can learn how to manage your very own open hybrid cloud.

### Kubernetes commands

Once you have Kubernetes up and running, take a look at Jessica Cherry's article and accompanying cheat sheet that provides you with all the [essential Kubernetes commands][10]. In her article, she explains the syntax of `kubectl` commands and provides an overview of what each command and subcommand is meant to do.

### Fun Kubernetes projects

Nothing's more frustrating than having access to technology but not knowing what to do with it. For instance, it's one thing to have a Raspberry Pi on your desk, but it's an entirely different matter to decide what it ought to spend its CPU cycles doing. We've published plenty of articles to give some guidance to your Kubernetes explorations:

  * [Helm][11] is a package manager for Kubernetes. Exploring it is an easy way to get comfortable with living in Kubernetes.
  * Learn all about [Operator SDK][12] to get familiar with Kubernetes objects and operators.
  * Provide a [network file system (NFS) on top of Kubernetes.][13]
  * Learn how to route traffic with [Skipper][14] or [Traefik.][15]



Most importantly, take the time to get comfortable with containers and Kubernetes. Whether you first embrace containerized apps on the server, cloud, or desktop, they're an important paradigm to understand, because they're a powerful construct that's made applications on Linux better, stronger, more robust, and easier. Invest time to learn more about them. You'll be glad you did.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/kubernetes-anniversary

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
