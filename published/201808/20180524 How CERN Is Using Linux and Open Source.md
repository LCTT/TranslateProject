欧洲核子研究组织（CERN）是如何使用 Linux 和开源的
============================================================

![CERN](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/atlas-cern.jpg?itok=IRLUYCNQ "CERN")

>欧洲核子研究组织（简称 CERN）依靠开源技术处理大型强子对撞机生成的大量数据。ATLAS（超环面仪器，如图所示）是一种探测基本粒子的通用探测器。（图片来源：CERN）

[CERN][6] 无需过多介绍了吧。CERN 创建了<ruby>万维网<rt>World Wide Web</rt></ruby>（WWW）和<ruby>大型强子对撞机<rt>Large Hadron Collider</rt></ruby>（LHC），这是世界上最大的<ruby>粒子加速器<rt>particle accelerator</rt></ruby>，就是通过它发现了 <ruby>[希格斯玻色子][7]<rt>Higgs boson</rt></ruby>。负责该组织 IT 操作系统和基础架构的 Tim Bell 表示，他的团队的目标是“为全球 13000 名物理学家提供计算设施，以分析这些碰撞，了解宇宙的构成以及是如何运转的。”

CERN 正在进行硬核科学研究，尤其是大型强子对撞机，它在运行时 [生成大量数据][8]。“CERN 目前存储大约 200 PB 的数据，当加速器运行时，每月有超过 10 PB 的数据产生。这必然会给计算基础架构带来极大的挑战，包括存储大量数据，以及能够在合理的时间范围内处理数据，对于网络、存储技术和高效计算架构都是很大的压力。“Bell 说到。

![Tim Bell](https://www.linux.com/sites/lcom/files/styles/floated_images/public/tim-bell-cern.png?itok=5eUOpip- "Tim Bell")

*Tim Bell, CERN*

大型强子对撞机的运作规模和它产生的数据量带来了严峻的挑战，但 CERN 对这些问题并不陌生。CERN 成立于 1954 年，已经 60 余年了。“我们一直面临着难以解决的计算能力挑战，但我们一直在与开源社区合作解决这些问题。”Bell 说，“即使在 90 年代，当我们发明万维网时，我们也希望与人们共享，使其能够从 CERN 的研究中受益，开源是做这件事的再合适不过的工具了。”

### 使用 OpenStack 和 CentOS

时至今日，CERN 是 OpenStack 的深度用户，而 Bell 则是 OpenStack 基金会的董事会成员之一。不过 CERN 比 OpenStack 出现的要早，多年来，他们一直在使用各种开源技术通过 Linux 服务器提供服务。

“在过去的十年中，我们发现，与其自己解决问题，不如找到面临类似挑战的上游开源社区进行合作，然后我们一同为这些项目做出贡献，而不是一切都由自己来创造和维护。“Bell 说。

一个很好的例子是 Linux 本身。CERN 曾经是 Red Hat Enterprise Linux 的客户。其实，早在 2004 年，他们就与 Fermilab 合作一起建立了自己的 Linux 发行版，名为 [Scientific Linux][9]。最终他们意识到，因为没有修改内核，耗费时间建立自己的发行版是没有意义的，所以他们迁移到了 CentOS 上。由于 CentOS 是一个完全开源和社区驱使的项目，CERN 可以与该项目合作，并为 CentOS 的构建和分发做出贡献。

CERN 帮助 CentOS 提供基础架构，他们还组织了 CentOS DoJo 活动（LCTT 译者注：CentOS Dojo 是为期一日的活动，汇聚来自 CentOS 社群的人分享系统管理、最佳实践及新兴科技。），工程师可以汇聚在此共同改进 CentOS 的封装。

除了 OpenStack 和 CentOS 之外，CERN 还是其他开源项目的深度用户，包括用于配置管理的 Puppet、用于监控的 Grafana 和 InfluxDB，等等。

“我们与全球约 170 个实验室合作。因此，每当我们发现一个开源项目的改进之处，其他实验室便可以很容易地采纳使用。”Bell 说，“与此同时，我们也向其他项目学习。当像 eBay 和 Rackspace 这样大规模的装机量提高了解决方案的可扩展性时，我们也从中受益，也可以扩大规模。“

### 解决现实问题

2012 年左右，CERN 正在研究如何为大型强子对撞机扩展计算能力，但难点是人员而不是技术。CERN 雇用的员工人数是固定的。“我们必须找到一种方法来扩展计算能力，而不需要大量额外的人来管理。”Bell 说，“OpenStack 为我们提供了一个自动的 API 驱动和软件定义的基础架构。”OpenStack 还帮助 CERN 检查与服务交付相关的问题，然后使其自动化，而无需增加员工。

“我们目前在日内瓦和布达佩斯的两个数据中心运行大约 280000 个处理器核心和 7000 台服务器。我们正在使用软件定义的基础架构使一切自动化，这使我们能够在保持员工数量不变的同时继续添加更多的服务器。“Bell 说。

随着时间的推移，CERN 将面临更大的挑战。大型强子对撞机有一个到 2035 年的蓝图，包括一些重要的升级。“我们的加速器运转三到四年，然后会用 18 个月或两年的时间来升级基础架构。在这维护期间我们会做一些计算能力的规划。
”Bell 说。CERN 还计划升级高亮度大型强子对撞机，会允许更高光度的光束。与目前的 CERN 的规模相比，升级意味着计算需求需增加约 60 倍。

“根据摩尔定律，我们可能只能满足需求的四分之一，因此我们必须找到相应的扩展计算能力和存储基础架构的方法，并找到自动化和解决方案，例如 OpenStack，将有助于此。”Bell 说。

“当我们开始使用大型强子对撞机并观察我们如何提供计算能力时，很明显我们无法将所有内容都放入 CERN 的数据中心，因此我们设计了一个分布式网格结构：位于中心的 CERN 和围绕着它的级联结构。”Bell 说，“全世界约有 12 个大型一级数据中心，然后是 150 所小型大学和实验室。他们从大型强子对撞机的数据中收集样本，以帮助物理学家理解和分析数据。”

这种结构意味着 CERN 正在进行国际合作，数百个国家正致力于分析这些数据。归结为一个基本原则，即开源不仅仅是共享代码，还包括人们之间的协作、知识共享，以实现个人、组织或公司无法单独实现的目标。这就是开源世界的希格斯玻色子。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/5/how-cern-using-linux-open-source

作者：[SWAPNIL BHARTIYA][a]
译者：[jessie-pang](https://github.com/jessie-pang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://home.cern/about/experiments/atlas
[4]:https://www.linux.com/files/images/tim-bell-cernpng
[5]:https://www.linux.com/files/images/atlas-cernjpg
[6]:https://home.cern/
[7]:https://home.cern/topics/higgs-boson
[8]:https://home.cern/about/computing
[9]:https://www.scientificlinux.org/