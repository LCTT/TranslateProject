并发服务器（五）：Redis 案例研究
======
这是我写的并发网络服务器系列文章的第五部分。在前四部分中我们讨论了并发服务器的结构，这篇文章我们将去研究一个在生产系统中大量使用的服务器的案例—— [Redis][10]。

![Redis logo](https://eli.thegreenplace.net/images/2017/redis_logo.png)

Redis 是一个非常有魅力的项目，我关注它很久了。它最让我着迷的一点就是它的 C 源代码非常清晰。它也是一个高性能大并发内存数据库服务器的非常好的例子，它是研究网络并发服务器的一个非常好的案例，因此，我们不能错过这个好机会。

我们来看看前四部分讨论的概念在真实世界中的应用程序。

本系列的所有文章有：

*   [第一节 - 简介][3]

*   [第二节 - 线程][4]

*   [第三节 - 事件驱动][5]

*   [第四节 - libuv][6]

*   [第五节 - Redis 案例研究][7]

### 事件处理库

Redis 最初发布于 2009 年，它最牛逼的一件事情大概就是它的速度 —— 它能够处理大量的并发客户端连接。需要特别指出的是，它是用一个单线程来完成的，而且还不对保存在内存中的数据使用任何复杂的锁或者同步机制。

Redis 之所以如此牛逼是因为，它在一个给定的系统上使用了可用的最快事件循环，并将它们封装成由它实现的事件循环库（在 Linux 上是 epoll，在 BSD 上是 kqueue，等等）。这个库的名字叫做 [ae][11]。使用 ae 来写一个快速服务器变得很容易，只要在它内部没有阻塞即可，而 Redis 则保证[[1]][12]了这一点。

在这里，我们的兴趣点主要是它对文件事件的支持 —— 当文件描述符（类似于网络套接字）有一些有趣的未决事情时将调用注册的回调函数。与 libuv 类似，ae 支持多路事件循环和不应该感到意外的 aeCreateFileEvent 信号：

```
int aeCreateFileEvent(aeEventLoop *eventLoop, int fd, int mask,
                      aeFileProc *proc, void *clientData);
```

它在 fd 上使用一个给定的事件循环，为新的文件事件注册一个回调（proc）函数。当使用的是 epoll 时，它将调用 epoll_ctl 在文件描述符上添加一个事件（可能是 EPOLLIN、EPOLLOUT、也或许两者都有，取决于 mask 参数）。ae 的 aeProcessEvents 功能是 “运行事件循环和发送回调函数”，它在 hood 下，命名为 epoll_wait。

### 处理客户端请求

我们通过跟踪 Redis 服务器代码来看一下，ae 如何为客户端事件注册回调函数的。initServer 启动时，通过注册一个回调函数来读取正在监听的套接字上的事件，通过使用回调函数 acceptTcpHandler 来调用 aeCreateFileEvent。当新的连接可用的，这个回调函数被调用。它被称为 accept [[2]][13]，接下来是 acceptCommonHandler，它转而去调用 createClient 以初始化新客户端连接所需要的数据结构。

createClient 的工作是去监听来自客户端的入站数据。它设置套接字为非阻塞模式（一个异步事件循环中的关键因素）并使用 aeCreateFileEvent 去注册另外一个文件事件回调函数以读取事件 ——  readQueryFromClient。每当客户端发送数据，这个函数将被事件循环调用。

readQueryFromClient 只做一些我们预期之内的事情 —— 解析客户端命令和动作，并通过查询和/或操作数据来回复。因为客户端套接字是非阻塞的，这个函数可以处理 EAGAIN，以及部分数据；从客户端中读取的数据是累积在客户端专用的缓冲区中，而完整的查询可能在回调函数的多个调用中被分割。

### 将数据发送回客户端

在前面的内容中，我说到了 readQueryFromClient 结束了发送给客户端的回复。这在逻辑上是正确的，因为 readQueryFromClient 准备要发送回复，但它不真正去做实质的发送—— 因为这里并不能保证客户端套接字是做好写入/发送数据的准备的。我们为它使用事件循环机制。

Redis 是这样做的，每次事件循环即将进入休眠时，它注册一个 beforeSleep 函数，去等待对套接字的读取/写入。beforeSleep 做的其中一件事情就是调用 handleClientsWithPendingWrites。它的作用是通过调用 writeToClient 立即去尝试发送所有可用的回复；如果一些套接字不可用时，那么当套接字可用时，它将注册一个事件循环去调用 sendReplyToClient。这可以被看作为一种优化 —— 如果套接字可用于立即发送数据（一般是 TCP 套接字），这时并不需要注册事件 ——只发送数据。因为套接字是非阻塞的，它从不会去阻塞循环。

### 为什么 Redis 要实现它自己的事件库？

在 [第四部分][14] 中我们讨论了使用 libuv 来构建一个异步并发服务器。需要注意的是，Redis 并没有使用 libuv，或者任何类似的事件库，而是它去实现自己的事件库 —— ae，用 ae 来封装 epoll、kqueue 和 select。事实上，Antirez（Redis 的创建者）恰好在 [2011 年的一篇文章][15] 中回答了这个问题。他的回答的要点是：ae 只有大约 770 行代码，他理解的非常透彻；而 libuv 代码量非常巨大，也没有提供 Redis 所需的额外功能。

现在，ae 的代码大约增长到 1300 多行，比起 libuv 的 26000 行（这是在没有 Windows、测试、示例、文档的情况下的数据）来说那是小巫见大巫了。libuv 是一个非常综合的库，这使它更复杂，并且很难去适应其它项目的特殊需求；另一方面，ae 是专门为 Redis 设计的，与 Redis 共同演进，只包含 Redis 所需要的东西。

这是我 [前些年在一篇文章中][16] 提到的软件项目依赖关系的另一个很好的示例：

> 依赖的优势与花费在软件项目上的工作量成反比。

在某种程序上，Antirez 在他的文章中也提到了这一点。他提到，依赖提供的一些附加价值（在我的文章中的“基础” 依赖）更有意义（它的例子是 jemalloc 和 Lua），就像 libuv 这样的依赖关系，为特定的 Redis 需求，去实现整个功能是非常容易的。

### Redis 中的多线程

[在 Redis 的绝大多数历史中][17]，它都是一个不折不扣的单线程的东西。一些人觉得这太不可思议了，有这种想法完全可以理解。Redis 本质上是受网络束缚的 —— 只要数据库大小合理，对于任何给定的客户端请求，其大部分延时都是浪费在网络等待上，而不是在 Redis 的数据结构上。

然而，现在事情已经不再那么简单了。Redis 现在有几个新功能都用到了线程：

1.  "缓慢地" [释放内存][8]。

2.  在后台进程中使用 fsync 调用写一个 [持久化日志][9]。

3.  运行需要的用户定义模块去执行一个长周期运行的操作。

对于前两个特性，Redis 使用它自己的一个简单的 bio（它是 “Background I/O" 的首字母缩写）库。这个库是根据 Redis 的需要进行了硬编码，它不能用到其它的地方 —— 它按预设的进程数量运行，每个 Redis 后台作业类型需要一个进程。

而对于第三个特性，[Redis 模块][18] 可以定义新的 Redis 命令，并且遵循与普通 Redis 命令相同的标准，包括不阻塞主线程。如果在模块中自定义的一个 Redis 命令，希望去执行一个长周期运行的操作，这将创建一个线程在后台去运行它。在 Redis 源码树中的 src/modules/helloblock.c 提供了这样的一个示例。

有了这些特性，Redis 使用线程将一个事件循环结合起来，在一般的案例中，Redis 具有了更快的速度和弹性，这有点类似于在本系统文章中 [第四节][19] 讨论的工作队列。


| [[1]][1] | Redis 的一个核心部分是：它是一个 _内存中_  数据库；因此，查询从不会运行太长的时间。当然了，这将会带来各种各样的其它问题。在使用分区的情况下，服务器可能最终路由一个请求到另一个实例上；在这种情况下，将使用异步 I/O 来避免阻塞其它客户端。|


| [[2]][2] | 使用 anetAccept；anet 是 Redis 对 TCP 套接字代码的封装。|



--------------------------------------------------------------------------------

via: https://eli.thegreenplace.net/2017/concurrent-servers-part-5-redis-case-study/

作者：[Eli Bendersky][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://eli.thegreenplace.net/pages/about
[1]:https://eli.thegreenplace.net/2017/concurrent-servers-part-5-redis-case-study/#id1
[2]:https://eli.thegreenplace.net/2017/concurrent-servers-part-5-redis-case-study/#id2
[3]:http://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/
[4]:http://eli.thegreenplace.net/2017/concurrent-servers-part-2-threads/
[5]:http://eli.thegreenplace.net/2017/concurrent-servers-part-3-event-driven/
[6]:http://eli.thegreenplace.net/2017/concurrent-servers-part-4-libuv/
[7]:http://eli.thegreenplace.net/2017/concurrent-servers-part-5-redis-case-study/
[8]:http://antirez.com/news/93
[9]:https://redis.io/topics/persistence
[10]:https://redis.io/
[11]:https://redis.io/topics/internals-rediseventlib
[12]:https://eli.thegreenplace.net/2017/concurrent-servers-part-5-redis-case-study/#id4
[13]:https://eli.thegreenplace.net/2017/concurrent-servers-part-5-redis-case-study/#id5
[14]:http://eli.thegreenplace.net/2017/concurrent-servers-part-4-libuv/
[15]:http://oldblog.antirez.com/post/redis-win32-msft-patch.html
[16]:http://eli.thegreenplace.net/2017/benefits-of-dependencies-in-software-projects-as-a-function-of-effort/
[17]:http://antirez.com/news/93
[18]:https://redis.io/topics/modules-intro
[19]:http://eli.thegreenplace.net/2017/concurrent-servers-part-4-libuv/
