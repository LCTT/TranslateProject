[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11497-1.html)
[#]: subject: (Kubernetes networking, OpenStack Train, and more industry trends)
[#]: via: (https://opensource.com/article/19/10/kubernetes-openstack-and-more-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

每周开源点评：Kubernetes 网络、OpenStack Train 以及更多的行业趋势
======

> 开源社区和行业趋势的每周总览。

![Person standing in front of a giant computer screen with numbers, data][1]

作为我在具有开源开发模型的企业软件公司担任高级产品营销经理的角色的一部分，我为产品营销人员、经理和其他影响者定期发布有关开源社区，市场和行业趋势的定期更新。以下是该更新中我和他们最喜欢的五篇文章。

### OpenStack Train 中最令人兴奋的功能

- [文章地址][2]

> 考虑到 Train 版本必须提供的所有技术优势（[你可以在此处查看版本亮点][3]），你可能会对 Red Hat 认为这些将使我们的电信和企业客户受益的顶级功能及其用例感到好奇。以下我们对该版本最兴奋的功能的概述。

**影响**：OpenStack 对我来说就像 Shia LaBeouf：它在几年前达到了炒作的顶峰，然后继续产出了好的作品。Train 版本看起来是又一次令人难以置信的创新下降。

### 以 Ansible 原生的方式构建 Kubernetes 操作器

- [文章地址][4]

> 操作器简化了 Kubernetes 上复杂应用程序的管理。它们通常是用 Go 语言编写的，并且需要懂得 Kubernetes 内部的专业知识。但是，还有另一种进入门槛较低的选择。Ansible 是操作器 SDK 中的一等公民。使用 Ansible 可以释放应用程序工程师的精力，最大限度地利用时间来自动化和协调你的应用程序，并使用一种简单的语言在新的和现有的平台上进行操作。在这里我们可以看到如何做。

**影响**：这就像你发现可以用搅拌器和冷冻香蕉制作出不错的冰淇淋一样：Ansible（通常被认为很容易掌握）可以使你比你想象的更容易地做一些令人印象深刻的操作器魔术。

### Kubernetes 网络：幕后花絮

- [文章地址][5]

> 尽管围绕该主题有很多很好的资源（链接在[这里][6]），但我找不到一个示例，可以将所有的点与网络工程师喜欢和讨厌的命令输出连接起来，以显示背后实际发生的情况。因此，我决定从许多不同的来源收集这些信息，以期帮助你更好地了解事物之间的联系。

**影响**：这是一篇对复杂主题（带有图片）阐述的很好的作品。保证可以使 Kubenetes 网络的混乱程度降低 10％。

### 保护容器供应链

- [文章地址][7]

> 随着容器、软件即服务和函数即服务的出现，人们开始着眼于在使用现有服务、函数和容器映像的过程中寻求新的价值。[Red Hat][8] 的容器首席产品经理 Scott McCarty 表示，关注这个重点既有优点也有缺点。“它使我们能够集中精力编写满足我们需求的新应用程序代码，同时将对基础架构的关注转移给其他人身上，”McCarty 说，“容器处于一个最佳位置，提供了足够的控制，而卸去了许多繁琐的基础架构工作。”但是，容器也会带来与安全性相关的劣势。

**影响**：我在一个由大约十位安全人员组成的小组中，可以肯定地说，整天要考虑软件安全性需要一定的倾向。当你长时间凝视深渊时，它也凝视着你。如果你不是如此倾向的软件开发人员，请听取 Scott 的建议并确保你的供应商考虑安全。

### 15 岁的 Fedora：为何 Matthew Miller 看到 Linux 发行版的光明前景

- [文章链接][9]

> 在 TechRepublic 的一个大范围采访中，Fedora 项目负责人 Matthew Miller 讨论了过去的经验教训、软件容器的普遍采用和竞争性标准、Fedora 的潜在变化以及包括 systemd 在内的热门话题。

**影响**：我喜欢 Fedora 项目的原因是它的清晰度；该项目知道它代表什么。像 Matt 这样的人就是为什么能看到光明前景的原因。

*我希望你喜欢这张上周让我印象深刻的列表，并在下周一回来了解更多的开放源码社区、市场和行业趋势。*

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/kubernetes-openstack-and-more-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.redhat.com/en/blog/look-most-exciting-features-openstack-train
[3]: https://releases.openstack.org/train/highlights.html
[4]: https://www.cncf.io/webinars/building-kubernetes-operators-in-an-ansible-native-way/
[5]: https://itnext.io/kubernetes-networking-behind-the-scenes-39a1ab1792bb
[6]: https://github.com/nleiva/kubernetes-networking-links
[7]: https://www.devprojournal.com/technology-trends/open-source/securing-the-container-supply-chain/
[8]: https://www.redhat.com/en
[9]: https://www.techrepublic.com/article/fedora-at-15-why-matthew-miller-sees-a-bright-future-for-the-linux-distribution/
