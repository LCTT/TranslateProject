原生云计算：你所不知道的 Kubernetes 特性和工具
============================================================

![](https://www.hpe.com/content/dam/hpe/insights/articles/2017/10/how-to-implement-cloud-native-computing-with-kubernetes/featuredStory/How-to-implement-cloud-native-computing-with-containers-and-Kubernetes-1742.jpg.transform/nxt-1043x496-crop/image.jpeg)

> 开放容器计划（OCI）和原生云计算基金会（CNCF）的代表说，Kubernetes 和容器可以在降低程序员和系统管理成本的同时加速部署进程，从被忽视的 Kubernetes 特性（比如命令空间）开始，去利用 Kubernetes 和它的相关工具运行一个原生云架构。

[Kubernetes][2] 不止是一个云容器管理器。正如 Steve Pousty，他是 [Red Hat][3] 支持的 [OpenShift][4] 的首席开发者，在 [Linux 基金会][5]的[开源峰会][6]上的讲演中解释的那样，Kubernetes 提供了一个 “使用容器进行原生云计算的通用操作平台”。

Pousty 的意思是什么？先让我们复习一下基础知识。

[开源容器计划][7]（OCI）和 [原生云计算基金会][8] （CNCF）的执行董事 Chris Aniszczyk 的解释是，“原生云计算使用开源软件栈将应用程序部署为微服务，打包每一个部分到其容器中，并且动态地编排这些容器以优化资源使用”。[Kubernetes 一直在关注着原生云计算的最新要素][9]。这将最终将导致 IT 中很大的一部分发生转变，如从服务器到虚拟机，从<ruby>构建包<rt>buildpack</rt></ruby>到现在的 [容器][10]。

会议主持人表示，数据中心的演变将节省相当可观的成本，部分原因是它需要更少的专职员工。例如，据 Aniszczyk 说，通过使用 Kubernetes，谷歌每 10000 台机器仅需要一个网站可靠性工程师（LCTT 译注：即 SRE）。

实际上，系统管理员可以利用新的 Kubernetes 相关的工具的优势，并了解那些被低估的功能。

### 构建一个原生云平台

Pousty 解释说，“对于 Red Hat 来说，Kubernetes 是云 Linux 的内核。它是每个人都可以构建于其上的基础设施”。

例如，假如你在一个容器镜像中有一个应用程序。你怎么知道它是安全的呢？ Red Hat 和其它的公司使用 [OpenSCAP][11]，它是基于 <ruby>[安全内容自动化协议][12]<rt>Security Content Automation Protocol</rt></ruby>（SCAP）的，是使用标准化的方式表达和操作安全数据的一个规范。OpenSCAP 项目提供了一个开源的强化指南和配置基准。选择一个合适的安全策略，然后，使用 OpenSCAP 认可的安全工具去使某些由 Kubernetes 控制的容器中的程序遵守这些定制的安全标准。

Red Hat 将使用<ruby>[原子扫描][13]<rt>Atomic Scan</rt></ruby>来自动处理这个过程；它借助 OpenSCAP <ruby>提供者<rt>provider</rt></ruby>来扫描容器镜像中已知的安全漏洞和策略配置问题。原子扫描会以只读方式加载文件系统。这些通过扫描的容器，会在一个可写入的目录存放扫描器的输出。

Pousty 指出，这种方法有几个好处，主要是，“你可以扫描一个容器镜像而不用实际运行它”。因此，如果在容器中有糟糕的代码或有缺陷的安全策略，它不会影响到你的系统。

原子扫描比手动运行 OpenSCAP 快很多。 因为容器从启用到消毁可能就在几分钟或几小时内，原子扫描允许 Kubernetes 用户在（很快的）容器生命期间保持容器安全，而不是在更缓慢的系统管理时间跨度里进行。

### 关于工具

帮助系统管理员和 DevOps 管理大部分 Kubernetes 操作的另一个工具是 [CRI-O][14]。这是一个基于 OCI 实现的 [Kubernetes 容器运行时接口][15]。CRI-O 是一个守护进程， Kubernetes 可以用于运行存储在 Docker 仓库中的容器镜像，Dan Walsh 解释说，他是 Red Hat 的顾问工程师和 [SELinux][16] 项目领导者。它允许你直接从 Kubernetes 中启动容器镜像，而不用花费时间和 CPU 处理时间在 [Docker 引擎][17] 上启动。并且它的镜像格式是与容器无关的。

在 Kubernetes 中， [kubelet][18] 管理 pod（容器集群）。使用 CRI-O，Kubernetes 及其 kubelet 可以管理容器的整个生命周期。这个工具也不是和 Docker 镜像捆绑在一起的。你也可以使用新的 [OCI 镜像格式][19] 和 [CoreOS 的 rkt][20] 容器镜像。

同时，这些工具正在成为一个 Kubernetes 栈：编排系统、[容器运行时接口][21] （CRI）和 CRI-O。Kubernetes 首席工程师 Kelsey Hightower 说，“我们实际上不需要这么多的容器运行时——无论它是 Docker 还是 [rkt][22]。只需要给我们一个到内核的 API 就行”，这个结果是这些技术人员的承诺，是推动容器比以往更快发展的强大动力。

Kubernetes 也可以加速构建容器镜像。目前为止，有[三种方法来构建容器][23]。第一种方法是通过一个 Docker 或者 CoreOS 去构建容器。第二种方法是注入定制代码到一个预构建镜像中。最后一种方法是，<ruby>资产生成管道<rt>Asset Generation Pipeline</rt></ruby>使用容器去编译那些<ruby>资产<rt>asset</rt></ruby>，然后其被包含到使用 Docker 的<ruby>[多阶段构建][24]<rt>Multi-Stage Build</rt></ruby>所构建的随后镜像中。

现在，还有一个 Kubernetes 原生的方法：Red Hat 的 [Buildah][25]， 这是[一个脚本化的 shell 工具][26] 用于快速、高效地构建 OCI 兼容的镜像和容器。Buildah 降低了容器环境的学习曲线，简化了创建、构建和更新镜像的难度。Pousty 说。你可以使用它和 Kubernetes 一起基于应用程序的调用来自动创建和使用容器。Buildah 也更节省系统资源，因为它不需要容器运行时守护进程。

因此，比起真实地引导一个容器和在容器内按步骤操作，Pousty 说，“挂载该文件系统，就如同它是一个常规的文件系统一样做一些正常操作，并且在最后提交”。

这意味着你可以从一个仓库中拉取一个镜像，创建它所匹配的容器，并且优化它。然后，你可以使用 Kubernetes 中的 Buildah 在你需要时去创建一个新的运行镜像。最终结果是，他说，运行 Kubernetes 管理的容器化应用程序比以往速度更快，需要的资源更少。

### 你所不知道的 Kubernetes 拥有的特性

你不需要在其它地方寻找工具。Kubernetes 有几个被低估的特性。

根据谷歌云全球产品经理 Allan Naim 的说法，其中一个是 [Kubernetes 命名空间][27]。Naim 在开源峰会上谈及 “Kubernetes 最佳实践”，他说，“很少有人使用命名空间，这是一个失误。”

“命名空间是将一个单个的 Kubernetes 集群分成多个虚拟集群的方法”，Naim 说。例如，“你可以认为命名空间就是<ruby>姓氏<rt>family name</rt></ruby>”，因此，假如说 “Simth” 用来标识一个家族，如果有个成员 Steve Smith，他的名字就是 “Steve”，但是，家族范围之外的，它就是 “Steve Smith” 或称 “来自 Chicago 的 Steve Smith”。

严格来说，“命名空间是一个逻辑分区技术，它允许一个 Kubernetes 集群被多个用户、用户团队或者一个用户的多个不能混淆的应用程序所使用。Naim 解释说，“每个用户、用户团队、或者应用程序都可以存在于它的命名空间中，与集群中的其他用户是隔离的，并且可以像你是这个集群的唯一用户一样操作它。”

Practically 说，你可以使用命名空间去构建一个企业的多个业务/技术的实体进入 Kubernetes。例如，云架构可以通过映射产品、地点、团队和成本中心为命名空间，从而定义公司的命名空间策略。

Naim 建议的另外的方法是，去使用命名空间将软件开发<ruby>流程<rt>pipeline</rt></ruby>划分到分离的命名空间中，如测试、质量保证、<ruby>预演<rt>staging</rt></ruby>和成品等常见阶段。或者命名空间也可以用于管理单独的客户。例如，你可以为每个客户、客户项目、或者客户业务单元去创建一个单独的命名空间。它可以更容易地区分项目，避免重用相同名字的资源。

然而，Kubernetes 现在还没有提供一个跨命名空间访问的控制机制。因此，Naim 建议你不要使用这种方法去对外公开程序。还要注意的是，命名空间也不是一个管理的“万能药”。例如，你不能将命名空间嵌套在另一个命名空间中。另外，也没有跨命名空间的强制安全机制。

尽管如此，小心地使用命名空间，还是很有用的。

### 以人为中心的建议

从谈论较深奥的技术换到项目管理。Pousty 建议，在转移到原生云和微服务架构时，在你的团队中要有一个微服务操作人员。“如果你去做微服务，你的团队最终做的就是 Ops-y。并且，不去使用已经知道这种操作的人是愚蠢的行为”，他说。“你需要一个正确的团队核心能力。我不想开发人员重新打造运维的轮子”。

而是，将你的工作流彻底地改造成一个能够使用容器和云的过程，对此，Kubernetes 是很适用的。

### 使用 Kubernetes 的原生云计算：领导者的课程

*   迅速扩大的原生云生态系统。寻找可以扩展你使用容器的方法的工具。
*   探索鲜为人知的 Kubernetes 特性，如命名空间。它们可以改善你的组织和自动化程度。
*   确保部署到容器的开发团队有一个 Ops 人员参与。否则，冲突将不可避免。

--------------------------------------------------------------------------------

作者简介：

Steven J. Vaughan-Nichols,  Vaughan-Nichols & Associates 的 CEO

Steven J. Vaughan-Nichols，即 sjvn，是一个技术方面的作家，从 CP/M-80 还是前沿技术、PC 操作系统、300bps 是非常快的因特网连接、WordStar 是最先进的文字处理程序的那个时候开始，一直从事于商业技术的写作，而且喜欢它。他的作品已经发布在了从高科技出版物（IEEE Computer、ACM Network、 Byte）到商业出版物（eWEEK、 InformationWeek、ZDNet），从大众科技（Computer Shopper、PC Magazine、PC World）再到主流出版商（Washington Post、San Francisco Chronicle、BusinessWeek) 等媒体之上。

