Kubernetes是什么？What is Kubernetes?
============================================================
本文是Kubernetes的概览。


*   [为什么选择Kubernetes?][7]

    *   [为什么我需要Kubernetes，它能做什么?][1]

    *   [Kubernetes是一个什么样的平台?][2]

    *   [Kubernetes不是什么？][3]

    *   [Kubernetes这个单词的含义？k8s?][4]

*   [接下来][8]


Kubernetes 是一款跨集群的 [专门为自动化部署、缩放、操作应用程序容器的开源平台][25] , 提供了以容器为中心的基础架构。

使用 Kubernetes , 你可以快速、高效地满足用户以下的需求：

*   快速精准地部署应用程序

*   即时缩放应用程序

*   无缝展现新特征

我们的目标是，在公有或私有云中，培育出可以释放正在运行的程序的负担的一系列工具和组件的生态系统。

#### Kubernetes 的优势

*   **轻便**: 公有云、私有云、混合云、多态云

*   **可扩展**: 模块化、组件化，可添加插件、可Hook

*   **自动修正**: 自动布局、自动重启、自动复制、自动缩放

Google 公司于2014年启动了 Kubernetes 项目。Kubernetes 是在[ Google 的长达15年的成规模的产品运行工作量的经验下][26]构建的, 结合了公司中最优秀的创意，并在社区中经历了反复地实践。

### 为什么选择容器?

想要知道你为什么要选择使用 [容器][27]?

