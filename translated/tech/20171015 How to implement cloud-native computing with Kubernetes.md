怎么去使用 Kubernetes 实现私有云计算
============================================================

![](https://insights.hpe.com/content/hpe-nxt/en/articles/2017/10/how-to-implement-cloud-native-computing-with-kubernetes/_jcr_content/article-image.transform/1043x496-crop/image.jpeg)

开源容器倡导者和私有云计算基金会的代表说，Kubernetes 和容器可以在降低程序员和系统管理员成本（costs）的同时加速部署进程，从不被看好的 Kubernetes 特性（像命令空间）开始，去利用 Kubernetes 和它的相关工具运行一个私有云架构

[Kubernetes][2] 不止是一个云容器管理器。正如 Steve Pousty，他是[Red Hat][3]支持的[OpenShift][4]的首席开发者，在[Linux 基金会][5]的[开源提交者][6]的一个报告中解释的那样，Kubernetes 提供作为一个 “使用容器进行私有云计算的一个通用操作面（common operating plane）”。

Pousty 的意思是什么？让我们复习一下基础知识。

[开源容器倡议][7] (OCI) 和 [私有云计算基金会][8] (CNCF) 的执行董事 Chris Aniszczyk 的解释是，“私有云计算使用一个开源软件栈去部署作为微服务的应用程序，打包每一个部分到它自己的容器中，并且动态排布这些容器去优化资源使用”，[Kubernetes 关注私有云计算的最新要素][9]。最终将导致 IT 中很大的一部分发生转变，从服务器到虚拟机到构建包 （buildpacks） 到现在的 [容器][10]。

会议主持人说，数据中心的演变将节省相当可观的成本， 部分原因是它需要更少的专职员工。例如，据 Aniszczyk 说，通过使用 Kubernetes，谷歌每 10000 台机器仅需要一个网站可靠性工程师（译者注：即SRE）。

实际上，系统管理员可以利用新的 Kubernetes 相关的工具并可以去开发喜欢的功能。

### 构建一个私有云平台

Pousty 解释说，“对于 Red Hat， Kubernetes 是云 Linux 内核。它是每个人都可以在上面构建的基础设施”。

例如，假如你在一个容器镜像中有一个应用程序。你怎么知道它是安全的呢？ Red Hat 和其它的公司使用 [OpenSCAP][11]，它是基于 [安全内容自动化协议][12] (SCAP)的，是使用标准化的方式去表达和操作安全数据的一个规范。OpenSCAP 项目提供了一个开源的强化指南和配置基准。你选择一个合适的安全策略，然后，使用 OpenSCAP 认可的安全工具去使某些在你的 Kubernetes 控制的容器中的程序遵守这些定制的安全标准。

还没有搞明白怎么去使用容器？好吧，我现在指导你。

[傻瓜式获得容器（Get Containers for Dummies）][1]

Red Hat 将使用[原子扫描（Atomic Scan）][13]自动处理这个过程；它用 OpenSCAP 提供的工具去扫描容器镜像中的已知安全漏洞和策略配置问题。原子扫描加载了只读的文件系统。这些通过扫描的容器，随着一个可写入扫描器的目录一起输出。

Pousty 指出，这种方法有几个好处，主要是，“你可以在不实际运行它的情况下，去扫描一个容器镜像”。因此，如果在容器中有糟糕的代码或有缺陷的安全策略，它不会对你的系统做任何事情。

原子扫描比手动运行 OpenSCAP 快很多。 因为，容器从启用到消毁可能就在几分钟或几小时内，原子扫描允许 Kubernetes 用户在容器启用期间去保持容器安全，而不用花费太多的系统管理时间。

### 关于工具

帮助 Kubernetes 进行大部分的系统管理和开发运营（DevOps）操作的另一个工具是 [CRI-O][14]。这是一个基于 OCI 实现的 [Kubernetes 容器运行时接口][15]。CRI-O 是一个守护进程， Kubernetes 可以用于运行存储在 Docker registries 中的容器镜像，Dan Walsh 解释说，它是 Red Hat 的顾问工程师和 [SELinux][16] 项目领导者。它允许你直接从 Kubernetes 中启动容器镜像，而不用花费时间和 CPU 周期在 [Docker 引擎][17] 上启动。并且它的镜像格式是与容器无关的。

在 Kubernetes 中， [kubelets][18] 管理 pods、或者容器的集群。使用 CRI-O，Kubernetes 和 它的 kubelets 可以管理整个容器的生命周期。这个工具也不是和 Docker 镜像结合在一起的。你也可以使用新的 [OCI 镜像格式][19] 和 [CoreOS 的 rkt][20] 容器镜像。

同时，这些工具正在成为一个 Kubernetes 栈：Orchestrator、[容器运行时接口][21] (CRI)、和 CRI-O。Kubernetes 首席工程师 Kelsey Hightower 说，“我们实际上不需要这么多的容器运行时—无论它是 Docker 还是 [rkt][22]。仅需要给我们一个到内核的 API”，结果，对这些技术人员的承诺，是推动容器比以往更快发展的强大动力。

Kubernetes 也可以加速构建容器镜像。直到最近，这是 [构建容器的三种方法][23]。第一种方法是通过一个 Docker 或者 CoreOS 去构建容器。第二种方法是注入客户代码到一个预构建镜像中。最后一种方法是，资产生成管理（Asset Generation Pipelines）使用容器去编译那些资产（assets）包含到随后生成的镜像中，它使用了 Dockers 的[多阶段构建][24]去构建镜像。

现在，还有一个 Kubernetes 的私有方法：Red Hat 的 [Buildah][25]， [一个脚本化的 shell 工具][26] 用于快速高效地构建 OCI 兼容的镜像和容器。Buildah 降低了容器环境的学习曲线（learning curve），简化了创建、构建和更新镜像的难度。Pousty 说。你可以使用它和 Kubernetes 一起去创建和推动容器基于一个应用程序上的调用自动化。Buildah 也节省系统资源，因为它不需要容器运行时守护进程。

因此，比起真实地引导一个容器和容器内的按步骤操作，Pousty 说，“你加载一个文件系统，在你的机器上做一些正常操作，如果它是一个常规的文件系统，并且在最后去提交”。

这意味着你可以从一个 Registry 中销毁一个镜像，创建它匹配的容器，并且优化它。然后，你可以使用 Kubernetes 中的 Buildah 在你需要时去创建一个新的运行镜像。最终结果是，他说，运行 Kubernetes 管理的容器化应用程序比以往速度更快，需要的资源更少。

### 你不知道的 Kubernetes 所拥有的特性

你不需要在其它地方寻找工具。Kubernetes 有几个被低估的特性。

 根据谷歌云全球产品经理 Allan Naim 的说法，其中一个是，[Kubernetes 命名空间][27]。Naim 在“Kubernetes 最佳实践”中的开源总结上的演讲中说，“很少有人使用命名空间，这是一个失误（mistake）”

“命名空间是区分一个单个的 Kubernetes 集群到多个虚拟集群的方法”，Naim 说。例如，“你可以认为命名空间就是家族名（family names）”，因此，如果 “Simth” 标识一个家族，一个成员，Steve Smith，它仅是“Steve”，但是，家族范围之外的，它就是“Steve Smith” 也或许为“来自 Chicago 的 Steve Smith”。

严格来说，“命名空间是一个逻辑的分区技术，它允许一个 Kubernetes 集群被多个用户、用户团队或者在多个应用程序上不能混淆的一个用户使用。Naim 解释说，“每个用户、用户团队、或者可以存在于它的命名空间中的应用程序，与集群中的其他用户是隔离的，并且操作它就像你是这个集群的唯一用户一样。”

Practically说，你可以使用命名空间去构建一个企业的多个业务/技术整体进入 Kubernetes。例如，云架构可以通过映射产品、位置、团队和成本中心为命名空间，去定义公司命名空间策略。

Naim 建议的另外的方法是，去使用命名空间区分软件开发流程（pipelines）到分离的命名空间中。如测试、质量保证、分段（staging）和成品。或者命名空间可以用于管理单独的客户。例如，你可以为每个客户、客户项目、或者客户业务单元去创建一个命名空间。它可以更容易地区分项目，避免重用相同名字的资源。

然而，Kubernetes 现在还没有提供一个跨命名空间访问的控制机制。因此，Naim 建议你不要使用这种方法去对外公开程序。还要注意的是，命名空间也不是一个管理的“万能药”。例如，你不能将命名空间嵌套在另一个命名空间中。另外，也没有跨命名空间的强制的安全机制。

尽管如此，小心地使用命名空间，还是很有用的。

### 友情提示

转换到较深奥的（deep）技术去做项目管理，Pousty 建议，在转移到私有云和微服务架构时，在你的团队中使用一个微服务操作人员。“如果你去做微服务，你的团队将结束使用 Ops-y 工作。并且，不去使用已经知道这种操作的人是愚蠢的行为”，他说。“你需要一个正确的团队核心能力。我不想开发人员重新使用 Operations Wheel”。

而是，将你的工作流彻底地改造成一个能够使用容器和云的过程，对此，Kubernetes 是很好的。

### 使用 Kubernetes 的私有云计算：领导者的课程

*   迅速扩大的私有云生态系统。寻找可以扩展你使用容器的方法的工具。

*   探索鲜为人知的 Kubernetes 特性，如命名空间。它们可以改善你的组织和自动化程度。

*   确保部署到容器的开发团队有一个 Ops 人员参与。否则，冲突将不可避免。

--------------------------------------------------------------------------------

作者简介：

Steven J. Vaughan-Nichols, CEO, Vaughan-Nichols & Associates 

Steven J. Vaughan-Nichols, 又名叫 sjvn，是一个技术方面的作家，自 CP/M-80 以来一直从事与前沿技术、PC 操作系统等商业技术的写作；300bps 是非常快的因特网连接； WordStar 是最先进的文字处理程序；而且我喜欢它。他的作品已经发布在了技术含量非常高的主流出版社 (Washington Post, San Francisco Chronicle, BusinessWeek)的出版物上（IEEE Computer、 ACM Network、 Byte)，去商业化推广 (eWEEK、InformationWeek、ZDNet) 流行的技术 (Computer Shopper、PC Magazine、PC World)。

---------------------


via: https://insights.hpe.com/articles/how-to-implement-cloud-native-computing-with-kubernetes-1710.html

作者：[ Steven J. Vaughan-Nichols][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

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
