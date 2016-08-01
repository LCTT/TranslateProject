给学习OpenStack基础设施的新手的入门指南
===========================================================

任何一个为OpenStack贡献源码的人会受到社区的欢迎，但是，对于一个发展趋近成熟并且快速迭代的开源社区而言，能够拥有一个新手指南并不是
件坏事。在奥斯汀举办的OpenStack峰会上，[Paul Belanger][1] (红帽公司), [Elizabeth K. Joseph][2] (HPE公司),和[Christopher Aedo][3] (IBM公司)将会就针对新人的OpenStack基础设施作一场专门的会谈。在这次采访中，他们将会提供一些建议和资源来帮助新人成为OpenStack贡献者中的一员。
![](https://opensource.com/sites/default/files/images/life/Interview%20banner%20Q%26A.png)

**你在谈话中表示你将“投入全部身心于基础设施并解释你需要知道的有关于维持OpenStack正常工作的系统的每一件事情”。这是一个持续了40分钟的的艰巨任务。那么，对于学习OpenStack基础设施的新手来说最需要知道那些事情呢?**
**Elizabeth K. Joseph (EKJ)**: 我们没有为OpenStack使用GitHub这种提交补丁的方式，这是因为这样做会对新手造成巨大的困扰，尽管由于历史原因我们还是保留了所有原先就在GitHub上的所有库的镜像。相反，我们使用了一种完全开源的复查形式，并通过OpenStack基础设施团队来持续的维持系统集成(CI)。相关的，自从我们使用了CI系统，每一个提交给OpenStack的改变都会在被合并之前进行测试。
**Paul Belanger (PB)**: 这个项目中的大多数都是富有激情的人，因此当你提交的补丁被某个人否定时不要感到沮丧。
**Christopher Aedo (CA)**:社区很想帮助你取得成功，因此不要害怕提问或者寻求更多的那些能够促进你理解某些事物的引导者。

### 在你的讲话中，对于一些你无法涉及到的方面，你会向新手推荐哪些在线资源来让他们更加容易入门？
**PB**:当然是我们的[OpenStack项目基础设施文档][5]。我们已经花了足够大的努力来尽可能让这些文档能够随时保持最新状态。我们对每个运行OpenStack项目并投入使用的系统都有制作专门的页面来进行说明。甚至于连OpenStack云基础设施团队也即将上线。

**EKJ**:我对于将基础设施文档作为新手入门教程这件事上的观点和Paul是一致的，另外，我们十分乐意看到来自那些folk了我们项目的学习者提交上来的补丁。我们通常不会意识到我们忽略了文档中的某些内容，除非它们恰好被人问起。因此，阅读，学习，然后帮助我们修补这些知识上的漏洞。你可以在[OpenStack基础设施邮件清单]提出你的问题，或者在我们位于FreeNode上的#OpenStack-infra的IRC专栏发起你的提问。
**CA**:我喜欢[这个详细的发布][7]，它是由Ian Wienand写的一篇关于构建图片的文章。
### "gotchas" 会是OpenStack新的代码贡献者苦苦寻找的吗？
**EKJ**:向项目作出贡献并不仅仅是提交新的代码和新的特性；OpenStack社区高度重视代码复查。如果你想要别人查看你的补丁，那你最好先看看其他人是如何做的，然后参考他们的风格，最后一步布做到你也能够向其他人一样提交清晰且结构分明的代码补丁。你越是能让你的同伴了解你的工作并知道你正在做的复查，那他们也就更有可能形成及时复查你的代码的风格。
**CA**:我看到过大量的新手在面对Gerrit时受挫，阅读开发者引导中的[开发者工作步骤][9]时，可能只是将他通读了一遍。如果你没有经常使用Gerrit，那你最初对它的感觉可能是困惑和无力的。但是，如果你随后做了一些代码复查的工作，那么你马上就能轻松应对它。同样，我是IRC的忠实粉丝。它可能是一个获得帮助的好地方，但是，你最好保持一个长期保留的状态，这样，尽管你在某个时候没有出现，人们也可以回答你的问题。（阅读[IRC,开源界的成功秘诀][10]。）你不必总是在线，但是你最好能够轻松的在一个通道中进行回滚操作，以此来跟上最新的动态，这种能力非常重要。
**PB**:我同意Elizabeth和Chris—Gerrit关于寻求何种方式来学习的观点。每个开发人员所作出的努力都将让社区变得更加美好。你不仅仅要提交代码给别人去复查，同时，你也要能够复查其他人的代码。留意Gerrit的用户接口，你可能一时会变的很疑惑。我推荐新手去尝试[Gertty][11]，它是一个基于控制台的终端接口，用于Gerrit代码复查系统，而它恰好也是OpenStack基础设施所驱动的一个项目。
### 你对于OpenStack新手如何通过网络与其他贡献者交流方面有什么好的建议？
**PB**:对我来说，是通过IRC以及在Freenode上参加#OpenStack-infra专栏([IRC logs][12]).这专栏上面有很多对新手来说很有价值的资源。你可以看到OpenStack项目日复一日的运作情况，同时，一旦你知道了OpenStack项目的工作原理，你将更好的知道如何为OpenStack的未来发展作出贡献。
**CA**:我想要为IRC再次说明一点，在IRC上保持一整天的在线记录对我来说有非常重大的意义，因为我会感觉到被重视并且时刻保持连接。这也是一种非常好的获得帮助的方式，特别是当你卡在了项目中出现的某一个难题的时候，而在专栏中，总会有一些人很乐意为你解决问题。
**EKJ**:[OpenStack开发邮件列表][13]对于能够时刻查看到你所致力于的OpenStack项目的最新情况是非常重要的。因此，我推荐一定要订阅它。邮件列表使用课题标签来区分项目，因此你可以设置你的邮件客户端来使用它，并且集中精力于你所关心的项目。除了在线资源之外，全世界范围内也成立了一些OpenStack小组，他们被用来为OpenStack的用户和贡献者提供服务。这些小组可能会定期举行座谈和针对OpenStack主要贡献者的一些活动。你可以在MeetUp.com上搜素你所在地域的贡献者活动聚会，或者在[groups.openstack.org]上查看你所在的地域是否存在OpenStack小组。最后，还有一个每六个月举办一次的OpenStack峰会，这个峰会上会作一些关于基础设施的演说。当前状态下，这个峰会包含了用户会议和开发者会议，会议内容都是和OpenStack相关的东西，包括它的过去，现在和未来。
### OpenStack需要在那些方面得到提升来让新手更加容易学会并掌握？
**PB**: 我认为我们的[account-setup][16]过程对于新的贡献者已经做的比较容易了，特别是教他们如何提交他们的第一个补丁。真正参与到OpenStack开发者模式的过程是需要花费很大的努力的，可能对于开发者来说已经显得非常多了；然而，一旦融入进去了，这个模式将会运转的十分高效和令人满意。
**CA**: 我们拥有一个由专业开发者组成的社区，而且我们的关注点都是发展OpenStack本身，同时，我们致力于让用户付出更小的代价去使用OpenStack云基础设施平台。我们需要发掘更多的应用开发者，并且鼓励更多的人去开发能在OpenStack云上完美运行的云应用程序，我们还鼓励他们在[社区App目录]上去贡献那些由他们开发的app。我们可以通过提升我们的API标准和保证我们不同的库（比如libcloud，phpopencloud已经其他一些库），并让他们持续的为开发者提供可信赖的支持来实现这一目标。还有一点就是通过倡导更多的OpenStack黑客加入进来。所有的这些事情都可以降低新人的学习门槛，这样也能引导他们与这个社区之间的关系更加紧密。y.
**EKJ**: 我已经致力于开源软件很多年了。但是，对于大量的OpenStack开发者而言，这是一个他们每个人都在从事的第一个开源项目。我发现他们之前使用私有软件的背景并没有为他们塑造开源的观念和方法论，还有在开源项目中需要具备的合作技巧。我乐于看到我们能够让那些曾经一直在使用私有软件工作的人能够真正的明白他们在开源如软件社区所从事的事情的巨大价值。
### 我认为2016年对于开源Haiku的进一步增长是具有重大意义的一年。通过Haiku来向新手解释OpenStack。
**PB**: 如果你喜欢自由软件，你可以向OpenStack提交你的第一个补丁。
**CA**:	在不久的未来，OpenStack将以统治世界的姿态让这个世界变得更好。
**EKJ**: OpenStack是一个可以免费部署在你的服务器上面并且运行你自己的云的一个软件。
*Paul,Elizabeth和Christopher将会在4月25号星期一上午11：15于奥斯汀举办的OpenStack峰会上进行演说。

------------------------------------------------------------------------------

via: https://opensource.com/business/16/4/interview-openstack-infrastructure-beginners

作者：[linux.com][a]
译者：[kylepeng93](https://github.com/kylepeng93)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://rikkiendsley.com/
[1]: https://twitter.com/pabelanger
[2]: https://twitter.com/pleia2
[3]: https://twitter.com/docaedo
[4]: https://www.openstack.org/summit/austin-2016/summit-schedule/events/7337
[5]: http://docs.openstack.org/infra/system-config/
[6]: http://lists.openstack.org/cgi-bin/mailman/listinfo/openstack-infra
[7]: https://www.technovelty.org/openstack/image-building-in-openstack-ci.html
[8]: https://code.google.com/p/gerrit/
[9]: http://docs.openstack.org/infra/manual/developers.html#development-workflow
[10]: https://developer.ibm.com/opentech/2015/12/20/irc-the-secret-to-success-in-open-source/
[11]: https://pypi.python.org/pypi/gertty
[12]: http://eavesdrop.openstack.org/irclogs/%23openstack-infra/
[13]: http://lists.openstack.org/cgi-bin/mailman/listinfo/openstack-dev
[14]: https://groups.openstack.org/
[15]: https://www.openstack.org/summit/
[16]: http://docs.openstack.org/infra/manual/developers.html#account-setup
[17]: https://apps.openstack.org/
[18]: https://www.openstack.org/summit/austin-2016/summit-schedule/events/7337
