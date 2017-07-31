Linux “天气预报”
============================================================

### 欢迎来到 Linux 天气预报

本页面是为了跟踪在不久的将来某个时间内有可能出现在主线内核和/或主要发行版中的 Linux 开发社区的进展情况。你的“首席气象学家”是 [LWN.net][8] 执行主编 Jonathan Corbet。如果你有改进预测的建议（特别是如果你有一个你认为应该跟踪的项目或修补程序的情况下），请在下面补充你的意见。

### 预测摘要

**当前情况**：内核 4.12 于 7 月 2 日发布。它包含了许多新功能，包括：

* [BFQ 和 Kyber 块 I/O 调度器][2]。已经开发多年的 BFQ 在交互式系统上表现更好，这引起了移动设备领域的兴趣。相反，Kyber 是一个更简单的调度程序，旨在用于通常出现在企业配置中的快速设备。
* epoll_wait() 系统调用现在可以执行网络套接字的繁忙轮询。
* 实时修补机制已经实现了[混合一致性模型][3]，这将可以把更复杂的补丁应用于运行中的内核。
* [可信执行框架][4]应该使得内核与在 ARM TrustZone 安全世界中运行的代码之间的交互更加容易。

4.12 是最繁忙的内核开发周期之一，合并了近 15000 次更新。有关这些变化来源的概述，请参阅[这里][9]。

**短期预测**：4.13 内核预期在 2017 年 9 月初发布。这个内核中会出现的一些变化是：

* 更好地支持非阻塞直接块 I/O 操作。
* [结构布局随机化机制][5]是正在进行的内核加固防攻击项目的下一步。
* 内核现在已经[原生支持 TLS 网络协议][6]。
* 采取[透明大页交换][7]，这使得有更好的内存管理性能。
* 块子系统中回写错误的处理[已经改进][1]，这使得错误不太可能不告知程序而写入数据。

4.13 内核现在处于稳定时期，所以在这个开发周期的剩余时间内只会接受修复补丁。

这篇[文章][10]根据[知识共享署名 - 共享 3.0 许可证][11]获得许可。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/2017/7/linux-weather-forecast

作者：[JONATHAN CORBET][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/corbet
[1]:https://lwn.net/Articles/724307/
[2]:https://lwn.net/Articles/720675/
[3]:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d83a7cb375eec21f04c83542395d08b2f6641da2
[4]:https://lwn.net/Articles/717125/
[5]:https://lwn.net/Articles/722293/
[6]:https://lwn.net/Articles/666509/
[7]:https://lwn.net/Articles/717707/
[8]:http://www.lwn.net/
[9]:https://lwn.net/Articles/726950/
[10]:http://purl.org/dc/elements/1.1/
[11]:http://creativecommons.org/licenses/by-sa/3.0/