---------------------

via: https://insights.hpe.com/articles/how-to-implement-cloud-native-computing-with-kubernetes-1710.html

作者：[Steven J. Vaughan-Nichols][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.hpe.com/contributors/steven-j-vaughan-nichols.html
[1]:https://www.hpe.com/us/en/resources/storage/containers-for-dummies.html?jumpid=in_insights~510287587~Containers_Dummies~sjvn_Kubernetes
[2]:https://kubernetes.io/
[3]:https://www.redhat.com/en
[4]:https://www.openshift.com/
[5]:https://www.linuxfoundation.org/
[6]:http://events.linuxfoundation.org/events/open-source-summit-north-america
[7]:https://www.opencontainers.org/
[8]:https://www.cncf.io/
[9]:https://insights.hpe.com/articles/the-basics-explaining-kubernetes-mesosphere-and-docker-swarm-1702.html
[10]:https://insights.hpe.com/articles/when-to-use-containers-and-when-not-to-1705.html
[11]:https://www.open-scap.org/
[12]:https://scap.nist.gov/
[13]:https://developers.redhat.com/blog/2016/05/02/introducing-atomic-scan-container-vulnerability-detection/
[14]:http://cri-o.io/
[15]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[16]:https://wiki.centos.org/HowTos/SELinux
[17]:https://docs.docker.com/engine/
[18]:https://kubernetes.io/docs/admin/kubelet/
[19]:http://www.zdnet.com/article/containers-consolidation-open-container-initiative-1-0-released/
[20]:https://coreos.com/rkt/docs/latest/
[21]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[22]:https://coreos.com/rkt/
[23]:http://chris.collins.is/2017/02/24/three-docker-build-strategies/
[24]:https://docs.docker.com/engine/userguide/eng-image/multistage-build/#use-multi-stage-builds
[25]:https://github.com/projectatomic/buildah
[26]:https://www.projectatomic.io/blog/2017/06/introducing-buildah/
[27]:https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
