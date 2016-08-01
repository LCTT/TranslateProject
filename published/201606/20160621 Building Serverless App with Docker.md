用 Docker 创建 serverless 应用
======================================

当今世界会时不时地出现一波波科技浪潮，将以前的技术拍死在海滩上。针对 serverless 应用的概念我们已经谈了很多，它是指将你的应用程序按功能来部署，这些功能在被用到时才会启动。你不用费心去管理服务器和程序规模，因为它们会在需要的时候在一个集群中启动并运行。

但是 serverless 并不意味着没有 Docker 什么事儿，事实上 Docker 就是 serverless 的。你可以使用 Docker 来容器化这些功能，然后在 Swarm 中按需求来运行它们。serverless 是一项构建分布式应用的技术，而 Docker 是它们完美的构建平台。

### 从 servers 到 serverless

那如何才能写一个 serverless 应用呢？来看一下我们的例子，[5个服务组成的投票系统][1]：

![](https://blog.docker.com/wp-content/uploads/Picture1.png)

投票系统由下面5个服务组成：

- 两个 web 前端
- 一个后台处理投票的进程
- 一个计票的消息队列
- 一个数据库

后台处理投票的进程很容易转换成 serverless 构架，我们可以使用以下代码来实现：

```
import dockerrun
client = dockerrun.from_env()
client.run("bfirsh/serverless-record-vote-task", [voter_id, vote], detach=True)
```

这个投票处理进程和消息队列可以用运行在 Swarm 上的 Docker 容器来代替，并实现按需自动部署。

我们也可以用容器替换 web 前端，使用一个轻量级 HTTP 服务器来触发容器响应一个 HTTP 请求。Docker 容器代替长期运行的 HTTP 服务器来挑起响应请求的重担，这些容器可以自动扩容来支撑更大访问量。

新的架构就像这样：

![](https://blog.docker.com/wp-content/uploads/Picture2.png)

红色框内是持续运行的服务，绿色框内是按需启动的容器。这个架构里需要你来管理的长期运行服务更少，并且可以自动扩容（最大容量由你的 Swarm 决定）。

### 我们可以做点什么？

你可以在你的应用中使用3种技术：

1. 在 Docker 容器中按需运行代码。
2. 使用 Swarm 来部署集群。
3. 通过使用 Docker API 套接字在容器中运行容器。

结合这3种技术，你可以有很多方法搭建你的应用架构。用这种方法来部署后台环境真是非常有效，而在另一些场景，也可以这么玩，比如说：

- 由于存在延时，使用容器实现面向用户的 HTTP 请求可能不是很合适，但你可以写一个负载均衡器，使用 Swarm 来对自己的 web 前端进行自动扩容。
- 实现一个 MongoDB 容器，可以自检 Swarm 并且启动正确的分片和副本（LCTT 译注：分片技术为大规模并行检索提供支持，副本技术则是为数据提供冗余）。

### 下一步怎么做

我们提供了这些前卫的工具和概念来构建应用，并没有深入发掘它们的功能。我们的架构里还是存在长期运行的服务，将来我们需要使用 Swarm 来把所有服务都用按需扩容的方式实现。

希望本文能在你搭建架构时给你一些启发，但我们还是需要你的帮助。我们提供了所有的基本工具，但它们还不是很完善，我们需要更多更好的工具、库、应用案例、文档以及其他资料。

[我们在这里发布了工具、库和文档][3]。如果想了解更多，请贡献给我们一些你知道的资源，以便我们能够完善这篇文章。

玩得愉快。

### 更多关于 Docker 的资料

- New to Docker? Try our 10 min [online tutorial][4]
- Share images, automate builds, and more with [a free Docker Hub account][5]
- Read the Docker [1.12 Release Notes][6]
- Subscribe to [Docker Weekly][7]
- Sign up for upcoming [Docker Online Meetups][8]
- Attend upcoming [Docker Meetups][9]
- Watch [DockerCon EU 2015 videos][10]
- Start [contributing to Docker][11]


--------------------------------------------------------------------------------

via: https://blog.docker.com/2016/06/building-serverless-apps-with-docker/

作者：[Ben Firshman][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.docker.com/author/bfirshman/

[1]: https://github.com/docker/example-voting-app
[3]: https://github.com/bfirsh/serverless-docker
[4]: https://docs.docker.com/engine/understanding-docker/ 
[5]: https://hub.docker.com/
[6]: https://docs.docker.com/release-notes/
[7]: https://www.docker.com/subscribe_newsletter/
[8]: http://www.meetup.com/Docker-Online-Meetup/
[9]: https://www.docker.com/community/meetup-groups
[10]: https://www.youtube.com/playlist?list=PLkA60AVN3hh87OoVra6MHf2L4UR9xwJkv
[11]: https://docs.docker.com/contributing/contributing/



