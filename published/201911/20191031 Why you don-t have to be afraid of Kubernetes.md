[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11539-1.html)
[#]: subject: (Why you don't have to be afraid of Kubernetes)
[#]: via: (https://opensource.com/article/19/10/kubernetes-complex-business-problem)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

为什么你不必害怕 Kubernetes
======

> Kubernetes 绝对是满足复杂 web 应用程序需求的最简单、最容易的方法。

![Digital creative of a browser on the internet][1]

在 90 年代末和 2000 年代初，在大型网站工作很有趣。我的经历让我想起了 American Greetings Interactive，在情人节那天，我们拥有了互联网上排名前 10 位之一的网站（以网络访问量衡量）。我们为 [AmericanGreetings.com][2]、[BlueMountain.com][3] 等公司提供了电子贺卡，并为 MSN 和 AOL 等合作伙伴提供了电子贺卡。该组织的老员工仍然深切地记得与 Hallmark 等其它电子贺卡网站进行大战的史诗般的故事。顺便说一句，我还为 Holly Hobbie、Care Bears 和 Strawberry Shortcake 运营过大型网站。

我记得那就像是昨天发生的一样，这是我们第一次遇到真正的问题。通常，我们的前门（路由器、防火墙和负载均衡器）有大约 200Mbps 的流量进入。但是，突然之间，Multi Router Traffic Grapher（MRTG）图示突然在几分钟内飙升至 2Gbps。我疯了似地东奔西跑。我了解了我们的整个技术堆栈，从路由器、交换机、防火墙和负载平衡器，到 Linux/Apache web 服务器，到我们的 Python 堆栈（FastCGI 的元版本），以及网络文件系统（NFS）服务器。我知道所有配置文件在哪里，我可以访问所有管理界面，并且我是一位经验丰富的，打过硬仗的系统管理员，具有多年解决复杂问题的经验。

但是，我无法弄清楚发生了什么……

当你在一千个 Linux 服务器上疯狂地键入命令时，五分钟的感觉就像是永恒。我知道站点可能会在任何时候崩溃，因为当它被划分成更小的集群时，压垮上千个节点的集群是那么的容易。

我迅速*跑到*老板的办公桌前，解释了情况。他几乎没有从电子邮件中抬起头来，这使我感到沮丧。他抬头看了看，笑了笑，说道：“是的，市场营销可能会开展广告活动。有时会发生这种情况。”他告诉我在应用程序中设置一个特殊标志，以减轻 Akamai 的访问量。我跑回我的办公桌，在上千台 web 服务器上设置了标志，几分钟后，站点恢复正常。灾难也就被避免了。

我可以再分享 50 个类似的故事，但你脑海中可能会有一点好奇：“这种运维方式将走向何方?”

关键是，我们遇到了业务问题。当技术问题使你无法开展业务时，它们就变成了业务问题。换句话说，如果你的网站无法访问，你就不能处理客户交易。

那么，所有这些与 Kubernetes 有什么关系？一切！世界已经改变。早在 90 年代末和 00 年代初，只有大型网站才出现大型的、<ruby>规模级<rt>web-scale</rt></ruby>的问题。现在，有了微服务和数字化转型，每个企业都面临着一个大型的、规模级的问题——可能是多个大型的、规模级的问题。

你的企业需要能够通过许多不同的人构建的许多不同的、通常是复杂的服务来管理复杂的规模级的网站。你的网站需要动态地处理流量，并且它们必须是安全的。这些属性需要在所有层（从基础结构到应用程序层）上由 API 驱动。

### 进入 Kubernetes

Kubernetes 并不复杂；你的业务问题才复杂。当你想在生产环境中运行应用程序时，要满足性能（伸缩性、性能抖动等）和安全性要求，就需要最低程度的复杂性。诸如高可用性（HA）、容量要求（N+1、N+2、N+100）以及保证最终一致性的数据技术等就会成为必需。这些是每家进行数字化转型的公司的生产要求，而不仅仅是 Google、Facebook 和 Twitter 这样的大型网站。

在旧时代，我还在 American Greetings 任职时，每次我们加入一个新的服务，它看起来像这样：所有这些都是由网站运营团队来处理的，没有一个是通过订单系统转移给其他团队来处理的。这是在 DevOps 出现之前的 DevOps：

  1. 配置 DNS（通常是内部服务层和面向公众的外部）
  2. 配置负载均衡器（通常是内部服务和面向公众的）
  3. 配置对文件的共享访问（大型 NFS 服务器、群集文件系统等）
  4. 配置集群软件（数据库、服务层等）
  5. 配置 web 服务器群集（可以是 10 或 50 个服务器）

大多数配置是通过配置管理自动完成的，但是配置仍然很复杂，因为每个系统和服务都有不同的配置文件，而且格式完全不同。我们研究了像 [Augeas][4] 这样的工具来简化它，但是我们认为使用转换器来尝试和标准化一堆不同的配置文件是一种反模式。

如今，借助 Kubernetes，启动一项新服务本质上看起来如下：

  1. 配置 Kubernetes YAML/JSON。
  2. 提交给 Kubernetes API（`kubectl create -f service.yaml`）。

Kubernetes 大大简化了服务的启动和管理。服务所有者（无论是系统管理员、开发人员还是架构师）都可以创建 Kubernetes 格式的 YAML/JSON 文件。使用 Kubernetes，每个系统和每个用户都说相同的语言。所有用户都可以在同一 Git 存储库中提交这些文件，从而启用 GitOps。

而且，可以弃用和删除服务。从历史上看，删除 DNS 条目、负载平衡器条目和 Web 服务器的配置等是非常可怕的，因为你几乎肯定会破坏某些东西。使用 Kubernetes，所有内容都处于命名空间下，因此可以通过单个命令删除整个服务。尽管你仍然需要确保其它应用程序不使用它（微服务和函数即服务 [FaaS] 的缺点），但你可以更加确信：删除服务不会破坏基础架构环境。

### 构建、管理和使用 Kubernetes

太多的人专注于构建和管理 Kubernetes 而不是使用它（详见 [Kubernetes 是一辆翻斗车][5]）。

在单个节点上构建一个简单的 Kubernetes 环境并不比安装 LAMP 堆栈复杂得多，但是我们无休止地争论着构建与购买的问题。不是 Kubernetes 很难；它以高可用性大规模运行应用程序。建立一个复杂的、高可用性的 Kubernetes 集群很困难，因为要建立如此规模的任何集群都是很困难的。它需要规划和大量软件。建造一辆简单的翻斗车并不复杂，但是建造一辆可以运载 [10 吨垃圾并能以 200 迈的速度稳定行驶的卡车][6]则很复杂。

管理 Kubernetes 可能很复杂，因为管理大型的、规模级的集群可能很复杂。有时，管理此基础架构很有意义；而有时不是。由于 Kubernetes 是一个社区驱动的开源项目，它使行业能够以多种不同方式对其进行管理。供应商可以出售托管版本，而用户可以根据需要自行决定对其进行管理。（但是你应该质疑是否确实需要。）

使用 Kubernetes 是迄今为止运行大规模网站的最简单方法。Kubernetes 正在普及运行一组大型、复杂的 Web 服务的能力——就像当年 Linux 在 Web 1.0 中所做的那样。

由于时间和金钱是一个零和游戏，因此我建议将重点放在使用 Kubernetes 上。将你的时间和金钱花费在[掌握 Kubernetes 原语][7]或处理[活跃度和就绪性探针][8]的最佳方法上（表明大型、复杂的服务很难的另一个例子）。不要专注于构建和管理 Kubernetes。（在构建和管理上）许多供应商可以为你提供帮助。

### 结论

我记得对无数的问题进行了故障排除，比如我在这篇文章的开头所描述的问题——当时 Linux 内核中的 NFS、我们自产的 CFEngine、仅在某些 Web 服务器上出现的重定向问题等）。开发人员无法帮助我解决所有这些问题。实际上，除非开发人员具备高级系统管理员的技能，否则他们甚至不可能进入系统并作为第二双眼睛提供帮助。没有带有图形或“可观察性”的控制台——可观察性在我和其他系统管理员的大脑中。如今，有了 Kubernetes、Prometheus、Grafana 等，一切都改变了。

关键是：

  1. 时代不一样了。现在，所有 Web 应用程序都是大型的分布式系统。就像 AmericanGreetings.com 过去一样复杂，现在每个网站都有扩展性和 HA 的要求。
  2. 运行大型的分布式系统是很困难的。绝对是。这是业务的需求，不是 Kubernetes 的问题。使用更简单的编排系统并不是解决方案。

Kubernetes 绝对是满足复杂 Web 应用程序需求的最简单，最容易的方法。这是我们生活的时代，而 Kubernetes 擅长于此。你可以讨论是否应该自己构建或管理 Kubernetes。有很多供应商可以帮助你构建和管理它，但是很难否认这是大规模运行复杂 Web 应用程序的最简单方法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/kubernetes-complex-business-problem

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: http://AmericanGreetings.com
[3]: http://BlueMountain.com
[4]: http://augeas.net/
[5]: https://linux.cn/article-11011-1.html
[6]: http://crunchtools.com/kubernetes-10-ton-dump-truck-handles-pretty-well-200-mph/
[7]: https://linux.cn/article-11036-1.html
[8]: https://srcco.de/posts/kubernetes-liveness-probes-are-dangerous.html
