Kubernetes 是什么？
=================

![](https://www.redhat.com/cms/managed-files/styles/max_size/s3/subtopic-header-template-crane-2000x560.png?itok=xht5Sni6)

Kubernetes，简称 k8s（k，8 个字符，s——明白了？）或者 “kube”，是一个开源的 [Linux 容器][3]自动化运维平台，它消除了容器化应用程序在部署、伸缩时涉及到的许多手动操作。换句话说，你可以将多台主机组合成集群来运行 Linux 容器，而 Kubernetes 可以帮助你简单高效地管理那些集群。构成这些集群的主机还可以跨越[公有云][4]、[私有云][5]以及混合云。

Kubernetes 最开始是由 Google 的工程师设计开发的。Google 作为 [Linux 容器技术的早期贡献者][6]之一，曾公开演讲介绍 [Google 如何将一切都运行于容器之中][7]（这是 Google 的云服务背后的技术）。Google 一周内的容器部署超过 20 亿次，全部的工作都由内部平台 [Borg][8] 支撑。Borg 是 Kubernetes 的前身，几年来开发 Borg 的经验教训也成了影响 Kubernetes 中许多技术的主要因素。

_趣闻: Kubernetes logo 中的七个辐条来源于项目原先的名称, “[Seven of Nine 项目][1]”（LCTT 译注：Borg 是「星际迷航」中的一个宇宙种族，Seven of Nine 是该种族的一名女性角色）。_ 

![](https://kubernetes.io/images/favicon.png)

红帽作为最早与 Google 合作开发 Kubernetes 的公司之一（甚至早于 Kubernetes 的发行），已经是 Kubernetes 上游项目的[第二大贡献者][9]。Google 在 2015 年把 Kubernetes 项目捐献给了新成立的 <ruby>[云计算基金会][11]<rt>Cloud Native Computing Foundation</rt></ruby>（CNCF）。


### 为什么你需要 Kubernetes ？

真实的生产环境应用会包含多个容器，而这些容器还很可能会跨越多个服务器主机部署。Kubernetes 提供了为那些工作负载大规模部署容器的编排与管理能力。Kubernetes 编排让你能够构建多容器的应用服务，在集群上调度或伸缩这些容器，以及管理它们随时间变化的健康状态。

Kubernetes 也需要与网络、存储、安全、监控等其它服务集成才能提供综合性的容器基础设施。

![Kubernetes 解释－图表](https://www.redhat.com/cms/managed-files/styles/max_size/s3/kubernetes-diagram-902x416.png?itok=C_wxL4HV "Kubernetes 解释－图表") 

当然，这取决于你如何在你的环境中使用容器。一个初步的 Linux 容器应用程序把容器视作高效、快速的虚拟机。一旦把它部署到生产环境或者扩展为多个应用，很显然你需要许多组托管在相同位置的容器合作提供某个单一的服务。随着这些容器的累积，你的运行环境中容器的数量会急剧增加，复杂度也随之增长。

Kubernetes 通过将容器分类组成 “pod” 来解决了容器增殖带来的许多常见问题。pod 为容器分组提供了一层抽象，以此协助你调度工作负载以及为这些容器提供类似网络与存储这类必要的服务。Kubernetes 的其它组件帮助你对 pod 进行负载均衡，以保证有合适数量的容器支撑你的工作负载。

正确实施的 Kubernetes，结合类似 [Atomic Registry][12]、[Open vSwitch][13]、[heapster][14]、[OAuth][15] 和 [SELinux][16] 的开源项目，让你可以管理你自己的整个容器基础设施。

### Kubernetes 能做些什么？

在生产环境中使用 Kubernetes 的主要优势在于它提供了在物理机或虚拟机集群上调度和运行容器的平台。更宽泛地说，它能帮你在生产环境中实现可以依赖的基于容器的基础设施。而且，由于 Kubernetes 本质上就是运维任务的自动化平台，你可以执行一些其它应用程序平台或管理系统支持的操作，只不过操作对象变成了容器。

有了 Kubernetes，你可以：

*   跨主机编排容器。
*   更充分地利用硬件资源来最大化地满足企业应用的需求。
*   控制与自动化应用的部署与升级。
*   为有状态的应用程序挂载和添加存储器。
*   线上扩展或裁剪容器化应用程序与它们的资源。
*   声明式的容器管理，保证所部署的应用按照我们部署的方式运作。
*   通过自动布局、自动重启、自动复制、自动伸缩实现应用的状态检查与自我修复。

然而 Kubernetes 依赖其它项目来提供完整的编排服务。结合其它开源项目作为其组件，你才能充分感受到 Kubernetes 的能力。这些必要组件包括：

*   仓库：Atomic Registry、Docker Registry 等。
*   网络：OpenvSwitch 和智能边缘路由等。
*   监控：heapster、kibana、hawkular 和 elastic。
*   安全：LDAP、SELinux、 RBAC 与 支持多租户的 OAUTH。
*   自动化：通过 Ansible 的 playbook 进行集群的安装和生命周期管理。
*   服务：大量事先创建好的常用应用模板。

[红帽 OpenShift 为容器部署预先集成了上面这些组件。][17]

### Kubernetes 入门

和其它技术一样，大量的专有名词有可能成为入门的障碍。下面解释一些通用的术语，希望帮助你理解 Kubernetes。

- **Master（主节点）：** 控制 Kubernetes 节点的机器，也是创建作业任务的地方。
- **Node（节点）：** 这些机器在 Kubernetes 主节点的控制下执行被分配的任务。
- **Pod：** 由一个或多个容器构成的集合，作为一个整体被部署到一个单一节点。同一个 pod 中的容器共享 IP 地址、进程间通讯（IPC）、主机名以及其它资源。Pod 将底层容器的网络和存储抽象出来，使得集群内的容器迁移更为便捷。
- **Replication controller（复制控制器）：** 控制一个 pod 在集群上运行的实例数量。
- **Service（服务）：** 将服务内容与具体的 pod 分离。Kubernetes 服务代理负责自动将服务请求分发到正确的 pod 处，不管 pod 移动到集群中的什么位置，甚至可以被替换掉。
- **Kubelet：** 这个守护进程运行在各个工作节点上，负责获取容器列表，保证被声明的容器已经启动并且正常运行。
- **kubectl：** 这是 Kubernetes 的命令行配置工具。

[上面这些知识就足够了吗？不，这仅仅是一小部分，更多内容请查看 Kubernetes 术语表。][18]

### 生产环境中使用 Kubernetes

Kubernetes 是开源的，所以没有正式的技术支持机构为你的商业业务提供支持。如果在生产环境使用 Kubernetes 时遇到问题，你恐怕不会太愉快，当然你的客户也不会太高兴。

这就是[红帽 OpenShift][2] 要解决的问题。OpenShift 是为企业提供的 Kubernetes ——并且集成了更多的组件。OpenShift 包含了强化 Kubernetes 功能、使其更适用于企业场景的额外部件，包括仓库、网络、监控、安全、自动化和服务在内。OpenShift 使得开发者能够在具有伸缩性、控制和编排能力的云端开发、托管和部署容器化的应用，快速便捷地把想法转变为业务。

而且，OpenShift 还是由头号开源领导公司红帽支持和开发的。

### Kubernetes 如何适用于你的基础设施

![Kubernetes 图表](https://www.redhat.com/cms/managed-files/styles/max_size/s3/kubernetes-diagram-2-824x437.png?itok=KmhLmkgi "Kubernetes 图表") 

Kubernetes 运行在操作系统（例如 [Red Hat Enterprise Linux Atomic Host][19]）之上，操作着该节点上运行的容器。Kubernetes 主节点（master）从管理员（或者 DevOps 团队）处接受命令，再把指令转交给附属的节点。这种带有大量服务的切换工作自动决定最适合该任务的节点，然后在该节点上分配资源并指派 pod 来完成任务请求。

所以从基础设施的角度，管理容器的方式发生了一点小小的变化。对容器的控制在更高的层次进行，提供了更佳的控制方式，而无需用户微观管理每个单独的容器或者节点。必要的工作则主要集中在如何指派 Kubernetes 主节点、定义节点和 pod 等问题上。

#### docker 在 Kubernetes 中的角色

[Docker][20] 技术依然执行它原本的任务。当 kubernetes 把 pod 调度到节点上，节点上的 kubelet 会指示 docker 启动特定的容器。接着，kubelet 会通过 docker 持续地收集容器的信息，然后提交到主节点上。Docker 如往常一样拉取容器镜像、启动或停止容器。不同点仅仅在于这是由自动化系统控制而非管理员在每个节点上手动操作的。

--------------------------------------------------------------------------------

via: https://www.redhat.com/en/containers/what-is-kubernetes

作者：[www.redhat.com][a]
译者：[haoqixu](https://github.com/haoqixu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.redhat.com/
[1]:https://cloudplatform.googleblog.com/2016/07/from-Google-to-the-world-the-Kubernetes-origin-story.html
[2]:https://www.redhat.com/en/technologies/cloud-computing/openshift
[3]:https://www.redhat.com/en/containers/whats-a-linux-container
[4]:https://www.redhat.com/en/topics/cloud-computing/what-is-public-cloud
[5]:https://www.redhat.com/en/topics/cloud-computing/what-is-private-cloud
[6]:https://en.wikipedia.org/wiki/Cgroups
[7]:https://speakerdeck.com/jbeda/containers-at-scale
[8]:http://blog.kubernetes.io/2015/04/borg-predecessor-to-kubernetes.html
[9]:http://stackalytics.com/?project_type=kubernetes-group&metric=commits
[10]:https://techcrunch.com/2015/07/21/as-kubernetes-hits-1-0-google-donates-technology-to-newly-formed-cloud-native-computing-foundation-with-ibm-intel-twitter-and-others/
[11]:https://www.cncf.io/
[12]:http://www.projectatomic.io/registry/
[13]:http://openvswitch.org/
[14]:https://github.com/kubernetes/heapster
[15]:https://oauth.net/
[16]:https://selinuxproject.org/page/Main_Page
[17]:https://www.redhat.com/en/technologies/cloud-computing/openshift
[18]:https://kubernetes.io/docs/reference/
[19]:https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux/options
[20]:https://www.redhat.com/en/containers/what-is-docker
