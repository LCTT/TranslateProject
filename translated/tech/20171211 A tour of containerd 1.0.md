containerd 1.0 探索之旅
======
![containerd][1]

我们在过去的文章中讨论了一些 containerd 的不同特性，它是如何设计的，以及随着时间推移已经修复的一些问题。Containerd 是被用于 Docker、Kubernetes CRI、以及一些其它的项目，在这些平台中事实上都使用了 containerd，而许多人并不知道 containerd 存在于这些平台之中，这篇文章就是为这些人所写的。我想写更多的关于 containerd 的设计以及特性集方面的文章，但是现在，我们从它的基础知识开始。

我认为容器生态系统有时候可能很复杂。尤其是我们所使用的技术。它是什么？一个运行时，还是别的？一个运行时 … containerd（它的发音是 " _container-dee "_）正如它的名字，它是一个容器守护进程，而不是一些人所“传说”的那样。它最初是作为 OCI 运行时（就像 runc 一样）的集成点构建的，在过去的六个月中它增加了许多特性，使其达到了像 Docker 这样的现代容器平台以及像 Kubernetes 这样的编排平台的需求。

那么，你使用 containerd 能去做些什么呢？你可以推送或拉取功能以及镜像管理。可以获得容器生命周期 APIs 去创建、运行、以及管理容器和它们的任务。一个完整的专门用于快照管理的 API，以及一个公开管理的项目。如果你需要去构建一个容器平台，基本上你不需要去处理任何底层操作系统细节方面的事情。我认为关于 containerd 中最重要的部分是，它有一个版本化的并且有 bug 修复和安全补丁的稳定 API。

![containerd][2]

由于在内核中并没有太多的用作 Linux 容器的东西，因此容器是多种内核特性捆绑在一起的，当你构建一个大型平台或者分布式系统时，你需要在你的管理代码和系统调用之间构建一个抽象层，然后将这些特性捆绑粘接在一起去运行一个容器。而这个抽象层就是 containerd 的所在之外。它为稳定类型的平台层提供了一个客户端，这样平台可以构建在顶部而无需进入到内核级。因此，可以让使用容器、任务、和快照类型的工作相比通过管理调用去 clone() 或者 mount() 要友好的多。与灵活性相平衡，直接与运行时或者宿主机交互，这些对象避免了常规的高级抽象所带来的性能牺牲。结果是简单的任务很容易完成，而困难的任务也变得更有可能完成。

![containerd][3]Containerd 被设计用于 Docker 和 Kubernetes、以及想去抽象出系统调用或者在 Linux、Windows、Solaris、 以及其它的操作系统上特定的功能去运行容器的其它的容器系统。考虑到这些用户的想法，我们希望确保 containerd 只拥有它们所需要的东西，而没有它们不希望的东西。事实上这是不太可能的，但是至少我们想去尝试一下。虽然网络不在 containerd 的范围之内，它并不能做到高级系统完全控制的那些东西。原因是，当你构建一个分布式系统时，网络是非常重要的方面。现在，对于 SDN 和服务发现，在 Linux 上，相比于抽象出 netlink 调用，网络是更特殊的平台。大多数新的网络都是基于路由的，并且每次一个新的容器被创建或者删除时，都会请求更新路由表。服务发现、DNS 等等都需要及时通知到这些改变。如果在 containerd 中添加对网络的管理，为了能够支持不同的网络接口、钩子、以及集成点，将会在 containerd 中增加很大的一块代码。而我们的选择是，在 containerd 中做一个健壮的事件系统，以便于很多的消费者可以去订阅它们所关心的事件。我们也公开发布了一个 [任务 API ][4]，它可以让用户去创建一个运行任务，也可以在一个容器的网络命名空间中添加一个接口，以及在一个容器的生命周期中的任何时候，无需复杂的 hooks 来启用容器的进程。

在过去的几个月中另一个添加到 containerd 中的领域是完整的存储，以及支持 OCI 和 Docker 镜像格式的分布式系统。你有一个跨 containerd API 的完整的目录地址存储系统，它不仅适用于镜像，也适用于元数据、检查点、以及附加到容器的任何数据。

我们也花时间去 [重新考虑如何使用 "图形驱动" 工作][5]。这些是叠加的或者允许镜像分层的块级文件系统，以使你执行的构建更加高效。当我们添加对 devicemapper 的支持时，图形驱动最初是由 Solomon 和我写的。Docker 在那个时候仅支持 AUFS，因此我们在叠加文件系统之后，对图形驱动进行建模。但是，做一个像 devicemapper/lvm 这样的块级文件系统，就如同一个堆叠文件系统一样，从长远来看是非常困难的。这些接口必须基于时间的推移进行扩展，以支持我们最初认为并不需要的那些不同的特性。对于 containerd，我们使用了一个不同的方法，像快照一样做一个堆叠文件系统而不是相反。这样做起来更容易，因为堆叠文件系统比起像 BTRFS、ZFS、以及 devicemapper 这样的文件系统提供了更好的灵活性。因为这些文件系统没有严格的父/子关系。这有助于我们去构建出 [快照的一个小型接口][6]，同时还能满足 [构建者][7] 的要求，还能减少了需要的代码数量，从长远来看这样更易于维护。

![][8]

你可以在 [Stephen Day's Dec 7th 2017 KubeCon SIG Node presentation][9]上找到更多关于 containerd 的架构方面的详细资料。

除了在 1.0 代码库中的技术和设计上的更改之外，我们也将  [containerd 管理模式从长期 BDFL 转换为技术委员会][10]，为社区提供一个独立的可信任的第三方资源。

--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/12/containerd-ga-features-2/

作者：[Michael Crosby][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/michael/
[1]:https://i0.wp.com/blog.docker.com/wp-content/uploads/950cf948-7c08-4df6-afd9-cc9bc417cabe-6.jpg?resize=400%2C120&amp;amp;ssl=1
[2]:https://i1.wp.com/blog.docker.com/wp-content/uploads/4a7666e4-ebdb-4a40-b61a-26ac7c3f663e-4.jpg?resize=906%2C470&amp;amp;ssl=1 "containerd"
[3]:https://i1.wp.com/blog.docker.com/wp-content/uploads/2a73a4d8-cd40-4187-851f-6104ae3c12ba-1.jpg?resize=1140%2C680&amp;amp;ssl=1
[4]:https://github.com/containerd/containerd/blob/master/api/services/tasks/v1/tasks.proto
[5]:https://blog.mobyproject.org/where-are-containerds-graph-drivers-145fc9b7255
[6]:https://github.com/containerd/containerd/blob/master/api/services/snapshots/v1/snapshots.proto
[7]:https://blog.mobyproject.org/introducing-buildkit-17e056cc5317
[8]:https://i1.wp.com/blog.docker.com/wp-content/uploads/d0fb5eb9-c561-415d-8d57-e74442a879a2-1.jpg?resize=1140%2C556&amp;amp;ssl=1
[9]:https://speakerdeck.com/stevvooe/whats-happening-with-containerd-and-the-cri
[10]:https://github.com/containerd/containerd/pull/1748
