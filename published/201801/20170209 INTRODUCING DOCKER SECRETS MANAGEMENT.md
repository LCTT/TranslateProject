Docker 涉密信息管理介绍
====================================

容器正在改变我们对应用程序和基础设施的看法。无论容器内的代码量是大还是小，容器架构都会引起代码如何与硬件相互作用方式的改变 —— 它从根本上将其从基础设施中抽象出来。对于容器安全来说，在 Docker 中，容器的安全性有三个关键组成部分，它们相互作用构成本质上更安全的应用程序。

![Docker Security](https://i2.wp.com/blog.docker.com/wp-content/uploads/e12387a1-ab21-4942-8760-5b1677bc656d-1.jpg?w=1140&ssl=1) 
 
构建更安全的应用程序的一个关键因素是与系统和其他应用程序进行安全通信，这通常需要证书、令牌、密码和其他类型的验证信息凭证 —— 通常称为应用程序<ruby>涉密信息<rt>secrets</rt></ruby>。我们很高兴可以推出 Docker Secrets，这是一个容器原生的解决方案，它是加强容器安全的<ruby>可信赖交付<rt>Trusted Delivery</rt></ruby>组件，用户可以在容器平台上直接集成涉密信息分发功能。

有了容器，现在应用程序是动态的，可以跨越多种环境移植。这使得现存的涉密信息分发的解决方案略显不足，因为它们都是针对静态环境。不幸的是，这导致了应用程序涉密信息管理不善的增加，在不安全的、土造的方案中（如将涉密信息嵌入到 GitHub 这样的版本控制系统或者同样糟糕的其它方案），这种情况十分常见。

### Docker 涉密信息管理介绍

根本上我们认为，如果有一个标准的接口来访问涉密信息，应用程序就更安全了。任何好的解决方案也必须遵循安全性实践，例如在传输的过程中，对涉密信息进行加密；在不用的时候也对涉密数据进行加密；防止涉密信息在应用最终使用时被无意泄露；并严格遵守最低权限原则，即应用程序只能访问所需的涉密信息，不能多也不能不少。

通过将涉密信息整合到 Docker 编排，我们能够在遵循这些确切的原则下为涉密信息的管理问题提供一种解决方案。

下图提供了一个高层次视图，并展示了 Docker swarm 模式体系架构是如何将一种新类型的对象 —— 一个涉密信息对象，安全地传递给我们的容器。

![Docker Secrets Management](https://i0.wp.com/blog.docker.com/wp-content/uploads/b69d2410-9e25-44d8-aa2d-f67b795ff5e3.jpg?w=1140&ssl=1) 

在 Docker 中，涉密信息是任意的数据块，比如密码、SSH 密钥、TLS 凭证，或者任何其他本质上敏感的数据。当你将一个涉密信息加入 swarm 集群（通过执行 `docker secret create` ）时，利用在引导新集群时自动创建的[内置证书颁发机构][17]，Docker 通过相互认证的 TLS 连接将密钥发送给 swarm 集群管理器。

```
$ echo "This is a secret" | docker secret create my_secret_data -
```

一旦，涉密信息到达某个管理节点，它将被保存到内部的 Raft 存储区中。该存储区使用 NACL 开源加密库中的 Salsa20、Poly1305 加密算法生成的 256 位密钥进行加密，以确保从来不会把任何涉密信息数据写入未加密的磁盘。将涉密信息写入到内部存储，赋予了涉密信息跟其它 swarm 集群数据一样的高可用性。

当 swarm 集群管理器启动时，包含涉密信息的加密 Raft 日志通过每一个节点独有的数据密钥进行解密。此密钥以及用于与集群其余部分通信的节点 TLS 证书可以使用一个集群级的加密密钥进行加密。该密钥称为“解锁密钥”，也使用 Raft 进行传递，将且会在管理器启动的时候使用。

当授予新创建或运行的服务权限访问某个涉密信息权限时，其中一个管理器节点（只有管理器可以访问被存储的所有涉密信息）会通过已经建立的 TLS 连接将其分发给正在运行特定服务的节点。这意味着节点自己不能请求涉密信息，并且只有在管理器提供给他们的时候才能访问这些涉密信息 —— 严格地控制请求涉密信息的服务。

```
$ docker service  create --name="redis" --secret="my_secret_data" redis:alpine
```

未加密的涉密信息被挂载到一个容器，该容器位于 `/run/secrets/<secret_name>` 的内存文件系统中。

```
$ docker exec $(docker ps --filter name=redis -q) ls -l /run/secrets
total 4
-r--r--r--    1 root     root            17 Dec 13 22:48 my_secret_data
```

如果一个服务被删除或者被重新安排在其他地方，集群管理器将立即通知所有不再需要访问该涉密信息的节点，这些节点将不再有权访问该应用程序的涉密信息。

```
$ docker service update --secret-rm="my_secret_data" redis

$ docker exec -it $(docker ps --filter name=redis -q) cat /run/secrets/my_secret_data

cat: can't open '/run/secrets/my_secret_data': No such file or directory
```

查看 [Docker Secret 文档][18]以获取更多信息和示例，了解如何创建和管理您的涉密信息。同时，特别感谢 [Laurens Van Houtven](https://www.lvh.io/) 与 Docker 安全和核心团队合作使这一特性成为现实。

### 通过 Docker 更安全地使用应用程序 

Docker 涉密信息旨在让开发人员和 IT 运营团队可以轻松使用，以用于构建和运行更安全的应用程序。它是首个被设计为既能保持涉密信息安全，并且仅在特定的容器需要它来进行必要的涉密信息操作的时候使用。从使用 Docker Compose 定义应用程序和涉密数据，到 IT 管理人员直接在 Docker Datacenter 中部署的 Compose 文件，涉密信息、网络和数据卷都将加密并安全地与应用程序一起传输。

更多相关学习资源:

*   [1.13 Docker 数据中心具有 Secrets、安全扫描、容量缓存等新特性][7]
*   [下载 Docker][8] 且开始学习
*   [在 Docker 数据中心尝试使用 secrets][9]
*   [阅读文档][10]
*   参与 [即将进行的在线研讨会][11]

--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/02/docker-secrets-management/

作者：[Ying Li][a]
译者：[HardworkFish](https://github.com/HardworkFish)
校对：[imquanquan](https://github.com/imquanquan), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/yingli/
[1]:http://www.linkedin.com/shareArticle?mini=true&url=http://dockr.ly/2k6gnOB&title=Introducing%20Docker%20Secrets%20Management&summary=Containers%20are%20changing%20how%20we%20view%20apps%20and%20infrastructure.%20Whether%20the%20code%20inside%20containers%20is%20big%20or%20small,%20container%20architecture%20introduces%20a%20change%20to%20how%20that%20code%20behaves%20with%20hardware%20-%20it%20fundamentally%20abstracts%20it%20from%20the%20infrastructure.%20Docker%20believes%20that%20there%20are%20three%20key%20components%20to%20container%20security%20and%20...
[2]:http://www.reddit.com/submit?url=http://dockr.ly/2k6gnOB&title=Introducing%20Docker%20Secrets%20Management
[3]:https://plus.google.com/share?url=http://dockr.ly/2k6gnOB
[4]:http://news.ycombinator.com/submitlink?u=http://dockr.ly/2k6gnOB&t=Introducing%20Docker%20Secrets%20Management
[5]:https://twitter.com/share?text=Get+safer+apps+for+dev+and+ops+w%2F+new+%23Docker+secrets+management+&via=docker&related=docker&url=http://dockr.ly/2k6gnOB
[6]:https://twitter.com/share?text=Get+safer+apps+for+dev+and+ops+w%2F+new+%23Docker+secrets+management+&via=docker&related=docker&url=http://dockr.ly/2k6gnOB
[7]:http://dockr.ly/AppSecurity
[8]:https://www.docker.com/getdocker
[9]:http://www.docker.com/trial
[10]:https://docs.docker.com/engine/swarm/secrets/
[11]:http://www.docker.com/webinars
[12]:https://blog.docker.com/author/yingli/
[13]:https://blog.docker.com/tag/container-security/
[14]:https://blog.docker.com/tag/docker-security/
[15]:https://blog.docker.com/tag/secrets-management/
[16]:https://blog.docker.com/tag/security/
[17]:https://docs.docker.com/engine/swarm/how-swarm-mode-works/pki/
[18]:https://docs.docker.com/engine/swarm/secrets/
[19]:https://lvh.io%29/
