[#]: subject: "Why use Apache Druid for your open source analytics database"
[#]: via: "https://opensource.com/article/22/4/apache-druid-open-source-analytics"
[#]: author: "David Wang https://opensource.com/users/davidwang"
[#]: collector: "lkxed"
[#]: translator: "unigeorge"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

开源分析数据库 Apache Druid 的推荐理由
======
对用户而言，优秀的对外数据分析工具不可多得，因此选择合适的数据架构就显得尤为重要。

![metrics and data shown on a computer screen][1]

(Image by: Opensource.com)

现如今，数据分析不再是仅面向内部开发人员。当为业务方构建数据分析系统时，你需要确认哪种数据库后端是最合适的。

程序员的本能可能是“选用自己了解的数据库（例如 PostgreSQL 或 [MySQL][2]）”。诚然，数据仓库可能会扩展到其核心 BI 仪表板和报告之外的功能，不过对业务方的数据分析支持仍是其重要功能之一，因此要选择合适的工具来保证此功能的性能。

问题的关键点在于用户体验，以下是对外支持数据分析工作的一些关键技术讨论点（以 Apache Druid 为例）。

### 低延迟特性

一直在队列中等待查询会让人很恼火。与延迟有关的因素包括数据量、数据库的处理能力、用户和 API 调用的数量，以及数据库支持查询应用的能力。

当数据量比较大时，有一些方法可以基于任意在线分析处理 (OLAP) 数据库构建交互式数据体验，但或多或少都有一些其他方面的牺牲。预计算查询会对性能要求较高，还会使架构变得僵化。预聚合处理会使数据粒度变大。将数据时间限制在近期的处理方式，会使得数据完整性得不到保证。

“不妥协”的解决方案是选择专为大规模交互而构建的优化架构和数据格式，[Apache Druid][3] 正是这样一个旨在支持现代分析程序的实时数据库。

* 首先，Druid 具备特有的分布式弹性架构，可将数据从共享数据层预取到近乎无限容量的数据服务器集群中。这种架构与诸如云数据仓库这样的解耦查询引擎相比，具有更快的性能，因为它不需要移动数据，并且比像 PostgreSQL 和 MySQL 这样的纵向扩展数据库具有更高的可扩展性。

* 其次，Druid 采用内置于数据格式中的自动多级索引来驱动每个内核去支持更多查询操作。在常规 OLAP 列格式基础之上，还增加了全局索引、数据字典和位图索引，这可以最大化利用 CPU 周期，加快处理速度。

### 高可用性

如果开发团队为内部报告搭建了一个后端，那么中断几分钟甚至更长时间真的很严重吗？实际上并不是的。所以在典型 OLAP 数据库和数据仓库中，计划外的停机和维护是可以允许的。

但是如果你们团队构建了一个对外的供客户使用的分析应用程序，如果发生数据中断，会严重影响客户满意度、收入，当然还有你的周末休息时间。这就是为什么弹性（高可用性和数据持久性）需要成为对外分析应用程序数据库中的首要考虑因素。

考虑弹性就需要考虑设计标准。节点或集群范围的故障能完全避免吗？丢失数据的后果有多严重？保障应用程序和数据需要涉及哪些工作？

关于服务器故障，保证弹性的常规方法是多节点服务以及[备份机制][4]。但如果你是为客户构建应用程序，则对数据丢失的敏感性要高得多。*间断性*备份并不能完全解决这一问题。

Apache Druid 的核心架构内置了该问题的解决方案，本质是一种强大而简单的弹性方法，旨在保证承受任何变故都不会丢失数据（即使是刚刚发生的事件）。

Druid 基于对象存储中共享数据的自动、多级复制实现高可用性 (HA) 和持久性。它实现了用户期望的 HA 特性以及持续备份机制，即使整个集群出现问题，也可以自动保护和恢复数据库的最新状态。

### 多用户

一个好的应用应该同时兼备大用户量和“引人入胜”的体验，因此为高并发构建后端非常重要。你肯定不想看到因为应用挂掉而让客户沮丧。内部报告的架构不必考虑这点，因为并发用户数量要小得多且有限。所以现实是，用于内部报告的数据库可能并不适合高并发应用程序。

为高并发构建数据库主要在于取得 CPU 使用率、可伸缩性和成本之间的平衡点。解决并发问题的通常做法是投入更多硬件成本。逻辑上说，只要增加 CPU 的数量，就能够同时进行更多的查询操作。虽然事实确实如此，但成本的增加是不可忽视的。

更好的方法还是使用像 Apache Druid 这样的数据库，它具有优化的存储和查询引擎，可以降低 CPU 使用率。我们强调的关键词是“优化”。数据库不应该读取它不需要的数据。Apache Druid 可以让基础设施在同一时间跨度内为更多查询操作提供服务。

节省成本是开发人员使用 Apache Druid 构建外部分析应用程序的一个重要原因。Apache Druid 具有高度优化的数据格式，结合了从搜索引擎世界借鉴来的多级索引以及数据缩减算法，可以最大限度地减少所需的处理量。

最终表现就是 Apache Druid 提供了其他数据库不可比拟的处理效率。它可以支持每秒数十到数千跨度的 TB 甚至 PB 级别的查询。

### 着眼当下，预见未来

分析应用程序对于用户而言至关重要，所以要构建正确的数据架构。

你肯定不想一开始就选择了一个错误的数据库，然后在后续扩展时面对诸多令人头疼的问题。幸运的是，Apache Druid 可以从小规模开始，并在之后轻松扩展以支持任何可以想象的应用程序。Apache Druid 有[优秀的官方文档][5]，当然它是开源的，所以不妨尝试一下并，快速上手吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/4/apache-druid-open-source-analytics

作者：[David Wang][a]
选题：[lkxed][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/davidwang
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/metrics_data_dashboard_system_computer_analytics.png
[2]: https://opensource.com/downloads/mariadb-mysql-cheat-sheet
[3]: https://druid.apache.org/
[4]: https://opensource.com/article/19/3/backup-solutions
[5]: https://druid.apache.org/docs/latest/design/
