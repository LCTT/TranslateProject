[#]: collector: (lujun9972)
[#]: translator: (unigeorge)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13908-1.html)
[#]: subject: (Define and optimize data partitions in Apache Cassandra)
[#]: via: (https://opensource.com/article/20/5/apache-cassandra)
[#]: author: (Anil Inamdar https://opensource.com/users/anil-inamdar)

在 Apache Cassandra 中定义和优化数据分区 
======

> 速度和可扩展性是 Apache Cassandra 不变的追求；来学习一下如何充分发挥它的专长吧。 

![](https://img.linux.net.cn/data/attachment/album/202110/22/103651gse3iyiajyaagk34.jpg)

Apache Cassandra 是一个数据库，但又不是一个简单的数据库；它是一个复制数据库，专为可扩展性、高可用性、低延迟和良好性能而设计调整。Cassandra 可以帮你的数据在区域性中断、硬件故障时，以及很多管理员认为数据量过多的情况下幸免于难。

全面掌握数据分区知识，你就能让 Cassandra 集群实现良好的设计、极高的性能和可扩展性。在本文中，我将探究如何定义分区，Cassandra 如何使用这些分区，以及一些你应该了解的最佳实践方案和已知问题。 

基本概念是这样的: 供数据库关键函数（如数据分发、复制和索引化）使用的原子单元，单个这样的数据块就是一个分区。分布式数据系统通常会把传入的数据分配到这些分区中，使用简单的数学函数（例如 identity 或 hashing 函数）执行分区过程，并用得到的 “分区键” 对数据分组，进一步再形成分区。例如，假设传入数据是服务器日志，使用 “identity” 分区函数和每个日志的时间戳（四舍五入到小时值）作为分区键，我们可以对这些数据进行分区，实现每个分区各保存一小时的日志的目的。 

### Cassandra 中的数据分区 

Cassandra 作为分布式系统运行，并且符合前述数据分区原则。使用 Cassandra，数据分区依赖于在集群级别配置的算法和在表级别配置的分区键。

![Cassandra data partition][2]

Cassandra 查询语言（CQL）使用大家很熟悉的 SQL 表、行、列等术语。在上面的示例图中，表配置的主键中包含了分区键，具体格式为：<ruby>主键<rt>Primary Key</rt></ruby> = <ruby>分区键<rt>Partition Key</rt></ruby> + [<ruby>聚簇列<rt>Clustering Columns</rt></ruby>] 。

Cassandra 中的主键既定义了唯一的数据分区，也包含着分区内的数据排列依据信息。数据排列信息取决于聚簇列（非必需项）。每个唯一的分区键代表着服务器（包括其副本所在的服务器）中管理的若干行。 

### 在 CQL 中定义主键 

接下来的四个示例演示了如何使用 CQL 语法表示主键。定义主键会让数据行分到不同的集合里，通常这些集合就是分区。 

#### 定义方式 1（分区键：log_hour，聚簇列：无）

```
CREATE TABLE server_logs(
   log_hour TIMESTAMP PRIMARYKEY,
   log_level text,
   message text,
   server text
   )
```

这里，有相同 `log_hour` 的所有行都会进入同一个分区。

#### 定义方式 2（分区键：log_hour，聚簇列：log_level）

```
CREATE TABLE server_logs(
   log_hour TIMESTAMP,
   log_level text,
   message text,
   server text,
   PRIMARY KEY (log_hour, log_level)
   )
```

此定义方式与方式 1 使用了相同的分区键，但此方式中，每个分区的所有行都会按 `log_level` 升序排列。

#### 定义方式 3（分区键：log_hour，server，聚簇列：无） 

```
CREATE TABLE server_logs(
   log_hour TIMESTAMP,
   log_level text,
   message text,
   server text,
   PRIMARY KEY ((log_hour, server))
   )
```

在此定义中，`server` 和 `log_hour` 字段都相同的行才会进入同一个分区。 

#### 定义方式 4（分区键：log_hour，server，聚簇列：log_level）

```
CREATE TABLE server_logs(
   log_hour TIMESTAMP,
   log_level text,
   message text,
   server text,
   PRIMARY KEY ((log_hour, server),log_level)
   )WITH CLUSTERING ORDER BY (column3 DESC);
```

此定义方式与方式 3 分区相同，但分区内的行会依照 `log_level` 降序排列。 

### Cassandra 如何使用分区键 

Cassandra 依靠分区键来确定在哪个节点上存储数据，以及在需要时定位数据。Cassandra 通过查看表中的分区键来执行这些读取和写入操作，并使用<ruby>令牌<rt>tokens</rt></ruby>（一个 $-2^{63}$ 到 $+2^{63}-1$ 范围内的 long 类型值）来进行数据分布和索引。这些令牌通过分区器映射到分区键，分区器使用了将分区键转换为令牌的分区函数。通过这种令牌机制，Cassandra 集群的每个节点都拥有一组数据分区。然后分区键在每个节点上启用数据索引。 

![Cassandra cluster with 3 nodes and token-based ownership][3]

图中显示了一个三节点的 Cassandra 集群以及相应的令牌范围分配。这只是一个简单的示意图：具体实现过程使用了 [Vnodes][4]。 

### 数据分区对 Cassandra 集群的影响

用心的分区键设计对于实现用例的理想分区大小至关重要。合理的分区可以实现均匀的数据分布和强大的 I/O 性能。分区大小对 Cassandra 集群有若干需要注意的影响：

  * 读取性能 —— 为了在磁盘上的 SSTables 文件中找到分区，Cassandra 使用缓存、索引和索引摘要等数据结构。过大的分区会降低这些数据结构的维护效率，从而对性能产生负面影响。Cassandra 新版本在这方面取得了长足的进步：特别是 3.6 及其以上版本的 Cassandra 引擎引入了存储改进，针对大型分区，可以提供更好的性能，以及更强的应对内存问题和崩溃的弹性。
  * 内存使用 —— 大分区会对 JVM 堆产生更大的压力，同时分区的增大也降低了垃圾收集机制的效率。
  * Cassandra 修复 —— 大分区使 Cassandra 执行修复维护操作（通过跨副本比较数据来保持数据一致）时更加困难。
  * “墓碑”删除 —— 听起来可能有点骇人，Cassandra 使用称为“<ruby>墓碑<rt>tombstones</rt></ruby>”的独特标记来记录要删除的数据。如果没有合适的数据删除模式和压缩策略，大分区会使删除过程变得更加困难。 

虽然这些影响可能会让人更倾向于简单地设计能产生小分区的分区键，但数据访问模式对理想的分区大小也有很大影响（有关更多信息，请阅读关于 [Cassandra 数据建模][5] 的深入讲解）。数据访问模式可以定义为表的查询方式，包括表的所有 `select` 查询。 理想情况下，CQL 选择查询应该在 `where` 子句中只使用一个分区键。也就是说，当查询可以从单个分区，而不是许多较小的分区获取所需数据时，Cassandra 是最有效率的。

### 分区键设计的最佳实践 

遵循分区键设计的最佳实践原则，这会帮你得到理想的分区大小。根据经验，Cassandra 中的最大分区应保持在 100MB 以下。理想情况下，它应该小于 10MB。虽然 Cassandra 3.6 及其以上版本能更好地支持大分区，但也必须对每个工作负载进行仔细的测试和基准测试，以确保分区键设计能够支持所需的集群性能。 

具体来说，这些最佳实践原则适用于任何分区键设计： 

  * 分区键的目标必须是将理想数量的数据放入每个分区，以支持其访问模式的需求。
  * 分区键应禁止无界分区：那些大小可能随着时间无限增长的分区。例如，在上面的 `server_logs` 示例中，随着服务器日志数量的不断增加，使用服务器列作为分区键就会产生无界分区。相比之下，使用 `log_hour` 将每个分区限制为一个小时数据的方案会更好。
  * 分区键还应避免产生分区倾斜，即分区增长不均匀，有些分区可能随着时间的推移而不受限制地增长。在 `server_logs` 示例中，在一台服务器生成的日志远多于其他服务器的情况下使用服务器列会产生分区倾斜。为了避免这种情况，可以从表中引入另一个属性来强制均匀分布，即使要创建一个虚拟列来这样做，也是值得的。
  * 使用时间元素和其他属性的组合分区键，这对时间序列数据分区很有帮助。这种方式可以防止无界分区，使访问模式能够在查询特定数据时使用时间属性，而且能够对特定时间段内的数据进行删除。上面的每个示例都使用了 `log_hour` 时间属性来演示这一点。 

还有一些工具可用于帮助测试、分析和监控 Cassandra 分区，以检查所选模式是否高效。通过仔细设计分区键，使解决方案的数据和需求保持一致，并遵循最佳实践原则来优化分区大小，你就可以充分利用数据分区，更好地发挥 Cassandra 的可扩展性和性能潜力。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/apache-cassandra

作者：[Anil Inamdar][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/anil-inamdar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://opensource.com/sites/default/files/uploads/apache_cassandra_1_0.png (Cassandra data partition)
[3]: https://opensource.com/sites/default/files/uploads/apache_cassandra_2_0.png (Cassandra cluster with 3 nodes and token-based ownership)
[4]: https://www.instaclustr.com/cassandra-vnodes-how-many-should-i-use/
[5]: https://www.instaclustr.com/resource/6-step-guide-to-apache-cassandra-data-modelling-white-paper/
