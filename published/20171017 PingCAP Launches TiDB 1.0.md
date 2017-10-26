PingCAP 推出 TiDB 1.0
============================================================

> PingCAP 推出了 TiDB 1.0，一个可扩展的混合数据库解决方案

2017 年 10 月 16 日， 一家尖端的分布式数据库技术公司 PingCAP Inc. 正式宣布发布 [TiDB][4] 1.0。TiDB 是一个开源的分布式混合事务/分析处理 （HTAP） 数据库，它使企业能够使用单个数据库来满足这两个负载。

在当前的数据库环境中，基础架构工程师通常要使用一个数据库进行在线事务处理（OLTP），另一个用于在线分析处理（OLAP）。TiDB 旨在通过构建一个基于实时事务数据的实时业务分析的 HTAP 数据库来打破这种分离。有了 TiDB，工程师现在可以花更少的时间来管理多个数据库解决方案，并有更多的时间为他们的公司提供业务价值。TiDB 的一个金融证券公司的用户正在利用这项技术为财富管理和用户角色的应用提供支持。借助 TiDB，该公司可以轻松处理 web 量级的计费记录，并进行关键任务时间敏感的数据分析。

PingCAP 联合创始人兼 CEO 刘奇（Max Liu）说：

> “两年半前，Edward、Dylan 和我开始这个旅程，为长期困扰基础设施软件业的老问题建立一个新的数据库。今天，我们很自豪地宣布，这个数据库 TiDB 可以面向生产环境了。亚伯拉罕·林肯曾经说过，‘预测未来的最好办法就是创造’，我们在 771 天前预测的未来，现在我们已经创造了，这不仅是我们团队的每一个成员，也是我们的开源社区的每个贡献者、用户和合作伙伴的努力工作和奉献。今天，我们庆祝和感谢开源精神的力量。明天，我们将继续创造我们相信的未来。”

TiDB 已经在亚太地区 30 多家公司投入生产环境，其中包括 [摩拜][5]、[Gaea][6] 和 [YOUZU][7] 等快速增长的互联网公司。使用案例涵盖从在线市场和游戏到金融科技、媒体和旅游的多个行业。

### TiDB 功能

**水平可扩展性**

TiDB 随着你的业务发展而增长。你可以通过添加更多机器来增加存储和计算能力。

**兼容 MySQL 协议**

像用 MySQL 一样使用 TiDB。你可以用 TiDB 替换 MySQL 来增强你的应用，且在大多数情况下不用更改一行代码，也几乎没有迁移成本。

**自动故障切换和高可用性**

你的数据和程序始终处于在线状态。TiDB 自动处理故障并保护你的应用免受整个数据中心的机器故障甚至停机。

**一致的分布式事务**

TiDB 类似于单机关系型数据库系统（RDBMS）。你可以启动跨多台机器的事务，而不用担心一致性。TiDB 使你的应用程序代码简单而强大。

**在线 DDL**

根据你的要求更改 TiDB 模式。你可以添加新的列和索引，而不会停止或影响你正在进行的操作。

[现在尝试TiDB！][8]

### 使用案例

- [yuanfudao.com 中 TiDB 如何处理快速的数据增长和复杂查询] [9]
- [从 MySQL 迁移到 TiDB 以每天处理数千万行数据] [10]

### 更多信息：

TiDB 内部：

*   [数据存储][1]
*   [计算][2]
*   [调度][3]

--------------------------------------------------------------------------------

via: https://pingcap.github.io/blog/2017/10/17/announcement/

作者：[PingCAP][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://pingcap.github.io/blog/
[1]:https://pingcap.github.io/blog/2017/07/11/tidbinternal1/
[2]:https://pingcap.github.io/blog/2017/07/11/tidbinternal2/
[3]:https://pingcap.github.io/blog/2017/07/20/tidbinternal3/
[4]:https://github.com/pingcap/tidb
[5]:https://en.wikipedia.org/wiki/Mobike
[6]:http://www.gaea.com/en/
[7]:http://www.yoozoo.com/aboutEn
[8]:https://pingcap.com/doc-QUICKSTART
[9]:https://pingcap.github.io/blog/2017/08/08/tidbforyuanfudao/
[10]:https://pingcap.github.io/blog/2017/05/22/Comparison-between-MySQL-and-TiDB-with-tens-of-millions-of-data-per-day/
