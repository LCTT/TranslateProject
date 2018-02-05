Docker 引擎的 Swarm 模式：添加工作者节点教程
================

让我们继续几周前在 CentOS 7.2 中开始的工作。 在本[指南][1]中，我们学习了如何初始化以及启动 Docker 1.12 中内置的原生的集群以及编排功能。但是我们只有管理者（manager）节点还没有其它工作者（worker）节点。今天我们会展开讲述这个。

我将向你展示如何将不对称节点添加到 Sawrm 中，比如一个与 CentOS 相邻的 [Fedora 24][2]，它们都将加入到集群中，还有相关很棒的负载均衡等等。当然这并不是轻而易举的，我们会遇到一些障碍，所以它应该是非常有趣的。

![Teaser](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-teaser-more.png) 

### 先决条件

在将其它节点成功加入 Swarm 之前，我们需要做几件事情。理想情况下，所有节点都应该运行相同版本的 Docker，为了支持原生的编排功能，它的版本至少应该为 1.12。像 CentOS 一样，Fedora 内置的仓库没有最新的构建版本，所以你需要手动构建，或者使用 Docker 仓库手动[添加和安装][3]正确的版本，并修复一些依赖冲突。我已经向你展示了如何在 CentOS 中操作，经过是相同的。

此外，所有节点都需要能够相互通信。这就需要有正确的路由和防火墙规则，这样管理者（manager）和工作者（worker）节点才能互相通信。否则，你无法将节点加入 Swarm 中。最简单的解决方法是临时清除防火墙规则 （`iptables -F`），但这可能会损害你的安全。请确保你完全了解你正在做什么，并为你的节点和端口创建正确的规则。

> Error response from daemon: Timeout was reached before node was joined. The attempt to join the swarm will continue in the background. Use the "docker info" command to see the current swarm status of your node.

> 守护进程的错误响应：节点加入之前已超时。尝试加入 Swarm 的请求将在后台继续进行。使用 “docker info” 命令查看节点的当前 Swarm 状态。

你需要在主机上提供相同的 Docker 镜像。在上一个教程中我们创建了一个 Apache 映像，你需要在你的工作者（worker）节点上执行相同操作，或者分发已创建的镜像。如果你不这样做，你会遇到错误。如果你在设置 Docker 上需要帮助，请阅读我的[介绍指南][4]和[网络教程][5]。

```
7vwdxioopmmfp3amlm0ulimcu   \_ websky.11   my-apache2:latest
localhost.localdomain   Shutdown   Rejected 7 minutes ago
"No such image: my-apache2:lat&"
```

### 现在开始

现在我们有一台启动了 CentOS 机器，并成功地创建了容器。你可以使用主机端口连接到该服务，这一切都看起来很好。目前，你的 Swarm 只有管理者（manager）。

![Manager](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-manager.png) 

### 加入工作者（worker）

要添加新的节点，你需要使用 `join` 命令。但是你首先必须提供令牌、IP 地址和端口，以便工作者（woker）节点能正确地对 Swarm 管理器进行身份验证。接着（在 Fedora 上）执行：

```
[root@localhost ~]# docker swarm join-token worker
To add a worker to this swarm, run the following command:

docker swarm join \
--token SWMTKN-1-0xvojvlza90nrbihu6gfu3qm34ari7lwnza ... \
192.168.2.100:2377
```

如果你不修复防火墙和路由规则，你会得到超时错误。如果你已经加入了 Swarm，重复 `join` 命令会收到错误：

```
Error response from daemon: This node is already part of a swarm. Use "docker swarm leave" to leave this swarm and join another one.
```

如果有疑问，你可以离开 Swarm，然后重试：

```
[root@localhost ~]# docker swarm leave
Node left the swarm.

docker swarm join --token
SWMTKN-1-0xvojvlza90nrbihu6gfu3qnza4 ... 192.168.2.100:2377
This node joined a swarm as a worker.
```

在工作者（worker）节点中，你可以使用 `docker info` 来检查状态：

