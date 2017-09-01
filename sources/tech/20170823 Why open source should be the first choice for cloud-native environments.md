为什么开源应该是云原生环境的首选
============================================================

### 基于相同的原因，Linux 击败了闭源软件，开源应该成为云原生环境的首选。

![Why open source should be the first choice for cloud-native environments](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn "Why open source should be the first choice for cloud-native environments")
Image by : 

[Jason Baker][6]. [CC BY-SA 4.0][7]. Source: [Cloud][8], [Globe][9]. Both [CC0][10].

让我们回溯到上世纪 90 年代，当时闭源软件大行其道，而开源才刚开始进入它自己的时代。是什么导致了这种转变，更重要的是，当我们转变为云原生环境时，我们能从今天学到什么?

### 基础设施的历史教训

我将从一个高度武断的、开放的基础设施的过去30年的历史开始。如果他们知道什么的话，在 20 世纪 90 年代，Linux 只是大多数组织的雷达上的一个闪光点。从那些很快就能看到 Linux 的好处的公司中，你已经得到了早期的支持，主要是作为私有 Unix 的廉价替代品，但是使用 Microsoft Windows NT 来部署服务器的方式是使用一种Unix或增加的专有形式。

这种工具的专有特性为更专有的软件提供了一个肥沃的生态系统。软件被装箱出售。甚至开源也参与了包装游戏;你可以在书架上买到Linux，而不是把你的互联网连接从免费的来源下载。去商店或者和你的软件供应商一起工作只是你得到软件的方式。

### [ubuntu_box.png][1]

