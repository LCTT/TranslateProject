5 个需要知道的开源的软件定义网络（SDN）项目
============================================================


 ![SDN](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/software-defined-networking_0.jpg?itok=FeWzZo8n "SDN") 

> SDN 开始重新定义企业网络。这里有五个应该知道的开源项目。


纵观整个 2016 年，软件定义网络（SDN）持续快速发展并变得成熟。我们现在已经超出了开源网络的概念阶段，两年前评估这些项目潜力的公司已经开始了企业部署。如几年来所预测的，SDN 正在开始重新定义企业网络。

这与市场研究人员的观点基本上是一致的。IDC 在今年早些时候公布了 SDN 市场的[一份研究][3]，它预计从 2014 年到 2020 年 SDN 的年均复合增长率为 53.9％，届时市场价值将达到 125 亿美元。此外，“<ruby>2016 技术趋势<rt>Technology Trends 2016</rt></ruby>” 报告中将 SDN 列为 2016 年最佳技术投资。

IDC 网络基础设施副总裁，[Rohit Mehra][4] 说：“云计算和第三方平台推动了 SDN 的需求，这预示着 2020 年的一个价值超过 125 亿美元的市场。毫无疑问的是 SDN 的价值将越来越多地渗透到网络虚拟化软件和 SDN 应用中，包括虚拟化网络和安全服务。大型企业现在正在数据中心体现 SDN 的价值，但它们最终会认识到其在分支机构和校园网络中的广泛应用。“

Linux 基金会最近[发布][5]了其 2016 年度报告[“开放云指南：当前趋势和开源项目”][6]。其中第三份年度报告全面介绍了开放云计算的状态，并包含关于 unikernel 的部分。你现在可以[下载报告][7]了，首先要注意的是汇总和分析研究，说明了容器、unikernel 等的趋势是如何重塑云计算的。该报告提供了对当今开放云环境中心的分类项目的描述和链接。

在本系列中，我们会研究各种类别，并提供关于这些领域如何发展的更多见解。下面，你会看到几个重要的 SDN 项目及其所带来的影响，以及 GitHub 仓库的链接，这些都是从“开放云指南”中收集的：

### 软件定义网络

#### [ONOS][8]

<ruby>开放网络操作系统<rt>Open Network Operating System</rt></ruby>（ONOS）是一个 Linux 基金会项目，它是一个面向服务提供商的软件定义网络操作系统，它具有可扩展性、高可用性、高性能和抽象功能来创建应用程序和服务。

[ONOS 的 GitHub 地址][9]。

#### [OpenContrail][10]

OpenContrail 是 Juniper Networks 的云开源网络虚拟化平台。它提供网络虚拟化的所有必要组件：SDN 控制器、虚拟路由器、分析引擎和已发布的上层 API。其 REST API 配置并收集来自系统的操作和分析数据。

[OpenContrail 的 GitHub 地址][11]。

#### [OpenDaylight][12]

OpenDaylight 是 Linux 基金会旗下的 OpenDaylight 基金会项目，它是一个可编程的、提供给服务提供商和企业的软件定义网络平台。它基于微服务架构，可以在多供应商环境中的一系列硬件上实现网络服务。

[OpenDaylight 的 GitHub 地址][13]。

#### [Open vSwitch][14]

Open vSwitch 是一个 Linux 基金会项目，是具有生产级品质的多层虚拟交换机。它通过程序化扩展设计用于大规模网络自动化，同时还支持标准管理接口和协议，包括 NetFlow、sFlow、IPFIX、RSPAN、CLI、LACP 和 802.1ag。它支持类似 VMware 的分布式 vNetwork 或者 Cisco Nexus 1000V 那样跨越多个物理服务器分发。

[OVS 在 GitHub 的地址][15]。

#### [OPNFV][16]

<ruby>网络功能虚拟化开放平台<rt>Open Platform for Network Functions Virtualization</rt></ruby>（OPNFV）是 Linux 基金会项目，它用于企业和服务提供商网络的 NFV 平台。它汇集了计算、存储和网络虚拟化方面的上游组件以创建 NFV 程序的端到端平台。

[OPNFV 在 Bitergia 上的地址][17]。

_要了解更多关于开源云计算趋势和查看顶级开源云计算项目完整列表，[请下载 Linux 基金会的 “开放云指南”][18]。_

--------------------------------------------------------------------------------

via: https://www.linux.com/news/open-cloud-report/2016/5-open-source-software-defined-networking-projects-know

作者：[SAM DEAN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sam-dean
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/software-defined-networkingjpg-0
[3]:https://www.idc.com/getdoc.jsp?containerId=prUS41005016
[4]:http://www.idc.com/getdoc.jsp?containerId=PRF003513
[5]:https://www.linux.com/blog/linux-foundation-issues-2016-guide-open-source-cloud-projects
[6]:http://ctt.marketwire.com/?release=11G120876-001&id=10172077&type=0&url=http%3A%2F%2Fgo.linuxfoundation.org%2Frd-open-cloud-report-2016-pr
[7]:http://go.linuxfoundation.org/l/6342/2016-10-31/3krbjr
[8]:http://onosproject.org/
[9]:https://github.com/opennetworkinglab/onos
[10]:http://www.opencontrail.org/
[11]:https://github.com/Juniper/contrail-controller
[12]:https://www.opendaylight.org/
[13]:https://github.com/opendaylight
[14]:http://openvswitch.org/
[15]:https://github.com/openvswitch/ovs
[16]:https://www.opnfv.org/
[17]:http://projects.bitergia.com/opnfv/browser/
[18]:http://bit.ly/2eHQOwy
