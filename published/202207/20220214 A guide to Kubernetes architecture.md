[#]: subject: "A guide to Kubernetes architecture"
[#]: via: "https://opensource.com/article/22/2/kubernetes-architecture"
[#]: author: "Nived Velayudhan https://opensource.com/users/nivedv"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14789-1.html"

Kubernetes 架构指南
======

> 了解 Kubernetes 架构中不同组件是如何组合在一起的，这样你就可以更好地排查问题、维护一个健康的集群，以及优化工作流。

![](https://img.linux.net.cn/data/attachment/album/202207/03/105135ey33hhx022m9y9fr.jpg)

使用 Kubernetes 来编排容器，这种描述说起来简单，但理解它的实际含义以及如何实现它完全是另外一回事。如果你正在运行或管理 Kubernetes 集群，那么你就会知道 Kubernetes 由一台称为 “<ruby>控制平面<rt>control plane</rt></ruby>” 的机器和许多其他 <ruby>工作节点<rt>worker node</rt></ruby> 机器组成。每种类型都有一个复杂但稳定的堆栈，这使编排成为可能，熟悉每个组件有助于理解它是如何工作的。

![Kubernetes 架构图][2]

*（Nived Velayudhan, [CC BY-SA 4.0][3]）*

### 控制平面组件

Kubernetes 安装在一个称为“<ruby>控制平面<rt>control plane</rt></ruby>”的机器上，它会运行 Kubernetes 守护进程，并在启动容器和<ruby>容器组<rt>pod</rt></ruby>时与之通信。下面介绍控制平面的各个组件。

#### etcd

etcd 是一种快速、分布式一致性键值存储器，用作 Kubernetes 对象数据的持久存储，如容器组、副本控制器、密钥和服务。etcd 是 Kubernetes 存储集群状态和元数据的唯一地方。唯一与 etcd 直连的组件是 Kubernetes API 服务器。其他所有组件都通过 API 服务器间接的从 etcd 读写数据。

etcd 还实现了一个监控功能，它提供了一个基于事件的接口，用于异步监控键的更改。一旦你更改了一个键，它的监控者就会收到通知。API 服务器组件严重依赖于此来获得通知，并将 etcd 变更至期望状态。

_为什么 etcd 实例的数量应该是奇数？_

你通常会运行三个、五个或七个 etcd 实例实现高可用（HA）环境，但这是为什么呢？因为 etcd 是分布式数据存储，可以水平扩展它，但你需要确保每个实例中的数据是一致的。因此，需要为系统当前状态达成共识，etcd 为此使用 [RAFT 共识算法][4]。
 
RAFT 算法需要经过选举（或仲裁）集群才能进入下一个状态。如果你只有两个 etcd 实例并且他们其中一个失败的话，那么 etcd 集群无法转换到新的状态，因为不存在过半这个概念。如果你有三个 etcd 实例，一个实例可能会失败，但仍有 2 个实例可用于进行选举。

#### API 服务器

API 服务器是 Kubernetes 中唯一直接与 etcd 交互的组件。Kubernetes 中的其他所有组件都必须通过 API 服务器来处理集群状态，包括客户端（kubectl）。API 服务器具有以下功能：

  * 提供在 etcd 中存储对象的一致方式。
  * 执行验证对象，防止客户端存储配置不正确的对象（如果它们直接写入 etcd 数据存储，可能会发生这种情况）。
  * 提供 RESTful API 来创建、更新、修改或删除资源。
  * 提供 [乐观并发锁][5]，在发生更新时，其他客户端永远不会有机会重写对象。
  * 对客户端发送的请求进行身份验证和授权。它使用插件提取客户端的用户名、ID、所属组，并确定通过身份验证的用户是否可以对请求的资源执行请求的操作。
  * 如果请求试图创建、修改或删除资源，则负责 [权限控制][6]。例如，AlwaysPullImages、DefaultStorageClass 和 ResourceQuota。
  * 实现了一种监控机制（类似于 etcd），用户客户端监控更改。这允许调度器和控制器管理器等组件以松耦合的方式与 API 服务器交互。

#### 控制器管理器

在 Kubernetes 中，控制器持续监控集群状态，然后根据需要进行或请求更改。每个控制器都尝试将当前集群状态变更至期望状态。控制器至少跟踪一种 Kubernetes 资源类型，这些对象均有一个字段来表示期望的状态。

控制器示例：

  * 副本管理器（管理<ruby>副本控制器<rt>ReplicationController</rt></ruby>资源的控制器）
  * <ruby>副本集<rt>ReplicaSet</rt></ruby>、<rub>守护进程集<rt>DaemonSet</rt></ruby> 和任务控制器
  * 部署控制器
  * 有状态负载控制器
  * 节点控制器
  * 服务控制器
  * 接入点控制器
  * 命名空间控制器
  * <ruby>持久卷<rt>PersistentVolume</rt></ruby>控制器

控制器通过监控机制来获得变更通知。它们监视 API 服务器对资源的变更，对每次更改执行操作，无论是新建对象还是更新或删除现有对象。大多数时候，这些操作包括创建其他资源或更新监控的资源本身。不过，由于使用监控并不能保证控制器不会错过任何事件，它们还会定期执行一系列操作，确保没有错过任何事件。

控制器管理器还执行生命周期功能。例如命名空间创建和生命周期、事件垃圾收集、已终止容器组垃圾收集、[级联删除垃圾收集][7] 和节点垃圾收集。有关更多信息，参考 [云控制器管理器][8]。

#### 调度器

调度器是一个将容器组分配给节点的控制平面进程。它会监视新创建没有分配节点的容器组。调度器会给每个发现的容器组分配运行它的最佳节点。

满足容器组调度要求的节点称为可调度节点。如果没有合适的节点，那么容器组会一直处于未调度状态，直到调度器可以安置它。一旦找到可调度节点，它就会运行一组函数来对节点进行评分，并选择得分最高的节点，然后它会告诉 API 服务器所选节点的信息。这个过程称为绑定。

节点的选择分为两步：

  1. 过滤所有节点的列表，获得可以调度容器组的节点列表（例如，PodFitsResources 过滤器检查候选节点是否有足够的可用资源来满足容器组的特定资源请求）。
  2. 对第一步得到的节点列表进行评分和排序，选择最佳节点。如果得分最高的有多个节点，循环过程可确保容器组会均匀地部署在所有节点上。

调度决策要考虑的因素包括：

  * 容器组是否请求硬件/软件资源？节点是否报告内存或磁盘压力情况？
  * 节点是否有与容器组规范中的节点选择器匹配的标签？
  * 如果容器组请求绑定到特定地主机端口，该端口是否可用？
  * 容器组是否容忍节点的污点？
  * 容器组是否指定节点亲和性或反亲和性规则？

调度器不会指示所选节点运行容器组。调度器所做的就是通过 API 服务器更新容器组定义。然后 API 服务器通过监控机制通知 kubelet 容器组已被调度，然后目标节点上的 kubelet 服务看到容器组被调度到它的节点，它创建并运行容器组。

### 工作节点组件

工作节点运行 kubelet 代理，这允许控制平面接纳它们来处理负载。与控制平面类似，工作节点使用几个不同的组件来实现这一点。 以下部分描述了工作节点组件。

#### Kubelet

Kubelet 是一个运行在集群中每个节点上的代理，负责在工作节点上运行的所有事情。它确保容器在吊舱中运行。

kubelet服务的主要功能有：

  * 通过在 API 服务器中创建节点资源来注册它正在运行的节点。
  * 持续监控 API 服务器上调度到节点的容器组。
  * 使用配置的容器运行时启动容器组的容器。
  * 持续监控正在运行的容器，并将其状态、事件和资源消耗报告给 API 服务器。
  * 运行容器存活探测，在探测失败时重启容器，当 API 服务器中删除容器组时终止（通知服务器容器组终止的消息）。

#### 服务代理

服务代理（kube-proxy）在每个节点上运行，确保一个容器组可以与另一个容器组通讯，一个节点可以与另一个节点对话，一个容器可以与另一个容器对话。它负责监视 API 服务器对服务和容器组定义的更改，以保持整个网络配置是最新的。当一项服务得到多个容器组的支持时，代理会在这些容器组之间执行负载平衡。

kube-proxy 之所以叫代理，是因为它最初实际上是一个代理服务器，用于接受连接并将它们代理到容器组。当前的实现是使用 iptables 规则将数据包重定向到随机选择的后端容器组，而无需通过实际的代理服务器。

关于它工作原理的高级视图：

  * 当你创建一个服务时，会立即分配一个虚拟 IP 地址。
  * API 服务器会通知在工作节点上运行的 kube-proxy 代理有一个新服务。
  * 每个 kube-proxy 通过设置 iptables 规则使服务可寻址，确保截获每个服务 IP/端口对，并将目的地址修改为支持服务的一个容器组。
  * 监控 API 服务器对服务或其端点对象的更改。

#### 容器运行时

容器运行时有两类：

  * **较低级别的容器运行时：** 它们主要关注运行中的容器并为容器设置命名空间和<ruby>控制组<rt>cgroup</rt></ruby>。
  * **更高级别的容器运行时（容器引擎）：** 它们专注于格式、解包、管理、共享镜像以及为开发人员提供 API。

容器运行时负责：

  * 如果容器镜像本地不存在，则从镜像仓库中提取。
  * 将镜像解压到写时复制文件系统，所有容器层叠加创建一个合并的文件系统。
  * 准备一个容器挂载点。
  * 设置容器镜像的元数据，如覆盖命令、用户输入的入口命令，并设置 SECCOMP 规则，确保容器按预期运行。
  * 通知内核将进程、网络和文件系统等隔离分配给容器。
  * 通知内核分配一些资源限制，如 CPU 或内存限制。
  * 将系统调用（syscall）传递给内核启动容器。
  * 确保 SElinux/AppArmor 设置正确。

### 协同

系统级组件协同工作，确保 Kubernetes 集群的每个部分都能实现其目和执行其功能。当你深入编辑 [YAML 文件][10] 时，有时很难理解请求是如何在集群中通信的。现在你已经了解了各个部分是如何组合在一起的，你可以更好地理解 Kubernetes 内部发生了什么，这有助于诊断问题、维护健康的集群并优化你的工作流。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/kubernetes-architecture

作者：[Nived Velayudhan][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nivedv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://opensource.com/sites/default/files/uploads/kubernetes-architecture-diagram.png (Kubernetes architecture diagram)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://www.geeksforgeeks.org/raft-consensus-algorithm/
[5]: https://stackoverflow.com/questions/52910322/kubernetes-resource-versioning#:~:text=Optimistic%20concurrency%20control%20\(sometimes%20referred,updated%2C%20the%20version%20number%20increases.
[6]: https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/
[7]: https://kubernetes.io/docs/concepts/architecture/garbage-collection/
[8]: https://kubernetes.io/docs/concepts/architecture/cloud-controller/
[9]: https://www.redhat.com/architect/how-kubernetes-creates-runs-containers
[10]: https://www.redhat.com/sysadmin/yaml-beginners
