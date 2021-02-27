[#]: collector: (lujun9972)
[#]: translator: (AmorSu)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 container concepts you need to understand)
[#]: via: (https://opensource.com/article/20/12/containers-101)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

6 container concepts you need to understand
6个你需要知道的关于容器的概念
======
Containers are everywhere, and they've radically changed the IT
landscape. What do you need to know about them?
容器现在是无所不在，它们已经快速的改变了 IT 行业。关于容器你需要知道一些什么呢？
![网络上停泊在海里的船只][1]

Containerization has radically changed the IT landscape because of the significant value and wide array of benefits it brings to business. Nearly any recent business innovation has containerization as a contributing factor, if not the central element.
因为容器给商业所带来的巨大的价值和大量的好处，它快速的改变了IT行业。几乎所有最新的商业创新，都有容器化贡献的一部分因素，甚至是主要因素。

In modern application architectures, the ability to deliver changes quickly to the production environment gives you an edge over your competitors. Containers deliver speed by using a microservices architecture that helps development teams create functionality, fail small, and recover faster. Containerization also enables applications to start faster and automatically scale cloud resources on demand. Furthermore, [DevOps][2] maximizes containerization's benefits by enabling the flexibility, portability, and efficiency required to go to market early.
在现代化应用架构中，能够快速的把修改交付到生产环境的能力，让你比你的竞争对手更胜一筹。容器通过使用微服务架构，帮助开发团队开发功能、更小的失败、更快的恢复，从而加快交付速度。容器化还让应用软件能够快速启动、按需自动扩展云资源。还有，[DevOps][2]通过灵活性、移动性、和有效性让产品可以尽快进入市场，从而将容器化的所能带来的好处最大化。

While speed, agility, and flexibility are the main promises of containerization using DevOps, security is a critical factor. This led to the rise of DevSecOps, which incorporates security into application development from the start and throughout the lifecycle of a containerized application. By default, containerization massively improves security because it isolates the application from the host and other containerized applications.
在 DevOps 中，当速度，敏捷，灵活是容器化的主要保障时，安全则是一个重要的因素。这就导致了 DevSecOps 的出现。它从一开始，到贯穿容器化应用的整个生命周期，都始终将安全融合到应用的开发中。默认情况下，容器化大大地增强了安全性，因为它将应用和宿主主机以及其他的容器化应用相互隔离开来。

### What are containers?
### 什么是容器？

Containers are the solution to problems inherited from monolithic architectures. Although monoliths have strengths, they prevent organizations from moving fast the agile way. Containers allow you to break monoliths into [microservices][3].
容器是单体式应用程序所遗留的问题的解决方案。虽然单体式有它的优点，但是它让组织无法用敏捷的方式快速前进。而容器则让你能够将单体式分解成 [微服务][3]

Essentially, a container is an application bundle of lightweight components, such as application dependencies, libraries, and configuration files, that run in an isolated environment on top of traditional operating systems or in virtualized environments for easy portability and flexibility.
本质上来说，容器只是一些轻量化组件的应用集，比如软件依赖、库、配置文件等等，然后运行在一个隔离的环境之中，这个隔离的环境又是运行在传统操作系统之上的，或者为了可移植性和灵活性而运行在虚拟化环境之上。

![容器的架构][4]

(Michael Calizo, [CC BY-SA 4.0][5])

To summarize, containers provide isolation by taking advantage of kernel technologies like cgroups, [kernel namespaces][6], and [SELinux][7]. Containers share a kernel with the host, which allows them to use fewer resources than a virtual machine (VM) would require.
总而言之，容器通过利用像 cgroups、 [kernel namespaces][6], and [SELinux][7] 这样的内核技术来实现隔离。容器跟宿主主机共用一个内核，因此比虚拟机占用更少的资源。

### Container advantages
### 容器的优势

This architecture provides agility that is not feasible with VMs. Furthermore, containers support a more flexible model when it comes to compute and memory resources, and they allow resource-burst modes so that applications can consume more resources, when required, within the defined boundaries. In other words, containers provide scalability and flexibility that you cannot get from running an application on top of a VM.
这种架构所带来的敏捷性是虚拟机所不可能做到的。此外，在计算和内存资源方面，容器支持一种更灵活的模型，而且它支持突发资源模式，因此应用程序可以在需要的时候，在限定的范围内，使用更多的资源。

Containers make it easy to share and deploy applications on public or private clouds. More importantly, they provide consistency that helps operations and development teams reduce the complexity that comes with multi-platform deployment.
容器让在公有云或者私有云上部署和分享应用变得非常容易。更重要的是，它所提供的连贯性，帮助运维和开发团队降低了在跨平台部署的过程中的复杂度。

Containers also enable a common set of building blocks that can be reused in any stage of development to recreate identical environments for development, testing, staging, and production, extending the concept of "write-once, deploy anywhere."
容器还有一个通用的构建组件的集合，可以在开发的任何阶段拿来复用，从而可以重建出一样的环境供开发、测试、预备、生产使用，将“一次编写、到处执行”的概念加以扩展。

Compared to virtualization, containers make it simpler to achieve flexibility, consistency, and the ability to deploy applications faster—the main principles of DevOps.
和虚拟化相比，容器让灵活性、连贯性、和快速部署应用，这些 DevOps 的原则，实现起来更简单。

### The Docker factor

[Docker][8] has become synonymous with containers. Docker revolutionized and popularized containers, even though the technology existed before Docker. Examples include AIX Workload partitions, Solaris Containers, and Linux containers ([LXC][9]), which was created to [run multiple Linux environments in a single Linux host][10].

### The Kubernetes effect

Kubernetes is widely recognized as the leading [orchestration engine][11]. In the last few years, [Kubernetes' popularity][12] coupled with maturing container adoption created the ideal scenario for ops, devs, and security teams to embrace the changing landscape.

Kubernetes provides a holistic approach to managing containers. It can run containers across a cluster to enable features like autoscaling cloud resources, including event-driven application requirements, in an automated and distributed way. This ensures high availability "for free" (i.e., neither developers nor admins expend extra effort to make it happen).

In addition, OpenShift and similar Kubernetes enterprise offerings make container adoption much easier.

![Kubernetes cluster][13]

(Michael Calizo, [CC BY-SA 4.0][5])

### Will containers replace VMs?

[KubeVirt][14] and similar [open source][15] projects show a lot of promise that containers will replace VMs. KubeVirt brings VMs into containerized workflows by converting the VMs into containers, where they run with the benefits of containerized applications.

Right now, containers and VMs work as complementary solutions rather than competing technologies. Containers run atop VMs to increase availability, especially for applications that require persistency, and take advantage of virtualization technology that makes it easier to manage the hardware infrastructure (like storage and networking) required to support containers.

### What about Windows containers?

There is a big push from Microsoft and the open source community to make Windows containers successful. Kubernetes Operators have fast-tracked Windows container adoption, and products like OpenShift now enable [Windows worker nodes][16] to run Windows containers.

Windows containerization creates a lot of enticing possibilities, especially for enterprises with mixed environments. Being able to run your most critical applications on top of a Kubernetes cluster is a big advantage towards achieving a hybrid- or multi-cloud environment.

### The future of containers

Containers play a big role in the shifting IT landscape because enterprises are moving towards fast, agile delivery of software and solutions to [get ahead of competitors][17].

Containers are here to stay. In the very near future, other use cases, like serverless on the edge, will emerge and further change how we think about the speed of getting information to and from digital devices. The only way to survive these changes is to adapt to them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/containers-101

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[AmorSu](https://github.com/amorsu)
校对：[校对者ID](https://github.com/校对者ID)

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