![Ubuntu box packaging on a Best Buy shelf](https://opensource.com/sites/default/files/u128651/ubuntu_box.png "Ubuntu box packaging on a Best Buy shelf")

Ubuntu盒包装在最好的买架上

我认为，随着LAMP系列 (Linux、Apache、MySQL 和 PHP / Perl / Python) 的兴起，情况发生了变化。

我认为，随着 LAMP 系列 (Linux、Apache、MySQL 和 PHP / Perl / Python) 的兴起，情况发生了变化。LAMP系列是一个巨大的成功故事。它是稳定的、可伸缩的、友好的。与此同时，我开始看到对闭源解决方案的不满。一旦客户在LAMP系列中有了这种开源的念头，他们就会改变他们对软件的期望，包括:

*   不愿被供应商绑架，

*   关注安全,

*   希望修复 bug ，以及

*   当软件被孤立开发时，意味着创新被扼杀了。

在技术方面，我们也看到了组织者在如何使用软件上的巨大变化。突如其来一个网站的宕机是不可预测和接受的。这会对扩展性和自动化造成影响。特别是在过去的十年里，我们看到了从传统的基础设施模型到“牛”模型的转变，在这种模式中，服务器可以被替换和替换，而不是保存和命名。公司使用大量的数据，更注重数据保留和处理速度，并将数据返回给用户。

开源社区，开放社区和来自大公司的增持投资，为我们如何开始使用软件提供了基础。系统管理员的工作职责开始需要使用 Linux 的技能，熟悉开源技术和方法。通过开源，如 Chef cookbooks 和 Puppet 模块，管理员可以共享他们工具的配置。我们不再单独配置和调优 MySQL ;我们创建了一个用于处理以上问题的系统。

开源现在无处不在，围绕它的工具也无处不在。我们可以把重点放在更有趣的工程上，从而为我们的雇主带来更大的价值。

开源现在无处不在，围绕它的工具也无处不在。曾经对这个想法怀有敌意的公司不仅通过互操作性项目与外界拥抱开源，而且还通过发布他们自己的开源软件项目并且围绕它们构建社区。

### [microsoft_linux_stick.png][2]

![A "Microsoft Linux" USB stick](https://opensource.com/sites/default/files/u128651/microsoft_linux_stick.png "A "Microsoft Linux" USB stick")

A "Microsoft 
![heart](https://opensource.com/sites/all/libraries/ckeditor/plugins/smiley/images/heart.png "heart")
 Linux" USB stick

### 转向云端

今天，我们生活在一个 DevOps 和云端的世界里。我们收获了开源运动带来的创新成果。Tim O ' reilly 所称的 “[inner-sourcing][11]” ，在公司内部采用开源软件开发实践。我们正在为云平台共享部署配置。像 Terraform 这样的工具甚至允许我们编写和分享我们如何部署到特定的平台。

今天，我们生活在一个 DevOps 和云端的世界里。但这些平台本身呢？

> "Most people just consume the cloud without thinking ... many users are sinking cost into infrastructure that is not theirs, and they are giving up data and information about themselves without thinking."
> —Edward Snowden, OpenStack Summit, May 9, 2017

现在是时候把更多的想法放入我们的本能反应中来部署扩展到云上。

就像 Snowden 强调的那样，现在我们有可能失去对用户数据的控制。抛开安全不谈，如果我们回顾一下我们转向开源的原因，个中原因还包括对厂商锁定的担忧，创新难以推动，以及无法修复bug。

在你把自己和/或你的公司锁定在一个专有平台之前，考虑以下问题:

*   我使用的服务是遵循开放标准，还是闭源？

*   如果服务供应商破产或被竞争对手收购，我的追索权是什么？

*   关于停机、安全等问题，供应商在与客户沟通中是否有一个明确而真诚的历史过往？

*   供应商是否响应bug和特性请求，即使那是来自小客户？

*   供应商是否会在我不知情的情况下使用我们的数据（或者更糟，不让我们反对的客户协议）？

*   供应商是否有一个计划来处理长期的，不断上升的增长成本，特别是如果最初的成本很低呢？

您可以通过这个问卷，讨论每个要点，仍然决定使用专有的解决方案。这很好，公司一直都在这么做。然而，如果你像我一样，宁愿找到一个更开放的解决方案，而仍然受益于云，你确实有选择。


### 基于私有云

当您寻找私有云解决方案时，您的第一个选择是投资一个云提供商，它的核心运行在开源软件上。 [OpenStack][12] 是行业领袖，在其7年的历史中，有100多个参与组织和成千上万的贡献者(包括我)。 OpenStack 项目已经证明，与多个 openstackbased 云的接口不仅是可以实现，而且相对简单。云公司之间的 api 是相似的，所以您不必局限于特定的 OpenStack 供应商。作为一个开放源码项目，您仍然可以影响基础设施的特性、bug请求和方向。

第二种选择是继续在一个基本级别上使用专有云，但在一个开源容器编排系统中。无论您选择 [DC / OS][13](基于[Apache Mesos][14]) ，[Kubernetes][15] ，或[Docker in swarm mode][16] ，这些平台都允许您将专有云系统提供的虚拟机作为独立的 Linux 机器，并在此之上安装您的平台。您所需要的只是 linux 不会立即被锁定在特定于云的工具或平台上。决策可以根据具体情况来决定是否使用特定的私有后端，但如果你这样做，就应该着眼于未来。

有了这两种选择，你也可以选择完全离开云。您可以部署自己的 OpenStack 云，或者将容器平台内部架构移动到您自己的数据中心。

### 做一个月球探测器

最后，我想谈一谈开源项目基础设施。今年3月，来自 [Southern California Linux Expo][17] 的多个开放源码项目的参与者讨论了为他们的项目运行开源基础设施。(更多的，请阅读我的 [summary of this event][18]。)我认为这些项目的工作是基础设施开放采购的最后一步。除了我们现在正在做的基本分享之外，我相信公司和组织可以在不放弃与竞争对手较劲的情况下，充分利用他们的基础设施开源。

开源项目已经公开了他们的基础设施，已经证明了允许多个公司和组织向他们的基础设施提交有系统知识的 bug 报告，甚至是补丁和特定论文。突然之间，你可以邀请兼职的贡献者。你的客户可以通过了解你的基础设施在“引擎”而使用放心。


想要更多的证据吗?访问 [Open Source Infrastructure][19] 的网站，了解更多的项目，使其基础设施开放源代码(以及他们已经发布的大量基础设施)。


8 月 26 日在费城的 FOSSCON 网站上，伊丽莎白·k·约瑟夫的演讲[The Open Sourcing of Infrastructure][4]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/8/open-sourcing-infrastructure

作者：[ Elizabeth K. Joseph][a]
译者：[wenzhiyi](https://github.com/wenzhiyi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pleia2
[1]:https://opensource.com/file/366596
[2]:https://opensource.com/file/366591
[3]:https://opensource.com/article/17/8/open-sourcing-infrastructure?rate=PdT-huv5y5HFZVMHOoRoo_qd95RG70y4DARqU5pzgkU
[4]:https://fosscon.us/node/12637
[5]:https://opensource.com/user/25923/feed
[6]:https://opensource.com/users/jason-baker
[7]:https://creativecommons.org/licenses/by-sa/4.0/
[8]:https://pixabay.com/en/clouds-sky-cloud-dark-clouds-1473311/
[9]:https://pixabay.com/en/globe-planet-earth-world-1015311/
[10]:https://creativecommons.org/publicdomain/zero/1.0/
[11]:https://opensource.com/life/16/11/create-internal-innersource-community
[12]:https://www.openstack.org/
[13]:https://dcos.io/
[14]:http://mesos.apache.org/
[15]:https://kubernetes.io/
[16]:https://docs.docker.com/engine/swarm/
[17]:https://www.socallinuxexpo.org/
[18]:https://opensource.com/article/17/3/growth-open-source-project-infrastructures
[19]:https://opensourceinfra.org/
[20]:https://opensource.com/users/pleia2
[21]:https://opensource.com/users/pleia2
