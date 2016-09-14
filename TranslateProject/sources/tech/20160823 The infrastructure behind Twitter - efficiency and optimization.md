The infrastructure behind Twitter: efficiency and optimization
Twitter背后的架构：效率与优化
===========


In the past, we've published details about Finagle, Manhattan, and the summary of how we re-architected the site to be able to handle events like Castle in the Sky, the Super Bowl, 2014 World Cup, the global New Year's Eve celebration, among others. In this infrastructure series, we're focusing on the core infrastructure and components that run Twitter. We're also going to focus each blog on efforts surrounding scalability, reliability, and efficiency in a way that highlights the history of our infrastructure, challenges we've faced, lessons learned, upgrades made, and where we're heading.
之前我们已经发布了关于[Finagle](https://twitter.github.io/finagle/),[Manhattan](https://blog.twitter.com/2014/manhattan-our-real-time-multi-tenant-distributed-database-for-twitter-scale)两个项目，以及我们如何重构架构以使我们的系统能够处理天空之城（下有注释），超级碗，2014世界杯，全球新年夜庆祝活动等等。在这个架构系列中，我们聚焦于运营Twitter所需的关键设施和组件。我们也将会在blog中写一些我们在扩展性，可靠性，效率性方面的努力，包括我们基础设施历史，遇到过的挑战，学到的教训，做过的升级，以及我们现在前进的方向。

> 2013年8月2日，宫崎骏的《天空之城》在NTV迎来其第14次电视重播，剧情发展到高潮之时，Twitter的TPS（Tweets Per Second）也被推上了新的高度——143,199 TPS，是平均值的25倍，这个记录保持至今 -- 译者注。

### Data center efficiency
### 数据中心效率提升

#### History
####历史

Twitter hardware and data centers are at the scale few technology companies ever reach. However, this was not accomplished without a few missteps along the way. Our uptime has matured through a combination of physical improvements and software-based changes.
Twitter硬件和数据中心当前的规模是很少有公司能达到的。然而，走到这一步也经历过很多错误。我们的正常运行时间也随着硬件和软件升级逐渐提高。

During the period when the fail whale was prevalent, outages occurred due to software limitations, as well as physical failures at the hardware or infrastructure level. Failure domains existed in various definitions which had to be aggregated to determine the risk and required redundancy for services. As the business scaled in customers, services, media content, and global presence, the strategy evolved to efficiently and resiliently support the service.
那段系统经常挂掉的时间，系统因为各种原因经常运行中断，软件限制或者是硬件或设备引起的物理故障。故障出现在多个区域必须聚合在一起才能发现失败的地方并提供冗余来解决问题。随着Twitter的业务在客户、服务、媒体内容以及全球化方面的提升，Twitter的战略现在转变为构建更加高效、弹性支撑的服务。

> Twitter系统故障的界面被称为失败鲸（Fail Whale），如下图 -- 译者注
![Fail Whale](https://upload.wikimedia.org/wikipedia/en/d/de/Failwhale.png)

#### Challenges
#### 挑战

Software dependencies on bare metal were further dependant on our data centers' ability to operate and maintain uptime of power, fiber connectivity, and environment. These discrete physical failure domains had to be reviewed against the services distributed on the hardware to provide for fault tolerance.
裸机上的软件越来越依赖数据中心的能力来运营并维护电源的正常运行时间、光纤连接和环境。这些离散的物理故障必须和部署在它之上的服务一起考虑来优化容错能力。

The initial decision of which data center service provider to scale with was done when specialization in site selection, operation, and design was in its infancy. We began in a hosted provider then migrated to a colocation facility as we scaled. Early service interruptions occurred as result of equipment failures, data center design issues, maintenance issues, and human error. As a result, we continually iterated on the physical layer designs to increase the resiliency of the hardware and the data center operations.
最早决定使用哪些数据中心供应商的时候，我们的对于站点选择、运营和设计都非常不专业。我们一开始租用主机后来随着业务的增长我们选择主机代管服务。早起的业务中断主要是由设备故障、数据中心设计问题、维护问题以及人为操作失误造成的。我们持续迭代我们的物理层设计来增强硬件和数据中心操作的可恢复性。

The physical reasons for service interruptions were inclusive of hardware failures at the server component level, top of rack switch, and core switches. For example, during the initial evaluation of our customized servers, the hardware team determined the cost of the second power supply was not warranted given the low rate of failure of server power supplies — so they were removed from the design. The data center power topology provides redundancy through separate physical whips to the racks and requires the second power supply. Removal of the second power supply eliminated the redundant power path, leaving the hardware vulnerable to impact during distribution faults in the power system. To mitigate the impact of the single power supply, ATS units were required to be added at the rack level to allow a secondary path for power.
服务中断的物理故障原因包括服务器硬件、机架交换机、核心交换机等。例如，硬件团队在最初评审定制服务器的时候，认为双路电源不能保证降低服务器供电的问题 -- 他们移除了这个电源。数据中心的拓扑设计中通过给机架两路供电来提高冗余，而这需要两块电源，否则如果电网出现故障就很容易影响到硬件。为了减少单路供电造成的影响，我们不得不在机架上增加ATS单元（AC transfer switch 交流切换开关）来接入第二路供电。

The layering of systems with diverse fiber paths, power sources, and physical domains continued to separate services from impacts at relatively small scale interruptions, thus improving resiliency.
通过不同的光线线路、电力线处和多处机房分担服务这些方法吧我们的系统分层，这样将服务中断控制在较小的范围内，从而提高系统可靠性。

#### Lessons learned and major technology upgrades, migrations, and adoptions
#### 我们学到的教训和重要的技术升级、迁移和选型

We learned to model dependencies between the physical failure domains, (i.e. building power and cooling, hardware, fiber) and the services distributed across them to better predict fault tolerance and drive improvements.
我们学到要先建模，将可能出故障的地方（例如大楼的供电和冷却系统、硬件、光纤网络等）和它们上面构建的服务之间的依赖关系弄清楚，从而获得更好的容错能力并驱动提升。

We added additional data centers providing regional diversity to mitigate risk from natural disaster and the ability to fail between regions when it was needed during major upgrades, deploys or incidents. The active-active operation of data centers provided for staged code deployment reducing overall impacts of code rollouts.
我们增加了更多的数据中心提升地理容灾能力，从而减少自然灾害的影响，而且这样可以提高在大版本升级、部署和故障处理时候站点之间的容错能力。同时这种数据中心多活的形式提供了代码灰度发布的能力，减少代码首次部署时候的风险。

The efficiency of power use by the data centers has improved with expanding the operating ranges of the environmental envelope and designing the hardware for resiliency at the higher operating temperatures.
数据中心的能源使用效率也因为我们扩大数据中心的环境范围，设计新硬件能够在更高温度下正常运行。

#### Future work
#### 未来工作

Our data centers continue to evolve in strategy and operation, providing for live changes to the operating network and hardware without interruption to the users. Our strategy will continue to focus on scale within the existing power and physical footprints through optimization and maintaining flexibility while driving efficiency in the coming years.
我们数据中心的战略和运营都在持续改进中，在不影响终端用户的前提下对网络和硬件进行实时更改。我们明年的计划还是在当前能耗和硬件的基础上通过优化和更灵活的维护来提升效率。

### Hardware efficiency
### 硬件效率提升

#### History and challenges
#### 历史和挑战

Our hardware engineering team was started to qualify and validate performance of off-the-shelf purchased hardware, and evolved into customization of hardware for cost and performance optimizations.
我们的硬件工程师团队从检验市面上现有硬件开始，到现在定制硬件来节省成本并获得更好的表现。

Procuring and consuming hardware at Twitter's scale comes with a unique set of challenges. In order to meet the demands of our internal customers, we initially started a program to qualify and ensure the quality of purchased hardware. The team was primarily focused on performance and reliability testing ensuring that systems could meet the demands. Running systematic tests to validate the behavior was predictable, and there were very few bugs introduced.
为想Twitter这样规模的企业生产和使用硬件是一个不小的挑战。为了满足内部用户的徐水球，我们一开始启动了一个项目来检测并保证购买的硬件的品质。团队重点关注性能和可靠性测试来保证系统能满足我们的需求。做系统性的测试来保证硬件的行为可预测，并保证尽量不引入新的问题。

As we scaled our major workloads (Mesos, Hadoop, Manhattan, and MySQL) it became apparent the available market offerings didn't quite meet the needs. Off-the-shelf servers come with enterprise features, like raid controllers and hot swap power supplies. These components improve reliability at small scale, but often decrease performance and increase cost; for example some raid controllers interfered with the performance of SSDs and could be a third of the cost of the system.
随着我们一些关键组件的符合越来越大（Mesos, Hadoop, Manhattan, MySQL等），市面上的产品已经很难满足我们的需求了。市面上企业服务器提供了一些高级功能，例如Raid管理或者电源热切换等，但这些组件只是提升了很小的可靠性，但常常会降低性能并报价不菲；例如一些Raid控制器会影响SSD的性能，并且价格可能高达整个系统的三分之一。

At the time, we were a large user of mysql databases. Issues arose from both supply and performance of SAS media. The majority of deployments were 1u servers, and the total number of drives used plus a writeback cache could predict the performance of a system often time limited to a sustained 2000 sequential IOPS. In order to continue scaling this workload, we were stranding CPU cores and disk capacity to meet IOPS requirement. We were unable to find cost-effective solutions at this time.
那时，我们也是MySQL数据库的一个大型用户。问题主要出在SAS（Serial Attached SCSI，串行连接SCSI）媒体设备的供应和性能上。我们大量使用1u的服务器。驱动器总数加上一个回写缓存可以支撑系统2000顺序IOPS（Input/Output Per Second）。为了获得这样的数值，我们增加CPU核心数和磁盘性能来满足IOPS的要求。我们那时候找不到更节省成本的方案。

As our volume of hardware reached a critical mass, it made sense to invest in a hardware engineering team for customized white box solutions with focus on reducing the capital expenses and increased performance metrics.
随着我们硬件需求越来越大，投资一个硬件工程团队变得有意义了，这样我们可以自由的定制一个投资更低性能更好的硬件。

#### Major technology changes and adoption
#### 关键技术变更与选择

We've made many transitions in our hardware technology stack. Below is a timeline for adoptions of new technology and internally developed platforms.
我们在硬件技术上变化了很多次。下面是我们采用新技术和自研平台的时间线。

- 2012 - SSDs become the primary storage media for our MySQL and key/value databases.
- 2013 - Our first custom solution for Hadoop workloads is developed, and becomes our primary bulk storage solution.
- 2013 - Our custom solution is developed for Mesos, TFE, and cache workloads.
- 2014 - Our custom SSD key/value server completes development.
- 2015 - Our custom database solution is developed.
- 2016 - We developed GPU systems for inference and training of machine learning models.
- 2012 - 采用SSD作为我们MySQL和Key-Value数据库的主要存储媒介。
- 2013 - 我们开发了第一个定制的Hadoop工作站，它成为我们主要的大容量存储方案。
- 2013 - 我们定制的解决方案应用在Apache Mesos、TFE（Twitter Front-End）以及缓存设备上。
- 2014 - 我们定制的SSD Key-Value服务器完成开发。
- 2015 - 我们定制的数据库解决方案完成开发。
- 2016 - 我们开发了一个GPU系统来做机器推理和训练机器学习模型。

#### Lessons learned
#### 学到的教训

The objective of our Hardware Engineering team is to significantly reduce the capital expenditure and operating expenditure by making small tradeoffs that improve our TCO. Two generalizations can apply to reduce the cost of a server:
硬件团队的目标是通过做很多小的权衡折衷来优化TCO（总体拥有成本），最终达到达到降低CAPEX（资本支出）和OPEX（运营支出）的目的。降低服务器的成本，概括来说是下面这两点：

1. Removing the unused components
2. Improving utilization
1. 抛弃无用的功能和组件
2. 提升利用率

Twitter's workload is divided into four main verticals: storage, compute, database, and gpu. Twitter defines requirements on a per vertical basis, allowing Hardware Engineering to produce a focused feature set for each. This approach allows us to optimize component selection where the equipment may go unused or underutilized. For example, our storage configuration has been designed specifically for Hadoop workloads and was delivered at a TCO reduction of 20% over the original OEM solution. At the same time, the design improved both the performance and reliability of the hardware. Similarly, for our compute vertical, the Hardware Engineering Team has improved the efficiency of these systems by removing unnecessary features.
Twitter的设备总体来说有这四大类：存储设备、计算设备、数据库和GPU。Twitter对每一类都定义了详细的需求，让硬件工程师根据各自需求设计产品。这样我们就能对那些用不到或者很少用的部分进行优化。例如，我们的存储设备就专门为Hadoop优化，设备的购买和运营价格相比于OEM产品降低了20%。同时，我们的设计还提高了设备的性能和可靠性。同样的，对于计算设备，硬件工程师们也通过移除无用的特性提高了效率。

There is a minimum overhead required to operate a server, and we quickly reached a point where it could no longer remove components to reduce cost. In the compute vertical specifically, we decided the best approach was to look at solutions that replaced multiple nodes with a single node, and rely on Aurora/Mesos to manage the capacity. We settled on a design that replaced two of our previous generation compute nodes with a single node.
一个服务器可以移除的组件是有限的，我们很快就没办法通过减少组件来降低成本了。我们想了其他办法，例如在记录设备里，我们认为降低成本最好的办法是用一台节点替换多个节点，通过Aurora/Mesos软件架构来管理它们。我们做了一个设计方案，用一个计算节点替换到前一代的两个计算设备。

Our design verification began with a series of rough benchmarks, and then progressed to a series of production load tests confirming a scaling factor of 2. Most of this improvement came from simply increasing the thread count of the CPU, but our testing confirmed a 20-50% improvement in our per thread performance. Additionally we saw a 25% increase in our per thread power efficiency, due to sharing the overhead of the server across more threads.
我们新设计首先要通过一系列的基准测试，然后再做一系列负载测试，新旧设备的换算系数要达到2。大多数的提升是来自简单增加CPU的进程数，但是我们的测试也确认了20~50%的单线程性能提升，同时通过分享各个线程之间的开销，我们也发现单线程能耗也优化了25%。

For the initial deployment, our monitoring showed a 1.5 replacement factor, which was well below the design goal. An examination of the performance data revealed there was a flawed assumption in the workload characteristics, and that it needed to be identified.
新设备刚部署的时候，我们的监控发现新设备只能代替1.5台旧设备，这比我们的目标低很多。对性能数据检查后发现我们之前对设备的假设是错的，而这正是我们在做性能测试时候需要识别出来的问题。

Our Hardware Engineering Team's initial action was to develop a model to predict the packing efficiency of the current Aurora job set into various hardware configurations. This model correctly predicted the scaling factor we were observing in the fleet, and suggested we were stranding cores due to unforeseen storage requirements. Additionally, the model predicted we would see a still improved scaling factor by changing the memory configuration as well.


Hardware configuration changes take time to implement, so Hardware Engineering identified a few large jobs and worked with our SRE teams to adjust the scheduling requirements to reduce the storage needs. These changes were quick to deploy, and resulted in an immediate improvement to a 1.85 scaling factor.

In order to address the situation permanently, we needed to adjust to configuration of the server. Simply expanding the installed memory and disk capacity resulted in a 20% improvement in the CPU core utilization, at a minimal cost increase. Hardware Engineering worked with our manufacturing partners to adjust the bill of materials for the initial shipments of these servers. Follow up observations confirmed a 2.4 scaling factor exceeding the target design.

### Migration from bare metal to mesos

Until 2012, running a service inside Twitter required hardware requisitions. Service owners had to find out and request the particular model or class of server, worry about your rack diversity, maintain scripts to deploy code, and manage dead hardware. There was essentially no "service discovery." When a web service needed to talk to the user service, it typically loaded up a YAML file containing all of the host IPs and ports of the user service and the service used that list (port reservations were tracked in a wiki page). As hardware died or was added, managing required editing and committing changes to the YAML file that would go out with the next deploy. Making changes in the caching tier meant many deploys over hours and days, adding a few hosts at a time and deploying in stages. Dealing with cache inconsistencies during the deploy was a common occurrence, since some hosts would be using the new list and some the old. It was possible to have a host running old code (because the box was temporarily down during the deploy) resulting in a flaky behavior with the site.

In 2012/2013, two things started to get adopted at Twitter: service discovery (via a zookeeper cluster and a library in the core module of Finagle) and Mesos (including our own scheduler framework on top of Mesos called Aurora, now an Apache project).

Service discovery no longer required static YAML host lists. A service either self-registered on startup or was automatically registered under mesos into a "serverset" (which is just a path to a list of znodes in zookeeper based on the role, environment, and service name). Any service that needed to talk to that service would just watch that path and get a live view of what servers were out there.

With Mesos/Aurora, instead of having a script (we were heavy users of Capistrano) that took a list of hosts, pushed binaries around and orchestrated a rolling restart, a service owner pushed the package into a service called "packer" (which is a service backed by HDFS), uploaded an aurora configuration that described the service (how many CPUs it needed, how much memory, how many instances needed, the command lines of all the tasks each instance should run) and Aurora would complete the deploy. It schedules instances on an available hosts, downloads the artifact from packer, registers it in service discovery, and launches it. If there are any failures (hardware dies, network fails, etc), Mesos/Aurora automatically reschedules the instance on another host.

#### Twitter's Private PaaS

Mesos/Aurora and Service Discovery in combination were revolutionary. There were many bugs and growing pains over the next few years and many hard lessons learned about distributed systems, but the fundamental design was sound. In the old world, the teams were constantly dealing with and thinking about hardware and its management. In the new world, the engineers only have to think about how best to configure their services and how much capacity to deploy. We were also able to radically improve the CPU utilization of Twitter's fleet over time, since generally each service that got their own bare metal hardware didn't fully utilize its resources and did a poor job of managing capacity. Mesos allows us to pack multiple services into a box without having to think about it, and adding capacity to a service is only requesting quota, changing one line of a config, and doing a deploy.

Within two years, most "stateless" services moved into Mesos. Some of the most important and largest services (including our user service and our ads serving system) were among the first to move. Being the largest, they saw the biggest benefit to their operational burden. This allowed them to reduce their operational burden.

We are continuously looking for ways to improve the efficiency and optimization of the infrastructure. As part of this, we regularly benchmark against public cloud providers and offerings to validate our TCO and performance expectations of the infrastructure. We also have a good presence in public cloud, and will continue to utilize the public cloud when it's the best available option. The next series of this post will mainly focus on the scale of our infrastructure.

Special thanks to Jennifer Fraser, David Barr, Geoff Papilion, Matt Singer, and Lam Dong for all their contributions to this blog post.





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






