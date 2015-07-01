深入 NGINX: 我们如何设计性能和扩展
================================================================================

NGINX 能在 web 性能中取得领先地位，这是由于其软件设计所决定的。许多 web 服务器和应用程序服务器使用一个简单的线程或基于流程的架构，NGINX 立足于一个复杂的事件驱动的体系结构，使它能够在现代硬件上扩展到成千上万的并发连接。

这张[深入 NGINX][1] 的信息图从高层次的流程架构深度挖掘说明了 NGINX 如何在单一进程里保持多个连接。这篇博客进一步详细地解释了这一切是如何工作的。

### 知识 – NGINX进程模型 ###

![Master Process](http://cdn.nginx.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-08-at-12.36.30-PM.png)

为了更好的理解这个设计，你需要理解 NGINX 如何运行的。NGINX 有一个主进程（它执行特权操作，如读取配置和绑定端口）和一些工作进程与辅助进程。

    # service nginx restart
    * Restarting nginx
    # ps -ef --forest | grep nginx
    root     32475     1  0 13:36 ?        00:00:00 nginx: master process /usr/sbin/nginx \
                                                    -c /etc/nginx/nginx.conf
    nginx    32476 32475  0 13:36 ?        00:00:00  \_ nginx: worker process
    nginx    32477 32475  0 13:36 ?        00:00:00  \_ nginx: worker process
    nginx    32479 32475  0 13:36 ?        00:00:00  \_ nginx: worker process
    nginx    32480 32475  0 13:36 ?        00:00:00  \_ nginx: worker process
    nginx    32481 32475  0 13:36 ?        00:00:00  \_ nginx: cache manager process
    nginx    32482 32475  0 13:36 ?        00:00:00  \_ nginx: cache loader process

在四核服务器，NGINX 主进程创建了4个工作进程和两个管理磁盘内容缓存的缓存辅助进程。

### 为什么架构很重要？ ###

任何 Unix 应用程序的根本基础是线程或进程。（从 Linux 操作系统的角度来看，线程和进程大多是相同的，主要的区别是他们共享内存的程度。）一个线程或进程是一个自包含的指令集，操作系统可以在一个 CPU 核心上调度运行它们。大多数复杂的应用程序并行运行多个线程或进程有两个原因：

- 它们可以同时使用更多的计算核心。
- 线程或进程可以轻松实现并行操作。（例如，在同一时刻保持多连接）。

进程和线程消耗资源。他们每个都使用内存和其他系统资源，他们会在 CPU 核心中换入和换出（一个操作可以叫做上下文切换）。大多数现代服务器可以并行保持上百个小型的、活动的线程或进程，但是一旦内存耗尽或高 I/O 压力引起大量的上下文切换会导致性能严重下降。 

网络应用程序设计的常用方法是为每个连接分配一个线程或进程。此体系结构简单、容易实现，但是当应用程序需要处理成千上万的并发连接时这种结构就不具备扩展性。

### NGINX 如何工作？ ###

NGINX 使用一种可预测的进程模式来分配可使用的硬件资源：

- 主进程（master）执行特权操作，如读取配置和绑定端口，然后创建少量的子进程（如下的三种类型）。
- 缓存加载器进程（cache loader）在加载磁盘缓存到内存中时开始运行，然后退出。适当的调度，所以其资源需求很低。
- 缓存管理器进程（cache manager）定期裁剪磁盘缓存中的记录来保持他们在配置的大小之内。
- 工作进程（worker）做所有的工作！他们保持网络连接、读写内容到磁盘，与上游服务器通信。

在大多数情况下 NGINX 的配置建议：每个 CPU 核心运行一个工作进程，这样最有效地利用硬件资源。你可以在配置中包含 [worker_processes auto][2]指令配置：

    worker_processes auto;

当一个 NGINX 服务处于活动状态，只有工作进程在忙碌。每个工作进程以非阻塞方式保持多连接，以减少上下文交换。

每个工作进程是一个单一线程并且独立运行，它们会获取新连接并处理之。这些进程可以使用共享内存通信来共享缓存数据、会话持久性数据及其它共享资源。（在 NGINX 1.7.11 及其以后版本，还有一个可选的线程池，工作进程可以转让阻塞的操作给它。更多的细节，参见“[NGINX 线程池可以爆增9倍性能！][16]”。对于 NGINX Plus 用户，该功能计划在今年晚些时候加入到 R7 版本中。）

### NGINX 工作进程内部 ###

![](http://cdn.nginx.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-08-at-12.39.48-PM.png)

每个 NGINX 工作进程按照 NGINX 配置初始化，并由主进程提供一组监听端口。

NGINX 工作进程首先在监听套接字上等待事件（[accept_mutex][3] 和[内核套接字分片][4]）。事件被新进来的连接初始化。这些连接被分配到一个状态机 – HTTP 状态机是最常用的，但 NGINX 也实现了流式（原始 TCP ）状态机和几种邮件协议（SMTP、IMAP和POP3）的状态机。

![Internet Requests](http://cdn.nginx.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-08-at-12.40.32-PM.png)

状态机本质上是一组指令，告诉 NGINX 如何处理一个请求。大多数 web 服务器像 NGINX 一样使用类似的状态机来实现相同的功能 - 区别在于实现。

### 调度状态机 ###

把状态机想象成国际象棋的规则。每个 HTTP 事务是一个象棋游戏。一方面棋盘是 web 服务器 —— 一位大师可以非常迅速地做出决定。另一方面是远程客户端 —— 在一个相对较慢的网络下 web 浏览器访问网站或应用程序。

不管怎样，这个游戏规则很复杂。例如，web 服务器可能需要与各方沟通（代理一个上游的应用程序）或与身份验证服务器对话。web 服务器的第三方模块甚至可以扩展游戏规则。

#### 一个阻塞状态机 ####

回忆我们之前的描述，一个进程或线程就像一套独立的指令集，操作系统可以在一个 CPU 核心上调度运行它。大多数 web 服务器和 web 应用使用每个连接一个进程或者每个连接一个线程的模式来玩这个“象棋游戏”。每个进程或线程都包含玩完“一个游戏”的指令。在服务器运行该进程的期间，其大部分的时间都是“阻塞的” —— 等待客户端完成它的下一步行动。

![Blocking I/O](http://cdn.nginx.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-08-at-12.40.52-PM.png)

1. web 服务器进程在监听套接字上监听新连接（客户端发起新“游戏”）
1. 当它获得一个新游戏，就玩这个游戏，每走一步去等待客户端响应时就阻塞了。
1. 游戏完成后，web 服务器进程可能会等待是否有客户机想要开始一个新游戏（这里指的是一个“保持的”连接）。如果这个连接关闭了（客户端断开或者发生超时），web 服务器进程会返回并监听一个新“游戏”。

要记住最重要的一点是每个活动的 HTTP 连接（每局棋）需要一个专用的进程或线程（象棋高手）。这个结构简单容并且易扩展第三方模块（“新规则”）。然而，还是有巨大的不平衡：尤其是轻量级 HTTP 连接其实就是一个文件描述符和小块内存，映射到一个单独的线程或进程，这是一个非常重量级的系统对象。这种方式易于编程，但太过浪费。

#### NGINX是一个真正的象棋大师 ####

也许你听过[同时表演赛][5]游戏，有一个象棋大师同时对战许多对手？

![Kiril Georgiev](http://cdn.nginx.com/wp-content/uploads/2015/06/Kiril-Georgiev.gif)

*[列夫·吉奥吉夫在保加利亚的索非亚同时对阵360人][6]。他的最终成绩是284胜70平6负。*

这就是 NGINX 工作进程如何“下棋”的。每个工作进程（记住 - 通常每个CPU核心上有一个工作进程）是一个可同时对战上百人（事实是，成百上千）的象棋大师。

![Event-driven Architecture](http://cdn.nginx.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-08-at-12.41.13-PM.png)

1. 工作进程在监听和连接套接字上等待事件。
1. 事件发生在套接字上，并且由工作进程处理它们：
	- 在监听套接字的事件意味着一个客户端已经开始了一局新棋局。工作进程创建了一个新连接套接字。
	- 在连接套接字的事件意味着客户端已经下了一步棋。工作进程及时响应。

一个工作进程在网络流量上从不阻塞，等待它的“对手”(客户端)做出反应。当它下了一步，工作进程立即继续其他的游戏，在那里工作进程正在处理下一步，或者在门口欢迎一个新玩家。

#### 为什么这个比阻塞式多进程架构更快？ ####

NGINX 每个工作进程很好的扩展支撑了成百上千的连接。每个连接在工作进程中创建另外一个文件描述符和消耗一小部分额外内存。每个连接有很少的额外开销。NGINX 进程可以固定在某个 CPU 上。上下文交换非常罕见，一般只发生在没有工作要做时。

在阻塞方式，每个进程一个连接的方法中，每个连接需要大量额外的资源和开销，并且上下文切换（从一个进程切换到另一个）非常频繁。

更详细的解释，看看这篇关于 NGINX 架构的[文章][7]，它由NGINX公司开发副总裁及共同创始人 Andrew Alexeev 写的。

通过适当的[系统优化][8]，NGINX 的每个工作进程可以扩展来处理成千上万的并发 HTTP 连接，并能脸不红心不跳的承受峰值流量(大量涌入的新“游戏”)。

### 更新配置和升级 NGINX ###

NGINX 的进程体系架构使用少量的工作进程，有助于有效的更新配置文件甚至 NGINX 程序本身。

![Updating Configuration](http://cdn.nginx.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-08-at-12.41.33-PM.png)

更新 NGINX 配置文件是非常简单、轻量、可靠的操作。典型的就是运行命令 `nginx –s reload`，所做的就是检查磁盘上的配置并发送 SIGHUP 信号给主进程。

当主进程接收到一个 SIGHUP 信号，它会做两件事：

- 重载配置文件和分支出一组新的工作进程。这些新的工作进程立即开始接受连接和处理流量（使用新的配置设置）
- 通知旧的工作进程优雅的退出。工作进程停止接受新的连接。当前的 http 请求一旦完成，工作进程就彻底关闭这个连接（那就是，没有残存的“保持”连接）。一旦所有连接关闭，这个工作进程就退出。

这个重载过程能引发一个 CPU 和内存使用的小峰值，但是跟活动连接加载的资源相比它一般不易察觉。每秒钟你可以多次重载配置（很多 NGINX 用户都这么做）。非常罕见的情况下，有很多世代的工作进程等待关闭连接时会发生问题，但即使是那样也很快被解决了。

NGINX 的程序升级过程中拿到了高可用性圣杯 —— 你可以随随时更新这个软件，不会丢失连接，停机，或者中断服务。

![New Binary](http://cdn.nginx.com/wp-content/uploads/2015/06/Screen-Shot-2015-06-08-at-12.41.51-PM.png)

程序升级过程类似于平滑重载配置的方法。一个新的 NGINX 主进程与原主进程并行运行，然后他们共享监听套接字。两个进程都是活动的，并且各自的工作进程处理流量。然后你可以通知旧的主进程和它的工作进程优雅的退出。

整个过程的详细描述在 [NGINX 管理][9]。

### 结论 ###

[深入 NGINX 信息图][10] 提供一个 NGINX 功能实现的高层面概览，但在这简单的解释的背后是超过十年的创新和优化，使得 NGINX 在广泛的硬件上提供尽可能最好的性能同时保持了现代 Web 应用程序所需要的安全性和可靠性。

如果你想阅读更多关于NGINX的优化，查看这些优秀的资源：

- [安装和 NGINX 性能调优][11] (webinar; Speaker Deck 上的[讲义][12])
- [NGINX 性能调优][13]
- [开源应用架构： NGINX 篇][14]
- [NGINX 1.9.1 中的套接字分片][15] (使用 SO_REUSEPORT 套接字选项)

--------------------------------------------------------------------------------

via: http://nginx.com/blog/inside-nginx-how-we-designed-for-performance-scale/

作者：[Owen Garrett][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://nginx.com/author/owen/
[1]:http://nginx.com/resources/library/infographic-inside-nginx/
[2]:http://nginx.org/en/docs/ngx_core_module.html#worker_processes
[3]:http://nginx.org/en/docs/ngx_core_module.html#accept_mutex
[4]:http://nginx.com/blog/socket-sharding-nginx-release-1-9-1/
[5]:http://en.wikipedia.org/wiki/Simultaneous_exhibition
[6]:http://gambit.blogs.nytimes.com/2009/03/03/in-chess-records-were-made-to-be-broken/
[7]:http://www.aosabook.org/en/nginx.html
[8]:http://nginx.com/blog/tuning-nginx/
[9]:http://nginx.org/en/docs/control.html
[10]:http://nginx.com/resources/library/infographic-inside-nginx/
[11]:http://nginx.com/resources/webinars/installing-tuning-nginx/
[12]:https://speakerdeck.com/nginx/nginx-installation-and-tuning
[13]:http://nginx.com/blog/tuning-nginx/
[14]:http://www.aosabook.org/en/nginx.html
[15]:http://nginx.com/blog/socket-sharding-nginx-release-1-9-1/
[16]:http://nginx.com/blog/thread-pools-boost-performance-9x/
