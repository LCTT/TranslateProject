DevOps 实践指南
======
> 这些技巧或许对那些想要践行 DevOps 的系统运维和开发者能有所帮助。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_resume_rh1x.png?itok=S3HGxi6E)

在去年大概一年的时间里，我注意到对“Devops 实践”感兴趣的开发人员和系统管理员突然有了明显的增加。这样的变化也合理：现在开发者只要花很少的钱，调用一些 API，就能单枪匹马地在一整套分布式基础设施上运行自己的应用，在这个时代，开发和运维的紧密程度前所未有。我看过许多博客和文章介绍很酷的 DevOps 工具和相关思想，但是给那些希望践行 DevOps 的人以指导和建议的内容，我却很少看到。

这篇文章的目的就是描述一下如何去实践。我的想法基于 Reddit 上 [devops][1] 的一些访谈、聊天和深夜讨论，还有一些随机谈话，一般都发生在享受啤酒和美食的时候。如果你已经开始这样实践，我对你的反馈很感兴趣，请通过[我的博客][2]或者 [Twitter][3] 联系我，也可以直接在下面评论。我很乐意听到你们的想法和故事。

### 古代的 IT

了解历史是搞清楚未来的关键，DevOps 也不例外。想搞清楚 DevOps 运动的普及和流行，去了解一下上世纪 90 年代后期和 21 世纪前十年 IT 的情况会有帮助。这是我的经验。

我的第一份工作是在一家大型跨国金融服务公司做 Windows 系统管理员。当时给计算资源扩容需要给 Dell 打电话（或者像我们公司那样打给 CDW），并下一个价值数十万美元的订单，包含服务器、网络设备、电缆和软件，所有这些都要运到生产或线下的数据中心去。虽然 VMware 仍在尝试说服企业使用虚拟机运行他们的“性能敏感”型程序是更划算的，但是包括我们在内的很多公司都还是愿意使用他们的物理机运行应用。

在我们技术部门，有一个专门做数据中心工程和运营的团队，他们的工作包括价格谈判，让荒唐的月租能够降一点点，还包括保证我们的系统能够正常冷却（如果设备太多，这个事情的难度会呈指数增长）。如果这个团队足够幸运足够有钱，境外数据中心的工作人员对我们所有的服务器型号又都有足够的了解，就能避免在盘后交易中不小心搞错东西。那时候亚马逊 AWS 和 Rackspace 逐渐开始加速扩张，但还远远没到临界规模。

当时我们还有专门的团队来保证硬件上运行着的操作系统和软件能够按照预期工作。这些工程师负责设计可靠的架构以方便给系统打补丁、监控和报警，还要定义<ruby>基础镜像<rt>gold image</rt></ruby>的内容。这些大都是通过很多手工实验完成的，很多手工实验是为了编写一个<ruby>运行说明书<rt>runbook</rt></ruby>来描述要做的事情，并确保按照它执行后的结果确实在预期内。在我们这么大的组织里，这样做很重要，因为一线和二线的技术支持都是境外的，而他们的培训内容只覆盖到了这些运行说明而已。

（这是我职业生涯前三年的世界。我那时候的梦想是成为制定最高标准的人！）

软件发布则完全是另外一头怪兽。无可否认，我在这方面并没有积累太多经验。但是，从我收集的故事（和最近的经历）来看，当时大部分软件开发的日常大概是这样：

* 开发人员按照技术和功能需求来编写代码，这些需求来自于业务分析人员的会议，但是会议并没有邀请开发人员参加。
* 开发人员可以选择为他们的代码编写单元测试，以确保在代码里没有任何明显的疯狂行为，比如除以 0 但不抛出异常。
* 然后开发者会把他们的代码标记为 “Ready for QA”（准备好了接受测试），质量保障的成员会把这个版本的代码发布到他们自己的环境中，这个环境和生产环境可能相似，也可能不，甚至和开发环境相比也不一定相似。
* 故障会在几天或者几个星期内反馈到开发人员那里，这个时长取决于其它业务活动和优先事项。

虽然系统管理员和开发人员经常有不一致的意见，但是对“变更管理”却一致痛恨。变更管理由高度规范的（就我当时的雇主而言）和非常必要的规则和程序组成，用来管理一家公司应该什么时候做技术变更，以及如何做。很多公司都按照 [ITIL][4] 来操作，简单的说，ITIL 问了很多和事情发生的原因、时间、地点和方式相关的问题，而且提供了一个过程，对产生最终答案的决定做审计跟踪。

