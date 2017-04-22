OpenContrail：一个 OpenStack 生态中的重要工具
============================================================


![OpenContrail](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/contrails-cloud.jpg?itok=aoNIH-ar "OpenContrail") 

*OpenContrail 是用于 OpenStack 云计算平台的 SDN 平台，它正在成为管理员需要具备的技能的重要工具。*

[Creative Commons Zero] [1] Pixabay

整个 2016 年，软件定义网络（SDN）迅速发展，开源和云计算领域的众多参与者正帮助其获得增长。结合这一趋势，用在 OpenStack 云计算平台上的流行的 SDN 平台 [OpenContrail][3] 正成为许多管理员需要具备的技能的重要工具。

正如管理员和开发人员在 OpenStack 生态系统中围绕着诸如 Ceph 等重要工具提升技能一样，他们将需要拥抱 OpenContrail，它是由 Apache 软件基金会全面开源并管理的软件。

考虑到这些，OpenStack 领域中最活跃的公司之一 Mirantis 已经[宣布][4]对 OpenContrail 的提供商业支持和贡献。该公司提到：“添加了 OpenContrail 后，Mirantis 将会为与 OpenStack 一起使用的开源技术，包括用于存储的 Ceph、用于计算的 OpenStack/KVM、用于 SDN 的 OpenContrail 或 Neutron 提供一站式的支持。”

根据 Mirantis 公告，“OpenContrail 是一个使用基于标准协议构建的 Apache 2.0 许可项目，为网络虚拟化提供了所有必要的组件 - SDN 控制器、虚拟路由器、分析引擎和已发布的上层 API，它有一个可扩展 REST API 用于配置以及从系统收集操作和分析数据。作为规模化构建，OpenContrail 可以作为云基础设施的基础网络平台。”

有消息称 Mirantis [收购了 TCP Cloud][5]，这是一家专门从事 OpenStack、OpenContrail 和 Kubernetes 管理服务的公司。Mirantis 将使用 TCP Cloud 的云架构持续交付技术来管理将在 Docker 容器中运行的 OpenContrail 控制面板。作为这项工作的一部分，Mirantis 也会一直致力于 OpenContrail。

OpenContrail 的许多贡献者正在与 Mirantis 紧密合作，他们特别注意了 Mirantis 将提供的支持计划。

“OpenContrail 是 OpenStack 社区中一个重要的项目，而 Mirantis 很好地容器化并提供商业支持。我们团队正在做的工作使 OpenContrail 能轻松地扩展并更新，并与 Mirantis OpenStack 的其余部分进行无缝滚动升级。 ” Mirantis 的工程师总监和 OpenContrail 咨询委员会主任 Jakub Pavlik 说：“商业支持也将使 Mirantis 能够使该项目与各种交换机兼容，从而为客户提供更多的硬件和软件选择。”

除了 OpenContrail 的商业支持外，我们很可能还会看到 Mirantis 为那些想要学习如何利用它的云管理员和开发人员提供的教育服务。Mirantis 已经以其 [OpenStack 培训][6]课程而闻名，并将 Ceph 纳入了培训课程中。

在 2016 年，SDN 种类快速演变，并且对许多部署 OpenStack 的组织也有意义。IDC 最近发布了 SDN 市场的[一项研究][7]，预计从 2014 年到 2020 年 SDN 市场的年均复合增长率为 53.9％，届时市场价值将达到 125 亿美元。此外，“Technology Trends 2016” 报告将 SDN 列为组织最佳的技术投资之一。

IDC 网络基础设施总裁 [Rohit Mehra][8] 说：“云计算和第三方平台推动了 SDN 的需求，它将在 2020 年代表一个价值超过 125 亿美元的市场。丝毫不用奇怪的是 SDN 的价值将越来越多地渗透到网络虚拟化软件和 SDN 应用中，包括虚拟化网络和安全服务。大型企业在数据中心中实现 SDN 的价值，但它们最终将会认识到其在横跨分支机构和校园网络的广域网中的广泛应用。”

同时，Linux 基金会最近[宣布][9]发布了其 2016 年度报告[“开放云指导：当前趋势和开源项目”][10]。第三份年度报告全面介绍了开放云计算，并包含一个关于 SDN 的部分。

Linux 基金会还提供了[软件定义网络基础知识][11]（LFS265），这是一个自定进度的 SDN 在线课程，另外作为 [Open Daylight][12] 项目的领导者，另一个重要的开源 SDN 平台正在迅速成长。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/open-networking-summit/2017/2/opencontrail-essential-tool-openstack-ecosystem

作者：[SAM DEAN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sam-dean
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/contrails-cloudjpg
[3]:https://www.globenewswire.com/Tracker?data=brZ3aJVRyVHeFOyzJ1Dl4DMY3CsSV7XcYkwRyOcrw4rDHplSItUqHxXtWfs18mLsa8_bPzeN2EgZXWcQU8vchg==
[4]:http://www.econotimes.com/Mirantis-Becomes-First-Vendor-to-Offer-Support-and-Managed-Services-for-OpenContrail-SDN-486228
[5]:https://www.globenewswire.com/Tracker?data=Lv6LkvREFzGWgujrf1n6r_qmjSdu67-zdRAYt2itKQ6Fytomhfphuk5EbDNjNYtfgAsbnqI8H1dn_5kB5uOSmmSYY9XP2ibkrPw_wKi5JtnAyV43AjuR_epMmOUkZZ8QtFdkR33lTGDmN6O5B4xkwv7fENcDpm30nI2Og_YrYf0b4th8Yy4S47lKgITa7dz2bJpwpbCIzd7muk0BZ17vsEp0S3j4kQJnmYYYk5udOMA=
[6]:https://training.mirantis.com/
[7]:https://www.idc.com/getdoc.jsp?containerId=prUS41005016
[8]:http://www.idc.com/getdoc.jsp?containerId=PRF003513
[9]:https://www.linux.com/blog/linux-foundation-issues-2016-guide-open-source-cloud-projects
[10]:http://ctt.marketwire.com/?release=11G120876-001&id=10172077&type=0&url=http%3A%2F%2Fgo.linuxfoundation.org%2Frd-open-cloud-report-2016-pr
[11]:https://training.linuxfoundation.org/linux-courses/system-administration-training/software-defined-networking-fundamentals
[12]:https://www.opendaylight.org/
