The infrastructure behind Twitter: efficiency and optimization
Twitter背后的基础设施：效率与优化
===========


In the past, we've published details about Finagle, Manhattan, and the summary of how we re-architected the site to be able to handle events like Castle in the Sky, the Super Bowl, 2014 World Cup, the global New Year's Eve celebration, among others. In this infrastructure series, we're focusing on the core infrastructure and components that run Twitter. We're also going to focus each blog on efforts surrounding scalability, reliability, and efficiency in a way that highlights the history of our infrastructure, challenges we've faced, lessons learned, upgrades made, and where we're heading.
过去我们曾经发布过一些关于 [Finagle](https://twitter.github.io/finagle/) , [Manhattan](https://blog.twitter.com/2014/manhattan-our-real-time-multi-tenant-distributed-database-for-twitter-scale) 等项目文章，还有如何优化我们的架构来支撑一些大型事件，例如天空之城（下有注释），超级碗， 2014 世界杯，全球新年夜庆祝活动等。在这个基础设施系列文章中，我们主要聚焦于 Twitter 运营所需的一些关键设施和组件。我们也将会在后续的文章中写一些我们在扩展性，可靠性，效率性方面的做过的事情，比如我们基础设施历史，遇到过的挑战，学到的教训，做过的升级，以及我们现在前进的方向等等。

> 2013年8月2日，宫崎骏的《天空之城》在NTV迎来其第14次电视重播，剧情发展到高潮之时，Twitter的TPS（Tweets Per Second）也被推上了新的高度——143,199 TPS，是平均值的25倍，这个记录保持至今 -- 译者注。

### Data center efficiency
### 数据中心的效率优化

#### History
#### 历史

Twitter hardware and data centers are at the scale few technology companies ever reach. However, this was not accomplished without a few missteps along the way. Our uptime has matured through a combination of physical improvements and software-based changes.
当前Twitter硬件规模和数据中心的数量超过大多数公司。但达到这样的规模不是一蹴而就的，我们曾经犯过很多错误，系统也是随着硬件和软件升级逐渐优化而一步步成熟起来的。

During the period when the fail whale was prevalent, outages occurred due to software limitations, as well as physical failures at the hardware or infrastructure level. Failure domains existed in various definitions which had to be aggregated to determine the risk and required redundancy for services. As the business scaled in customers, services, media content, and global presence, the strategy evolved to efficiently and resiliently support the service.
有个一时期我们的系统故障不断。软件问题，硬件问题，甚至底层设问题不断爆发，常常导致系统运营中断。随着 Twitter 在客户、服务、媒体上的影响力不断扩大，构建一个高效、可靠的系统来提供服务成为我们的战略诉求。

> Twitter系统故障的界面被称为失败鲸（Fail Whale），如下图 -- 译者注
![Fail Whale](https://upload.wikimedia.org/wikipedia/en/d/de/Failwhale.png)

#### Challenges
#### 挑战

Software dependencies on bare metal were further dependant on our data centers' ability to operate and maintain uptime of power, fiber connectivity, and environment. These discrete physical failure domains had to be reviewed against the services distributed on the hardware to provide for fault tolerance.
将软件直接安装在服务器上意味着可靠性是建立在数据中心的硬件之上，电源、网络以及其他的环境因素都是可能的威胁。这种情况下，如果要增加容错能力，就需要统筹考虑物理设备和在上面运行的服务。

The initial decision of which data center service provider to scale with was done when specialization in site selection, operation, and design was in its infancy. We began in a hosted provider then migrated to a colocation facility as we scaled. Early service interruptions occurred as result of equipment failures, data center design issues, maintenance issues, and human error. As a result, we continually iterated on the physical layer designs to increase the resiliency of the hardware and the data center operations.
刚开始决策使用哪个数据中心供应商的时候，我们都还是菜鸟，对于站点选择、运营和设计都非常不专业。我们先选择租用主机，业务增长后我们改用主机托管服务。早期的业务故障主要是因为设备故障、数据中心设计问题、维护问题以及人为操作失误。我们也在持续迭代我们的硬件设计，从而增强硬件和数据中心的容错性。

The physical reasons for service interruptions were inclusive of hardware failures at the server component level, top of rack switch, and core switches. For example, during the initial evaluation of our customized servers, the hardware team determined the cost of the second power supply was not warranted given the low rate of failure of server power supplies — so they were removed from the design. The data center power topology provides redundancy through separate physical whips to the racks and requires the second power supply. Removal of the second power supply eliminated the redundant power path, leaving the hardware vulnerable to impact during distribution faults in the power system. To mitigate the impact of the single power supply, ATS units were required to be added at the rack level to allow a secondary path for power.
服务中断的原因有很多，其中硬件故障常发生在服务器、机架交换机、核心交换机这地方。举一个曾经犯过的错误，我们的硬件团队最初在设计服务器的时候，认为双路电源对减少供电问题的意义不大 -- 他们真的就移除了一块电源。然而数据中心一般提供两路供电给机架来提高冗余性，防止电网的问题引发事故，而这需要两块电源。最终我们不得不在机架上增加ATS单元（AC transfer switch 交流切换开关）来接入第二路供电。

The layering of systems with diverse fiber paths, power sources, and physical domains continued to separate services from impacts at relatively small scale interruptions, thus improving resiliency.
提高系统的可靠性靠的就是这样的改进，给网络、供电甚至机房增加冗余，从而将影响压缩到最小范围。

#### Lessons learned and major technology upgrades, migrations, and adoptions
#### 我们学到的教训以及重要的技术升级、迁移和选型

We learned to model dependencies between the physical failure domains, (i.e. building power and cooling, hardware, fiber) and the services distributed across them to better predict fault tolerance and drive improvements.
我们学到的第一个就是要先建模，将可能出故障的地方（例如建筑的供电和冷却系统、硬件、光线网络等）和它们上面构建的服务之间的依赖关系弄清楚，这样才能更好分析，从而优化设计提升容错能力。

We added additional data centers providing regional diversity to mitigate risk from natural disaster and the ability to fail between regions when it was needed during major upgrades, deploys or incidents. The active-active operation of data centers provided for staged code deployment reducing overall impacts of code rollouts.
我们增加了更多的数据中心提升地理容灾能力，减少自然灾害的影响，而且站点的隔离也降低了软件的风险，例如软件部署升级和系统故障等等。这种多活的数据中心架构提供了代码灰度发布的能力，减少代码首次上线时候的影响。

The efficiency of power use by the data centers has improved with expanding the operating ranges of the environmental envelope and designing the hardware for resiliency at the higher operating temperatures.
我们设计新硬件使之能够在更高温度下正常运行，数据中心的能源效率有所提升。

#### Future work
#### 下一步工作

Our data centers continue to evolve in strategy and operation, providing for live changes to the operating network and hardware without interruption to the users. Our strategy will continue to focus on scale within the existing power and physical footprints through optimization and maintaining flexibility while driving efficiency in the coming years.
随着公司的战略发展和运营增长，我们的数据中心也在持续不断改进，而这一切都不影响我们的最终用户。接下来我们的工作还是在当前能耗和硬件的基础上，通过维护和优化来提升效率。

### Hardware efficiency
### 硬件的效率优化

#### History and challenges
#### 历史和挑战

Our hardware engineering team was started to qualify and validate performance of off-the-shelf purchased hardware, and evolved into customization of hardware for cost and performance optimizations.
我们的硬件工程师团队刚成立的时候只能测试市面上现有硬件，而现在我们能自己定制硬件以节省成本并提升效率。

Procuring and consuming hardware at Twitter's scale comes with a unique set of challenges. In order to meet the demands of our internal customers, we initially started a program to qualify and ensure the quality of purchased hardware. The team was primarily focused on performance and reliability testing ensuring that systems could meet the demands. Running systematic tests to validate the behavior was predictable, and there were very few bugs introduced.
Twitter 是一个很大的公司，它对硬件的要求对任何人来说都是一个不小的挑战。为了满足整个公司的需求，我们的第一个项工作是能检测并保证购买的硬件的品质。团队重点关注的是性能和可靠性这两部分。对于硬件我们会做系统性的测试来保证其性能可预测，保证尽量不引入新的问题。

As we scaled our major workloads (Mesos, Hadoop, Manhattan, and MySQL) it became apparent the available market offerings didn't quite meet the needs. Off-the-shelf servers come with enterprise features, like raid controllers and hot swap power supplies. These components improve reliability at small scale, but often decrease performance and increase cost; for example some raid controllers interfered with the performance of SSDs and could be a third of the cost of the system.
随着我们一些关键组件的负荷越来越大（如 Mesos , Hadoop , Manhattan , MySQL 等），市面上的产品已经无法满足我们的需求。同时供应商提供的一些高级服务器功能，例如 Raid 管理或者电源热切换等，可靠性提升很小，反而会拖累系统性能而且价格高昂，例如一些 Raid 控制器会影响 SSD 的性能，价格高达系统总报价的三分之一。

At the time, we were a large user of mysql databases. Issues arose from both supply and performance of SAS media. The majority of deployments were 1u servers, and the total number of drives used plus a writeback cache could predict the performance of a system often time limited to a sustained 2000 sequential IOPS. In order to continue scaling this workload, we were stranding CPU cores and disk capacity to meet IOPS requirement. We were unable to find cost-effective solutions at this time.
那时，我们也是 MySQL 数据库的一个大型用户。SAS（Serial Attached SCSI，串行连接 SCSI ）设备的供应和性能都有很大的问题。我们大量使用 1 u 的服务器，它的驱动器和回写缓存一起也只能支撑每秒 2000 次顺序 IO。为了获得更好的效果，我们只得不断增加 CPU 核心数并加强磁盘能力。我们那时候找不到更节省成本的方案。

As our volume of hardware reached a critical mass, it made sense to invest in a hardware engineering team for customized white box solutions with focus on reducing the capital expenses and increased performance metrics.
后来随着我们对硬件需求越来越大，我们可以成立了一个硬件团队，从而自己来设计更便宜更高效的硬件。

#### Major technology changes and adoption
#### 关键技术变更与选择

We've made many transitions in our hardware technology stack. Below is a timeline for adoptions of new technology and internally developed platforms.
在硬件技术上我们切换了很多次，下面是我们采用的新技术和自研平台的时间线。

- 2012 - SSDs become the primary storage media for our MySQL and key/value databases.
- 2013 - Our first custom solution for Hadoop workloads is developed, and becomes our primary bulk storage solution.
- 2013 - Our custom solution is developed for Mesos, TFE, and cache workloads.
- 2014 - Our custom SSD key/value server completes development.
- 2015 - Our custom database solution is developed.
- 2016 - We developed GPU systems for inference and training of machine learning models.
- 2012 - 采用SSD作为我们 MySQL 和 Key-Value 数据库的主要存储媒介。
- 2013 - 我们开发了第一个定制版 Hadoop 工作站，它现在是我们主要的大容量存储方案。
- 2013 - 我们定制的解决方案应用在 Mesos 、 TFE（ Twitter Front-End ）以及缓存设备上。
- 2014 - 我们定制的 SSD Key-Value 服务器完成开发。
- 2015 - 我们定制的数据库解决方案完成开发。
- 2016 - 我们开发了一个 GPU 系统来做知识推理，机器学习训练。

#### Lessons learned
#### 学到的教训

The objective of our Hardware Engineering team is to significantly reduce the capital expenditure and operating expenditure by making small tradeoffs that improve our TCO. Two generalizations can apply to reduce the cost of a server:
硬件团队的目标是通过做取舍来优化TCO（总体拥有成本），最终达到达到降低CAPEX（资本支出）和OPEX（运营支出）的目的。概括来说，服务器降成本就是：

1. Removing the unused components
2. Improving utilization
1. 删除无用的功能和组件
2. 提升利用率

Twitter's workload is divided into four main verticals: storage, compute, database, and gpu. Twitter defines requirements on a per vertical basis, allowing Hardware Engineering to produce a focused feature set for each. This approach allows us to optimize component selection where the equipment may go unused or underutilized. For example, our storage configuration has been designed specifically for Hadoop workloads and was delivered at a TCO reduction of 20% over the original OEM solution. At the same time, the design improved both the performance and reliability of the hardware. Similarly, for our compute vertical, the Hardware Engineering Team has improved the efficiency of these systems by removing unnecessary features.
Twitter 的设备总体来说有这四大类：存储设备、计算设备、数据库和 GPU 。 Twitter 对每一类都定义了详细的需求，让硬件工程师根据针对性地设计产品，这样我们就能优化掉那些用不到或者很少用的部分。例如，我们的存储设备就专门为 Hadoop 优化，设备的购买和运营价格相比于 OEM 产品降低了 20% 。同时，减少功能还提高了设备的性能和可靠性。同样的，对于计算设备，硬件工程师们也通过移除无用的特性获得了效率提升。

There is a minimum overhead required to operate a server, and we quickly reached a point where it could no longer remove components to reduce cost. In the compute vertical specifically, we decided the best approach was to look at solutions that replaced multiple nodes with a single node, and rely on Aurora/Mesos to manage the capacity. We settled on a design that replaced two of our previous generation compute nodes with a single node.
一个服务器可以移除的组件总是有限的，我们很快就把能移除的都扔掉了。我们想出了其他办法，例如在存储设备里，我们认为降低成本最好的办法是用一台节点替换多个节点，并通过 Aurora/Mesos 来管理负载。这就是我们现在正在做的东西。

Our design verification began with a series of rough benchmarks, and then progressed to a series of production load tests confirming a scaling factor of 2. Most of this improvement came from simply increasing the thread count of the CPU, but our testing confirmed a 20-50% improvement in our per thread performance. Additionally we saw a 25% increase in our per thread power efficiency, due to sharing the overhead of the server across more threads.
对于这个我们自己新设计的服务器，首先要通过一系列的标准测试，然后会再做一系列负载测试，我们的目标是一台新设备至少能替换两台旧设备。大多数的提升都比较简单，例如增加 CPU 的进程数，同时我们的测试确认新 CPU 有 20~50% 的单线程性能提升，单线程能耗也降低了了 25% ，这都是我们测试环节需要做的工作。

For the initial deployment, our monitoring showed a 1.5 replacement factor, which was well below the design goal. An examination of the performance data revealed there was a flawed assumption in the workload characteristics, and that it needed to be identified.
这个新设备第一次部署的时候，监控发现新设备只能替换 1.5 台旧设备，这比我们的目标低了很多。对性能数据检查后发现，我们之前新硬件的部分指标是错的，而这正是我们在做性能测试需要发现的问题。

Our Hardware Engineering Team's initial action was to develop a model to predict the packing efficiency of the current Aurora job set into various hardware configurations. This model correctly predicted the scaling factor we were observing in the fleet, and suggested we were stranding cores due to unforeseen storage requirements. Additionally, the model predicted we would see a still improved scaling factor by changing the memory configuration as well.
对此我们硬件团队首先开发了一个模型，用来预测在不同的硬件配置下当前 Aurora 任务的打包效率。这个模型正确的预测了新旧硬件的性能比例。模型还指出了我们一开始没有考虑到的存储需求，并因此建议我们增加 CPU 核心数。另外，它还预测，如果我们修改内存的配置，那系统的性能还会有较大提高。

Hardware configuration changes take time to implement, so Hardware Engineering identified a few large jobs and worked with our SRE teams to adjust the scheduling requirements to reduce the storage needs. These changes were quick to deploy, and resulted in an immediate improvement to a 1.85 scaling factor.
硬件配置的改变都需要花时间去操作，所以我们的硬件工程师们就首先找出几个关键的任务。例如我们和站点工程团队一起计划任务顺序来降低存储需求，这种修改很简单，并且很快将我们的效率提高了 1.85 倍。

In order to address the situation permanently, we needed to adjust to configuration of the server. Simply expanding the installed memory and disk capacity resulted in a 20% improvement in the CPU core utilization, at a minimal cost increase. Hardware Engineering worked with our manufacturing partners to adjust the bill of materials for the initial shipments of these servers. Follow up observations confirmed a 2.4 scaling factor exceeding the target design.
为了更好的优化效率，我们对新硬件的配置做了修改，扩大了内存和磁盘容量就将 CPU 利用率提高了20%，而这个简单的修改只增加了非常小的成本。同时我们的硬件工程师也和生产的伙伴一起优化发货顺序来降低货运成本。后续的观察发现我们的自己的新设备实际上替换了2.4台旧设备，这个超出了预定的目标。

### Migration from bare metal to mesos
### 从裸设备迁移到 mesos 集群

Until 2012, running a service inside Twitter required hardware requisitions. Service owners had to find out and request the particular model or class of server, worry about your rack diversity, maintain scripts to deploy code, and manage dead hardware. There was essentially no "service discovery." When a web service needed to talk to the user service, it typically loaded up a YAML file containing all of the host IPs and ports of the user service and the service used that list (port reservations were tracked in a wiki page). As hardware died or was added, managing required editing and committing changes to the YAML file that would go out with the next deploy. Making changes in the caching tier meant many deploys over hours and days, adding a few hosts at a time and deploying in stages. Dealing with cache inconsistencies during the deploy was a common occurrence, since some hosts would be using the new list and some the old. It was possible to have a host running old code (because the box was temporarily down during the deploy) resulting in a flaky behavior with the site.
直到2012年为止，软件团队在 Twitter 开通一个新服务还需要自己操心硬件：提出硬件的规格需求，研究机架尺寸，开发部署脚本以及处理硬件故障。同时，系统中没有所谓的“服务发现”机制，当一个服务需要调用一个另一个服务时候，需要读取一个 YAML 配置文件，这个配置文件中有目标服务对应的主机 IP 和端口信息（端口信息是由一个公共 wiki 页面维护的）。随着硬件的替换和更新，YAML 配置文件里的内容也会不断的编辑更新。在各个系统的 cache 层更新配置意味着需要花几个小时甚至几天才重启服务，所以我们只能尽量一次增加多个配置并且按次序分别重启。我们经常遇到重启过程中 cache 不一致导致的问题，有的主机在使用旧的配置有的主机在用新的。有时候一台主机的异常（它正在重启）会导致整个站点都无法正常工作。 

In 2012/2013, two things started to get adopted at Twitter: service discovery (via a zookeeper cluster and a library in the core module of Finagle) and Mesos (including our own scheduler framework on top of Mesos called Aurora, now an Apache project).
在 2012/2013 年的时候，Twitter 开始尝试两个新事物：服务发现（来自 ZooKeeper 集群和 Finagle 核心模块中的一个库）和 Mesos（包括基于 Mesos 的一个自研的计划任务框架 Aurora ，它现在也是 Apache 基金会的一个项目）。

Service discovery no longer required static YAML host lists. A service either self-registered on startup or was automatically registered under mesos into a "serverset" (which is just a path to a list of znodes in zookeeper based on the role, environment, and service name). Any service that needed to talk to that service would just watch that path and get a live view of what servers were out there.
服务发现功能意味着不需要再维护一个静态 YAML 主机列表了。服务或者在启动后主动注册，或者自动被 mesos 接入到一个“服务集”（就是一个 ZooKeeper 中的 znode 列表，包含角色、环境和服务名信息）中。任何想要访问这个服务的组件都只需要监控这个路径就可以实时获取到一个正在工作的服务列表。

With Mesos/Aurora, instead of having a script (we were heavy users of Capistrano) that took a list of hosts, pushed binaries around and orchestrated a rolling restart, a service owner pushed the package into a service called "packer" (which is a service backed by HDFS), uploaded an aurora configuration that described the service (how many CPUs it needed, how much memory, how many instances needed, the command lines of all the tasks each instance should run) and Aurora would complete the deploy. It schedules instances on an available hosts, downloads the artifact from packer, registers it in service discovery, and launches it. If there are any failures (hardware dies, network fails, etc), Mesos/Aurora automatically reschedules the instance on another host.
现在我们通过 Mesos/Aurora ，而不是使用脚本（我们曾经是 Capistrano 的重度用户）来获取一个主机列表、分发代码并规划重启任务。现在软件团队如果想部署一个新服务，只需要将软件包上传到一个叫 Packer 的工具上（它是一个基于 HDFS 的一个服务），再在 Aurora 配置上描述文件（需要多少 CPU ，多少内存，多少个实例，启动的命令行），然后 Aurora 就会完成整个部署过程。 Aurora 找到可用的主机，从 Packer 下载代码，注册到“服务发现”，然后启动这个服务。如果整个过程中遇到失败（硬件故障、网络中断等等）， Mesos/Aurora 会自动规划一个新主机并将服务部署上去。

#### Twitter's Private PaaS
#### Twitter 的私有 PaaS 云平台

Mesos/Aurora and Service Discovery in combination were revolutionary. There were many bugs and growing pains over the next few years and many hard lessons learned about distributed systems, but the fundamental design was sound. In the old world, the teams were constantly dealing with and thinking about hardware and its management. In the new world, the engineers only have to think about how best to configure their services and how much capacity to deploy. We were also able to radically improve the CPU utilization of Twitter's fleet over time, since generally each service that got their own bare metal hardware didn't fully utilize its resources and did a poor job of managing capacity. Mesos allows us to pack multiple services into a box without having to think about it, and adding capacity to a service is only requesting quota, changing one line of a config, and doing a deploy.
Mesos/Aurora 和服务发现对我们的影响是革命性的。虽然在接下来几年里，我们碰到了无数 bug ，伤透了无数脑筋，学到了分布式系统里的无数教训，但是这套架还是非常棒。以前大家一直在考虑如何搭配和管理硬件，而现在，大家只需要考虑如何优化业务以及需要多少系统能力就可以了。同时，我们也从根本上解决了 CPU 利用率低的问题，以前服务直接安装在服务器上，这样的方式无法充分利用服务器资源，任务协调能力也很差。现在 Mesos 允许我们把多个服务打包成一个服务包，往里面增加一个新服务只需要增加一些硬件配额，改一行配置然后部署就可以了。

Within two years, most "stateless" services moved into Mesos. Some of the most important and largest services (including our user service and our ads serving system) were among the first to move. Being the largest, they saw the biggest benefit to their operational burden. This allowed them to reduce their operational burden.
在两年内，多数“无状态”服务迁移到了Mesos平台。一些极为重要和大型的服务（包括我们的用户服务和广告服务）是最先迁移上去的。因为它们的体量，所以他们从减少操作负担里获得了最大的好处。

We are continuously looking for ways to improve the efficiency and optimization of the infrastructure. As part of this, we regularly benchmark against public cloud providers and offerings to validate our TCO and performance expectations of the infrastructure. We also have a good presence in public cloud, and will continue to utilize the public cloud when it's the best available option. The next series of this post will mainly focus on the scale of our infrastructure.
我们一直在不断追寻提升效率和优化架构的方法。同时我们也定期去测试公有云提供商的产品来校正我们架构的TCO和性能期望。我们也在使用一些公有云的服务，如果公有云的服务更好的时候我们也会继续使用下去。这个系列的下一篇将会主要聚焦于我们基础设施的规模方面。

Special thanks to Jennifer Fraser, David Barr, Geoff Papilion, Matt Singer, and Lam Dong for all their contributions to this blog post.
特别感谢Jennifer Fraser, David Barr, Geoff Papilion, Matt Singer, Lam Dong对这篇文章的贡献。




--------------------------------------------------------------------------------

via: https://blog.twitter.com/2016/the-infrastructure-behind-twitter-efficiency-and-optimization?utm_source=webopsweekly&utm_medium=email

作者：[mazdakh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twitter.com/intent/user?screen_name=mazdakh
[1]: https://twitter.com/jenniferfraser
[2]: https://twitter.com/davebarr
[3]: https://twitter.com/gpapilion
[4]: https://twitter.com/lamdong
[5]: 宫崎骏大师的《天空之城》在NTV迎来其第14次电视重播，剧情发展到高潮之时，“Blase祭”也将Twitter的TPS（Twitters per second）推上了新的高度——143,199 TPS，Twitter一般每天会发出5亿多条微博，平均5700 TPS，新纪录是平均值的25倍。