你可能从我的简短历史课上了解到，当时 IT 的很多很多事情都是手工完成的。这导致了很多错误。错误又导致了很多财产损失。变更管理的工作就是尽量减少这些损失，它常常以这样的形式出现：不管变更的影响和规模大小，每两周才能发布部署一次。周五下午 4 点到周一早上 5 点 59 分这段时间，需要排队等候发布窗口。（讽刺的是，这种流程导致了更多错误，通常还是更严重的那种错误）

### DevOps 不是专家团

你可能在想 “Carlos 你在讲啥啊，什么时候才能说到 Ansible playbooks？”，我喜欢 Ansible，但是请稍等 —— 下面这些很重要。

你有没有过被分配到需要跟 DevOps 小组打交道的项目？你有没有依赖过“配置管理”或者“持续集成/持续交付”小组来保证业务流水线设置正确？你有没有在代码开发完的数周之后才参加发布部署的会议？

如果有过，那么你就是在重温历史，这个历史是由上面所有这些导致的。

出于本能，我们喜欢和像自己的人一起工作，这会导致[壁垒][5]的形成。很自然，这种人类特质也会在工作场所表现出来是不足为奇的。我甚至在曾经工作过的一个 250 人的创业公司里见到过这样的现象。刚开始的时候，开发人员都在聚在一起工作，彼此深度协作。随着代码变得复杂，开发相同功能的人自然就坐到了一起，解决他们自己的复杂问题。然后按功能划分的小组很快就正式形成了。

在我工作过的很多公司里，系统管理员和开发人员不仅像这样形成了天然的壁垒，而且彼此还有激烈的对抗。开发人员的环境出问题了或者他们的权限太小了，就会对系统管理员很恼火。系统管理员怪开发人员无时无刻地在用各种方式破坏他们的环境，怪开发人员申请的计算资源严重超过他们的需要。双方都不理解对方，更糟糕的是，双方都不愿意去理解对方。

大部分开发人员对操作系统，内核或计算机硬件都不感兴趣。同样，大部分系统管理员，即使是 Linux 的系统管理员，也都不愿意学习编写代码，他们在大学期间学过一些 C 语言，然后就痛恨它，并且永远都不想再碰 IDE。所以，开发人员把运行环境的问题甩给围墙外的系统管理员，系统管理员把这些问题和甩过来的其它上百个问题放在一起安排优先级。每个人都忙于怨恨对方。DevOps 的目的就是解决这种矛盾。

DevOps 不是一个团队，CI/CD 也不是 JIRA 系统的一个用户组。DevOps 是一种思考方式。根据这个运动来看，在理想的世界里，开发人员、系统管理员和业务相关人将作为一个团队工作。虽然他们可能不完全了解彼此的世界，可能没有足够的知识去了解彼此的积压任务，但他们在大多数情况下能有一致的看法。

把所有基础设施和业务逻辑都代码化，再串到一个发布部署流水线里，就像是运行在这之上的应用一样。这个理念的基础就是 DevOps。因为大家都理解彼此，所以人人都是赢家。聊天机器人和易用的监控工具、可视化工具的兴起，背后的基础也是 DevOps。

[Adam Jacob][6] 说的最好：“DevOps 就是企业往软件导向型过渡时我们用来描述操作的词。”

### 要实践 DevOps 我需要知道些什么

我经常被问到这个问题，它的答案和同属于开放式的其它大部分问题一样：视情况而定。

现在“DevOps 工程师”在不同的公司有不同的含义。在软件开发人员比较多但是很少有人懂基础设施的小公司，他们很可能是在找有更多系统管理经验的人。而其他公司，通常是大公司或老公司，已经有一个稳固的系统管理团队了，他们在向类似于谷歌 [SRE][7] 的方向做优化，也就是“设计运维功能的软件工程师”。但是，这并不是金科玉律，就像其它技术类工作一样，这个决定很大程度上取决于他的招聘经理。

也就是说，我们一般是在找对深入学习以下内容感兴趣的工程师：

