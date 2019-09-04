[#]: collector: (lujun9972)
[#]: translator: (LuuMing)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11307-1.html)
[#]: subject: (A beginner's guide to building DevOps pipelines with open source tools)
[#]: via: (https://opensource.com/article/19/4/devops-pipeline)
[#]: author: (Bryant Son  https://opensource.com/users/brson/users/milindsingh/users/milindsingh/users/dscripter)

使用开源工具构建 DevOps 流水线的初学者指南
======

> 如果你是 DevOps 新人，请查看这 5 个步骤来构建你的第一个 DevOps 流水线。

![](https://img.linux.net.cn/data/attachment/album/201909/05/060323yizmqwn43zwy13za.jpg)

DevOps 已经成为解决软件开发过程中出现的缓慢、孤立或者其他故障的默认方式。但是当你刚接触 DevOps 并且不确定从哪开始时，就意义不大了。本文探索了什么是 DevOps 流水线并且提供了创建它的 5 个步骤。尽管这个教程并不全面，但可以给你以后上手和扩展打下基础。首先，插入一个小故事。

### 我的 DevOps 之旅

我曾经在花旗集团的云小组工作，开发<ruby><rt>Infrastructure as a Service</rt>基础设施即服务</ruby>网页应用来管理花旗的云基础设施，但我经常对研究如何让开发流水线更加高效以及如何带给团队积极的文化感兴趣。我在 Greg Lavender 推荐的书中找到了答案。Greg Lavender 是花旗的云架构和基础设施工程（即 [Phoenix 项目][2]）的 CTO。这本书尽管解释的是 DevOps 原理，但它读起来像一本小说。

书后面的一张表展示了不同公司部署在发布环境上的频率：

公司 | 部署频率
---|---
Amazon | 23,000 次/天
Google | 5,500 次/天
Netflix | 500 次/天
Facebook | 1 次/天
Twitter | 3 次/周
典型企业 | 1 次/9 个月

Amazon、Google、Netflix 怎么能做到如此之频繁？那是因为这些公司弄清楚了如何去实现一个近乎完美的 DevOps 流水线。

但在花旗实施 DevOps 之前，情况并非如此。那时候，我的团队拥有不同<ruby>构建阶段<rt>stage</rt></ruby>的环境，但是在开发服务器上的部署非常手工。所有的开发人员都只能访问一个基于 IBM WebSphere Application 社区版的开发环境服务器。问题是当多个用户同时尝试部署时，服务器就会宕机，因此开发人员在部署时就得互相通知，这一点相当痛苦。此外，还存在代码测试覆盖率低、手动部署过程繁琐以及无法根据定义的任务或用户需求跟踪代码部署的问题。

我意识到必须做些事情，同时也找到了一个有同样感受的同事。我们决定合作去构建一个初始的 DevOps 流水线 —— 他设置了一个虚拟机和一个 Tomcat 服务器，而我则架设了 Jenkins，集成了 Atlassian Jira、BitBucket 和代码覆盖率测试。这个业余项目非常成功：我们近乎全自动化了开发流水线，并在开发服务器上实现了几乎 100% 的正常运行，我们可以追踪并改进代码覆盖率测试，并且 Git 分支能够与部署任务和 jira 任务关联在一起。此外，大多数用来构建 DevOps 所使用的工具都是开源的。

现在我意识到了我们的 DevOps 流水线是多么的原始，因为我们没有利用像 Jenkins 文件或 Ansible 这样的高级设置。然而，这个简单的过程运作良好，这也许是因为 [Pareto][3] 原则（也被称作 80/20 法则）。

### DevOps 和 CI/CD 流水线的简要介绍

如果你问一些人，“什么是 DevOps？”，你或许会得到一些不同的回答。DevOps，就像敏捷，已经发展到涵盖着诸多不同的学科，但大多数人至少会同意这些：DevOps 是一个软件开发实践或一个<ruby>软件开发生命周期<rt>software development lifecycle</rt></ruby>（SDLC），并且它的核心原则是一种文化上的变革 —— 开发人员与非开发人员呼吸着同一片天空的气息，之前手工的事情变得自动化；每个人做着自己擅长的事；同一时间的部署变得更加频繁；吞吐量提升；灵活度增加。

虽然拥有正确的软件工具并非实现 DevOps 环境所需的唯一东西，但一些工具却是必要的。最关键的一个便是持续集成和持续部署（CI/CD）。在流水线环境中，拥有不同的构建阶段（例如：DEV、INT、TST、QA、UAT、STG、PROD），手动的工作能实现自动化，开发人员可以实现高质量的代码，灵活而且大量部署。

这篇文章描述了一个构建 DevOps 流水线的五步方法，就像下图所展示的那样，使用开源的工具实现。

![Complete DevOps pipeline][4]

闲话少说，让我们开始吧。

### 第一步：CI/CD 框架

首先你需要的是一个 CI/CD 工具，Jenkins，是一个基于 Java 的 MIT 许可下的开源 CI/CD 工具，它是推广 DevOps 运动的工具，并已成为了<ruby>事实标准<rt>de facto standard</rt><ruby>。

所以，什么是 Jenkins？想象它是一种神奇的万能遥控，能够和许多不同的服务器和工具打交道，并且能够将它们统一安排起来。就本身而言，像 Jenkins 这样的 CI/CD 工具本身是没有用的，但随着接入不同的工具与服务器时会变得非常强大。

Jenkins 仅是众多构建 DevOps 流水线的开源 CI/CD 工具之一。

名称 | 许可证
---|---
[Jenkins][5] | Creative Commons 和 MIT
[Travis CI][6] | MIT
[CruiseControl][7] | BSD
[Buildbot][8] | GPL
[Apache Gump][9] | Apache 2.0
[Cabie][10] | GNU

下面就是使用 CI/CD 工具时 DevOps 看起来的样子。

![CI/CD tool][11]

你的 CI/CD 工具在本地主机上运行，但目前你还不能够做些别的。让我们紧随 DevOps 之旅的脚步。

### 第二步：源代码控制管理

验证 CI/CD 工具可以执行某些魔术的最佳（也可能是最简单）方法是与源代码控制管理（SCM）工具集成。为什么需要源代码控制？假设你在开发一个应用。无论你什么时候构建应用，无论你使用的是 Java、Python、C++、Go、Ruby、JavaScript 或任意一种语言，你都在编程。你所编写的程序代码称为源代码。在一开始，特别是只有你一个人工作时，将所有的东西放进本地文件夹里或许都是可以的。但是当项目变得庞大并且邀请其他人协作后，你就需要一种方式来避免共享代码修改时的合并冲突。你也需要一种方式来恢复一个之前的版本——备份、复制并粘贴的方式已经过时了。你（和你的团队）想要更好的解决方式。

这就是 SCM 变得不可或缺的原因。SCM 工具通过在仓库中保存代码来帮助进行版本控制与多人协作。

尽管这里有许多 SCM 工具，但 Git 是最标准恰当的。我极力推荐使用 Git，但如果你喜欢这里仍有其他的开源工具。

名称 | 许可证
---|---
[Git][12] | GPLv2 & LGPL v2.1
[Subversion][13] | Apache 2.0
[Concurrent Versions System][14] (CVS) | GNU
[Vesta][15] | LGPL
[Mercurial][16] | GNU GPL v2+

拥有 SCM 之后，DevOps 流水线看起来就像这样。

![Source control management][17]

CI/CD 工具能够自动化进行源代码检入检出以及完成成员之间的协作。还不错吧？但是，如何才能把它变成可工作的应用程序，使得数十亿人来使用并欣赏它呢？

### 第三步：自动化构建工具

真棒！现在你可以检出代码并将修改提交到源代码控制，并且可以邀请你的朋友就源代码控制进行协作。但是到目前为止你还没有构建出应用。要想让它成为一个网页应用，必须将其编译并打包成可部署的包或可执行程序（注意，像 JavaScript 或 PHP 这样的解释型编程语言不需要进行编译）。

于是就引出了自动化构建工具。无论你决定使用哪一款构建工具，它们都有一个共同的目标：将源代码构建成某种想要的格式，并且将清理、编译、测试、部署到某个位置这些任务自动化。构建工具会根据你的编程语言而有不同，但这里有一些通常使用的开源工具值得考虑。

名称 | 许可证 | 编程语言
---|---|---
[Maven][18] | Apache 2.0 | Java
[Ant][19] | Apache 2.0 | Java
[Gradle][20] | Apache 2.0 | Java
[Bazel][21] | Apache 2.0 | Java
[Make][22] | GNU | N/A
[Grunt][23] | MIT | JavaScript
[Gulp][24] | MIT | JavaScript
[Buildr][25] | Apache | Ruby
[Rake][26] | MIT | Ruby
[A-A-P][27] | GNU | Python
[SCons][28] | MIT | Python
[BitBake][29] | GPLv2 | Python
[Cake][30] | MIT | C#
[ASDF][31] | Expat (MIT) | LISP
[Cabal][32] | BSD | Haskell

太棒了！现在你可以将自动化构建工具的配置文件放进源代码控制管理系统中，并让你的 CI/CD 工具构建它。

![Build automation tool][33]

一切都如此美好，对吧？但是在哪里部署它呢？

### 第四步：网页应用服务器

到目前为止，你有了一个可执行或可部署的打包文件。对任何真正有用的应用程序来说，它必须提供某种服务或者接口，所以你需要一个容器来发布你的应用。

对于网页应用，网页应用服务器就是容器。应用程序服务器提供了环境，让可部署包中的编程逻辑能够被检测到、呈现界面，并通过打开套接字为外部世界提供网页服务。在其他环境下你也需要一个 HTTP 服务器（比如虚拟机）来安装服务应用。现在，我假设你将会自己学习这些东西（尽管我会在下面讨论容器）。

这里有许多开源的网页应用服务器。

名称 | 协议 | 编程语言
---|---|---
[Tomcat][34] | Apache 2.0 | Java
[Jetty][35] | Apache 2.0 | Java
[WildFly][36] | GNU Lesser Public | Java
[GlassFish][37] | CDDL & GNU Less Public | Java
[Django][38] | 3-Clause BSD | Python
[Tornado][39] | Apache 2.0 | Python
[Gunicorn][40] | MIT | Python
[Python Paste][41] | MIT | Python
[Rails][42] | MIT | Ruby
[Node.js][43] | MIT | Javascript

现在 DevOps 流水线差不多能用了，干得好！

![Web application server][44]

尽管你可以在这里停下来并进行进一步的集成，但是代码质量对于应用开发者来说是一件非常重要的事情。

### 第五步：代码覆盖测试

实现代码测试件可能是另一个麻烦的需求，但是开发者需要尽早地捕捉程序中的所有错误并提升代码质量来保证最终用户满意度。幸运的是，这里有许多开源工具来测试你的代码并提出改善质量的建议。甚至更好的，大部分 CI/CD 工具能够集成这些工具并将测试过程自动化进行。

代码测试分为两个部分：“代码测试框架”帮助进行编写与运行测试，“代码质量改进工具”帮助提升代码的质量。

#### 代码测试框架

名称 | 许可证 | 编程语言
---|---|---
[JUnit][45] | Eclipse Public License | Java
[EasyMock][46] | Apache | Java
[Mockito][47] | MIT | Java
[PowerMock][48] | Apache 2.0 | Java
[Pytest][49] | MIT | Python
[Hypothesis][50] | Mozilla | Python
[Tox][51] | MIT | Python

#### 代码质量改进工具

名称 | 许可证 | 编程语言
---|---|---
[Cobertura][52] | GNU | Java
[CodeCover][53] | Eclipse Public (EPL) | Java
[Coverage.py][54] | Apache 2.0 | Python
[Emma][55] | Common Public License | Java
[JaCoCo][56] | Eclipse Public License | Java
[Hypothesis][50] | Mozilla | Python
[Tox][51] | MIT | Python
[Jasmine][57] | MIT | JavaScript
[Karma][58] | MIT | JavaScript
[Mocha][59] | MIT | JavaScript
[Jest][60] | MIT | JavaScript

注意，之前提到的大多数工具和框架都是为 Java、Python、JavaScript 写的，因为 C++ 和 C# 是专有编程语言（尽管 GCC 是开源的）。

现在你已经运用了代码覆盖测试工具，你的 DevOps 流水线应该就像教程开始那幅图中展示的那样了。

### 可选步骤

#### 容器

正如我之前所说，你可以在虚拟机（VM）或服务器上发布你的应用，但是容器是一个更好的解决方法。

[什么是容器][61]？简要的介绍就是 VM 需要占用操作系统大量的资源，它提升了应用程序的大小，而容器仅仅需要一些库和配置来运行应用程序。显然，VM 仍有重要的用途，但容器对于发布应用（包括应用程序服务器）来说是一个更为轻量的解决方式。

尽管对于容器来说也有其他的选择，但是 Docker 和 Kubernetes 更为广泛。

名称 | 许可证
---|---
[Docker][62] | Apache 2.0
[Kubernetes][63] | Apache 2.0

了解更多信息，请查看 [Opensource.com][64] 上关于 Docker 和 Kubernetes 的其它文章：

  * [什么是 Docker？][65]
  * [Docker 简介][66]
  * [什么是 Kubernetes？][67]
  * [从零开始的 Kubernetes 实践][68]

#### 中间件自动化工具

我们的 DevOps 流水线大部分集中在协作构建与部署应用上，但你也可以用 DevOps 工具完成许多其他的事情。其中之一便是利用它实现<ruby>基础设施管理<rt>Infrastructure as Code</rt></ruby>（IaC）工具，这也是熟知的中间件自动化工具。这些工具帮助完成中间件的自动化安装、管理和其他任务。例如，自动化工具可以用正确的配置下拉应用程序，例如网页服务器、数据库和监控工具，并且部署它们到应用服务器上。

这里有几个开源的中间件自动化工具值得考虑：

名称 | 许可证
---|---
[Ansible][69] | GNU Public
[SaltStack][70] | Apache 2.0
[Chef][71] | Apache 2.0
[Puppet][72] | Apache or GPL

获取更多中间件自动化工具，查看 [Opensource.com][64] 上的其它文章：

  * [Ansible 快速入门指南][73]
  * [Ansible 自动化部署策略][74]
  * [配置管理工具 Top 5][75]

### 之后的发展

这只是一个完整 DevOps 流水线的冰山一角。从 CI/CD 工具开始并且探索其他可以自动化的东西来使你的团队更加轻松的工作。并且，寻找[开源通讯工具][76]可以帮助你的团队一起工作的更好。

发现更多见解，这里有一些非常棒的文章来介绍 DevOps ：

  * [什么是 DevOps][77]
  * [掌握 5 件事成为 DevOps 工程师][78]
  * [所有人的 DevOps][79]
  * [在 DevOps 中开始使用预测分析][80]

使用开源 agile 工具来集成 DevOps 也是一个很好的主意：

  * [什么是 agile ？][81]
  * [4 步成为一个了不起的 agile 开发者][82]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/devops-pipeline

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[LuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson/users/milindsingh/users/milindsingh/users/dscripter
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/network_team_career_hand.png?itok=_ztl2lk_ (Shaking hands, networking)
[2]: https://www.amazon.com/dp/B078Y98RG8/
[3]: https://en.wikipedia.org/wiki/Pareto_principle
[4]: https://opensource.com/sites/default/files/uploads/1_finaldevopspipeline.jpg (Complete DevOps pipeline)
[5]: https://github.com/jenkinsci/jenkins
[6]: https://github.com/travis-ci/travis-ci
[7]: http://cruisecontrol.sourceforge.net
[8]: https://github.com/buildbot/buildbot
[9]: https://gump.apache.org
[10]: http://cabie.tigris.org
[11]: https://opensource.com/sites/default/files/uploads/2_runningjenkins.jpg (CI/CD tool)
[12]: https://git-scm.com
[13]: https://subversion.apache.org
[14]: http://savannah.nongnu.org/projects/cvs
[15]: http://www.vestasys.org
[16]: https://www.mercurial-scm.org
[17]: https://opensource.com/sites/default/files/uploads/3_sourcecontrolmanagement.jpg (Source control management)
[18]: https://maven.apache.org
[19]: https://ant.apache.org
[20]: https://gradle.org/
[21]: https://bazel.build
[22]: https://www.gnu.org/software/make
[23]: https://gruntjs.com
[24]: https://gulpjs.com
[25]: http://buildr.apache.org
[26]: https://github.com/ruby/rake
[27]: http://www.a-a-p.org
[28]: https://www.scons.org
[29]: https://www.yoctoproject.org/software-item/bitbake
[30]: https://github.com/cake-build/cake
[31]: https://common-lisp.net/project/asdf
[32]: https://www.haskell.org/cabal
[33]: https://opensource.com/sites/default/files/uploads/4_buildtools.jpg (Build automation tool)
[34]: https://tomcat.apache.org
[35]: https://www.eclipse.org/jetty/
[36]: http://wildfly.org
[37]: https://javaee.github.io/glassfish
[38]: https://www.djangoproject.com/
[39]: http://www.tornadoweb.org/en/stable
[40]: https://gunicorn.org
[41]: https://github.com/cdent/paste
[42]: https://rubyonrails.org
[43]: https://nodejs.org/en
[44]: https://opensource.com/sites/default/files/uploads/5_applicationserver.jpg (Web application server)
[45]: https://junit.org/junit5
[46]: http://easymock.org
[47]: https://site.mockito.org
[48]: https://github.com/powermock/powermock
[49]: https://docs.pytest.org
[50]: https://hypothesis.works
[51]: https://github.com/tox-dev/tox
[52]: http://cobertura.github.io/cobertura
[53]: http://codecover.org/
[54]: https://github.com/nedbat/coveragepy
[55]: http://emma.sourceforge.net
[56]: https://github.com/jacoco/jacoco
[57]: https://jasmine.github.io
[58]: https://github.com/karma-runner/karma
[59]: https://github.com/mochajs/mocha
[60]: https://jestjs.io
[61]: /resources/what-are-linux-containers
[62]: https://www.docker.com
[63]: https://kubernetes.io
[64]: http://Opensource.com
[65]: https://opensource.com/resources/what-docker
[66]: https://opensource.com/business/15/1/introduction-docker
[67]: https://opensource.com/resources/what-is-kubernetes
[68]: https://opensource.com/article/17/11/kubernetes-lightning-talk
[69]: https://www.ansible.com
[70]: https://www.saltstack.com
[71]: https://www.chef.io
[72]: https://puppet.com
[73]: https://opensource.com/article/19/2/quickstart-guide-ansible
[74]: https://opensource.com/article/19/1/automating-deployment-strategies-ansible
[75]: https://opensource.com/article/18/12/configuration-management-tools
[76]: https://opensource.com/alternatives/slack
[77]: https://opensource.com/resources/devops
[78]: https://opensource.com/article/19/2/master-devops-engineer
[79]: https://opensource.com/article/18/11/how-non-engineer-got-devops
[80]: https://opensource.com/article/19/1/getting-started-predictive-analytics-devops
[81]: https://opensource.com/article/18/10/what-agile
[82]: https://opensource.com/article/19/2/steps-agile-developer
