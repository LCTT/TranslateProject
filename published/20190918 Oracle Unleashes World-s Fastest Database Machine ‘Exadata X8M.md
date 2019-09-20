[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11366-1.html)
[#]: subject: (Oracle Unleashes World’s Fastest Database Machine ‘Exadata X8M’)
[#]: via: (https://opensourceforu.com/2019/09/oracle-unleashes-worlds-fastest-database-machine-exadata-x8m/)
[#]: author: (Longjam Dineshwori https://opensourceforu.com/author/dineshwori-longjam/)

Oracle 发布全球最快的数据库机器 Exadata X8M
======

> Exadata X8M 是第一台具有集成持久内存和 RoCE 的数据库机器。Oracle 还宣布推出 Oracle 零数据丢失恢复设备 X8M（ZDLRA）。

![](https://img.linux.net.cn/data/attachment/album/201909/20/191530qiyvvxl8qqcov8xq.jpg)

Oracle 发布了新的 Exadata 数据库机器 X8M，旨在为数据库基础架构市场树立新的标杆。

Exadata X8M 结合了英特尔 Optane DC 持久存储器和通过融合以太网（RoCE）的 100 千兆的远程直接内存访问（RDMA）来消除存储瓶颈，并显著提高性能，其适用于最苛刻的工作负载，如在线事务处理（OLTP）、分析、物联网、欺诈检测和高频交易。

“借助 Exadata X8M，我们可以提供内存级的性能，同时为 OLTP 和分析提供共享存储的所有优势，”Oracle 任务关键型数据库技术执行副总裁 Juan Loaiza 说。

“使用对共享持久存储器的直接数据库访问将响应时间减少一个数量级，可加速每个 OLTP 应用程序，它是需要实时访问大量数据的应用程序的游戏规则改变者，例如欺诈检测和个性化购物，”官方补充。

### 它有什么独特之处？

Oracle Exadata X8M 使用 RDMA 让数据库直接访问智能存储服务器中的持久内存，从而绕过整个操作系统、IO 和网络软件堆栈。这导致更低的延迟和更高的吞吐量。使用 RDMA 绕过软件堆栈还可以释放存储服务器上的 CPU 资源，以执行更多智能扫描查询来支持分析工作负载。

### 更少的存储瓶颈

“高性能 OLTP 应用需要高的每秒输入/输出操作（IOPS）和低延迟。直接数据库访问共享持久性内存可将SQL 读取的峰值性能提升至 1600 万 IOPS，比行业领先的 Exadata X8 高出 2.5 倍，“Oracle 在一份声明中表示。

此外，Exadata X8M 通过使远程 IO 延迟低于 19 微秒，大大减少了关键数据库 IO 的延迟 —— 这比 Exadata X8 快 10 倍以上。即使对于每秒需要数百万 IO 的工作负载，也可实现这些超低延迟。

### 比 AWS 和 Azure 更高效

该公司声称，与 Oracle 最快的 Amazon RDS 存储相比，Exadata X8M 的延迟降低了 50 倍，IOPS 提高了 200 倍，容量提高了 15 倍。

与 Azure SQL 数据库服务存储相比，Exadata X8M 的延迟降低了 100 倍，IOPS 提高了 150 倍，容量提高了 300 倍。

据 Oracle 称，单机架 Exadata X8M 可提供高达 2 倍的 OLTP 读取 IOPS，3 倍的吞吐量和比具有持久性内存的共享存储系统（如 Dell EMC PowerMax 8000 的单机架）低 5 倍的延迟。

“通过同时支持更快的 OLTP 查询和更高的分析工作负载吞吐量，Exadata X8M 是融合混合工作负载环境以降低 IT 成本和复杂性的理想平台，”该公司说。

### Oracle 零数据丢失恢复设备 X8

Oracle 当天还宣布推出 Oracle 零数据丢失恢复设备 X8M（ZDLRA），它使用新的 100Gb RoCE，用于计算和存储服务器之间的高吞吐量内部数据传输。

Exadata 和 ZDLRA 客户现在可以在 RoCE 或基于 InfiniBand 的工程系统之间进行选择，以在其架构部署中实现最佳灵活性。

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/09/oracle-unleashes-worlds-fastest-database-machine-exadata-x8m/

作者：[Longjam Dineshwori][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/dineshwori-longjam/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/02/Oracle-Cloud.jpg?resize=350%2C212&ssl=1
