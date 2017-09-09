为什么开源应该是云原生环境的首选
============================================================

> 基于 Linux 击败了专有软件一样的原因，开源应该成为云原生环境的首选。

![Why open source should be the first choice for cloud-native environments](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn "Why open source should be the first choice for cloud-native environments")

让我们回溯到上世纪 90 年代，当时专有软件大行其道，而开源才刚开始进入它自己的时代。是什么导致了这种转变？更重要的是，而今天我们转到云原生环境时，我们能从中学到什么?

### 基础设施的历史经验

我将以一个高度武断的、开源的视角开始，来看看基础设施过去 30 年的历史。在上世纪 90 年代，Linux 只是大多数组织视野中一个微不足道的小光点而已——如果他们听说过它的话。你早早购入股票的那些公司们很快就发现了 Linux 的好处，它主要是作为专有的 Unix 的廉价替代品，而部署服务器的标准方式是使用专有的 Unix，或者日渐增多的使用 Microsoft Windows NT。

这种模式的专有本性为更专有的软件提供了一个肥沃的生态系统。软件被装在盒子里面放在商店出售。甚至开源软件也参与了这种装盒游戏；你可以在货架上买到 Linux，而不是用你的互联网连接免费下载。去商店和从你的软件供应商那里只是你得到软件的不同方式而已。

