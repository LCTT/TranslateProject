软件定义存储（SDS）的发展：十个你应当知道的项目
============================================================

 ![Software defined Storage](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/software-defined.jpg?itok=fRTy33a8 "Software Defined Storage") 

*凭借 SDS，组织机构可以更好抽象出底层存储的管理功能，并且通过不同策略实现灵活配置。下面将要向你展示一些你应当知道的此类开源项目。Creative Commons Zero，Pixabay *

纵观 2016 年，SDS（Software-Defined Storage，软件定义存储）方面取得了很多里程碑式的进步，并且日益紧密的与云部署结合在了一起。凭借 SDS ，组织机构可以更好抽象出底层存储的管理功能，并且通过不同策略实现灵活配置。当然，他们也可以选择自由开源的 SDS 解决方案。人们熟知的 Ceph 正是凭借 OpenStack 部署在不断扩大自己的影响力，但是它离成为唯一的 SDS 开源项目还有很长的路要走。

Gartner 的一份市场调查报告中预测，截至到 2019 年，70% 已有的存储部署解决方案会支持以纯软件的方式来实施。同时 Gartner 还预测截至到 2020 年，70% 到 80% 的非结构化数据会存储在由 SDS 管理的廉价存储设备中。

最近，Dell EMC 公司加入到了由 Linux 基金会发起的 [OpenSDS][4] 项目中。 OpenSDS 致力于寻求解决 SDS 集成所面临的挑战，并推动企业对开放标准的采用。它由存储客户与厂商组成，包括 Fujitsu，Hitachi Data Systems，Huawei，Oregon State University 以及 Vodafone。同时 OpenSDS 也寻求与其它的上游开源社区进行合作，比如 Cloud Native Computing Foundation、Docker、OpenStack 以及 Open Container Initiative。

根据 Open SDS 项目的 [主页][5]，2017 年会是 SDS 的一个元年：“社区希望在 2017 第二季度完成原型的发布，并且在第三季度中发布一个测试版本。OpenSDS 的最初组织者期望能通过这个项目来影响到一些开源技术，比如来自 Openstack 社区的 Cinder 和 Manila 项目，并且能够支持更广泛的云存储解决方案。”

与此同时，SDS 相关项目也呈现了爆发式的增长，其范围横跨 Apache Cassandra 到 Cehp。Linux 基金会最近发布了 2016 年度报告“[开放云指南：当前的趋势及开源项目][7]”，报告从整体上分析了开放云计算的现状，其中有一章涵盖了 SDS。你可以[下载][8]这篇报告，需要注意的是，这是一份综合了容器发展趋势、SDS，以及云计算的重新定义等等很多内容。报告中涵盖了当今对于开源云计算最重要的一些项目，并分类给出了描述和链接。

在这个系列的文章中，我们从该报告中整理了很多项目，并且针对它们是如何发展的提供了一些额外的视角及信息。在下面的内容当中，你会看到现今对 SDS 来说很重要的项目，并且能了解到它们为什么具有这么大的影响力。同时，根据上面的报告，我们提供了相关项目的 GitHub 仓库链接，方便大家查看。

### 软件定义存储（SDS）

- [Apache Cassandra][9]
	
	Apache Cassandra 是一个可扩展的、高可用的，面向任务优先应用的数据库。它可以运行在商业设备或者云架构上，并且能实现跨数据中心的低延迟数据传输，同时具备良好的容错性。[Cassandra 的 GitHub 仓库][10]。

- [Ceph][11]

	Ceph 是 Red Hat 构建的一个企业级可扩展的块设备、对象，以及文件存储平台，并且可部署在公有云或者私有云之上。Ceph 目前被广泛应用于 OpenStack。[Ceph 的 GitHub 仓库][12]。

- [CouchDB][13]

	CouchDB 是一个 Apache 软件基金会项目，是一个单节点或者集群数据库管理系统。CouchDB 提供了 RESTful HTTP 接口来读取和更新数据库文件。[CouchDB 的 GitHub 仓库][14]。

