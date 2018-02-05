# 最小权限的容器协调器


Docker 平台和容器已经成为打包、部署、和管理应用程序的标准。为了在一个集群内协调跨节点的容器，必须有一个关键的能力：一个容器协调器。

![container orchestrator](https://i0.wp.com/blog.docker.com/wp-content/uploads/f753d4e8-9e22-4fe2-be9a-80661ef696a8-3.jpg?resize=536%2C312&ssl=1)

对于关键的集群化以及计划的任务，协调器是起重大作用的，比如：

*   管理容器计划和资源分配。

*   支持服务发现和无缝（hitless）应用程序部署。

*   分配应用程序运行必需的资源。

不幸的是，在这种环境下，协调器的分布式特性和资源的短暂性使得确保协调器的安全是一个极具挑战性的任务。在这篇文章中，我们将讨论容器协调器安全模型中没有考虑到的、但是很重要的方面的详细情况，以及 Docker 企业版中如何使用内置的编排性能、Swarm 模式，去克服这些问题。

诱因和威胁模型
============================================================

使用 swarm 模式的 Docker 企业版的其中一个主要目标是提供一个内置安全特性的协调器。为达到这个目标，我们部署了第一个在我们心目中认为的最小权限原则设计的容器协调器。

在计算机科学中，一个分布式系统所要求的最小权限原则是，系统中的每个参与着仅仅能访问它正当目的所需要的信息和资源。不是更多，也不是更少。

> #### “一个进程必须仅仅能去访问它的正当目的所需要的信息和资源”

#### 最小权限原则

在一个 Docker 企业版集群中的每个节点分配的角色：既不是管理者（manager），也不是工人（worker）。这些角色为节点定义了一个很粗粒度的权限级别：管理和运行各自的任务。尽管如此，不用理会它的内置的角色，通过使用加密的方式，来保证一个节点仅仅有执行它的任务所需要的信息和资源。结果是，防止大多数的复杂的攻击者模式：攻击者控制底层通讯网络，或者甚至是攻陷的集群节点，确保集群安全变得更容易了。

# 内核缺省安全

这是一个很老的安全最大化状态：如果它不是缺省的，没有一个使用它。Docker Swarm 模式将内核缺省安全这一概念融入了内核，并且使用这一机制去解决协调器生命周期中三个很难的并且很重要的部分：

1.  可信引导和节点引入。

2.  节点身份发布和管理。

3.  经过认证、授权、和加密的信息存储和传播。

我们来分别看一下这三个部分

### 可信引导和节点引入

确保集群安全的第一步，没有别的，就是严格控制成员和身份。管理员不能依赖它们节点的身份，并且在节点之间强制实行绝对的负载隔离。这意味着，未授权的节点不能允许加入到集群中，并且，已经是集群一部分的节点不能改变身份，突然去伪装成另一个节点。

为解决这种情况，通过 Docker 企业版 Swarm 模式管理的节点，维护了健壮的、不可改变的身份。期望的特性是，通过使用两种关键的构建块去保证加密：

1.  为集群成员使用安全加入令牌。

2.  从一个集中化的认证机构发行的内嵌唯一身份的证书。

### 加入 Swarm

去安全加入 Swarm，需要这个节点的令牌拷贝。在集群内的每个操作角色中，令牌是独一无二的 — 那里现在有两种类型的节点：工人（workers）和管理者（managers）。由于这种分隔，拥有一个工人令牌的节点将不允许以管理者角色加入到集群。唯一的方式是通过 swarm 的管理 API，去向集群管理者请求一个特殊的令牌。

令牌是安全的并且是随机生成的，它也有一个使得令牌漏洞更容易去检测的特殊语法：一个可以在你的日志和仓库中很容易监视的特殊前缀。幸运的是，即便发现一个漏洞，令牌也可以很容易去更新，并且，推荐你经常去更新它们 — 特别是，在一段时间中你的集群不进行扩大的情况下。

![Docker Swarm](https://i1.wp.com/blog.docker.com/wp-content/uploads/92d171d4-52c7-4702-8143-110c6f52017c-2.jpg?resize=547%2C208&ssl=1)

### 引导信任

作为它的身份标识创建的一部分，一个新的节点将向任意一个网络管理者请求发布一个新的身份。但是，在我们下面的威胁模型中，所有的通讯可以被一个第三方拦截。这种请求存在的问题是：一个节点怎么知道与它进行对话的对方是合法的管理者？

![Docker Security](https://i0.wp.com/blog.docker.com/wp-content/uploads/94e3fef0-5bd2-4970-b9e9-25b566d926ad-2.jpg?resize=528%2C348&ssl=1)

幸运的是，Docker 有一个内置机制可以避免这种情况。加入令牌，它被主机用于加入 Swarm，包含一个根 CA 证书的哈希串。所以，主机可以使用单向 TLS，并且使用这个哈希串去验证它加入的 Swarm 是否正确：如果管理者持有的证书没有被正确的 CA 哈希串签名，节点就知道它不可信任。

### 节点身份发布和管理

在一个 Swarm 中，身份标识是内嵌在每个节点都单独持有的一个 x509 证书中。在一个最小权限原则的表现中，证书的私钥被绝对限制到主机的原始位置。尤其是，管理者不能访问除了它自己的私钥以外的任何一个私钥。

### 身份发布

去接收它们的证书而无需共享它们的私钥，新的主机通过发布一个证书签名请求（CSR）来开始，管理者收到证书签名请求之后，转换成一个证书。这个证书成为这个新的主机的身份标识，使这个节点成为 Swarm 的一个完全合格成员！

#### 
![](https://i0.wp.com/blog.docker.com/wp-content/uploads/415ae6cf-7e76-4ba8-9d84-6d49bf327d8f-2.jpg?resize=548%2C350&ssl=1)

当和安全引导机制一起使用时，发行身份标识的这个机制去加入节点是缺省安全的：所有的通讯部分都是经过认证的、授权的，并且非敏感信息从来都不会以明文方式进行交换。

### 身份标识延期

尽管如此，给一个 Swarm 中安全地加入节点，仅仅是 “故事” 的一部分。为降低证书的漏洞或者失窃造成的影响，并且移除管理 CRL 列表的复杂性，Swarm 模式为身份标识使用了较短存活周期的证书。这些证书缺省情况下三个月后将过期，但是，也可以配置为一个小时后即刻过期！

![Docker secrets](https://i0.wp.com/blog.docker.com/wp-content/uploads/55e2ab9a-19cd-465d-82c6-fa76110e7ecd-2.jpg?resize=556%2C365&ssl=1)

这个较短的证书过期时间，意味着不能手动去处理证书更新，所以，通常会使用一个 PKI 系统。对于 Swarm，所有的证书是以一种不中断的方式进行自动更新的。这个过程很简单：使用一个相互认证的 TLS 连接去证明一个特定身份标识的所有者，一个 Swarm 节点定期生成一个新的公钥/私钥密钥对并且用相关的 CSR 去签名发送，创建一个维持相同身份标识的完整的新证书。

### 经过认证、授权、和加密的信息存储和传播。

在一个正常的 Swarm 的操作中，发送到工人（worker）节点去运行的关于任务的信息。这里不仅仅包含将被一个节点运行的容器的信息；也包含那个容器运行所必需的资源的所有的信息，包括敏感的秘密，比如，私钥、密码、和 API 令牌。

### 传输安全

事实上，参与 Swarm 的每个节点都拥有一个独一无二的 X509 格式的证书，因此，节点之间的通讯安全是没有问题的：节点使用它们各自的证书，与另一个连接方进行相互认证、继承机密、真实性、和 TLS 的完整性。

![Swarm Mode](https://i0.wp.com/blog.docker.com/wp-content/uploads/972273a3-d9e5-4053-8fcb-a407c8cdcbf6-2.jpg?resize=347%2C271&ssl=1)

关于 Swarm 模式的一个有趣的细节是，本质上它是使用了一个推送模式：仅管理者被允许去发送信息到工人们（workers）— 显著降低了暴露在低权限工人节点面前的管理者节点的攻击面。

### 将负载严格隔离进安全区域

管理者节点的其中一个责任是，去决定发送到每个工人（worker）节点的任务是什么。管理者节点使用多种策略去做这个决定；根据每个节点和每个负载的特性，去跨 Swarm 去安排负载。

在使用 Swarm 模式的 Docker 企业版中，管理者通过使用附加到每个单个节点标识上的安全标签，去影响这些安排决定。这些标签允许管理者将节点组与不同的安全区域连接到一起，以限制敏感负载暴露，以及使相关秘密信息更安全。

![Docker Swarm Security](https://i0.wp.com/blog.docker.com/wp-content/uploads/67ffa551-d4ae-4522-ba13-4a646a158592-2.jpg?resize=546%2C375&ssl=1)

### 安全分发秘密

除了加快身份标识发布过程之外，管理者节点还有存储和分发工人节点所需要的任何资源的任务。像任何其它类型的资源一样处理秘密，并且基于安全的 mTLS 连接，从管理者推送到工人节点。

![Docker Secrets](https://i1.wp.com/blog.docker.com/wp-content/uploads/4341da98-2f8c-4aed-bb40-607246344dd8-2.jpg?resize=508%2C326&ssl=1)

在主机上，Docker 企业版能确保秘密仅提供给它们指定的容器。在同一个主机上的其它容器并不能访问它们。Docker 以一个临时文件系统的方式显露秘密给一个容器，确保秘密总是保存在内存中，并且从不写入到磁盘。这种方式比其它竞争的替代者更加安全，比如，[在环境变量中存储它们][12]。一旦这个任务完成，这个秘密将永远消失。

### 存储秘密

在管理者主机上的秘密总是加密静止的。缺省情况下，加密这些秘密的密钥（被称为数据加密密钥，DEK）是以明文的方式存储在硬盘上的。这使得那些对安全性要求较低的人可以轻松地去使用 Docker Swarm 模式。

但是，如果你运行一个生产集群，我们推荐你启用自动锁定模式。当自动锁定模式启用后，一个重新更新过的 DEK 被一个独立的加密密钥加密（KEK）。这个密钥从不被存储在集群中；管理者有责任将它存储在一个安全可靠的地方，并且当集群启动的时候可以提供它。这就是所谓的 “解锁” Swarm。

根据 Raft 故障容错一致性算法，Swarm 模式支持多个管理者。在这个场景中，无缝扩展了秘密存储的安全性。每个管理者主机除了共享密钥之外 ，还有一个唯一的磁盘加密密钥。幸运的是，Raft 日志在磁盘上也是加密的，并且，在自动锁定模式下，没有 KEK 同样是不可访问的。

### 当一个节点被攻陷后发生了什么？

![Docker Secrets](https://i0.wp.com/blog.docker.com/wp-content/uploads/2a78b37d-bbf0-40ee-a282-eb0900f71ba9-2.jpg?resize=502%2C303&ssl=1)

在传统的协调器中，挽回一台被攻陷的主机是一个缓慢而复杂的过程。使用 Swarm 模式，恢复它就像运行一个 Docker 节点的 rm 命令一样容易。这是从集群中删除一个受影响的节点，而 Docker 将去处理剩下的事情，即，重新均衡负载，并且确保其它的主机已经知道，而不会去与受影响的节点通讯。

正如我们看到的那样，感谢最小权限协调器，甚至是，如果攻击者在主机上持续活动，它们将被从剩余的网络上切断。主机的证书 — 它的身份标识 — 被列入黑名单，因此，管理者也不能有效访问它。

# 结论

使用 Swarm 模式的 Docker 企业版，在缺省情况下确保了协调器的所有关键区域的安全：

*   加入集群。阻止恶意节点加入到集群。

*   安排主机进入安全区域。阻止攻击者的横向移动。

*   安排任务。任务将仅被委派到允许的节点。

*   分配资源。恶意节点不能 “盗取” 其它的负载或者资源。

*   存储秘密。从不明文保存并且从不写入到工人节点的磁盘上。

*   与工人节点的通讯。使用相互认证的 TLS 加密。

因为 Swarm 模式持续提升，Docker 团队正在努力将最小权限原则进一步推进。我们正在处理的一个任务是：如果一个管理者被攻陷了，怎么去保证剩下的节点的安全？路线图已经有了，其中一些功能已经可以使用，比如，白名单功能，仅允许特定的 Docker 镜像，阻止管理者随意运行负载。这是通过 Docker 可信内容来实现的。

--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/10/least-privilege-container-orchestration/

作者：[Diogo Mónica][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/diogo/
[1]:http://www.linkedin.com/shareArticle?mini=true&url=http://dockr.ly/2yZoNdy&title=Least%20Privilege%20Container%20Orchestration&summary=The%20Docker%20platform%20and%20the%20container%20has%20become%20the%20standard%20for%20packaging,%20deploying,%20and%20managing%20applications.%20In%20order%20to%20coordinate%20running%20containers%20across%20multiple%20nodes%20in%20a%20cluster,%20a%20key%20capability%20is%20required:%20a%20container%20orchestrator.Orchestrators%20are%20responsible%20for%20critical%20clustering%20and%20scheduling%20tasks,%20such%20as:%20%20%20%20Managing%20...
[2]:http://www.reddit.com/submit?url=http://dockr.ly/2yZoNdy&title=Least%20Privilege%20Container%20Orchestration
[3]:https://plus.google.com/share?url=http://dockr.ly/2yZoNdy
[4]:http://news.ycombinator.com/submitlink?u=http://dockr.ly/2yZoNdy&t=Least%20Privilege%20Container%20Orchestration
[5]:https://blog.docker.com/author/diogo/
[6]:https://blog.docker.com/tag/docker-orchestration/
[7]:https://blog.docker.com/tag/docker-secrets/
[8]:https://blog.docker.com/tag/docker-security/
[9]:https://blog.docker.com/tag/docker-swarm/
[10]:https://blog.docker.com/tag/least-privilege-orchestrator/
[11]:https://blog.docker.com/tag/tls/
[12]:https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/