![Ubuntu box packaging on a Best Buy shelf](https://opensource.com/sites/default/files/u128651/ubuntu_box.png "Ubuntu box packaging on a Best Buy shelf")

*Ubuntu 包装盒出现在百思买的货架上*

我认为，随着 LAMP 系列（Linux、Apache、MySQL 和 PHP / Perl / Python）的崛起，情况发生了变化。LAMP 系列非常成功。它是稳定的、可伸缩的和相对用户友好的。与此同时，我开始看到对专有解决方案的不满。一旦客户在 LAMP 系列中尝过了开源的甜头，他们就会改变他们对软件的期望，包括：

*   不愿被供应商绑架，
*   关注安全，
*   希望自己来修复 bug ，以及
*   孤立开发的软件意味着创新被扼杀。

在技术方面，我们也看到了各种组织在如何使用软件上的巨大变化。忽然有一天，网站的宕机变成不可接受的了。这就对扩展性和自动化有了更多的依赖。特别是在过去的十年里，我们看到了基础设施从传统的“宠物”模式到“群牛”模式的转变，在这种模式中，服务器可以被换下和替换，而不是一直运行和被指定。公司使用大量的数据，更注重数据留存和数据到用户的处理和返回速度。

开源和开源社区，以及来自大公司的日益增多的投入，为我们改变如何使用软件提供了基础。系统管理员的岗位要求开始 要求 Linux 技能和对开源技术和理念的熟悉。通过开源类似 Chef cookbooks 和 Puppet 模块这样东西，管理员可以分享他们的模式配置。我们不再单独配置和调优 MySQL；我们创建了一个掌控基础部分的系统，我们现在可以专注于更有趣的、可以给我们雇主带来更高价值的工程作业。

开源现在无处不在，围绕它的模式也无处不在。曾经仇视这个想法的公司不仅通过协同项目与外界拥抱开源，而且进一步地，还发布了他们自己的开源软件项目并且围绕它们构建了社区。

![A "Microsoft Linux" USB stick](https://opensource.com/sites/default/files/u128651/microsoft_linux_stick.png "A "Microsoft Linux" USB stick")

### 转向云端

今天，我们生活在一个 DevOps 和云端的世界里。我们收获了开源运动带来的创新成果。在公司内部采用开源软件开发实践的情况下， Tim O'reilly 所称的 “[内部开源][11]” 有了明显增长。我们为云平台共享部署配置。像 Terraform 这样的工具甚至允许我们编写和分享我们如何部署特定的平台。

但这些平台本身呢？

> “大多数人想都不想就使用了云……许多用户将钱投入到根本不属于他们的基础设施中，而对放弃他们的数据和信息毫无顾虑。"
> —Edward Snowden, OpenStack Summit, May 9, 2017

现在是时候要更多地想想本能地转移或扩展到云上的事情了。

就像 Snowden 强调的那样，现在我们正面临着对我们的用户和客户的数据的失控风险。抛开安全不谈，如果我们回顾一下我们转向开源的原因，个中原因还包括被厂商绑架的担忧、创新难以推动、甚至修复 bug 的考虑。

在把你自己和/或你的公司锁定在一个专有平台之前，考虑以下问题：

*   我使用的服务是遵循开放标准，还是被厂商绑架的？
*   如果服务供应商破产或被竞争对手收购，什么是我可以依赖的？
*   关于停机、安全等问题，供应商与其客户沟通中是否有一个明确而真诚的历史过往？
*   供应商是否响应 bug 和特性请求，即使那是来自小客户？
*   供应商是否会在我不知情的情况下使用我们的数据（或者更糟，即便我们的客户协议所不同意）？
*   供应商是否有一个计划来处理长期的，不断上升的增长成本，特别是如果最初的成本很低呢？

您可以通过这个问卷，讨论每个要点，而仍然决定使用专有的解决方案。这很好，很多公司一直都在这么做。然而，如果你像我一样，宁愿找到一个更开放的解决方案而仍然受益于云，你确实有的选择。

### 基于私有云

当您寻找私有云解决方案时，您的首选是开源，投资一个云提供商，其核心运行在开源软件上。 [OpenStack][12] 是行业领袖，在其 7 年的历史中，有 100 多个参与组织和成千上万的贡献者（包括我）。 OpenStack 项目已经证明，结合多个基于 OpenStack 云不仅是可行的，而且相对简单。云公司之间的 API 是相似的，所以您不必局限于特定的 OpenStack 供应商。作为一个开放源码项目，您仍然可以影响该基础设施的特性、bug 请求和发展方向。

第二种选择是继续在基础层面上使用私有云，但在一个开源容器编排系统中。无论您选择 [DC/OS][13]（基于[Apache Mesos][14]) 、[Kubernetes][15]  或 [Docker Swarm  模式][16] ，这些平台都允许您将私有云系统提供的虚拟机作为独立的 Linux 机器，并在此之上安装您的平台。您所需要的只是 Linux 而已，不会立即被锁定在特定云的工具或平台上。可以根据具体情况来决定是否使用特定的专属后端，但如果你这样做，就应该着眼于未来。

有了这两种选择，你也可以选择完全离开云服务商。您可以部署自己的 OpenStack 云，或者将容器平台内部架构移动到您自己的数据中心。

### 做一个登月计划

最后，我想谈一谈开源项目基础设施。今年 3 月，在召开的 [南加州 Linux 展会][17] 上，多个开放源码项目的参与者讨论了为他们的项目运行开源基础设施。（更多的，请阅读我的 [关于该会议的总结][18]）我认为这些项目正在做的这个工作是基础设施开源的最后一步。除了我们现在正在做的基本分享之外，我相信公司和组织们可以在不放弃与竞争对手相区分的“独门秘方”的情况下，进一步充分利用他们的基础设施开源。

开源了他们的基础设施的开源项目，已经证明了允许多个公司和组织向他们的基础设施提交训练有素的 bug 报告，甚至是补丁和特定论文的价值。突然之间，你可以邀请兼职的贡献者。你的客户可以通过了解你的基础设施，“深入引擎盖子之下”，从而获得信心。

想要更多的证据吗？访问 [开源基础设施][19] 的网站了解开源基础设施的项目（以及他们已经发布的大量基础设施）。

可以在 8 月 26 日在费城举办的 FOSSCON 大会上 Elizabeth K. Joseph 的演讲“[基础架构开源][4]”上了解更多。

（题图：[Jason Baker][6]. [CC BY-SA 4.0][7]. Source: [Cloud][8], [Globe][9]. Both [CC0][10].）

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/8/open-sourcing-infrastructure

作者：[Elizabeth K. Joseph][a]
译者：[wenzhiyi](https://github.com/wenzhiyi)
校对：[wxy](https://github.com/wxy)

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
