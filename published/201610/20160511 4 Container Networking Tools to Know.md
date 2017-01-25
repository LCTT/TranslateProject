4 个你需要了解的容器网络工具
===========

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/network-crop.jpeg?itok=Na1tb9aR)

> [Creative Commons Zero][1]

有如此之多的各种新的云计算技术、工具和技术需要我们跟进，到底从哪里开始学习是一个艰难的决定。这一系列[下一代云计算技术][2]的文章旨在让你快速了解新兴和快速变化领域的重大项目和产品，比如软件定义网络（SDN）、容器，以及其交叉领域：容器网络。

对于企业容器部署，容器和网络之间的关系仍然是一个挑战。容器需要网络功能来连接分布式应用程序。根据一篇最新的[企业网络星球][3]的文章，一部分的挑战是“以隔离的方式部署容器，在提供隔离自己容器内数据的所需功能的同时，保持有效的连接性”。

流行的容器平台 [Docker][4]，使用了软件定义虚拟网络来连接容器与本地网络。此外，它使用 Linux 的桥接功能和虚拟可扩展局域网（VXLAN）技术，可以在同一 Swarm 或容器集群内互相沟通。Docker 的插件架构也支持其他网络管理工具来管理容器网络，比如下面的提到的工具。

容器网络上的创新使得容器可以跨主机连接到其他容器上。这使开发人员可以在开发环境中，在一个主机上部署一个容器来运行一个应用，然后可以过渡到测试环境中，进而到生产环境中，使应用可以持续集成，敏捷开发，快速部署。

容器网络工具有助于实现容器网络的可扩展性，主要是通过：

1. 使复杂的，多主机系统能够跨多个容器主机进行分发。
2. 允许构建跨越多个公有云和私有云平台上的大量主机的容器系统。

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/john-willis_k.jpg?itok=lTsH9eqI)

*John Willis speaking 在 Open Networking Summit 2016.*

要获取更多信息，查看 [Docker 网络教程][5]，是由 Brent Salisbury 和 John Willis 在最近的 [Open Networking Summit (ONS)][6]讲演的。更多关于 ONS 的演讲内容可以在[这里][7]找到。

你应该知道的容器网络工具和项目包括下述：

- [Calico][8] -- Calico 项目（源自 [Metaswitch][9]）利用边界网关协议（BGP）和集成的云编排系统来保证虚拟机和容器之间的 IP 通信安全。
- [Flannel][10] -- Flannel (之前叫 rudder) 源自 [CoreOS][11]，它提供了一个覆盖网络，可以作为一个现有的 SDN 解决方案的替代品。
- [Weaveworks][12] -- Weaveworks 项目管理容器的工具包括 [Weave Net][13]、Weave Scope、Weave Flux。Weave Net 是一种用于构建和部署 Docker 容器的网络工具。
- [Canal][14] -- 就在本周，CoreOS 和 Tigera 宣布了新的开源项目 Canal 的信息。据其声明，Canal 项目旨在结合部分 Calico 和 Flannel，“构造网络安全策略到网络架构和云管理平台之中”。

你可以通过 Linux 基金会的免费“云基础设施技术”课程来了解更多关于容器管理、软件定义网络和其他下一代云技术，这是一个在 edX 上提供的大规模公开在线课程。[课程注册目前已经开放][15]，课程内容于 6 月开放。

------

via: https://www.linux.com/news/4-container-networking-tools-know

作者：[AMBER ANKERHOLZ][a]
译者：[Bestony](https://github.com/Bestony)
校对：[wxy](https://github.com/wxy)

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