```
Swarm: active
NodeID: 2i27v3ce9qs2aq33nofaon20k
Is Manager: false
Node Address: 192.168.2.103

Likewise, on the manager:

Swarm: active
NodeID: cneayene32jsb0t2inwfg5t5q
Is Manager: true
ClusterID: 8degfhtsi7xxucvi6dxvlx1n4
Managers: 1
Nodes: 3
Orchestration:
Task History Retention Limit: 5
Raft:
Snapshot Interval: 10000
Heartbeat Tick: 1
Election Tick: 3
Dispatcher:
Heartbeat Period: 5 seconds
CA Configuration:
Expiry Duration: 3 months
Node Address: 192.168.2.100
```

### 创建或缩放服务

现在，我们需要看下 Docker 是否以及如何在节点间分发容器。我的测试展示了一个在非常轻的负载下相当简单的平衡算法。试了一两次之后，即使在我尝试缩放并更新之后，Docker 也没有将运行的服务重新分配给新的 worker。同样，有一次，它在工作者（worker）节点上创建了一个新的服务。也许这是最好的选择。

![Scale service](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-scale-service.png) 

![Service ls](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-service-list.png) 

![Services ls, more](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-service-list-more.png) 

![New service](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-new-service.png) 

*在新的工作者（worker）节点上完整创建新的服务。*

过了一段时间，两个容器之间的现有服务有一些重新分配，但这需要一些时间。新服务工作正常。这只是一个前期观察，所以我现在不能说更多。现在是开始探索和调整的新起点。

![Service distributed](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-distributed.png) 

*负载均衡过了一会工作了。*

### 总结

Docker 是一只灵巧的小野兽，它仍在继续长大，变得更复杂、更强大，当然也更优雅。它被一个大企业吃掉只是一个时间问题。当它带来了原生的编排功能时，Swarm 模式运行得很好，但是它不只是几个容器而已，而是充分利用了其算法和可扩展性。

我的教程展示了如何将 Fedora 节点添加到由 CentOS 运行的群集中，并且两者能并行工作。关于负载平衡还有一些问题，但这是我将在以后的文章中探讨的。总而言之，我希望这是一个值得记住的一课。我们已经解决了在尝试设置 Swarm 时可能遇到的一些先决条件和常见问题，同时我们启动了一堆容器，我们甚至简要介绍了如何缩放和分发服务。要记住，这只是一个开始。

干杯。

--------------------------------------------------------------------------------

作者简介：

我是 Igor Ljubuncic。现在大约 38 岁，已婚但还没有孩子。我现在在一个大胆创新的云科技公司做首席工程师。直到大约 2015 年初时，我还在一个全世界最大的 IT 公司之一中做系统架构工程师，和一个工程计算团队开发新的基于 Linux 的解决方案，优化内核以及攻克 Linux 的问题。在那之前，我是一个为高性能计算环境设计创新解决方案的团队的技术领导。还有一些其他花哨的头衔，包括系统专家、系统程序员等等。所有这些都曾是我的爱好，但从 2008 年开始成为了我的付费工作。还有什么比这更令人满意的呢？

从 2004 年到 2008 年间，我曾通过作为医学影像行业的物理学家来糊口。我的工作专长集中在解决问题和算法开发。为此，我广泛地使用了 Matlab，主要用于信号和图像处理。另外，我得到了几个主要的工程方法学的认证，包括 MEDIC 六西格玛绿带、试验设计以及统计工程学。

我也开始写书，包括奇幻类和 Linux 上的技术性工作。彼此交融。

要查看我开源项目、出版物和专利的完整列表，请滚动到下面。

有关我的奖项，提名和 IT 相关认证的完整列表，请稍等一下。

-------------


via: http://www.dedoimedo.com/computers/docker-swarm-adding-worker-nodes.html

作者：[Igor Ljubuncic][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/faq.html
[1]:https://linux.cn/article-8888-1.html
[2]:http://www.dedoimedo.com/computers/fedora-24-gnome.html
[3]:http://www.dedoimedo.com/computers/docker-centos-upgrade-latest.html
[4]:http://www.dedoimedo.com/computers/docker-guide.html
[5]:http://www.dedoimedo.com/computers/docker-networking.html
