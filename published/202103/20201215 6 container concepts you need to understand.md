[#]: collector: (lujun9972)
[#]: translator: (AmorSu)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13170-1.html)
[#]: subject: (6 container concepts you need to understand)
[#]: via: (https://opensource.com/article/20/12/containers-101)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

6 个必知必会的关于容器的概念
======

> 容器现在是无所不在，它们已经快速的改变了 IT 格局。关于容器你需要知道一些什么呢？

![](https://img.linux.net.cn/data/attachment/album/202103/02/204713fgp7fasvm4ii2ire.jpg)

因为容器给企业所带来的巨大的价值和大量的好处，它快速的改变了 IT 格局。几乎所有最新的业务创新，都有容器化贡献的一部分因素，甚至是主要因素。

在现代化应用架构中，能够快速的把变更交付到生产环境的能力，让你比你的竞争对手更胜一筹。容器通过使用微服务架构，帮助开发团队开发功能、更小的失败、更快的恢复，从而加快交付速度。容器化还让应用软件能够快速启动、按需自动扩展云资源。还有，[DevOps][2] 通过灵活性、移动性、和有效性让产品可以尽快进入市场，从而将容器化的所能带来的好处最大化。

在 DevOps 中，虽然速度、敏捷、灵活是容器化的主要保障，但安全则是一个重要的因素。这就导致了 DevSecOps 的出现。它从一开始，到贯穿容器化应用的整个生命周期，都始终将安全融合到应用的开发中。默认情况下，容器化大大地增强了安全性，因为它将应用和宿主机以及其他的容器化应用相互隔离开来。

### 什么是容器？

容器是单体式应用程序所遗留的问题的解决方案。虽然单体式有它的优点，但是它阻碍了组织以敏捷的方式快速前进。而容器则让你能够将单体式分解成 [微服务][3]。

本质上来说，容器只是一些轻量化组件的应用集，比如软件依赖、库、配置文件等等，然后运行在一个隔离的环境之中，这个隔离的环境又是运行在传统操作系统之上的，或者为了可移植性和灵活性而运行在虚拟化环境之上。

![容器的架构][4]

总而言之，容器通过利用像 cgroup、 [内核命名空间][6] 和 [SELinux][7] 这样的内核技术来实现隔离。容器跟宿主机共用一个内核，因此比虚拟机占用更少的资源。

### 容器的优势

这种架构所带来的敏捷性是虚拟机所不可能做到的。此外，在计算和内存资源方面，容器支持一种更灵活的模型，而且它支持突发资源模式，因此应用程序可以在需要的时候，在限定的范围内，使用更多的资源。用另一句话来说，容器提供的扩展性和灵活性，是你在虚拟机上运行的应用程序中所无法实现的。

容器让在公有云或者私有云上部署和分享应用变得非常容易。更重要的是，它所提供的连贯性，帮助运维和开发团队降低了在跨平台部署的过程中的复杂度。

容器还可以实现一套通用的构建组件，可以在开发的任何阶段拿来复用，从而可以重建出一样的环境供开发、测试、预备、生产使用，将“一次编写、到处执行”的概念加以扩展。

和虚拟化相比，容器使实现灵活性、连贯性和快速部署应用的能力变得更加简单 —— 这是 DevOps 的主要原则。

### Docker 因素

[Docker][8] 已经变成了容器的代名词。Docker 让容器技术发生彻底变革并得以推广普及，虽然早在 Docker 之前容器技术就已经存在。这些容器技术包括 AIX 工作负载分区、 Solaris 容器、以及 Linux 容器（[LXC][9]），后者被用来 [在一台 Linux 宿主机上运行多个 Linux 环境][10]。

### Kubernetes 效应

Kubernetes 如今已被广泛认为是 [编排引擎][11] 中的领导者。在过去的几年里，[Kubernetes 的普及][12] 加上容器技术的应用日趋成熟，为运维、开发、以及安全团队可以拥抱日益变革的行业，创造了一个理想的环境。

Kubernetes 为容器的管理提供了完整全面的解决方案。它可以在一个集群中运行容器，从而实现类似自动扩展云资源这样的功能，这些云资源包括：自动的、分布式的事件驱动的应用需求。这就保证了“免费的”高可用性。（比如，开发和运维都不需要花太大的劲就可以实现）

此外，在 OpenShift 和 类似 Kubernetes 这样的企业的帮助下，容器的应用变得更加的容易。

![Kubernetes 集群][13]

### 容器会替代虚拟机吗？

[KubeVirt][14] 和类似的 [开源][15] 项目很大程度上表明，容器将会取代虚拟机。KubeVirt 通过将虚拟机转化成容器，把虚拟机带入到容器化的工作流中，因此它们就可以利用容器化应用的优势。

现在，容器和虚拟机更多的是互补的关系，而不是相互竞争的。容器在虚拟机上面运行，因此增加可用性，特别是对于那些要求有持久性的应用。同时容器可以利用虚拟化技术的优势，让硬件的基础设施（如：内存和网络）的管理更加便捷。

### 那么 Windows 容器呢？

微软和开源社区方面都对 Windows 容器的成功实现做了大量的推动。Kubernetes <ruby>操作器<rt>Operator</rt></ruby> 加速了 Windows 容器的应用进程。还有像 OpenShift 这样的产品现在可以启用 [Windows 工作节点][16] 来运行 Windows 容器。

Windows 的容器化创造出巨大的诱人的可能性。特别是对于使用混合环境的企业。在 Kubernetes 集群上运行你最关键的应用程序，是你成功实现混合云/多种云环境的目标迈出的一大步。

### 容器的未来

容器在 IT 行业日新月异的变革中扮演着重要的角色，因为企业在向着快速、敏捷的交付软件及解决方案的方向前进，以此来 [超越竞争对手][17]。

容器会继续存在下去。在不久的将来，其他的使用场景，比如边缘计算中的无服务器，将会浮现出来，并且更深地影响我们对从数字设备来回传输数据的速度的认知。唯一在这种变化中存活下来的方式，就是去应用它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/containers-101

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[AmorSu](https://github.com/amorsu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://opensource.com/resources/devops
[3]: https://opensource.com/resources/what-are-microservices
[4]: https://opensource.com/sites/default/files/uploads/container_architecture.png (Container architecture)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/19/10/namespaces-and-containers-linux
[7]: https://opensource.com/article/20/11/selinux-containers
[8]: https://opensource.com/resources/what-docker
[9]: https://linuxcontainers.org/
[10]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[11]: https://opensource.com/article/20/11/orchestration-vs-automation
[12]: https://enterprisersproject.com/article/2020/6/kubernetes-statistics-2020
[13]: https://opensource.com/sites/default/files/uploads/kubernetes_cluster.png (Kubernetes cluster)
[14]: https://kubevirt.io/
[15]: https://opensource.com/resources/what-open-source
[16]: https://www.openshift.com/blog/announcing-the-community-windows-machine-config-operator-on-openshift-4.6
[17]: https://www.imd.org/research-knowledge/articles/the-battle-for-digital-disruption-startups-vs-incumbents/
