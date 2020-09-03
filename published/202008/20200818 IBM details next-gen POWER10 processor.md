[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12546-1.html)
[#]: subject: (IBM details next-gen POWER10 processor)
[#]: via: (https://www.networkworld.com/article/3571415/ibm-details-next-gen-power10-processor.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

IBM 披露了下一代 POWER10 处理器细节
======

![](https://images.idgesg.net/images/article/2020/08/power-10_06-100854570-large.jpg)

> 新的 CPU 针对企业混合云和 AI 推断进行了优化，它采用了为 PB 级内存集群开发的新技术。

IBM 上周一公布了最新的 POWER RISC CPU 系列，该系列针对企业混合云计算和人工智能 （AI）推理进行了优化，同时还进行了其他一些改进。

Power 是上世纪 90 年代最后一款 Unix 处理器，当时 Sun Microsystems、HP、SGI 和 IBM 都有竞争性的 Unix 系统，以及与之配合的 RISC 处理器。后来，Unix 让位给了 Linux，RISC 让位给了 x86，但 IBM 坚持了下来。

这是 IBM 的第一款 7 纳米处理器，IBM 宣称它将在与前代 POWER9 相同的功率范围内，将容量和处理器能效提升多达三倍。该处理器采用 15 核设计（实际上是 16 核，但其中一个没有使用），并允许采用单芯片或双芯片型号，因此 IBM 可以在同一外形尺寸中放入两个处理器。每个核心最多可以有 8 个线程，每块 CPU 最多支持 4TB 的内存。

更有趣的是一种名为 Memory Inception 的新内存集群技术。这种形式的集群允许系统将另一台物理服务器中的内存当作自己的内存来看待。因此，服务器不需要在每个机箱中放很多内存，而是可以在内存需求激增的时候，从邻居那里借到内存。或者，管理员可以在集群的中间设置一台拥有大量内存的服务器，并在其周围设置一些低内存服务器，这些服务器可以根据需要从大内存服务器上借用内存。

所有这些都是在 50 到 100 纳秒的延迟下完成的。IBM 的杰出工程师 William Starke 在宣布前的视频会议上说：“这已经成为行业的圣杯了。与其在每个机器里放很多内存，不如当我们对内存的需求激增时，我可以向邻居借。”

POWER10 使用的是一种叫做开放内存接口（OMI）的东西，因此服务器现在可以使用 DDR4，上市后可以升级到 DDR5，它还可以使用 GPU 中使用的 GDDR6 内存。理论上，POWER10 将具备 1TB/秒的内存带宽和 1TB/秒的 SMP 带宽。

与 POWER9 相比，POWER10 处理器每个核心的 AES 加密引擎数量增加了四倍。这实现了多项安全增强功能。首先，这意味着在不降低性能的情况下进行全内存加密，因此入侵者无法扫描内存内容。

其次，它可以为容器提供隔离的硬件和软件安全。这是为了解决更高密度的容器相关的行安全考虑。如果一个容器被入侵，POWER10 处理器的设计能够防止同一虚拟机中的其他容器受到同样的入侵影响。

最后，POWER10 提供了核心内的 AI 业务推断。它通过片上支持用于训练的 bfloat16 以及 AI 推断中常用的 INT8 和 INT4 实现。这将允许事务性负载在应用中添加 AI 推断。IBM 表示，POWER10 中的 AI 推断是 POWER9 的 20 倍。

公告中没有提到的是对操作系统的支持。POWER 运行 IBM 的 Unix 分支 AIX，以及 Linux。这并不太令人惊讶，因为这个消息是在 Hot Chips 上发布的，Hot Chips 是每年在斯坦福大学举行的年度半导体会议。Hot Chips 关注的是最新的芯片进展，所以软件通常被排除在外。

IBM 一般会在发布前一年左右公布新的 POWER 处理器，所以有足够的时间进行 AIX 的更新。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3571415/ibm-details-next-gen-power10-processor.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
