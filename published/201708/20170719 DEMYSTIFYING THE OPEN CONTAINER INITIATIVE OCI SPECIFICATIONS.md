解密开放容器计划（OCI）规范
============================================================

<ruby>开放容器计划<rt>Open Container Initiative</rt></ruby>（OCI）宣布本周完成了容器运行时和镜像的第一版规范。OCI 在是 <ruby>Linux 基金会<rt>Linux Foundation</rt></ruby>支持下的容器解决方案标准化的成果。两年来，为了[建立这些规范][12]已经付出了大量的努力。 由此，让我们一起来回顾过去两年中出现的一些误区。

![OCI](https://i1.wp.com/blog.docker.com/wp-content/uploads/logo_oci.png?resize=800%2C180&ssl=1)

### 误区：OCI 是 Docker 的替代品

诚然标准非常重要，但它们远非一个完整的生产平台。 以万维网为例，它 25 年来一路演进，建立在诸如 TCP/IP 、HTTP 和 HTML 等可靠的核心标准之上。再以 TCP/IP 为例，当企业将 TCP/IP 合并为一种通用协议时，它推动了路由器行业，尤其是思科的发展。 然而，思科通过专注于在其路由平台上提供差异化的功能，而成为市场的领导者。我们认为 OCI 规范和 Docker 也是类似这样并行存在的。

[Docker 是一个完整的生产平台][13]，提供了基于容器的开发、分发、安全、编排的一体化解决方案。Docker 使用了 OCI 规范，但它大约只占总代码的 5％，而且 Docker 平台只有一小部分涉及容器的运行时行为和容器镜像的布局。

### 误区：产品和项目已经通过了 OCI 规范认证

运行时和镜像规范本周刚发布 1.0 的版本。 而且 OCI 认证计划仍在开发阶段，所以企业在该认证正式推出之前（今年晚些时候），没法要求容器产品的合规性、一致性或兼容性。

OCI [认证工作组][14]目前正在制定标准，使容器产品和开源项目能够符合规范的要求。标准和规范对于实施解决方案的工程师很重要，但正式认证是向客户保证其正在使用的技术真正符合标准的唯一方式。

### 误区：Docker 不支持 OCI 规范的工作

Docker 很早就开始为 OCI 做贡献。 我们向 OCI 贡献了大部分的代码，作为 OCI 项目的维护者，为 OCI 运行时和镜像规范定义提供了积极有益的帮助。Docker 运行时和镜像格式在 2013 年开源发布之后，便迅速成为事实上的标准，我们认为将代码捐赠给中立的管理机构，对于避免容器行业的碎片化和鼓励行业创新将是有益的。我们的目标是提供一个可靠和标准化的规范，因此 Docker 提供了一个简单的容器运行时 runc 作为运行时规范工作的基础，后来又贡献了 Docker V2 镜像规范作为 OCI 镜像规范工作的基础。

Docker 的开发人员如 Michael Crosby 和 Stephen Day 从一开始就是这项工作的关键贡献者，确保能将 Docker 的托管和运行数十亿个容器镜像的经验带给 OCI。等认证工作组完成（制定认证规范的）工作后，Docker 将通过 OCI 认证将其产品展示出来，以证明 OCI 的一致性。

### 误区：OCI 仅用于 Linux 容器技术

因为 OCI 是由 <ruby>Linux 基金会<rt>Linux Foundation</rt></ruby> 负责制定的，所以很容易让人误解为 OCI 仅适用于 Linux 容器技术。 而实际上并非如此，尽管 Docker 技术源于 Linux 世界，但 Docker 也一直在与微软合作，将我们的容器技术、平台和工具带到 Windows Server 的世界。 此外，Docker 向 OCI 贡献的基础技术广泛适用于包括 Linux 、Windows 和 Solaris 在内的多种操作系统环境，涵盖了 x86、ARM 和 IBM zSeries 等多种架构环境。

### 误区：Docker 仅仅是 OCI 的众多贡献者之一

OCI 作为一个支持成员众多的开放组织，代表了容器行业的广度。 也就是说，它是一个小而专业的个人技术专家组，为制作初始规范的工作贡献了大量的时间和技术。 Docker 是 OCI 的创始成员，贡献了初始代码库，构成了运行时规范的基础和后来的参考实现。 同样地，Docker 也将 Docker V2 镜像规范贡献给 OCI 作为镜像规范的基础。

### 误区：CRI-O 是 OCI 项目

CRI-O 是<ruby>云计算基金会<rt>Cloud Native Computing Foundation</rt></ruby>（CNCF）的 Kubernetes 孵化器的开源项目 -- 它不是 OCI 项目。 它基于早期版本的 Docker 体系结构，而 containerd 是一个直接的 CNCF 项目，它是一个包括 runc 参考实现的更大的容器运行时。 containerd 负责镜像传输和存储、容器运行和监控，以及支持存储和网络附件等底层功能。 Docker 在五个最大的云提供商（阿里云、AWS、Google Cloud Platform（GCP）、IBM Softlayer 和 Microsoft Azure）的支持下，将 containerd 捐赠给了云计算基金会（CNCF），作为多个容器平台和编排系统的核心容器运行时。

### 误区：OCI 规范现在已经完成了

虽然首版容器运行时和镜像格式规范的发布是一个重要的里程碑，但还有许多工作有待完成。 OCI 一开始着眼于定义一个狭窄的规范：开发人员可以依赖于容器的运行时行为，防止容器行业碎片化，并且仍然允许在不断变化的容器域中进行创新。之后才将含容器镜像规范囊括其中。

随着工作组完成运行时行为和镜像格式的第一个稳定规范，新的工作考量也已经同步展开。未来的新特性将包括分发和签名等。 然而，OCI 的下一个最重要的工作是提供一个由测试套件支持的认证过程，因为第一个规范已经稳定了。

**在 Docker 了解更多关于 OCI 和开源的信息：**

*  阅读关于 [OCI v1.0 版本的运行时和镜像格式规范]的博文[1]
*   访问 [OCI 的网站][2]
*   访问 [Moby 项目网站][3]
*   参加 [DockerCon Europe 2017][4]
*   参加 [Moby Summit LA][5] 

--------------------------------------------------------------------------------

作者简介：

Stephen 是 Docker 开源项目总监。 他曾在 Hewlett-Packard Enterprise （惠普企业）担任董事和杰出技术专家。他的关于开源软件和商业的博客发布在 “再次违约”(http://stephesblog.blogs.com) 和网站 opensource.com 上。

-----------------

via: https://blog.docker.com/2017/07/demystifying-open-container-initiative-oci-specifications/

作者：[Stephen][a]
译者：[rieonke](https://github.com/rieonke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://blog.docker.com/2017/07/oci-release-of-v1-0-runtime-and-image-format-specifications
[2]:https://www.opencontainers.org/join
[3]:http://mobyproject.org/
[4]:https://europe-2017.dockercon.com/
[5]:https://www.eventbrite.com/e/moby-summit-los-angeles-tickets-35930560273
[6]:https://blog.docker.com/author/stephen-walli/
[7]:https://blog.docker.com/tag/containerd/
[8]:https://blog.docker.com/tag/cri-o/
[9]:https://blog.docker.com/tag/linux-containers/
[10]:https://blog.docker.com/tag/linux-foundation/
[11]:https://blog.docker.com/tag/oci/
[12]:https://blog.docker.com/2017/07/oci-release-of-v1-0-runtime-and-image-format-specifications
[13]:https://www.docker.com/
[14]:https://github.com/opencontainers/certification
