[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12791-1.html)
[#]: subject: (Start using virtual tables in Apache Cassandra 4.0)
[#]: via: (https://opensource.com/article/20/10/virtual-tables-apache-cassandra)
[#]: author: (Ben Bromhead https://opensource.com/users/ben-bromhead)

如何在 Apache Cassandra 4.0 中使用虚拟表
======

> 虚拟表是什么以及如何使用。

![](https://img.linux.net.cn/data/attachment/album/202011/04/234511kpmv6dzac6fjmr65.jpg)

在最近的发布的 [Apache Cassandra 4.0 测试版][3]中的[众多新增功能][2]中，<ruby>虚拟表<rt>virtual table</rt></ruby>是一个值得关注的功能。

在以前的 Cassandra 版本中，用户需要访问 <ruby>Java 管理扩展<rt>Java Management Extensions</rt></ruby>（[JMX][4]） 来查看 Cassandra 的细节，如运行中的<ruby>压实<rt>compaction</rt></ruby>、客户端、度量和各种配置设置。虚拟表消除了这些挑战。Cassandra 4.0 测试版让用户能够从一个只读的系统表中以 <ruby>Cassandra 查询语言<rt>Cassandra Query Language</rt></ruby>（CQL）行的形式查询这些细节和数据。

以下是之前 Cassandra 版本中基于 JMX 的机制是如何工作的。想象一下，一个用户想要检查集群中某个节点的压实状态。用户首先要建立一个 JMX 连接，在节点上运行 `nodetool compactionstats`。这个要求马上就给用户带来了一些复杂的问题。用户的客户端是否配置了 JMX 访问？Cassandra 节点和防火墙是否配置为允许 JMX 访问？是否准备好了适当的安全和审计措施，并落实到位？这些只是用户在处理 Cassandra 以前版本时必须面对的其中一些问题。

在 Cassandra 4.0 中，虚拟表使得用户可以利用之前配置的驱动来查询所需信息。这一变化消除了与实现和维护 JMX 访问相关的所有开销。

Cassandra 4.0 创建了两个新的<ruby>键空间<rt>keyspace</rt></ruby>来帮助用户利用虚拟表：`system_views` 和 `system_virtual_schema`。`system_views` 键空间包含了用户查询的所有有价值的信息，有用地存储在一些表中。`system_virtual_schema` 键空间，顾名思义，存储了这些虚拟表的所有必要的模式信息。

![system_views and system_virtual_schema keyspaces and tables][5]

重要的是要明白，每个虚拟表的范围仅限于其节点。任何虚拟表查询都将返回的数据，只对其协调器的节点有效，而不管一致性如何。为了简化这一要求，已经在几个驱动中添加了支持，以便在这些查询中指定协调器节点 （Python、DataStax Java 和其他驱动现在提供了这种支持）。

为了说明这一点，请查看这个 `sstable_tasks` 虚拟表。这个虚拟表显示了对 [SSTables][7] 的所有操作，包括压实、清理、升级等。

![Querying the sstable_tasks virtual table][8]

如果用户在以前的 Cassandra 版本中运行 `nodetool compactionstats`，则会显示相同类型的信息。 在这里，这个查询发现该节点当前有一个活动的压缩。它还显示了它的进度以及它的键空间和表。得益于虚拟表，用户可以快速收集这些信息，并同样有效地获得正确诊断集群健康状况所需的能力。

需要说明的是，Cassandra 4.0 并没有去除对 JMX 访问的需求。JMX 仍然是查询某些指标的唯一选择。尽管如此，用户会欢迎简单地使用 CQL 来获取关键集群指标的能力。由于虚拟表提供的便利，用户可能会将之前投入到 JMX 工具的时间和资源重新投入到 Cassandra 本身。客户端工具也应该开始利用虚拟表提供的优势。

如果你对 Cassandra 4.0 测试版及其虚拟表功能感兴趣，请[试试试它][3]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/virtual-tables-apache-cassandra

作者：[Ben Bromhead][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ben-bromhead
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://www.instaclustr.com/apache-cassandra-4-0-beta-released/
[3]: https://cassandra.apache.org/download/
[4]: https://en.wikipedia.org/wiki/Java_Management_Extensions
[5]: https://opensource.com/sites/default/files/uploads/cassandra_virtual-tables.png (system_views and system_virtual_schema keyspaces and tables)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://cassandra.apache.org/doc/latest/architecture/storage_engine.html#sstables
[8]: https://opensource.com/sites/default/files/uploads/cassandra_virtual-tables_sstable_tasks.png (Querying the sstable_tasks virtual table)
