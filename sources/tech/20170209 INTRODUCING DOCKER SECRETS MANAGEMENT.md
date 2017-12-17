
Dockers Secrets 管理介绍
=========================

容器正在改变我们对应用程序和基础设施的看法。无论容器内的代码量是大还是小，容器架构引入了一种代码与硬件起作用方式的变化 – 它从根本上将其从基础设施中抽象出来。对于容器安全来说，Docker这里有三个关键部分。且他们共同引起了本质上更安全的应用程序。

 ![Docker Security](https://i2.wp.com/blog.docker.com/wp-content/uploads/e12387a1-ab21-4942-8760-5b1677bc656d-1.jpg?w=1140&ssl=1) 
 
构建更安全的应用程序的一个关键因素是与其他应用程序和系统进行安全通信，这通常需要证书、tokens、密码和其他类型的验证信息凭证--通常称为应用程序 secret。我们很高兴介绍Docker Sercets，Docker Secrets 是容器的本土解决方案，是加强容器安全的可信赖交付组件，用户可以在容器平台上直接集成 secret 分配功能。

有了容器，现在应用程序在多环境下是动态的、可移植的。这使得现存的 secret 分布解决方案略显不足，因为他们都是针对静态环境。不幸的是，这导致了应用程序secrets不善管理的增加，使其总是找到安全的，本土的解决方案，比如像GitHub嵌入secrets到版本控制系统，或着同样糟糕是像马后炮一样的定点解决。

### Docker Secerts 管理介绍

根本上我们认为，如果有一个标准的接口来访问secrets，应用程序就更安全了。任何好的解决方案也必须遵循安全性实践，例如在传输的过程中，对secrets进行加密；在休息的时候对secrets进行加密；防止无意中泄露最终应用所消耗的secrets；并严格遵守最小特权原则即应用程序只能访问所需的secrets，不能多也不能不少。

通过将secrets整合向docker的业务流程，我们能够在遵循这些确切的原则下为secrets管理问题提供一种解决方案。

下图提供了一个高层次视图，并展示了Docker swarm mode结构是如何将一种新类型的对象安全地传递给我们的容器：一个secret对象。

 ![Docker Secrets Management](https://i0.wp.com/blog.docker.com/wp-content/uploads/b69d2410-9e25-44d8-aa2d-f67b795ff5e3.jpg?w=1140&ssl=1) 

 
在Docker中，一个secret是任意的数据块，比如密码、SSH 密钥、TLS凭证，或者对自然界敏感的每一块数据。当你将一个secret加入swarm（通过执行`docker secret create`）时，docker利用在引导一个新的swarm时自动创建的内置的证书权威，通过相互认证的TLS连接把secret交给swarm管理。

```
$ echo "This is a secret" | docker secret create my_secret_data -
```

一旦，secret 达到一个管理节点，它就会被保存在采用NaCl的salsa20poly1305与一个256位的密钥来确保没有任何数据写入磁盘加密的 Raft store 中。 向内部存储写入secrets，保证了数据管理的大量获取。

当 swarm 管理器启动的时，包含secrets的被加密过的Raft日志通过每一个节点唯一的数据密钥进行解密。此密钥和用于与集群其余部分通信的节点的TLS凭据可以使用一个集群范围的密钥加密密钥进行加密，该密钥称为“解锁密钥”，还使用Raft进行传播，将且会在管理器启动的时候被要求。

当授予新创建或运行的服务访问某个secret时，管理器节的其中一个节点（只有管理人员可以访问被存储的所有存储secrets），将已建立的TLS连接发送给正在运行特定服务的节点。这意味着节点自己不能请求secrets，并且只有在管理员提供给他们的secrets时才能访问这些secrets——严格地要求那些需要他们的服务。如果一个服务被删除了，或者被重新安排在其他地方，管理员能够很快的注意到那些不再需要访问将它从内存中消除的secret 的所有节点，且那节点将不能够访问应用程序的secret。

```
$ docker service  create --name="redis" --secret="my_secret_data" redis:alpine
```

未加密的 secret 被安装到 /run/secrests/<secret name> 内存文件系统的容器中

```
$ docker exec $(docker ps --filter name=redis -q) ls -l /run/secrets
total 4
-r--r--r--    1 root     root            17 Dec 13 22:48 my_secret_data
```

如果一个服务被删除了，或者被重新安排在其他地方，管理员能够很快的注意到那些不再需要访问将它从内存中消除的secret 的所有节点，且那节点将不能够访问应用程序的secret。

```
$ docker service update --secret-rm="my_secret_data" redis

$ docker exec -it $(docker ps --filter name=redis -q) cat /run/secrets/my_secret_data

cat: can't open '/run/secrets/my_secret_data': No such file or directory
```

为了获得更多的信息和一些说明如何创建和管理secrets的例子可以看Docker secrets 文档。同时，特别推荐Docker 安全合作团 Laurens Van Houtven (https://www.lvh.io/) 和是这一特性成为现实的团队。

[Get safer apps for dev and ops w/ new #Docker secrets management][5]

[CLICK TO TWEET][6]

### 
![Docker Security](https://i2.wp.com/blog.docker.com/wp-content/uploads/Screenshot-2017-02-08-23.30.13.png?resize=1032%2C111&ssl=1)

### 通过 Docker 更安全地使用应用程序 

Docker secrets 为开发者设计成更易于使用且IT 运维团队用它来构建和运行更加安全的运用程序。Docker secrets 是首个被设计为既能保持secret安全又能仅在当被需要secret操作的确切容器需要的使用的容器结构。从通过直接在 Docker 数据中心开发部件文件的IT管理员并使用 Docker 组件来定义应用程序和secrets 来看，服务器、secrets、网络和 volumes 将能够安全可靠地使用应用程序。

更多相关学习资源:

*   [1.13 Docker 数据中心具有 Secrets, 安全扫描、容量缓存等新特性][7]

*   [下载 Docker ][8] 且开始学习

*   [在 Docker 数据中心尝试使用 secrets][9]

*   [阅读文档][10]

*   参与 [即将进行的在线研讨会][11]

--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/02/docker-secrets-management/

作者：[ Ying Li][a]
译者：[HardworkFish](https://github.com/HardworkFish)
校对：[校对者ID](https://github.com/校对者ID)

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
