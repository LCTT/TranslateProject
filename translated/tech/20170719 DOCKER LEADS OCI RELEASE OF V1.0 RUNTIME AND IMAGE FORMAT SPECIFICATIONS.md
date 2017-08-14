OCI 发布容器运行时和镜像格式规范 V1.0
============================================================

7 月 19 日是<ruby>开放容器计划<rt>Open Container Initiative</rt></ruby>（OCI）的一个重要里程碑，OCI 发布了容器运行时和镜像规范的 1.0 版本，而 Docker 在这过去两年中一直充当着推动和引领的核心角色。我们的目标是为社区、客户以及更广泛的容器行业提供底层的标准。要了解这一里程碑的意义，我们先来看看 Docker 在开发容器技术行业标准方面的成长和发展历史。

### Docker 将运行时和镜像捐赠给 OCI 的历史回顾

Docker 的镜像格式和容器运行时在 2013 年作为开源项目发布后，迅速成为事实上的标准。我们认识到将其转交给中立管理机构管理，以加强创新和防止行业碎片化的重要性。我们与广泛的容器技术人员和行业领导者合作，成立了<ruby>开放容器项目<rt>Open Container Project</rt></ruby>来制定了一套容器标准，并在 Linux 基金会的支持下，于 2015 年 6 月在 Docker 大会（DockerCon）上推出。最终在那个夏天演变成为<ruby>开放容器计划<rt>Open Container Initiative</rt></ruby> (OCI）。

Docker 贡献了 runc ，这是从 Docker 员工 [Michael Crosby][17] 的 libcontainer 项目中发展而来的容器运行时参考实现。 runc 是描述容器生命周期和运行时行为的运行时规范的基础。runc 被用在数千万个节点的生产环境中，这比任何其它代码库都要大一个数量级。runc 已经成为运行时规范的参考实现，并且随着项目的进展而不断发展。

在运行时规范制定工作开始近一年后，我们组建了一个新的工作组来制定镜像格式的规范。 Docker 将 Docker V2 镜像格式捐赠给 OCI 作为镜像规范的基础。通过这次捐赠，OCI 定义了构成容器镜像的数据结构（原始镜像）。定义容器镜像格式是一个至关重要的步骤，但它需要一个像 Docker 这样的平台通过定义和提供构建、管理和发布镜像的工具来实现它的价值。 例如，Dockerfile 等内容并不包括在 OCI 规范中。

![Docker 为 OCI 贡献的历史](https://i2.wp.com/blog.docker.com/wp-content/uploads/OCI.png?resize=938%2C1491&ssl=1)

### 开放容器标准化之旅

这个规范已经持续开发了两年。随着代码的重构，更小型的项目已经从 runc 参考实现中脱颖而出，并支持即将发布的认证测试工具。

有关 Docker 参与塑造 OCI 的详细信息，请参阅上面的时间轴，其中包括：创建 runc ，和社区一起更新、迭代运行时规范，创建 containerd 以便于将 runc 集成到 Docker 1.11 中，将 Docker V2 镜像格式贡献给 OCI 作为镜像格式规范的基础，并在 [containerd][18] 中实现该规范，使得该核心容器运行时同时涵盖了运行时和镜像格式标准，最后将 containerd 捐赠给了<ruby>云计算基金会<rt>Cloud Native Computing Foundation</rt></ruby>（CNCF），并于本月发布了更新的 1.0 alpha 版本。

维护者 [Michael Crosby][19] 和 [Stephen Day][20] 引导了这些规范的发展，并且为 v1.0 版本的实现提供了极大的帮助，另外 Alexander Morozov，Josh Hawn，Derek McGown 和 Aaron Lehmann 也贡献了代码，以及 Stephen Walli 参加了认证工作组。

Docker 仍然致力于推动容器标准化进程，在每个人都认可的层面建立起坚实的基础，使整个容器行业能够在依旧十分差异化的层面上进行创新。

### 开放标准只是一小块拼图

Docker 是一个完整的平台，用于创建、管理、保护和编排容器以及镜像。该项目的愿景始终是致力于成为支持开源组件的行业规范的基石，或着是容器解决方案的校准铅锤。Docker 平台正位于此层之上 -- 为客户提供从开发到生产的安全的容器管理解决方案。

OCI 运行时和镜像规范成为一个可靠的标准基础，允许和鼓励多样化的容器解决方案，同时它们不限制产品创新或遏制主要开发者。打一个比方，TCP/IP、HTTP 和 HTML 成为过去 25 年来建立万维网的可靠标准，其他公司可以继续通过这些标准的新工具、技术和浏览器进行创新。 OCI 规范也为容器解决方案提供了类似的规范基础。

开源项目也在为产品开发提供组件方面发挥着作用。containerd 项目就使用了 OCI 的 runc 参考实现，它负责镜像的传输和存储，容器运行和监控，以及支持存储和网络附件的等底层功能。containerd 项目已经被 Docker 捐赠给了 CNCF ，与其他重要项目一起支持云计算解决方案。

Docker 使用了 containerd 和其它自己的核心开源基础设施组件，如 LinuxKit，InfraKit 和 Notary 等项目来构建和保护 Docker 社区版容器解决方案。正在寻找一个能提供容器管理、安全性、编排、网络和更多功能的完整容器平台的用户和组织可以了解下 Docker Enterprise Edition 。

![Docker 栈](https://i0.wp.com/blog.docker.com/wp-content/uploads/243938a0-856b-4a7f-90ca-2452a69a385c-1.jpg?resize=1019%2C511&ssl=1)

> 这张图强调了 OCI 规范提供了一个由容器运行时实现的标准层：containerd 和 runc。 要组装一个完整的像 Docker 这样具有完整容器生命周期和工作流程的容器平台，需要和许多其他的组件集成在一起：管理基础架构的 InfraKit，提供操作系统的 LinuxKit，交付编排的 SwarmKit，确保安全性的 Notary。

### OCI 下一步该干什么

随着运行时和镜像规范的发布，我们应该庆祝开发者的努力。开放容器计划的下一个关键工作是提供认证计划，以验证实现者的产品和项目确实符合运行时和镜像规范。[认证工作组][21] 已经组织了一个程序，结合了开发套件（developing suite）的[运行时][22]和[镜像][23]规范测试工具将展示产品应该如何参照标准进行实现。

同时，当前规范的开发者们正在考虑下一个最重要的容器技术领域。云计算基金会的通用容器网络接口开发工作已经正在进行中，支持镜像签署和分发的工作正也在 OCI 的考虑之中。

除了 OCI 及其成员，Docker 仍然致力于推进容器技术的标准化。 OCI 的使命是为用户和公司提供在开发者工具、镜像分发、容器编排、安全、监控和管理等方面进行创新的基准。Docker 将继续引领创新，不仅提供提高生产力和效率的工具，而且还通过授权用户，合作伙伴和客户进行创新。

**在 Docker 学习更过关于 OCI 和开源的信息：**

*   阅读 [OCI 规范的误区][1]
*   访问 [开放容器计划的网站][2]
*   访问 [Moby 项目网站][3]
*   参加 [DockerCon Europe 2017][4]
*   参加 [Moby Summit LA][5]

--------------------------------------------------------------------------------

作者简介：

Patrick Chanezon是Docker Inc.技术人员。他的工作是帮助构建 Docker 。一个程序员和讲故事的人 （storyller），他在 Netscape 和 Sun 工作了10年的时间，又在Google，VMware 和微软工作了10年。他的主要职业兴趣是为这些奇特的双边市场“平台”建立和推动网络效应。他曾在门户网站，广告，电商，社交，Web，分布式应用和云平台上工作过。有关更多信息，请访问 linkedin.com/in/chanezon 和他的推特@chanezon。

------

via: https://blog.docker.com/2017/07/oci-release-of-v1-0-runtime-and-image-format-specifications/

作者：[Patrick Chanezon][a]
译者：[rieonke](https://github.com/rieonke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/chanezon/
[1]:https://linux.cn/article-8763-1.html
[2]:https://www.opencontainers.org/join
[3]:http://mobyproject.org/
[4]:https://europe-2017.dockercon.com/
[5]:https://www.eventbrite.com/e/moby-summit-los-angeles-tickets-35930560273
[6]:https://blog.docker.com/author/chanezon/
[7]:https://blog.docker.com/tag/cncf/
[8]:https://blog.docker.com/tag/containerd/
[9]:https://blog.docker.com/tag/containers/
[10]:https://blog.docker.com/tag/docker/
[11]:https://blog.docker.com/tag/docker-image-format/
[12]:https://blog.docker.com/tag/docker-runtime/
[13]:https://blog.docker.com/tag/infrakit/
[14]:https://blog.docker.com/tag/linux-foundation/
[15]:https://blog.docker.com/tag/oci/
[16]:https://blog.docker.com/tag/open-containers/
[17]:https://github.com/crosbymichael
[18]:https://containerd.io/
[19]:https://github.com/crosbymichael
[20]:https://github.com/stevvooe
[21]:https://github.com/opencontainers/certification
[22]:https://github.com/opencontainers/runtime-tools
[23]:https://github.com/opencontainers/image-tools
