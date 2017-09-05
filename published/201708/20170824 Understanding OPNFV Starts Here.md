从这开始了解 OPNFV
============================================================

![OPNFV](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/network-transformation.png?itok=uNTYBeQb "OPNFV")

如果电信运营商或企业今天从头开始构建网络，那么他们可能用软件定义资源的方式构建，这与 Google 或 Facebook 的基础设施类似。这是网络功能虚拟化 （NFV） 的前提。

NFV 是颠覆的一代，其将彻底改变网络的建设和运营。而且，[OPNFV][3] 是一个领先的开源 NFV 项目，旨在加速这项技术的采用。

你是想要知道有哪些开源项目可能会帮助你进行 NFV  转换计划的电信运营商或者相关的企业员工么？还是要将你的产品和服务推向新的 NFV 世界的技术提供商？或者，也许是一名想使用开源项目来发展你事业的工程师、网络运维或商业领袖？（例如 2013 年 Rackspace [提到][4] 拥有 OpenStack 技能的网络工程师的平均工资比他们的同行高 13%）？如果这其中任何一个适用于你，那么 _理解 OPNFV_ 一书是你的完美资源。

![OPNFV Book](https://www.linux.com/sites/lcom/files/understanding-opnfv.jpeg)

*“理解 OPNFV”一书高屋建瓴地提供了 OPNFV 的理解以及它如何帮助你和你们的组织。*

本书（由 Mirantis 、 Nick Chase 和我撰写）在 11 个易于阅读的章节和超过 144 页中介绍了从 NFV、NFV 转换、OPNFV 项目的各个方面到 VNF 入门的概述，涵盖了一系列主题。阅读本书后，你将对 OPNFV 是什么有一个高屋建瓴的理解以及它如何帮助你或你们的组织。这本书不是专门面向开发人员的，虽然有开发背景信息很有用。如果你是开发人员，希望作为贡献者参与 OPNFV 项目，那么 [wiki.opnfv.org][5] 仍然是你的最佳资源。

在本博客系列中，我们会向你展示本书的一部分内容 - 就是有些什么内容，以及你可能会学到的。

让我们从第一章开始。第 1 章，毫不奇怪，是对 NFV 的介绍。它从业务驱动因素（需要差异化服务、成本压力和敏捷需求）、NFV 是什么，以及你可从 NFV 可以获得什么好处的角度做了简要概述。

简而言之，NFV 可以在数据中心的计算节点上执行复杂的网络功能。在计算节点上执行的网络功能称为虚拟网络功能 （VNF）。因此，VNF 可以作为网络运行，NFV 还会添加机制来确定如何将它们链接在一起，以提供对网络中流量的控制。

虽然大多数人认为它用在电信，但 NFV 涵盖了广泛的使用场景，从基于应用或流量类型的按角色访问控制 （RBAC） 到用于管理网络内容的内容分发网络 （CDN） 网络（通常需要的地方），更明显的电信相关用例如演进分组核心 （EPC） 和 IP 多媒体系统（IMS）。

此外，一些主要收益包括增加收入、改善客户体验、减少运营支出 （OPEX）、减少资本支出 （CAPEX）和为新项目腾出资源。本节还提供了具体的 NFV 总体拥有成本 （TCO） 分析。这些话题的处理很简单，因为我们假设你有一些 NFV 背景。然而，如果你刚接触 NFV ，不要担心 - 介绍材料足以理解本书的其余部分。

本章总结了 NFV 要求 - 安全性、性能、互操作性、易操作性以及某些具体要求，如服务保证和服务功能链。不符合这些要求，没有 NFV 架构或技术可以真正成功。

阅读本章后，你将对为什么 NFV 非常重要、NFV是什么，以及 NFV 成功的技术要求有一个很好的概念。我们将在今后的博客文章中浏览下面的章节。

这本书已被证明是行业活动上最受欢迎的赠品，中文版正在进行之中！但是你现在可以[下载 PDF 格式的电子书][6]，或者在亚马逊上下载[打印版本][7]。

（题图：[Creative Commons Zero][1]Pixabay）

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/opnfv/2017/8/understanding-opnfv-starts-here

作者：[AMAR KAPADIA][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/akapadia
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/network-transformationpng
[3]:https://www.opnfv.org/
[4]:https://blog.rackspace.com/solving-the-openstack-talent-gap
[5]:https://wiki.opnfv.org/
[6]:https://www.opnfv.org/resources/download-understanding-opnfv-ebook
[7]:https://www.amazon.com/dp/B071LQY724/ref=cm_sw_r_cp_ep_dp_pgFMzbM8YHJA9
