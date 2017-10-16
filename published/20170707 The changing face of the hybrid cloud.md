混合云的变化
============================================================

> 围绕云计算的概念和术语仍然很新，但是也在不断的改进。

 
![混合云的变化](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-cloud.png?itok=vz0PIDDS "﻿The changing face of the hybrid cloud")

不管怎么看，云计算也只有十多年的发展时间。一些我们习以为常的云计算的概念和术语仍然很新。美国国家标准与技术研究所（NIST）文档显示，一些已经被熟悉的术语定义在 2011 年才被发布，例如基础设施即服务（IaaS），而在此之前它就以草案的形式广泛流传。

在该文档中其它定义中，有一个叫做<ruby>混合云<rt>hybrid cloud</rt></ruby>。让我们回溯一下该术语在这段期间的变化是很有启发性的。云基础设施已经超越了相对简单的分类。此外，它还强调了开源软件的使用者所熟悉的优先级，例如灵活性、可移植性、选择性，已经被运用到了混合云上。

NIST 对混合云最初的定义主要集中于<ruby>云爆发<rt>cloud bursting</rt></ruby>，你能使用内部的基础设施去处理一个基本的计算负荷，但是如果你的负荷量暴涨，可以将多出来的转为使用公有云。与之密切联系的是加强私有云与公有云之间 API 的兼容性，甚至是创造一个现货市场来提供最便宜的容量。

Nick Carr 在 [The Big Switch][10] 一书中提出一个概念，云是一种计算单元，其与输电网类似。这个故事不错，但是即使在早期，[这种类比的局限性也变得很明显][11]。计算不是以电流方式呈现的一种物品。需要关注的是，公有云提供商以及 OpenStack 一类的开源云软件激增的新功能，可见许多用户并不仅仅是寻找最便宜的通用计算能力。

云爆发的概念基本上忽略了计算是与数据相联系的现实，你不可能只移动洪水般突如其来的数据而不承担巨大的带宽费用，以及不用为转移需要花费的时间而操作。Dave McCrory 发明了 “<ruby>数据引力<rt>data gravity</rt></ruby>”一词去描述这个限制。

那么既然混合云有如此负面的情况，为什么我们现在还要再讨论混合云？

正如我说的，混合云的最初的构想是在云爆发的背景下诞生的。云爆发强调的是快速甚至是即时的将工作环境从一个云转移到另一个云上；然而，混合云也意味着应用和数据的移植性。确实，如之前 [2011 年我在 CNET 的文章][12]中写到：“我认为过度关注于全自动的工作转换给我们自己造成了困扰，我们真正应该关心的是，如果供应商不能满意我们的需求或者尝试将我们锁定在其平台上时，我们是否有将数据从一个地方到另一个地方的迁移能力。”

从那以后，探索云之间的移植性有了进一步的进展。

Linux 是云移植性的关键，因为它能运行在各种地方，无论是从裸机到内部虚拟基础设施，还是从私有云到公有云。Linux 提供了一个完整、可靠的平台，其具有稳定的 API 接口，且可以依靠这些接口编写程序。

被广泛采纳的容器进一步加强了 Linux 提供应用在云之间移植的能力。通过提供一个包含了应用的基础配置环境的镜像，应用在开发、测试和最终运行环境之间移动时容器提供了可移植性和兼容性。

Linux 容器被应用到要求可移植性、可配置性以及独立性的许多方面上。不管是预置的云，还是公有云，以及混合云都是如此。

容器使用的是基于镜像的部署模式，这让在不同环境中分享一个应用或者具有全部基础环境的服务集变得容易了。

在 OCI 支持下开发的规范定义了容器镜像的内容及其所依赖、环境、参数和一些镜像正确运行所必须的要求。在标准化的作用下，OCI 为许多其它工具提供了一个机会，它们现在可以依靠稳定的运行环境和镜像规范了。

同时，通过 Gluster 和 Ceph 这类的开源技术，分布式存储能提供数据在云上的可移植性。 物理约束限制了如何快速简单地把数据从一个地方移动到另一个地方；然而，随着组织部署和使用不同类型的基础架构，他们越来越渴望一个不受物理、虚拟和云资源限制的开放的软件定义储存平台。

