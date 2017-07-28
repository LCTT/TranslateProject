CoreOS, OCI Unveil Controversial Open Container Industry Standard
============================================================
![coreos-oci-open-container-industry-standard](http://www.linuxinsider.com/article_images/story_graphics_xlarge/xl-2017-core-os-1.jpg)


[**Managing Your Intellectual Property Integrity During M&A Transactions**][12]
[][13]Flexera Software presents best practices and methodology for the technical due diligence auditing process.
**[Download the White Paper][3]**

[CoreOS][4] and the [Open Container Initiative][5] on Wednesday introduced image and runtime specifications largely based on Docker's image format technology.

However, OCI's decision to model the standard on Docker's de facto platform has raised questions. Some critics have argued for other options.

Version 1.0 provides a stable standard for application containers, according to Brandon Philips, CTO at CoreOS and chair of the OCI Technical Oversight Board.

Having a standard created by industry leaders should spur OCI partners to develop further standards and innovation, he said.

Reaching the 1.0 mark means that the OCI Runtime Spec and the OCI Image Format Spec now are ready for broad use. Further, this achievement will push the OCI community to help stabilize a growing market of interoperable pluggable tools, Philips added.

The industry-supported standards also will provide a sense of confidence that containers are here to stay, he said, and that Kubernetes users can expect future support.

"The outcome is really good. The certification process is under way now," Philips told LinuxInsider.

### Collaboration Challenges

Open standards are key to the success of the container ecosystem, said Philips, and the best way to achieve standards is by working closely with the community. However, reaching agreement on version 1.0 was more time consuming than expected.

"Early on, the biggest challenge was coming to terms with the model of how the project releases would work and how to get the project off the ground," Philips recalled. "Everyone underestimated how much time that would take."

Coalition members dealt with mismatched expectations about what they wanted to do, he said, but in the last year or so, the group got the referencing expectations done and more testing came through.

### Quest for Standards

CoreOS officials began discussing the idea for an industry-approved open standard for the container image and runtime specifications several years ago. That early quest led to the realization that agreeing on a standard image format was critical, Phillips said.

CoreOS and container technology creator [Docker][6] announced OCI's formation in June 2015\. The coalition started with 21 industry leaders forming the Open Container Project (OCP) as a non-profit organization seeking minimal common standards for software containers for cloud storage.

The coalition includes leaders in the container industry -- among them, Docker, Microsoft, Red Hat, IBM, Google and The Linux Foundation.

OCI's goal is to give high confidence to application developers that the software deployed in their containers will continue to work when newer specifications come out and people develop new tools. That confidence must be met for both proprietary and open source software.

It does not matter if the tools and applications are proprietary or open source. With the specifications in place, the products can be designed to work with any container configuration, Philips said.

"You need a conscious effort to create standards outside of people writing code. It is a separate effort," he added.

As part of the coalition, Docker donated its de facto image format standard technology to the OCP.

It included the company's container format, runtime code and specifications. Work on creating an Open Container Initiative Image Specification began last year.

The standards milestone gives container users the capability to develop, package and sign application containers. They also can run the containers in a variety of container engines, noted Philips.

### A Choice of One?

The coalition faced two ways to pursue open standards, observed Charles King, principal analyst at [Pund-IT][7]. The first option was to gather like-minded people to hash out differences and build standards from scratch.

The coalition members seemed to settle for the second option, which involved adopting a powerful, market leading platform as an effective standard, he said.

"Docker's contributions to The [Linux Foundation][8] put the OCI firmly on the second path -- but those who are concerned about Docker's approach or its market position may feel there are better options," King told LinuxInsider.

In fact, one OCI member -- CoreOS -- leveled some strong criticism of the group's general direction at the beginning of the effort, he said, "so it will be interesting to see how V1.0 does/doesn't address those concerns."

### Faster Path

Docker's widely deployed runtime implementation is a suitable foundation for building an open standard. It already was a defacto standard, according to David Linthicum, senior vice president at [Cloud Technology Partners][9].

"It's also important that we get this working for us quickly. The waves of standards meetings, dealing with politics and things such as that, just waste time," he told LinuxInsider.

Right now, though, there are no better options, Linthicum added.

The runtime Docker uses is runC, which is an implementation of the OCI runtime standard, according to Joe Brockmeier, senior evangelist for Linux Containers at Red Hat.

"So, runC is a suitable foundation for a runtime standard, yes. It is broadly accepted and forms the basis for most container implementations today," he told LinuxInsider.

OCI is far more than Docker. While Docker did commit the underlying code from which the OCI specification is derived, the lineage stops there, said Brockmeier, and no truly viable alternatives exist.

### Docking the Question

Adopting an industry-wide standard likely will simplify and speed container adoption and management for many companies, suggested Pund-IT's King. It also is likely that some key vendors will continue to focus on their own proprietary container technologies.

"They'll argue that theirs is a superior path -- but that will effectively prevent the OCI from achieving market-wide leadership," he said. "Starting out with a standard that's more or less complete, as OCI has, may not perfectly please everyone, but it's likely to move forward to completion more quickly and effectively than other options."

Containers have standardized deployment to cloud, with Docker clearly leading the way, said Marko Anastasov, cofounder of [Semaphore][10].

Docker's de facto standard container does represent the best foundation for developing an open standard, he said.

"How Docker's commercial interests will influence the scale of its involvement in OCI remains to be seen," he told LinuxInsider.

### Opposing Viewpoint

An open standard is not the end-all for adopting more containers in cloud deployment, contended Nic Cheneweth, principal consultant with[ThoughtWorks][11]. A better approach is to look at the impact of the server virtualization segment of the IT industry.

"The principal driver for continued growth and widespread adoption was not in the statement of an industry standard but in the potential and realized efficiencies obtained by use of any of the competing technologies, such as VMware, Xen, etc.," Cheneweth told LinuxInsider.

Aspects of container technology, such as the container itself, lend themselves to definition of a standard. Until then, healthy competition guided by deep open source software involvement will contribute to be a better standard, he said.

A standard around the orchestration of containers is not particularly important to the continued growth of the space, according to Cheneweth.

However, if the industry insists on locking into a de facto container standard, the model OCI chose is a good starting point, he said. "I don't know that better options are available, but certainly worse ones exist."

--------------------------------------------------------------------------------

作者简介：

Jack M. Germain has been an ECT News Network reporter since 2003. His main areas of focus are enterprise IT, Linux and open source technologies. He has written numerous reviews of Linux distros and other open source software. Email Jack.


----

via: http://www.linuxinsider.com/story/84689.html

作者：[Jack M. Germain ][a]
译者：[译者ID](https://github.com/译者ID)
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


CoreOs , OCI(Open Container Initiative) 标准解开容器工业标准论战
[**在并购交易中保护你的智力资产完整**][12][][13]。Flexera 软件公司 提供卓越的技术尽职调查审计过程的实践和方案
[CoreOS][4] 和 [OCI标准][5] 本周三引入的镜像和运行时标准最大限度的参照了Docker的镜像规范技术
然而，OCI模仿docker的de facto 平台的决定引发了一些问题。一些批评者提出来用另外的解决方案
CoreOs的CTO及OCI技术管理委员会主席Brandon Philips说 1.0版本 提供了应用容器的稳定标准，产业领导者所创造的标准激发了OCI标准参与者创造出更深层的标准和创新。
他说，OCI完成1.0版本意味着 OCI运行时规范和OCI镜像格式标准现在已经可以广泛使用。
进一步说明，现在取得的成就将推动OCI社区稳固一个成长中的互操作插接式工具集市场
产业支持的标准将提供一种信心：容器将被留存并且Kubernetes（Kubernetes是Google开源的Docker容器集群管理系统）用户将获得更进一步的支持
Philips告诉LinuxInsider:结果是相当不错的，证明过程已经开始. 
### 合作和挑战
开放标准是容器生态系统取得成功的关键 最好的实现标准的方式是与社区协作。然而，在1.0版本上达成共识所花费的时间超越了我们的的想象。
"早期，最大的挑战在于接受项目的发布模式及如何实施该项目"，他追述道，”每个人都低估了项目所要花费的时间。“

合作者面对着和他们想做的不一致的预期，他说，但是在最近的一年前后，小组达到了他们的期望并且经历了更多的实验

### 追逐标准

CoreOS 官方在几年前就开始讨论这个想法：工业支持的开源容器镜像和运行时规范标准
早期的探索使我们认识到：标准镜像格式的一致是决定性的。Phillips说

CoreOS和容器技术创造者[Docker][6] 在2015年6月宣布OCI的开始。合作起始于 21个工业领导者制定开源容器计划（OCP）作为一个旨在最低限度的云存储通用软件容器标准的非营利组织

联合包括容器业界的领导者：Docker、微软、红帽、IBM、谷歌和linux基金会

OCI标准的目的是给予应用开发者高度的信心：新的标准或者新的开发工具出现，部署在容器上的软件仍然能够持续运转。这种信心必须同时满足所有私有和开源软件

工具和应用是私有还是开源的并没有什么关系。当标准开始应用，产品会被设计成与任何容器配置相融合，Philips说。

你需要刻意的超出人们写代码的功夫地努力去创造一个标准。它是一个额外的功夫。他补充道

作为合作的一部分，Docker向OCP（开源容器计划）贡献出它的de facto 镜像格式标准技术。

它包括公司的容器格式、运行时代码和标准。建立开源容器首创镜像标准的工作起始于去年

标准的里程碑给予容器使用者开发、打包、签名应用容器的能力。他们也能够在各种容器引擎上运行容器，Philips强调

### 唯一的选择？

[Pund-IT][7]的首席分析师Charles King注意到：合作面临着两种实现标准的方式。第一种选择是汇集相同意向的人员来避免分歧从零开始建立标准，但是合作者似乎不得不接受第二种方案：采用一种强大的以市场为导向的平台作为一个有效的标准。

Docker对[Linux Foundation][8]（linux基金会）的贡献使OCI坚定的选择了第二种方案。但是那些关注于Docker的实现途径或者它的市场地位的人也许感觉应该有更好的选择。King对LinuxInsider讲述

事实上，一个OCI成员--CoreOs --在开始的时候对该组织的总体方向进行了一些强烈的批评。拭目以待V1.0版本是否处理了那些关注点将是很有趣的事情


###  更快的路径

Docker已经被广泛的部署运行时实现是一个合适的基础。据[Cloud Technology Partners][9] 的高级副总裁David Linthicum所说，Docker已经是一个de facto 标准

“我们很快就能实现这些很重要。但是前后的标准会议、处理政治因素等事情却是如此的浪费时间” 。他对LinuxInsider采访者说

但是现在没有跟好的选择，他告诉LinuxInsider采访者

据RedHat公司的高级linux容器技术布道者Joe Brockmeier所说，Docker的运行时是 runC 。 它是一种OCI标准标准的实现

因此，runC 是一个合适的运行时标准的基础。它被广泛的接受并成为了大多数容器技术实现的基础

OCI是比Docker更进一步的标准。尽管Docker确实提交了OCI规范的基础的底层代码，然而这一谱系就此停止，并没真正的可行替代方案存在。

### 对接问题

Pund-IT的领导建议：采用一种广泛使用的产业标准将简化和加速许多公司对容器技术的采纳和管理。也有可能一些关键的供应商将继续关注他们自己的专有容器技术

Docker的商业利益将如何影响其参与OCI的规模还有待观察

### 反对的观点

开放标准并不是在云部署中采用更多的容器的最终目标。[ThoughtWorks][11]的首席顾问Nic Cheneweth 主张。更好的的方法是查看IT行业的服务器虚拟化部分的影响



