![为什么是容器?](https://d33wubrfki0l68.cloudfront.net/e7b766e0175f30ae37f7e0e349b87cfe2034a1ae/3e391/images/docs/why_containers.svg)

程序部署的 _旧方法_ 是指，通过操作系统包管理器在主机上安装程序。这样做的坏处是，容易混淆程序之间以及程序和主机系统之间的可执行文件、配置文件、库、生命周期。为了达到精准展现和精准回撤，你可以搭建一台不可变的虚拟机映象。但是虚拟机体量往往过于庞大。

容器部署的 _新方法_ 是基于操作系统级别的可视化，而非硬件可视化。容器彼此是孤立的，相对于主机也是独立的：它们有自己的文件系统，彼此之间不能看到对方的进程，分配到的计算资源都是有边界的。它们比虚拟机更容易搭建。并且由于和基础架构、主机文件系统是解耦的，它们可以在不同类型的云上或分布式OS上应用。

正因为容器又小又快，每一个容器映象都可以打包装载一个程序。这种一对一的「程序 - 映象」联系带给了容器诸多便捷。有了容器，静态容器映象可以在编译/发布时期创建，而非部署时期。因此，每个应用不必再等待和整个应用栈其它部分进行整合，也不必和产品基础架构环境之间进行妥协。在编译/发布时期生成容器映象建立了一个持续地把开发转化为产品的环境。相似地，容器远比虚拟机更加透明，尤其在设备监控和管理上。这一点，在容器的进程生命周期被基础架构管理而非被容器内的进程监督器隐藏掉时，尤为显著。最终，随着每个容器内都装载了单一的程序，管理容器就等于管理或部署整个应用。

容器优势总结：

*   **敏捷的应用创建与部署**: 相比虚拟机映象，容器映象的创建更简便、更高效。

*   **持续的开发，集成，以及部署**: 在快速回撤下提供可靠、高频的容器映象编译和部署（基于映象的不可变性）。

*   **开发与运营的关注点分离**: 由于容器映象是在编译/发布期创建的，因此整个过程与基础架构解耦。

*   **跨开发、测试、产品阶段的环境稳定性**: 在笔记本电脑上的运行结果和在云上完全一致。

*   **云平台与分布式OS平台高适应性**: 可以在Ubuntu， RHEL， CoreOS， on-prem， Google 容器引擎，乃至其它各类平台上运行。

*   **以应用为核心的管理**: 从在虚拟硬件上运行系统，到在利用逻辑资源的系统上运行程序，从而提升了系统的抽象层级。

*   **松散耦联、分布式、弹性、无拘束的 [微服务][5]**: 整个应用被分散为更小更独立的模块，并且这些模块可以被动态地部署和管理，而不再是存储在大型单用途机器上的臃肿的单一应用栈。

*   **资源隔离**: 增加程序表现的可预见性。

*   **资源利用率**: 高效且密集。

#### 为什么我需要Kubernetes，它能做什么?

至少，Kubernetes 能在实体机或虚拟机集群上安排和运行程序容器。而且，Kubernetes 也能让开发者斩断联系着实体机或虚拟机的「锁链」，从 **主机为中心** 的架构跃至 **容器为中心** 的架构。该架构最终提供给开发者诸多内在的优势和便利。Kubernetes 提供给基础架构以真正的 **容器为中心** 的开发环境。

Kubernetes 满足了一系列产品内运行程序的普通需求，诸如：

*   [共用地址的帮助进程][9]，协助应用程序整合，维护一对一「程序 - 映象」模型。

*   [装备存储系统][10]

*   [分布机密][11]

*   [检查程序状态][12]

*   [复制应用实例][13]

*   [使用横向荚式自动缩放][14]

*   [命名与发现][15]

*   [负载均衡][16]

*   [滚动更新][17]

*   [资源监控][18]

*   [访问并读取日志][19]

*   [程序调试][20]

*   [提供验证与授权][21]

以上这些共同组成了一套精简的平台即服务 (PaaS) 系统以及相关的灵活的基础架构即服务 (IaaS) 系统。此外还协助跨平台服务提供商增强了适用性。

#### Kubernetes是一个什么样的平台?

虽然 Kubernetes 提供了非常多的功能，总会有更多受益于新特性的新场景出现。针对特定应用的工作流程，能被流水线化以加速开发速度。专属设备组合在初始状态就可以被系统接受，这往往需要系统拥有健壮的自动缩放功能。这也是为什么 Kubernetes 同样被设计为以构造为了更方便地部署、缩放、管理程序为目的的工具组生态系统的平台。

[标签][28] 可以让用户按照自己的喜好组织资源。 [注释][29]让用户在资源里添加客户信息，以优化工作流程、简化管理工具、标示调试状态。

此外，[Kubernetes 控制面板][30]由同一[API][31]搭建，开发者和用户都可以使用。用户可以编写自己的控制器，比如[schedulers][32]，使用[自己的 API][33]可以被通用的[命令行工具][34]识别。

这种 [设计][35] 让其它系统也能经由 Kubernetes 构建。

#### What Kubernetes is not

Kubernetes is not a traditional, all-inclusive PaaS (Platform as a Service) system. It preserves user choice where it is important.

Kubernetes:

*   Does not limit the types of applications supported. It does not dictate application frameworks (e.g., [Wildfly][22]), restrict the set of supported language runtimes (for example, Java, Python, Ruby), cater to only [12-factor applications][23], nor distinguish  _apps_  from  _services_ . Kubernetes aims to support an extremely diverse variety of workloads, including stateless, stateful, and data-processing workloads. If an application can run in a container, it should run great on Kubernetes.

*   Does not provide middleware (e.g., message buses), data-processing frameworks (for example, Spark), databases (e.g., mysql), nor cluster storage systems (e.g., Ceph) as built-in services. Such applications run on Kubernetes.

*   Does not have a click-to-deploy service marketplace.

*   Does not deploy source code and does not build your application. Continuous Integration (CI) workflow is an area where different users and projects have their own requirements and preferences, so it supports layering CI workflows on Kubernetes but doesn’t dictate how layering should work.

*   Allows users to choose their logging, monitoring, and alerting systems. (It provides some integrations as proof of concept.)

*   Does not provide nor mandate a comprehensive application configuration language/system (for example, [jsonnet][24]).

*   Does not provide nor adopt any comprehensive machine configuration, maintenance, management, or self-healing systems.

On the other hand, a number of PaaS systems run  _on_  Kubernetes, such as [Openshift][36], [Deis][37], and [Eldarion][38]. You can also roll your own custom PaaS, integrate with a CI system of your choice, or use only Kubernetes by deploying your container images on Kubernetes.

Since Kubernetes operates at the application level rather than at the hardware level, it provides some generally applicable features common to PaaS offerings, such as deployment, scaling, load balancing, logging, and monitoring. However, Kubernetes is not monolithic, and these default solutions are optional and pluggable.

Additionally, Kubernetes is not a mere  _orchestration system_ . In fact, it eliminates the need for orchestration. The technical definition of  _orchestration_  is execution of a defined workflow: first do A, then B, then C. In contrast, Kubernetes is comprised of a set of independent, composable control processes that continuously drive the current state towards the provided desired state. It shouldn’t matter how you get from A to C. Centralized control is also not required; the approach is more akin to  _choreography_ . This results in a system that is easier to use and more powerful, robust, resilient, and extensible.

#### What does  _Kubernetes_  mean? K8s?

The name **Kubernetes** originates from Greek, meaning  _helmsman_  or  _pilot_ , and is the root of  _governor_  and [cybernetic][39].  _K8s_  is an abbreviation derived by replacing the 8 letters “ubernete” with “8”.

--------------------------------------------------------------------------------

via: https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/

作者：[kubernetes.io][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kubernetes.io/
[1]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#why-do-i-need-kubernetes-and-what-can-it-do
[2]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#how-is-kubernetes-a-platform
[3]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#what-kubernetes-is-not
[4]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#what-does-kubernetes-mean-k8s
[5]:https://martinfowler.com/articles/microservices.html
[6]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#kubernetes-is
[7]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#why-containers
[8]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#whats-next
[9]:https://kubernetes.io/docs/concepts/workloads/pods/pod/
[10]:https://kubernetes.io/docs/concepts/storage/volumes/
[11]:https://kubernetes.io/docs/concepts/configuration/secret/
[12]:https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
[13]:https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/
[14]:https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
[15]:https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/
[16]:https://kubernetes.io/docs/concepts/services-networking/service/
[17]:https://kubernetes.io/docs/tasks/run-application/rolling-update-replication-controller/
[18]:https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/
[19]:https://kubernetes.io/docs/concepts/cluster-administration/logging/
[20]:https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application-introspection/
[21]:https://kubernetes.io/docs/admin/authorization/
[22]:http://wildfly.org/
[23]:https://12factor.net/
[24]:https://github.com/google/jsonnet
[25]:http://www.slideshare.net/BrianGrant11/wso2con-us-2015-kubernetes-a-platform-for-automating-deployment-scaling-and-operations
[26]:https://research.google.com/pubs/pub43438.html
[27]:https://aucouranton.com/2014/06/13/linux-containers-parallels-lxc-openvz-docker-and-more/
[28]:https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
[29]:https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
[30]:https://kubernetes.io/docs/concepts/overview/components/
[31]:https://kubernetes.io/docs/reference/api-overview/
[32]:https://git.k8s.io/community/contributors/devel/scheduler.md
[33]:https://git.k8s.io/community/contributors/design-proposals/extending-api.md
[34]:https://kubernetes.io/docs/user-guide/kubectl-overview/
[35]:https://github.com/kubernetes/community/blob/master/contributors/design-proposals/principles.md
[36]:https://www.openshift.org/
[37]:http://deis.io/
[38]:http://eldarion.cloud/
[39]:http://www.etymonline.com/index.php?term=cybernetics