尤其是在数据存储需求飞速增长的情况下，由于预测分析，物联网和实时监控的趋势。[2016 年的一项研究表明][13]，98% 的 IT 决策者认为一个更敏捷的存储解决方案对他们的组织是有利的。在同一个研究中，他们列举出不恰当的存储基础设施是最令他们组织受挫的事情之一。

混合云表现出的是提供在不同计算能力和资源之间合适的移植性和兼容性。其不仅仅是将私有云和公有云同时运用在一个应用中。它是一套多种类型的服务，其中的一部分可能是你们 IT 部门建立和操作的，而另一部分可能来源于外部。

它们可能是软件即服务（SaaS）应用的混合，例如邮件和客户关系管理（CRM）。被 Kubernetes 这类开源软件协调在一起的容器平台越来越受新开发应用的欢迎。你的组织可能正在运用某一家大型云服务提供商来做一些事情。同时你也能在私有云或更加传统的内部基础设施上操作一些你自己的基础设施。

这就是现在混合云的现状，它能被归纳为两个选择，选择最合适的基础设施和服务，以及选择把应用和数据从一个地方移动到另一个你想的地方。

**相关阅读: [多重云和混合云有什么不同？][6]**
 
（题图 : [Flickr 使用者: theaucitron][9] (CC BY-SA 2.0)）

--------------------------------------------------------------------------------

作者简介：

Gordon Haff 是红帽云的布道者，常受到业内和客户的高度赞赏，帮助红帽云组合方案的发展。他是《Computing Next: How the Cloud Opens the Future》的作者，除此之外他还有许多出版物。在红帽之前，Gordon 写了大量的研究简报，经常被纽约时报等出版物在 IT 类话题上引用，在产品和市场策略上给予客户建议。他职业生涯的早期，在 Data General 他负责将各种不同的计算机系统，从微型计算机到大型的 UNIX 服务器，引入市场。他有麻省理工学院和达特茅斯学院的工程学位，还是康奈尔大学约翰逊商学院的工商管理学硕士。

-----

via: https://opensource.com/article/17/7/hybrid-cloud

作者：[Gordon Haff (Red Hat)][a]
译者：[ZH1122](https://github.com/ZH1122)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ghaff
[1]:https://opensource.com/resources/cloud?src=cloud_resource_menu1
[2]:https://opensource.com/resources/what-is-openstack?src=cloud_resource_menu2
[3]:https://opensource.com/resources/what-is-kubernetes?src=cloud_resource_menu3
[4]:https://opensource.com/16/12/yearbook-why-operating-system-matters?src=cloud_resource_menu4
[5]:https://opensource.com/business/16/10/interview-andy-cathrow-anchore?src=cloud_resource_menu5
[6]:https://enterprisersproject.com/article/2017/7/multi-cloud-vs-hybrid-cloud-whats-difference
[7]:https://opensource.com/article/17/7/hybrid-cloud?rate=ztmV2D_utD03cID1u41Al08w0XFm6rXXwCJdTwqI4iw
[8]:https://opensource.com/user/21220/feed
[9]:https://www.flickr.com/photos/theaucitron/5810163712/in/photolist-5p9nh3-6EkSKG-6EgGEF-9hYBcr-abCSpq-9zbjDz-4PVqwm-9RqBfq-abA2T4-4nXfwv-9RQkdN-dmjSdA-84o2ER-abA2Wp-ehyhPC-7oFYrc-4nvqBz-csMQXb-nRegFf-ntS23C-nXRyaB-6Xw3Mq-cRMaCq-b6wkkP-7u8sVQ-yqcg-6fTmk7-bzm3vU-6Xw3vL-6EkzCQ-d3W8PG-5MoveP-oMWsyY-jtMME6-XEMwS-2SeRXT-d2hjzJ-p2ZZVZ-7oFYoX-84r6Mo-cCizvm-gnnsg5-77YfPx-iDjqK-8gszbW-6MUZEZ-dhtwtk-gmpTob-6TBJ8p-mWQaAC/
[10]:http://www.nicholascarr.com/?page_id=21
[11]:https://www.cnet.com/news/there-is-no-big-switch-for-cloud-computing/
[12]:https://www.cnet.com/news/cloudbursting-or-just-portable-clouds/
[13]:https://www.redhat.com/en/technologies/storage/vansonbourne
[14]:https://opensource.com/users/ghaff
[15]:https://opensource.com/users/ghaff
