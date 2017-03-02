给学习 OpenStack 架构的新手入门指南
===========================================================

OpenStack 欢迎新成员的到来，但是，对于这个发展趋近成熟并且快速迭代的开源社区而言，能够拥有一个新手指南并不是件坏事。在奥斯汀举办的 OpenStack 峰会上，[Paul Belanger][1] （来自红帽公司）、 [Elizabeth K. Joseph][2] （来自 HPE 公司）和 [Christopher Aedo][3] （来自 IBM 公司）就[针对新人的 OpenStack 架构][4]作了一场专门的讲演。在这次采访中，他们提供了一些建议和资源来帮助新人成为 OpenStack 贡献者中的一员。

![](https://opensource.com/sites/default/files/images/life/Interview%20banner%20Q%26A.png)

**你的讲演介绍中说你将“深入架构核心，并解释你需要知道的关于让 OpenStack 工作起来的每一件事情”。这对于 40 分钟的讲演来说是一个艰巨的任务。那么，对于学习 OpenStack 架构的新手来说最需要知道那些事情呢?**

**Elizabeth K. Joseph （EKJ）**： 我们没有为 OpenStack 使用 GitHub 这种提交补丁的方式，这是因为这样做会对新手造成巨大的困扰，尽管由于历史原因我们还是在 GitHub 上维护了所有库的一个镜像。相反，我们使用了一种完全开源的评审形式，而且持续集成（CI）是由 OpenStack 架构团队维护的。与之有关的，自从我们使用了 CI 系统，每一个提交给 OpenStack 的改变都会在被合并之前进行测试。

**Paul Belanger （PB）**： 这个项目中的大多数都是富有激情的人，因此当你提交的补丁被某个人否定时不要感到沮丧。

**Christopher Aedo （CA）**：社区会帮助你取得成功，因此不要害怕提问或者寻求更多的那些能够促进你理解某些事物的引导者。

**在你的讲话中，对于一些你无法涉及到的方面，你会向新手推荐哪些在线资源来让他们更加容易入门？**

**PB**：当然是我们的 [OpenStack 项目架构文档][5]。我们已经花了足够大的努力来尽可能让这些文档能够随时保持最新状态。在 OpenStack 运行中使用的每个系统都作为一个项目，都制作了专门的页面来进行说明。甚至于连 OpenStack 云这种架构团队也会放到线上。

**EKJ**：我对于架构文档这件事上的观点和 Paul 是一致的，另外，我们十分乐意看到来自那些正在学习项目的人们提交上来的补丁。我们通常不会意识到我们忽略了文档中的某些内容，除非它们恰好被人问起。因此，阅读、学习，会帮助我们修补这些知识上的漏洞。你可以在 [OpenStack 架构邮件清单]提出你的问题，或者在我们位于 FreeNode 上的 #OpenStack-infra 的 IRC 专栏发起你的提问。

**CA**：我喜欢[这个详细的帖子][7]，它是由 Ian Wienand 写的一篇关于构建镜像的文章。

**"gotchas" 会是 OpenStack 新的贡献者们所寻找的吗？**

**EKJ**：向项目作出贡献并不仅仅是提交新的代码和新的特性；OpenStack 社区高度重视代码评审。如果你想要别人查看你的补丁，那你最好先看看其他人是如何做的，然后参考他们的风格，最后一步步做到你也能够向其他人一样提交清晰且结构分明的代码补丁。你越是能让你的同伴了解你的工作并知道你正在做的评审，那他们也就越有可能及时评审你的代码。

**CA**：我看到过大量的新手在面对 [Gerrit][8] 时受挫，阅读开发者引导中的[开发者工作步骤][9]，有可能的话多读几遍。如果你没有用过 Gerrit，那你最初对它的感觉可能是困惑和无力的。但是，如果你随后做了一些代码评审的工作，那么你就能轻松应对它。此外，我是 IRC 的忠实粉丝，它可能是一个获得帮助的好地方，但是，你最好保持一个长期在线的状态，这样，尽管你在某个时候没有出现，人们也可以回答你的问题。（阅读 [IRC，开源成功的秘诀][10]）你不必总是在线，但是你最好能够轻松的在一个频道中回溯之前信息，以此来跟上最新的动态，这种能力非常重要。

**PB**：我同意 Elizabeth 和 Chris 的观点， Gerrit 是需要花点精力的，它将汇聚你的开发方面的努力。你不仅仅要提交代码给别人去评审，同时，你也要能够评审其他人的代码。看到 Gerrit 的界面，你可能一时会变的很困惑。我推荐新手去尝试 [Gertty][11]，它是一个基于控制台的终端界面，用于 Gerrit 代码评审系统，而它恰好也是 OpenStack 架构所驱动的一个项目。

**你对于 OpenStack 新手如何通过网络与其他贡献者交流方面有什么好的建议？**

**PB**：对我来说，是通过 IRC 并在 Freenode 上参加 #OpenStack-infra 频道（[IRC 日志][12]）。这频道上面有很多对新手来说很有价值的资源。你可以看到 OpenStack 项目日复一日的运作情况，同时，一旦你知道了 OpenStack 项目的工作原理，你将更好的知道如何为 OpenStack 的未来发展作出贡献。

**CA**：我想要为 IRC 再次说明一点，在 IRC 上保持全天在线记录对我来说有非常重大的意义，因为我会时刻保持连接并随时接到提醒。这也是一种非常好的获得帮助的方式，特别是当你和某人卡在了项目中出现的某一个难题的时候，而在一个活跃的 IRC 频道中，总会有一些人很乐意为你解决问题。

**EKJ**：[OpenStack 开发邮件列表][13]对于能够时刻查看到你所致力于的 OpenStack 项目的最新情况是非常重要的。因此，我推荐一定要订阅它。邮件列表使用主题标签来区分项目，因此你可以设置你的邮件客户端来使用它来专注于你所关心的项目。除了在线资源之外，全世界范围内也成立了一些 OpenStack 小组，他们被用来为 OpenStack 的用户和贡献者提供服务。这些小组可能会定期要求 OpenStack 主要贡献者们举办座谈和活动。你可以在 MeetUp.com 上搜素你所在地域的贡献者活动聚会，或者在 [groups.openstack.org][14] 上查看你所在的地域是否存在 OpenStack 小组。最后，还有一个每六个月举办一次的 [OpenStack 峰会][15]，这个峰会上会作一些关于架构的演说。当前状态下，这个峰会包含了用户会议和开发者会议，会议内容都是和 OpenStack 相关的东西，包括它的过去，现在和未来。

**OpenStack 需要在那些方面得到提升来让新手更加容易学会并掌握？**

**PB**： 我认为我们的 [account-setup][16] 环节对于新的贡献者已经做的比较容易了，特别是教他们如何提交他们的第一个补丁。真正参与到 OpenStack 开发者模式中是需要花费很大的努力的，相比贡献者来说已经显得非常多了；然而，一旦融入进去了，这个模式将会运转的十分高效和令人满意。

**CA**： 我们拥有一个由专业开发者组成的社区，而且我们的关注点都是发展 OpenStack 本身，同时，我们致力于让用户付出更小的代价去使用 OpenStack 云架构平台。我们需要发掘更多的应用开发者，并且鼓励更多的人去开发能在 OpenStack 云上完美运行的云应用程序，我们还鼓励他们在[社区 App 目录][17]上去贡献那些由他们开发的应用。我们可以通过不断提升我们的 API 标准和保证我们不同的库（比如 libcloud，phpopencloud 以及其他一些库）持续地为开发者提供可信赖的支持来实现这一目标。还有一点就是通过举办更多的 OpenStack 黑客比赛。所有的这些事情都可以降低新人的学习门槛，这样也能引导他们与这个社区之间的关系更加紧密。

**EKJ**： 我已经致力于开源软件很多年了。但是，对于大量的 OpenStack 开发者而言，这是一个他们自己所从事的第一个开源项目。我发现他们之前使用私有软件的背景并没有为他们塑造开源的观念、方法论，以及在开源项目中需要具备的合作技巧。我乐于看到我们能够让那些曾经一直在使用私有软件工作的人能够真正的明白他们在开源如软件社区所从事的事情的巨大价值。

**我想把 2016 年打造成开源俳句之年。请用俳句来向新手解释 OpenStack 一下。**

（LCTT 译注：俳句（Haiku）是一种日本古典短诗，以5-7-5音节为三句，校对者不揣浅陋，诌了几句歪诗，勿笑 :D，另外 OpenStack 本身音节太长，就捏造了一个中文译名“开栈”——明白就好。）

**PB**： 开栈在云上//倘钟情自由软件//先当造补丁（OpenStack runs clouds
If you enjoy free software
Submit your first patch）

**CA**：时光不必久//开栈将支配世界//协力早来到（In the near future
OpenStack will rule the world
Help make it happen!）

**EKJ**：开栈有自由//放在自家服务器//运行你的云（OpenStack is free
Deploy on your own servers
And run your own cloud!）

*Paul、Elizabeth 和 Christopher 在 4 月 25 号星期一上午 11：15 于奥斯汀举办的 OpenStack 峰会发表了[演说][18]。

------------------------------------------------------------------------------

via: https://opensource.com/business/16/4/interview-openstack-infrastructure-beginners

作者：[Rikki Endsley][a]
译者：[kylepeng93](https://github.com/kylepeng93)
校对：[wxy](https://github.com/wxy)

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
