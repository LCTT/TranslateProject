
# 4 Container Networking Tools to Know

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/network-crop.jpeg?itok=Na1tb9aR)

> [Creative Commons Zero][1]

有了这么多新的云计算技术、工具和技术要跟踪，知道从哪开始学习新的技能变得难了。这一系列[下一代云计算技术][2]的目的是为了帮助你在重要的项目和产品在信息和快速变化的领域速度更快，如软件定义网络（SDN）、容器，他们不谋而合：容器网络

对于企业容器部署，容器和网络之间的关系依然具有挑战性。容器需要网络功能来链接分布式应用程序。根据最新的[企业网络星球][3]文章，一部分的挑战是“将容器部署在自己的独立数据环境中，同时保持有效链接的有隔离的容器部署方式”。

[Docker][4],流行的容器平台，使用了软件定义虚拟网络来链接容器和本地网络。此外，它使用Linux的桥接功能和虚拟可扩展局域网（VXLAN）技术，可以在同一容器集群互相沟通。Docker的插件架构也允许其他网络管理工具，比如下面的提到的工具来管理容器网络。 

容器网络上的创新使得容器可以链接到主机上的其他容器。这使开发人员可以在一个主机上部署一个容器运行一个应用，并过渡到整个测试环境，然后到一个生产环境，使应用可以持续集成，敏捷性和快速部署。

容器网络工具有助于实现容器网络的可扩展性，主要是通过：

1) 使复杂的，多主机系统被分发到多个容器主机。

2) 允许跨越多个公有云和私有云平台上的主机的容器系统的业务流程。

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/john-willis_k.jpg?itok=lTsH9eqI)

> John Willis speaking 在 Open Networking Summit 2016.

获取更多信息，查看 [Docker 网络教程][5] , 由 Brent Salisbury and John Willis 在最近的 [Open Networking Summit (ONS)][6]发布的. 更多关于ONS 的KeyNote可以 [这里][7]找到.

你应该知道的容器网络工具和项目包括下述：

[Calico][8] -- Calico 项目 (源自Metaswitch][9])利用边界网关协议（BGP）和集成的云编排系统来保证虚拟机和容器之间的IP通信安全。

[Flannel][10] -- Flannel (之前叫 rudder) 源自[CoreOS][11] 提供一个覆盖网络，可以作为一个现有的SDN解决方案的替代品。

[Weaveworks][12] -- Weaveworks 项目管理容器的工具包括 [Weave Net][13], Weave Scope, Weave Flux. Weave Net 是一种用于构建和部署Docker容器的网络工具。

[Canal][14] -- 就在本周, CoreOS 和Tigera 宣布了新项目 Canal 的信息 .根据声明,Canal项目旨在结合Calico和Flannel, “构造网络安全策略包括网络架构,云管理平台 ”.

你可以通过Linux基金会在EDX的大规模开放在线课程上的免费“云基础设施技术”课程来了解更多关于容器管理，软件定义网络，和其他下一代云技术。[课程注册目前已经开放][15], 课程内容将于6月开放。

------

via: https://www.linux.com/news/4-container-networking-tools-know

作者：[AMBER ANKERHOLZ][a]
译者：[Bestony](https://github.com/Bestony)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/aankerholz
[1]: https://www.linux.com/licenses/category/creative-commons-zero
[2]: https://www.linux.com/news/5-next-gen-cloud-technologies-you-should-know
[3]: http://www.enterprisenetworkingplanet.com/datacenter/datacenter-blog/container-networking-challenges-for-the-enterprise.html
[4]: https://docs.docker.com/engine/userguide/networking/dockernetworks/
[5]: https://youtu.be/Le0bEg4taak
[6]: http://events.linuxfoundation.org/events/open-networking-summit
[7]: https://www.linux.com/watch-videos-from-ons2016
[8]: https://www.projectcalico.org/
[9]: http://www.metaswitch.com/cloud-network-virtualization
[10]: https://coreos.com/blog/introducing-rudder/
[11]: https://coreos.com/
[12]: https://www.weave.works/
[13]: https://www.weave.works/products/weave-net/
[14]: https://github.com/tigera/canal
[15]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-cloud-infrastructure-technologies?utm_source=linuxcom&amp;utm_medium=article&amp;utm_campaign=cloud%20mooc%20article%201
