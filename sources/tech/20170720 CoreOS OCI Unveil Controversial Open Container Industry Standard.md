CoreOs , OCI(Open Container Initiative) 标准揭开了容器工业标准论战
============================================================
![coreos-oci-open-container-industry-standard](http://www.linuxinsider.com/article_images/story_graphics_xlarge/xl-2017-core-os-1.jpg)

[**在并购交易中保护知识产权完整性**][12][][13]。Flexera 软件公司 提供卓越的技术尽职调查审计过程的实践和方案
**[Download the White Paper][3]**

[CoreOS][4] 和 [OCI标准][5] 本周三发布的镜像和运行时标准主要参照了Docker的镜像格式技术

然而，OCI对docker的de facto 平台标准的模仿的决定引发了一些问题。一些批评者提出其他方案

CoreOs的CTO及OCI技术管理委员会主席Brandon Philips说 1.0版本 为应用容器提供了一个稳定标准

他说，产业领导者所创造的标准激发了OCI标准参与者创造出更深层的标准和创新。


Philips补充道，OCI完成1.0版本意味着 OCI运行时规范和OCI镜像格式标准现在已经可以广泛使用。
此外，现在取得的成就将推动OCI社区稳固一个成长中的互操作可插拔工具集市场

产业支持的标准将提供一种信心：容器将被留存并且Kubernetes（Kubernetes是Google开源的Docker容器集群管理系统）用户将获得更进一步的支持

Philips告诉LinuxInsider:结果是相当不错的，证明过程已经开始. 

### 合作和挑战

开放标准是容器生态系统取得成功的关键 Philips说，最好的实现标准的方式是与社区协作。然而，在1.0版本上达成共识所花费的时间超出了预期。

"早期，最大的挑战在于处理项目的发布模式及如何实施该项目"，他追述道，”每个人都低估了项目所要花费的时间。“

他说，合作者面对着和他们想做的不一致的预期，但是在过去的一年前后，小组达到了他们的期望并且经历了更多的实验

### 追逐标准

CoreOS 官方在几年前就开始讨论这个想法：行业支持的开源容器镜像和运行时规范标准，Phillips说，早期的探索使我们认识到：在标准镜像格式上达成一致是决定性的。

CoreOS和容器技术创造者[Docker][6] 在2015年6月宣布OCI的开始。合作起始于 21个行业领导者制定开源容器计划（OCP）。它作为一个非营利组织，旨在建立云存储软件容器的最低通用标准

联盟包括容器业界的领导者：Docker、微软、红帽、IBM、谷歌和linux基金会

OCI标准的目的是让应用开发者相信：新的规范并开发新出工具时，部署在容器上的软件仍然能够持续运转。这种信心必须同时满足所有私有和开源软件

工具和应用是私有还是开源的并没有什么关系。当规范开始应用，产品会被设计成与任何容器配置相适应，Philips说。

你需要有意识地超越编写代码的人能力之外创建标准。它是一个额外的功夫。他补充道

作为联盟的一部分，Docker向OCP（开源容器计划）贡献出它的de facto 镜像格式标准技术。

它包括公司的容器格式、运行时代码和规范。建立开源容器首创镜像标准的工作起始于去年。

标准的里程碑给予容器使用者开发、打包、签名应用容器的能力。他们也能够在各种容器引擎上运行容器，Philips强调

### 唯一的选择？

[Pund-IT][7]的首席分析师Charles King表示：联盟面临着两种实现标准的方式。第一种选择是汇集相同意向的人员来避免分歧从零开始建立标准。

但是联盟成员似乎满足于第二种方案：采用一种强大的以市场为导向的平台作为一个有效的标准。

Docker对[Linux Foundation][8]（linux基金会）的贡献使OCI坚定的选择了第二种方案。但是那些关注于Docker的实现途径或者它的市场地位的人也许感觉应该有更好的选择。King对LinuxInsider讲述

事实上，一个OCI成员--CoreOs --在开始的时候对该组织的总体方向进行了一些强烈的批评。拭目以待V1.0版本是否处理了那些关注点将是很有趣的事情


###  更快的路径

Docker已经被广泛的部署运行时实现是建立开放标准的合适基础。据[Cloud Technology Partners][9] 的高级副总裁David Linthicum所说，Docker已经是一个de facto 标准

“我们能很快就能实现这些想法也是很重要的。但是前后的标准会议、处理政治因素等事情只是浪费时间” 。他对LinuxInsider采访者说

但是现在没有更好的选择，他告诉LinuxInsider采访者

据RedHat公司的linux容器技术高级布道者Joe Brockmeier所说，Docker的运行时是 runC 。 它是OCI运行时标准的一种实现。

因此，runC 是一个合适的运行时标准的基础。它被广泛的接受并成为了大多数容器技术实现的基础。他告诉LinuxInsider

OCI是比Docker更进一步的标准。尽管Docker确实提交了遵循OCI规范的底层代码，然而这一谱系就此停止，并且没真正的可行替代方案存在。

### 对接问题

Pund-IT的领导建议：采用一种广泛使用的产业标准将简化和加速许多公司对容器技术的采纳和管理。也有可能一些关键的供应商将继续关注他们自己的专有容器技术

他们辩称他们的做法是一个更好的方式但这将有效的阻止OCI取得市场的主导地位。从一个大体上实现的标准开始，就像OCI所做的那样，也许并不能完美的使所有人满意。但是这也许能比其他方案更加快速有效的实现目标

容器已经标准化的部署到了云上，Docker显然是领先的。[Semaphore][10]联合创始人Marko Anastasov说。Docker的de facto标准容器代表了开发开放标准的的最佳基础。Docker的商业利益将如何影响其参与OCI的规模还有待观察

### 反对的观点

开放标准并不是在云部署中采用更多的容器的最终目标。[ThoughtWorks][11]的首席顾问Nic Cheneweth 主张。更好的的方法是查看IT行业的服务器虚拟化部分的影响

Cheneweth对LinuxInsider说:“持续增长和广泛采用的主要动力不是在行业标准的声明中，而是在使用任何竞争技术的潜在和实现的效率方面，比如VMware、Xen等。”

容器技术的某些方面，例如容器本身，可以根据标准来定义。他说，在此之前，由深度开源软件参与引导的健康竞争将有助于成为一个更好的标准。

据Cheneweth说，关于容器的编制标准对空间的持续增长并不特别重要。

不过，他表示，如果行业坚持锁定de facto容器标准，那么OCI所选择的模型是一个很好的起点。“我不知道是否有更好的选择，但更糟糕的选择是存在的。”

作者简介：

自2003年以来，Jack M.Germain一直是一个新闻网络记者。他主要关注的领域是企业IT、Linux和开源技术。他已经写了很多关于Linux发行版和其他开源软件的评论。


----

via: http://www.linuxinsider.com/story/84689.html

作者：[Jack M. Germain ][a]
译者：[LHRchina](https://github.com/LHRchina)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:jack.germain@newsroom.ectnews.comm
[1]:http://www.linuxinsider.com/story/84689.html?rss=1#
[2]:http://www.linuxinsider.com/perl/mailit/?id=84689
[3]:http://www.linuxinsider.com/story/84689.html?rss=1
[4]:https://coreos.com/
[5]:https://www.opencontainers.org/
[6]:https://www.docker.com/
[7]:http://www.pund-it.com/
[8]:http://www.linuxfoundation.org/
[9]:https://www.cloudtp.com/
[10]:http://www.semaphoreci.com/
[11]:https://www.thoughtworks.com/
[12]:http://www.linuxinsider.com/story/84689.html?rss=1
[13]:http://www.linuxinsider.com/story/84689.html?rss=1