- [Docker 数据卷插件][15]

	Docker Engine 数据卷插件可以使 Engine 与外部的存储系统一起集成部署，并且数据卷的生命周期与单一 Engine 主机相同。目前存在很多第三方的数据卷管理插件，包括 Azure File Storage、NetApp、VMware vSphere 等等。你可以在 GitHub上查找到更多的插件。

- [GlusterFS][16]

	Gluster 是 Red Hat 的可扩展网络文件系统，同时也是数据管理平台。Gluster 可以部署在公有云，私有云或者混合云之上，可用于 Linux 容器内的流媒体处理任务、数据分析任务，以及其它数据和带宽敏感型任务的执行。[GlusterFS 的 GitHub 仓库][17]。

- [MongoDB][18]

	MongoDB 是一个高性能的文件数据库，并且部署和扩展都非常简单。[MongoDB 的 GitHub 仓库][19]。

- [Nexenta][20]

	NexentaStor 是一个可扩展的、统一的软件定义的文件和块设备管理服务，同时支持数据管理功能。它能够与 VMware 集成，并且支持 Docker 和 OpenStack。[Nexenta 的 GitHub 仓库][21]。

- [Redis][22]

	Redis 是一个基于内存的数据存储，一般被用作数据库、缓存，以及消息代理。它支持多种数据结构，并且本身支持复制、Lua 脚本、LRU 算法、事务，以及多层级的硬盘持久化。

- [Riak CS][24]

	Riak CS（Cloud Storage）是基于 Basho  的分布式数据库 Riak KV 构建的对象存储软件。它提供了在不同规模的分布式云存储能力，可以用于公有云和私有云，还能为大压力的应用和服务提供基础的存储服务。其 API 兼容 Amazon S3，并且支持租户级别的费用计算和测量能力。[Riak CS 的 GitHub 仓库][25]。

- [Swift][26]

	Swift 是 OpenStack 项目中的对象存储系统，设计初衷是通过简单 API 存储和获取非结构化数据。Swift 设计之初就是可扩展的，并且针对持久性、可靠性以及并发数据读取做了优化。[Swift 的 GitHub 仓库][27]。

_了解更多的开源云计算趋势以及更完整的开源云计算项目列表，请[下载 Linux 基金会的“开放云指南”][3]。_

--------------------------------------------------------------------------------

via: https://www.linux.com/news/open-cloud-report/2016/guide-open-cloud-software-defined-storage-opens

作者：[SAM DEAN][a]
译者：[toutoudnf](https://github.com/toutoudnf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sam-dean
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/software-definedjpg
[3]:http://bit.ly/2eHQOwy
[4]:http://ctt.marketwire.com/?release=11G125514-001&id=10559023&type=0&url=https%3A%2F%2Fwww.opensds.io%2F
[5]:https://www.opensds.io/
[6]:https://www.linux.com/blog/linux-foundation-issues-2016-guide-open-source-cloud-projects
[7]:http://ctt.marketwire.com/?release=11G120876-001&id=10172077&type=0&url=http%3A%2F%2Fgo.linuxfoundation.org%2Frd-open-cloud-report-2016-pr
[8]:http://go.linuxfoundation.org/l/6342/2016-10-31/3krbjr
[9]:http://cassandra.apache.org/
[10]:https://github.com/apache/cassandra
[11]:http://ceph.com/
[12]:https://github.com/ceph/ceph
[13]:http://couchdb.apache.org/
[14]:https://github.com/apache/couchdb
[15]:https://docs.docker.com/engine/extend/plugins_volume/
[16]:https://www.gluster.org/
[17]:https://github.com/gluster/glusterfs
[18]:https://www.mongodb.com/
[19]:https://github.com/mongodb/mongo
[20]:https://nexenta.com/
[21]:https://github.com/Nexenta
[22]:http://redis.io/
[23]:https://github.com/antirez/redis
[24]:http://docs.basho.com/riak/cs/2.1.1/
[25]:https://github.com/basho/riak_cs
[26]:https://wiki.openstack.org/wiki/Swift
[27]:https://github.com/openstack/swift
