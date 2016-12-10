监控微服务的5条原则
====

![](http://thenewstack.io/wp-content/uploads/2016/09/toppicsysdig.jpg)

我们对微服务的需求可以归纳为一个词：速度。更快提供功能完善且可靠的软件的需求，彻底改变了软件开发模式。毫无疑问，这改变对软件管理，包括系统监控的方式，都产生了影响。这里，我们重点放在有效的监控微服务所需做出的巨大改变。我们将为这一新的软件开发模式拟定 5 条原则来调整你的监控方法。

监控是微服务控制系统的关键部分，你的软件越复杂，那么你就越难了解其性能及问题排障。鉴于软件交付发生的巨大改变，监控系统同样需要进行彻底的改造，以便在微服务环境下表现更好。文章接下来介绍监控微服务的 5 条原则，如下：

1. 监控容器和里面的东西。
2. 在服务性能上做监控，而不是容器性能。
3. 监控弹性和多位置服务
4. 监控开发接口。
5. 将您的监控映射到您的组织结构。

利用这 5 条原则，你可以在向微服务前进的道路上，建立更有效的对微服务的监控。这些原则，可以让你应对随着微服务而来的技术变化和组织变化。


### 微服务监控的原则

#### 1.监控容器和里面的东西

容器是微服务的重要组成部分，容器的速度、可移植性和隔离特性让开发者很方便的建立微服务的模型。容器的好处已经写的够多了，在这里我们不再重复。

容器对于其他的系统来说就像是黑盒子。这对于开发来说大有裨益，从开发到生产，甚至从开发者笔记本到云端，为它们带来高度的可移植性。但是当运行起来后，监控和解决服务问题时，这个黑盒子让常规的方法难以奏效了，我们会想：容器里到底在运行着什么？程序和代码运行性能如何？它有什么重要的输出指标吗？从开发者的视角，你需要对容器有更深的了解而不是仅仅知道一些容器的存在。

![](http://thenewstack.io/wp-content/uploads/2016/09/greatfordev.jpg)

非容器环境下衡量的典型做法，是让一个代理程序运行在用户处的一台主机或者虚机上，但这并不适用于容器。容器的优点是小，将各种进程分离开来，并尽可能的减少依赖关系。

从规模上看，成千上万的监测代理，对即使是一个中等大小的部署都是一个昂贵的资源浪费和管理的噩梦。对于容器有两个潜在的解决方案：1）要求你的开发人员直接提交他们的代码，或者2）利用一个通用的内核级的检测方法来查看主机上的所有应用程序和容器活动。这里我们不会深入说明，但每一种方法都有其优点和缺点。

#### 2. 利用业务流程系统提醒服务性能

理解容器容器中的运行数据并不容易，一个单一容器相比组成一个功能或服务的所有容器聚合后，度量值要低得多。

这特别适用于应用程序级别的信息，比如哪个请求拥有最短响应时间，或者哪些 URLs 有最多的错误，但它同样也适用于底层级别的监测，比如哪个服务的容器使用 CPU  资源超过了事先分配的资源数。

越来越多的软件部署需要一个<ruby>编排系统<rt> orchestration system</rt></ruby>，将逻辑化的应用程序转化到一个物理的容器中。常见的编排系统包括 Kubernetes、Mesosphere DC/OS 和 Docker Swarm。团队用一个编排系统来（1）定义微服务（2）理解部署的每个服务的当前状态。你可以认为编排系统甚至比容器还重要。容器是短暂的，只有满足你的服务需求才会存在。

DevOps 团队应该将告警重点放到尽可能贴近服务监控的运行特征上。如果应用受到了影响，这些告警是评估事态的第一道防线。但是获得这些告警并不容易，除非你的监控系统是容器本地的。

<ruby>[容器原生]<rt>Container-native</rt></ruby>[1]解决方案利用<ruby>编排元数据<rt>orchestration metadata</rt></ruby>来动态聚合容器和应用程序数据，并按每个服务计算监控度量。根据您的编排工具，您可能想在不同层次进行深入检测。比如，在 Kubernetes 里，你通常有 Namespace、ReplicaSets、Pods 和一些其他容器。这些不同的层聚合，对排除逻辑故障是很有必要的，与构成服务的容器的物理部署无关。

![](http://thenewstack.io/wp-content/uploads/2016/09/servicemonitoring.jpg)

#### 3. 监控<ruby>弹性<rt>Elastic</rt></ruby>和<ruby>多地部署<rt>Multi-Location</rt></ruby>的服务

弹性服务不是一个新概念，但是它在原生容器环境中的变化速度比在虚拟环境中快的多。迅速的变化会严重影响检测系统的正常运行。

经常监测变化的系统，需要根据软件部署，手动调整检查指标。这种调整可以是具体的，如定义要捕获的单个指标，或基于应用程序在一个特定的容器中的操作，配置要收集的数据。小规模上（比如几十个容器）我们可以接受，但是再大规模就难以承受了。微服务的集中监控必须能够自由的随弹性服务而增长和缩减，无需人工干预。

比如，如果为了监控 DevOps 团队必须手动定义包含容器的服务，他们毫无疑问会失手，因为 Kubernetes 或者 Mesos 每天定期的创建新的容器。同样，如果代码生成并置于生产环境时要求 Ops 团队安装一个<ruby>配置终结点<rt>custom stats endpoint</rt></ruby>，也给开发者从 Docker 仓库获取基础镜像带来更多的挑战。

在生产中，建立对跨越多个数据中心或多个云的复杂部署的监控，比如，如果你的服务跨越私有数据中心 和 AWS，那么亚马逊的 AWS CloudWatch 就很难做到这一点。还是要建立一个跨不同地域的监控系统，并可在动态的原生容器环境下运行。（In production, build monitoring toward a sophisticated deployment that spans multiple data centers or multiple clouds. Leveraging, for example, AWS CloudWatch will only get you so far if your services span your private data center as well as AWS. That leads back to implementing a monitoring system that can span these different locations as well as operate in dynamic, container-native environments.That leads back to implementing a monitoring system that can span these different locations as well as operate in dynamic, container-native environments.）

#### 4.监控开发接口

在微服务环境中，API 接口是通用的。它们是一个服务暴露给其他团队的唯一组件。事实上，API的响应和一致性可以看作是“内部 SLA”，即使还没有定义一个正式的 SLA（服务等级协议）。

因此，API 接口的监控也是必要的。API 监控可以有不同的形式，但是它绝对不是简单的二进制上下检查。例如，了解作为时间函数最常使用的点是有价值的。这使得团队可以看到服务使用的变化，无论是由于设计变更或用户的改变。

你也可以记录服务最缓慢的点，这些可能揭示出重大的问题，或者至少指向需要在系统中做优化的区域。

最后，跟踪系统服务响应的能力是另一个很重要的能力，它主要是开发者使用，也能帮助你了解整体用户体验，同时将信息基于底层和应用程序视角分成两大部分。

#### 5. 将您的监控映射到您的组织结构

这篇文章着重在微服务和监控上，像其他科技文章一样，这是因为很多人都关注此层面。

对于那些熟悉<ruby>[康威定律]<rt> Conway’s law</rt></ruby>[2]的人来说，系统的设计是基于开发团队的组织结构。创造更快，更敏捷的软件的压力，推动团队思考重新调整他们的开发组织和管理它的规则。

![](http://thenewstack.io/wp-content/uploads/2016/09/mapmonitoring.jpg)

所以，如果他们想从这个新的软件架构（微服务）上获益，他们的团队必须将微服务映射到团队自身中。也就是说，他们需要更小的更松散耦合的团队，可以选择自己的方向只要能够满足整个需求即可。在每一个团队中，对于开发语言的使用，bug的提交甚至工作职责都会有更大的控制能力。

DevOps 团队对此可以启用一个监控平台：让每一个微服务团队可以有自己的警报，度量指标，和控制面板，同时也要给出整体系统的视图。

### 总结

快捷让微服务流行起来。开发组织要想更快的为客户提供更多的功能，然后微服务技术就来了，架构转向微服务并且容器的流行让快捷开发成为可能，所有相关的进程理所当然的搭上了这辆火车。

最后，基本的监控原则需要适应伴随微服务而来的技术和结构。越早认识到这种转变的开发团队，能更早更容易的适应微服务这一新的架构。

--------------------------------------------------------------------------------

via: http://thenewstack.io/five-principles-monitoring-microservices/

作者：[Apurva Dave][a] [Loris Degioanni][b]
译者：[jiajia9linuxer](https://github.com/jiajia9linuxer)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://thenewstack.io/author/apurvadave/
[b]: http://thenewstack.io/author/lorisdegioanni/
[1]:https://techcrunch.com/2016/04/27/lets-define-container-native/
[2]:https://en.wikipedia.org/wiki/Conway%27s_law