* 如何管理和设计安全、可扩展的云平台（通常是在 AWS 上，不过微软的 Azure、Google Cloud Platform，还有 DigitalOcean 和 Heroku 这样的 PaaS 提供商，也都很流行）。
* 如何用流行的 [CI/CD][8] 工具，比如 Jenkins、GoCD，还有基于云的 Travis CI 或者 CircleCI，来构造一条优化的发布部署流水线和发布部署策略。
* 如何在你的系统中使用基于时间序列的工具，比如 Kibana、Grafana、Splunk、Loggly 或者 Logstash 来监控、记录，并在变化的时候报警。
* 如何使用配置管理工具，例如 Chef、Puppet 或者 Ansible 做到“基础设施即代码”，以及如何使用像 Terraform 或 CloudFormation 的工具发布这些基础设施。

容器也变得越来越受欢迎。尽管有人对大规模使用 Docker 的现状[表示不满][9]，但容器正迅速地成为一种很好的方式来实现在更少的操作系统上运行超高密度的服务和应用，同时提高它们的可靠性。（像 Kubernetes 或者 Mesos 这样的容器编排工具，能在宿主机故障的时候，几秒钟之内重新启动新的容器。）考虑到这些，掌握 Docker 或者 rkt 以及容器编排平台的知识会对你大有帮助。

如果你是希望做 DevOps 实践的系统管理员，你还需要知道如何写代码。Python 和 Ruby 是 DevOps 领域的流行语言，因为它们是可移植的（也就是说可以在任何操作系统上运行）、快速的，而且易读易学。它们还支撑着这个行业最流行的配置管理工具（Ansible 是使用 Python 写的，Chef 和 Puppet 是使用 Ruby 写的）以及云平台的 API 客户端（亚马逊 AWS、微软 Azure、Google Cloud Platform 的客户端通常会提供 Python 和 Ruby 语言的版本）。

如果你是开发人员，也希望做 DevOps 的实践，我强烈建议你去学习 Unix、Windows 操作系统以及网络基础知识。虽然云计算把很多系统管理的难题抽象化了，但是对应用的性能做调试的时候，如果你知道操作系统如何工作的就会有很大的帮助。下文包含了一些这个主题的图书。

