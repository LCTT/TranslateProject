[#]: collector: (lujun9972)
[#]: translator: (jdh8383)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10578-1.html)
[#]: subject: (7 CI/CD tools for sysadmins)
[#]: via: (https://opensource.com/article/18/12/cicd-tools-sysadmins)
[#]: author: (Dan Barker https://opensource.com/users/barkerd427)

系统管理员的 7 个 CI/CD 工具
======

> 本文是一篇简单指南：介绍一些顶级的开源的持续集成、持续交付和持续部署（CI/CD）工具。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc)

虽然持续集成、持续交付和持续部署（CI/CD）在开发者社区里已经存在很多年，一些机构在其运维部门也有实施经验，但大多数公司并没有做这样的尝试。对于很多机构来说，让运维团队能够像他们的开发同行一样熟练操作 CI/CD 工具，已经变得十分必要了。

无论是基础设施、第三方应用还是内部开发的应用，都可以开展 CI/CD 实践。尽管你会发现有很多不同的工具，但它们都有着相似的设计模型。而且可能最重要的一点是：通过带领你的公司进行这些实践，会让你在公司内部变得举足轻重，成为他人学习的榜样。

一些机构在自己的基础设施上已有多年的 CI/CD 实践经验，常用的工具包括 [Ansible][1]、[Chef][2] 或者 [Puppet][3]。另一些工具，比如 [Test Kitchen][4]，允许在最终要部署应用的基础设施上运行测试。事实上，如果使用更高级的配置方法，你甚至可以将应用部署到有真实负载的仿真“生产环境”上，来运行应用级别的测试。然而，单单是能够测试基础设施就是一项了不起的成就了。配置管理工具 Terraform 可以通过 Test Kitchen 来快速创建更[短暂][5]和[冥等的][6]的基础设施配置，这比它的前辈要强不少。再加上 Linux 容器和 Kubernetes，在数小时内，你就可以创建一套类似于生产环境的配置参数和系统资源，来测试整个基础设施和其上部署的应用，这在以前可能需要花费几个月的时间。而且，删除和再次创建整个测试环境也非常容易。

当然，作为初学者，你也可以把网络配置和 DDL（<ruby>数据定义语言<rt>data definition language</rt></ruby>）文件加入版本控制，然后开始尝试一些简单的 CI/CD 流程。虽然只能帮你检查一下语义语法或某些最佳实践，但实际上大多数开发的管道都是这样起步的。只要你把脚手架搭起来，建造就容易得多了。而一旦起步，你就会发现各种管道的使用场景。

举个例子，我经常会在公司内部写新闻简报，我使用 [MJML][7] 制作邮件模板，然后把它加入版本控制。我一般会维护一个 web 版本，但是一些同事喜欢 PDF 版，于是我创建了一个[管道][8]。每当我写好一篇新闻稿，就在 Gitlab 上提交一个合并请求。这样做会自动创建一个 index.html 文件，生成这篇新闻稿的 HTML 和 PDF 版链接。HTML 和 PDF 文件也会在该管道里同时生成。除非有人来检查确认，这些文件不会被直接发布出去。使用 GitLab Pages 发布这个网站后，我就可以下载一份 HTML 版，用来发送新闻简报。未来，我会修改这个流程，当合并请求成功或者在某个审核步骤后，自动发出对应的新闻稿。这些处理逻辑并不复杂，但的确为我节省了不少时间。实际上这些工具最核心的用途就是替你节省时间。

关键是要在抽象层创建出工具，这样稍加修改就可以处理不同的问题。值得留意的是，我创建的这套流程几乎不需要任何代码，除了一些[轻量级的 HTML 模板][9]，一些[把 HTML 文件转换成 PDF 的 nodejs 代码][10]，还有一些[生成索引页面的 nodejs 代码][11]。

这其中一些东西可能看起来有点复杂，但其中大部分都源自我使用的不同工具的教学文档。而且很多开发人员也会乐意跟你合作，因为他们在完工时会发现这些东西也挺有用。上面我提供的那些代码链接是给 [DevOps KC][12]（LCTT 译注：一个地方性 DevOps 组织） 发送新闻简报用的，其中大部分用来创建网站的代码来自我在内部新闻简报项目上所作的工作。

下面列出的大多数工具都可以提供这种类型的交互，但是有些工具提供的模型略有不同。这一领域新兴的模型是用声明式的方法例如 YAML 来描述一个管道，其中的每个阶段都是短暂而幂等的。许多系统还会创建[有向无环图（DAG）][13]，来确保管道上不同的阶段排序的正确性。

这些阶段一般运行在 Linux 容器里，和普通的容器并没有区别。有一些工具，比如 [Spinnaker][14]，只关注部署组件，而且提供一些其他工具没有的操作特性。[Jenkins][15] 则通常把管道配置存成 XML 格式，大部分交互都可以在图形界面里完成，但最新的方案是使用[领域专用语言（DSL）][16]（如 [Groovy][17]）。并且，Jenkins 的任务（job）通常运行在各个节点里，这些节点上会装一个专门的 Java 代理，还有一堆混杂的插件和预装组件。

Jenkins 在自己的工具里引入了管道的概念，但使用起来却并不轻松，甚至包含一些禁区。最近，Jenkins 的创始人决定带领社区向新的方向前进，希望能为这个项目注入新的活力，把 CI/CD 真正推广开（LCTT 译注：详见后面的 Jenkins 章节)。我认为其中最有意思的想法是构建一个云原生 Jenkins，能把 Kubernetes 集群转变成 Jenkins CI/CD 平台。

当你更多地了解这些工具并把实践带入你的公司和运维部门，你很快就会有追随者，因为你有办法提升自己和别人的工作效率。我们都有多年积累下来的技术债要解决，如果你能给同事们提供足够的时间来处理这些积压的工作，他们该会有多感激呢？不止如此，你的客户也会开始看到应用变得越来越稳定，管理层会把你看作得力干将，你也会在下次谈薪资待遇或参加面试时更有底气。

让我们开始深入了解这些工具吧，我们将对每个工具做简短的介绍，并分享一些有用的链接。

### GitLab CI

- [项目主页](https://about.gitlab.com/product/continuous-integration/)
- [源代码](https://gitlab.com/gitlab-org/gitlab-ce/)
- 许可证：MIT

GitLab 可以说是 CI/CD 领域里新登场的玩家，但它却在权威调研机构 [Forrester 的 CI 集成工具的调查报告][20]中位列第一。在一个高水平、竞争充分的领域里，这是个了不起的成就。是什么让 GitLab CI 这么成功呢？它使用 YAML 文件来描述整个管道。另有一个功能叫做 Auto DevOps，可以为较简单的项目用多种内置的测试单元自动生成管道。这套系统使用 [Herokuish buildpacks][21] 来判断语言的种类以及如何构建应用。有些语言也可以管理数据库，它真正改变了构建新应用程序和从开发的开始将它们部署到生产环境的过程。它原生集成于 Kubernetes，可以根据不同的方案将你的应用自动部署到 Kubernetes 集群，比如灰度发布、蓝绿部署等。

除了它的持续集成功能，GitLab 还提供了许多补充特性，比如：将 Prometheus 和你的应用一同部署，以提供操作监控功能；通过 GitLab 提供的 Issues、Epics 和 Milestones 功能来实现项目评估和管理；管道中集成了安全检测功能，多个项目的检测结果会聚合显示；你可以通过 GitLab 提供的网页版 IDE 在线编辑代码，还可以快速查看管道的预览或执行状态。

### GoCD

- [项目主页](https://www.gocd.org/)
- [源代码](https://github.com/gocd/gocd)
- 许可证：Apache 2.0

GoCD 是由老牌软件公司 Thoughtworks 出品，这已经足够证明它的能力和效率。对我而言，GoCD 最具亮点的特性是它的[价值流视图（VSM）][22]。实际上，一个管道的输出可以变成下一个管道的输入，从而把管道串联起来。这样做有助于提高不同开发团队在整个开发流程中的独立性。比如在引入 CI/CD 系统时，有些成立较久的机构希望保持他们各个团队相互隔离，这时候 VSM 就很有用了：让每个人都使用相同的工具就很容易在 VSM 中发现工作流程上的瓶颈，然后可以按图索骥调整团队或者想办法提高工作效率。

为公司的每个产品配置 VSM 是非常有价值的；GoCD 可以使用 [JSON 或 YAML 格式存储配置][23]，还能以可视化的方式展示数据等待时间，这让一个机构能有效减少学习它的成本。刚开始使用 GoCD 创建你自己的流程时，建议使用人工审核的方式。让每个团队也采用人工审核，这样你就可以开始收集数据并且找到可能的瓶颈点。

### Travis CI

- [项目主页](https://docs.travis-ci.com/)
- [源代码](https://github.com/travis-ci/travis-ci)
- 许可证：MIT

我使用的第一个软件既服务（SaaS）类型的 CI 系统就是 Travis CI，体验很不错。管道配置以源码形式用 YAML 保存，它与 GitHub 等工具无缝整合。我印象中管道从来没有失效过，因为 Travis CI 的在线率很高。除了 SaaS 版之外，你也可以使用自行部署的版本。我还没有自行部署过，它的组件非常多，要全部安装的话，工作量就有点吓人了。我猜更简单的办法是把它部署到 Kubernetes 上，[Travis CI 提供了 Helm charts][26]，这些 charts 目前不包含所有要部署的组件，但我相信以后会越来越丰富的。如果你不想处理这些细枝末节的问题，还有一个企业版可以试试。

假如你在开发一个开源项目，你就能免费使用 SaaS 版的 Travis CI，享受顶尖团队提供的优质服务！这样能省去很多麻烦，你可以在一个相对通用的平台上（如 GitHub）研发开源项目，而不用找服务器来运行任何东西。

### Jenkins

- [项目主页](https://jenkins.io/)
- [源代码](https://github.com/jenkinsci/jenkins)
- 许可证：MIT

Jenkins 在 CI/CD 界绝对是元老级的存在，也是事实上的标准。我强烈建议你读一读这篇文章：“[Jenkins: Shifting Gears][27]”，作者 Kohsuke 是 Jenkins 的创始人兼 CloudBees 公司 CTO。这篇文章契合了我在过去十年里对 Jenkins 及其社区的感受。他在文中阐述了一些这几年呼声很高的需求，我很乐意看到 CloudBees 引领这场变革。长期以来，Jenkins 对于非开发人员来说有点难以接受，并且一直是其管理员的重担。还好，这些问题正是他们想要着手解决的。

[Jenkins 配置既代码][28]（JCasC）应该可以帮助管理员解决困扰了他们多年的配置复杂性问题。与其他 CI/CD 系统类似，只需要修改一个简单的 YAML 文件就可以完成 Jenkins 主节点的配置工作。[Jenkins Evergreen][29] 的出现让配置工作变得更加轻松，它提供了很多预设的使用场景，你只管套用就可以了。这些发行版会比官方的标准版本 Jenkins 更容易维护和升级。

Jenkins 2 引入了两种原生的管道功能，我在 LISA（LCTT 译注：一个系统架构和运维大会） 2017 年的研讨会上已经[讨论过了][30]。这两种功能都没有 YAML 简便，但在处理复杂任务时它们很好用。

[Jenkins X][31] 是 Jenkins 的一个全新变种，用来实现云端原生 Jenkins（至少在用户看来是这样）。它会使用 JCasC 及 Evergreen，并且和 Kubernetes 整合的更加紧密。对于 Jenkins 来说这是个令人激动的时刻，我很乐意看到它在这一领域的创新，并且继续发挥领袖作用。

### Concourse CI

- [项目主页](https://concourse-ci.org/)
- [源代码](https://github.com/concourse/concourse)
- 许可证：Apache 2.0

我第一次知道 Concourse 是通过 Pivotal Labs 的伙计们介绍的，当时它处于早期 beta 版本，而且那时候也很少有类似的工具。这套系统是基于微服务构建的，每个任务运行在一个容器里。它独有的一个优良特性是能够在你本地系统上运行任务，体现你本地的改动。这意味着你完全可以在本地开发（假设你已经连接到了 Concourse 的服务器），像在真实的管道构建流程一样从你本地构建项目。而且，你可以在修改过代码后从本地直接重新运行构建，来检验你的改动结果。

Concourse 还有一个简单的扩展系统，它依赖于“资源”这一基础概念。基本上，你想给管道添加的每个新功能都可以用一个 Docker 镜像实现，并作为一个新的资源类型包含在你的配置中。这样可以保证每个功能都被封装在一个不可变的独立工件中，方便对其单独修改和升级，改变其中一个时不会影响其他构建。

### Spinnaker

- [项目主页](https://www.spinnaker.io/)
- [源代码](https://github.com/spinnaker/spinnaker)
- 许可证：Apache 2.0

Spinnaker 出自 Netflix，它更关注持续部署而非持续集成。它可以与其他工具整合，比如 Travis 和 Jenkins，来启动测试和部署流程。它也能与 Prometheus、Datadog 这样的监控工具集成，参考它们提供的指标来决定如何部署。例如，在<ruby>金丝雀发布<rt>canary deployment</rt></ruby>里，我们可以根据收集到的相关监控指标来做出判断：最近的这次发布是否导致了服务降级，应该立刻回滚；还是说看起来一切 OK，应该继续执行部署。

谈到持续部署，一些另类但却至关重要的问题往往被忽略掉了，说出来可能有点让人困惑：Spinnaker 可以帮助持续部署不那么“持续”。在整个应用部署流程期间，如果发生了重大问题，它可以让流程停止执行，以阻止可能发生的部署错误。但它也可以在最关键的时刻让人工审核强制通过，发布新版本上线，使整体收益最大化。实际上，CI/CD 的主要目的就是在商业模式需要调整时，能够让待更新的代码立即得到部署。

### Screwdriver

- [项目主页](http://screwdriver.cd/)
- [源代码](https://github.com/screwdriver-cd/screwdriver)
- 许可证：BSD

Screwdriver 是个简单而又强大的软件。它采用微服务架构，依赖像 Nomad、Kubernetes 和 Docker 这样的工具作为执行引擎。官方有一篇很不错的[部署教学文档][34]，介绍了如何将它部署到 AWS 和 Kubernetes 上，但如果正在开发中的 [Helm chart][35] 也完成的话，就更完美了。

Screwdriver 也使用 YAML 来描述它的管道，并且有很多合理的默认值，这样可以有效减少各个管道重复的配置项。用配置文件可以组织起高级的工作流，来描述各个任务间复杂的依赖关系。例如，一项任务可以在另一个任务开始前或结束后运行；各个任务可以并行也可以串行执行；更赞的是你可以预先定义一项任务，只在特定的拉取请求时被触发，而且与之有依赖关系的任务并不会被执行，这能让你的管道具有一定的隔离性：什么时候被构造的工件应该被部署到生产环境，什么时候应该被审核。

---

以上只是我对这些 CI/CD 工具的简单介绍，它们还有许多很酷的特性等待你深入探索。而且它们都是开源软件，可以自由使用，去部署一下看看吧，究竟哪个才是最适合你的那个。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/cicd-tools-sysadmins

作者：[Dan Barker][a]
选题：[lujun9972][b]
译者：[jdh8383](https://github.com/jdh8383)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/barkerd427
[b]: https://github.com/lujun9972
[1]: https://www.ansible.com/
[2]: https://www.chef.io/
[3]: https://puppet.com/
[4]: https://github.com/test-kitchen/test-kitchen
[5]: https://www.merriam-webster.com/dictionary/ephemeral
[6]: https://en.wikipedia.org/wiki/Idempotence
[7]: https://mjml.io/
[8]: https://gitlab.com/devopskc/newsletter/blob/master/.gitlab-ci.yml
[9]: https://gitlab.com/devopskc/newsletter/blob/master/index/index.html
[10]: https://gitlab.com/devopskc/newsletter/blob/master/html-to-pdf.js
[11]: https://gitlab.com/devopskc/newsletter/blob/master/populate-index.js
[12]: https://devopskc.com/
[13]: https://en.wikipedia.org/wiki/Directed_acyclic_graph
[14]: https://www.spinnaker.io/
[15]: https://jenkins.io/
[16]: https://martinfowler.com/books/dsl.html
[17]: http://groovy-lang.org/
[18]: https://about.gitlab.com/product/continuous-integration/
[19]: https://gitlab.com/gitlab-org/gitlab-ce/
[20]: https://about.gitlab.com/2017/09/27/gitlab-leader-continuous-integration-forrester-wave/
[21]: https://github.com/gliderlabs/herokuish
[22]: https://www.gocd.org/getting-started/part-3/#value_stream_map
[23]: https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html
[24]: https://docs.travis-ci.com/
[25]: https://github.com/travis-ci/travis-ci
[26]: https://github.com/travis-ci/kubernetes-config
[27]: https://jenkins.io/blog/2018/08/31/shifting-gears/
[28]: https://jenkins.io/projects/jcasc/
[29]: https://github.com/jenkinsci/jep/blob/master/jep/300/README.adoc
[30]: https://danbarker.codes/talk/lisa17-becoming-plumber-building-deployment-pipelines/
[31]: https://jenkins-x.io/
[32]: https://concourse-ci.org/
[33]: https://github.com/concourse/concourse
[34]: https://docs.screwdriver.cd/cluster-management/kubernetes
[35]: https://github.com/screwdriver-cd/screwdriver-chart
