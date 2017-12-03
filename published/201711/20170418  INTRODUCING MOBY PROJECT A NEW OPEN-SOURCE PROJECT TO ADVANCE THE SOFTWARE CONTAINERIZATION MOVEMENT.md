介绍 Moby 项目：推进软件容器化运动的一个新的开源项目
============================================================

![Moby Project](https://i0.wp.com/blog.docker.com/wp-content/uploads/1-2.png?resize=763%2C275&ssl=1)

自从 Docker 四年前将软件容器推向大众化以来，整个生态系统都围绕着容器化而发展，在这段这么短的时期内，它经历了两个不同的增长阶段。在这每一个阶段，生产容器系统的模式已经随着项目和不断增长的容器生态系统而演变适应用户群体的规模和需求。

Moby 是一个新的开源项目，旨在推进软件容器化运动，帮助生态系统将容器作为主流。它提供了一个组件库，一个将它们组装到定制的基于容器的系统的框架，也是所有容器爱好者进行实验和交换想法的地方。

让我们来回顾一下我们如何走到今天。在 2013-2014 年，开拓者开始使用容器，并在一个单一的开源代码库，Docker 和其他一些项目中进行协作，以帮助工具成熟。

![Docker Open Source](https://i0.wp.com/blog.docker.com/wp-content/uploads/2-2.png?resize=975%2C548&ssl=1)

然后在 2015-2016 年，云原生应用中大量采用容器用于生产环境。在这个阶段，用户社区已经发展到支持成千上万个部署，由数百个生态系统项目和成千上万的贡献者支持。正是在这个阶段，Docker 将其产品模式演变为基于开放式组件的方法。这样，它使我们能够增加创新和合作的方面。

涌现出来的新独立的 Docker 组件项目帮助促进了合作伙伴生态系统和用户社区的发展。在此期间，我们从 Docker 代码库中提取并快速创新组件，以便系统制造商可以在构建自己的容器系统时独立重用它们：[runc][7]、[HyperKit][8]、[VPNKit][9]、[SwarmKit][10]、[InfraKit][11]、[containerd][12] 等。

![Docker Open Components](https://i1.wp.com/blog.docker.com/wp-content/uploads/3-2.png?resize=975%2C548&ssl=1)

站在容器浪潮的最前沿，我们看到 2017 年出现的一个趋势是容器将成为主流，传播到计算、服务器、数据中心、云、桌面、物联网和移动的各个领域。每个行业和垂直市场，金融、医疗、政府、旅游、制造。以及每一个使用案例，现代网络应用、传统服务器应用、机器学习、工业控制系统、机器人技术。容器生态系统中许多新进入者的共同点是，它们建立专门的系统，针对特定的基础设施、行业或使用案例。

作为一家公司，Docker 使用开源作为我们的创新实验室，而与整个生态系统合作。Docker 的成功取决于容器生态系统的成功：如果生态系统成功，我们就成功了。因此，我们一直在计划下一阶段的容器生态系统增长：什么样的产品模式将帮助我们扩大容器生态系统，以实现容器成为主流的承诺？

去年，我们的客户开始在 Linux 以外的许多平台上要求有 Docker：Mac 和 Windows 桌面、Windows Server、云平台（如亚马逊网络服务（AWS）、Microsoft Azure 或 Google 云平台），并且我们专门为这些平台创建了[许多 Docker 版本][13]。为了在一个相对较短的时间和更小的团队中，以可扩展的方式构建和发布这些专业版本，而不必重新发明轮子，很明显，我们需要一个新的方式。我们需要我们的团队不仅在组件上进行协作，而且还在组件组合上进行协作，这借用[来自汽车行业的想法][14]，其中组件被重用于构建完全不同的汽车。

![Docker production model](https://i1.wp.com/blog.docker.com/wp-content/uploads/4-2.png?resize=975%2C548&ssl=1)

我们认为将容器生态系统提升到一个新的水平以让容器成为主流的最佳方式是在生态系统层面上进行协作。

![Moby Project](https://i0.wp.com/blog.docker.com/wp-content/uploads/5-2.png?resize=975%2C548&ssl=1)

为了实现这种新的合作高度，今天（2017 年 4 月 18 日）我们宣布推出软件容器化运动的新开源项目 Moby。它是提供了数十个组件的“乐高组件”，一个将它们组合成定制容器系统的框架，以及所有容器爱好者进行试验和交换意见的场所。可以把 Moby 认为是容器系统的“乐高俱乐部”。

Moby 包括：

1.  容器化后端组件**库**（例如，低层构建器、日志记录设备、卷管理、网络、镜像管理、containerd、SwarmKit 等）
2.  将组件组合到独立容器平台中的**框架**，以及为这些组件构建、测试和部署构件的工具。
3.  一个名为 “Moby Origin” 的引用组件，它是 Docker 容器平台的开放基础，以及使用 Moby 库或其他项目的各种组件的容器系统示例。

Moby 专为系统构建者而设计，他们想要构建自己的基于容器的系统，而不是可以使用 Docker 或其他容器平台的应用程序开发人员。Moby 的参与者可以从源自 Docker 的组件库中进行选择，或者可以选择将“自己的组件”（BYOC）打包为容器，以便在所有组件之间进行混合和匹配以创建定制的容器系统。

Docker 将 Moby 作为一个开放的研发实验室来试验、开发新的组件，并与容器技术的未来生态系统进行协作。我们所有的开源协作都将转向 Moby。Docker 现在并且将来仍然是一个开源产品，可以让你创建、发布和运行容器。从用户的角度来看，它是完全一样的。用户可以继续从 docker.com 下载 Docker。请在 Moby 网站上参阅[有关 Docker 和 Moby 各自角色的更多信息][15]。

请加入我们，帮助软件容器成为主流，并通过在组件和组合上进行协作，将我们的生态系统和用户社区发展到下一个高度。

--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/04/introducing-the-moby-project/

作者：[Solomon Hykes][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/solomon/
[1]:https://blog.docker.com/author/solomon/
[2]:https://blog.docker.com/tag/containerization/
[3]:https://blog.docker.com/tag/moby-library/
[4]:https://blog.docker.com/tag/moby-origin/
[5]:https://blog.docker.com/tag/moby-project/
[6]:https://blog.docker.com/tag/open-source/
[7]:https://github.com/opencontainers/runc
[8]:https://github.com/docker/hyperkit
[9]:https://github.com/docker/vpnkit
[10]:https://github.com/docker/swarmkit
[11]:https://github.com/docker/infrakit
[12]:https://github.com/containerd/containerd
[13]:https://blog.docker.com/2017/03/docker-enterprise-edition/
[14]:https://en.wikipedia.org/wiki/List_of_Volkswagen_Group_platforms
[15]:https://mobyproject.org/#moby-and-docker