如果你觉得这些东西听起来内容太多，没关系，大家都是这么想的。幸运的是，有很多小项目可以让你开始探索。其中一个项目是 Gary Stafford 的[选举服务](https://github.com/garystafford/voter-service)，一个基于 Java 的简单投票平台。我们要求面试候选人通过一个流水线将该服务从 GitHub 部署到生产环境基础设施上。你可以把这个服务与 Rob Mile 写的了不起的 DevOps [入门教程](https://github.com/maxamg/cd-office-hours)结合起来学习。

还有一个熟悉这些工具的好方法，找一个流行的服务，然后只使用 AWS 和配置管理工具来搭建这个服务所需要的基础设施。第一次先手动搭建，了解清楚要做的事情，然后只用 CloudFormation（或者 Terraform）和 Ansible 重写刚才的手动操作。令人惊讶的是，这就是我们基础设施开发人员为客户所做的大部分日常工作，我们的客户认为这样的工作非常有意义！

### 需要读的书

如果你在找 DevOps 的其它资源，下面这些理论和技术书籍值得一读。

#### 理论书籍

* Gene Kim 写的 《<ruby>[凤凰项目][10]<rt>The Phoenix Project</rt></ruby>》。这是一本很不错的书，内容涵盖了我上文解释过的历史（写的更生动形象），描述了一个运行在敏捷和 DevOps 之上的公司向精益前进的过程。
* Terrance Ryan 写的 《<ruby>[布道之道][11]<rt>Driving Technical Change</rt></ruby>》。非常好的一小本书，讲了大多数技术型组织内的常见性格特点以及如何和他们打交道。这本书对我的帮助比我想象的更多。
* Tom DeMarco 和 Tim Lister 合著的 《<ruby>[人件][12]<rt>Peopleware</rt></ruby>》。管理工程师团队的经典图书，有一点过时，但仍然很有价值。
* Tom Limoncelli 写的 《<ruby>[时间管理：给系统管理员][13]<rt>Time Management for System Administrators</rt></ruby>》。这本书主要面向系统管理员，它对很多大型组织内的系统管理员生活做了深入的展示。如果你想了解更多系统管理员和开发人员之间的冲突，这本书可能解释了更多。
* Eric Ries 写的 《<ruby>[精益创业][14]<rt>The Lean Startup</rt></ruby>》。描述了 Eric 自己的 3D 虚拟形象公司，IMVU，发现了如何精益工作，快速失败和更快盈利。
* Jez Humble 和他的朋友写的 《<ruby>[精益企业][15]<rt>Lean Enterprise</rt></ruby>》。这本书是对精益创业做的改编，以更适应企业，两本书都很棒，都很好地解释了 DevOps 背后的商业动机。
* Kief Morris 写的 《<ruby>[基础设施即代码][16]<rt>Infrastructure As Code</rt></ruby>》。关于“基础设施即代码”的非常好的入门读物！很好的解释了为什么所有公司都有必要采纳这种做法。
* Betsy Beyer、Chris Jones、Jennifer Petoff 和 Niall Richard Murphy 合著的 《<ruby>[站点可靠性工程师][17]<rt>Site Reliability Engineering</rt></ruby>》。一本解释谷歌 SRE 实践的书，也因为是“DevOps 诞生之前的 DevOps”被人熟知。在如何处理运行时间、时延和保持工程师快乐方面提供了有意思的看法。

#### 技术书籍

如果你想找的是让你直接跟代码打交道的书，看这里就对了。

* W. Richard Stevens 的 《<ruby>[TCP/IP 详解][18]<rt>TCP/IP Illustrated</rt></ruby>》。这是一套经典的（也可以说是最全面的）讲解网络协议基础的巨著，重点介绍了 TCP/IP 协议族。如果你听说过 1、2、3、4 层网络，而且对深入学习它们感兴趣，那么你需要这本书。
* Evi Nemeth、Trent Hein 和 Ben Whaley 合著的 《<ruby>[UNIX/Linux 系统管理员手册][19]<rt>UNIX and Linux System Administration Handbook</rt></ruby>》。一本很好的入门书，介绍 Linux/Unix 如何工作以及如何使用。
* Don Jones 和 Jeffrey Hicks 合著的 《<ruby>[Windows PowerShell 实战指南][20]<rt>Learn Windows Powershell In A Month of Lunches</rt></ruby>》。如果你在 Windows 系统下做自动化任务，你需要学习怎么使用 Powershell。这本书能够帮助你。Don Jones 是这方面著名的 MVP。
* 几乎所有 [James Turnbull][21] 写的东西，针对流行的 DevOps 工具，他发表了很好的技术入门读物。

不管是在那些把所有应用都直接部署在物理机上的公司，（现在很多公司仍然有充分的理由这样做）还是在那些把所有应用都做成 serverless 的先驱公司，DevOps 都很可能会持续下去。这部分工作很有趣，产出也很有影响力，而且最重要的是，它搭起桥梁衔接了技术和业务之间的缺口。DevOps 是一个值得期待的美好事物。

首次发表在 [Neurons Firing on a Keyboard][22]。使用 CC-BY-SA 协议。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/getting-devops

作者：[Carlos Nunez][a]
译者：[belitex](https://github.com/belitex)
校对：[pityonline](https://github.com/pityonline)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/carlosonunez
[1]: https://www.reddit.com/r/devops/
[2]: https://carlosonunez.wordpress.com/
[3]: https://twitter.com/easiestnameever
[4]: https://en.wikipedia.org/wiki/ITIL
[5]: https://www.psychologytoday.com/blog/time-out/201401/getting-out-your-silo
[6]: https://twitter.com/adamhjk/status/572832185461428224
[7]: https://landing.google.com/sre/interview/ben-treynor.html
[8]: https://en.wikipedia.org/wiki/CI/CD
[9]: https://thehftguy.com/2016/11/01/docker-in-production-an-history-of-failure/
[10]: https://itrevolution.com/book/the-phoenix-project/
[11]: https://pragprog.com/book/trevan/driving-technical-change
[12]: https://en.wikipedia.org/wiki/Peopleware:_Productive_Projects_and_Teams
[13]: http://shop.oreilly.com/product/9780596007836.do
[14]: http://theleanstartup.com/
[15]: https://info.thoughtworks.com/lean-enterprise-book.html
[16]: http://infrastructure-as-code.com/book/
[17]: https://landing.google.com/sre/book.html
[18]: https://en.wikipedia.org/wiki/TCP/IP_Illustrated
[19]: http://www.admin.com/
[20]: https://www.manning.com/books/learn-windows-powershell-in-a-month-of-lunches-third-edition
[21]: https://jamesturnbull.net/
[22]: https://carlosonunez.wordpress.com/2017/03/02/getting-into-devops/
