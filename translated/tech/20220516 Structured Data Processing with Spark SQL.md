[#]: subject: "Structured Data Processing with Spark SQL"
[#]: via: "https://www.opensourceforu.com/2022/05/structured-data-processing-with-spark-sql/"
[#]: author: "Phani Kiran https://www.opensourceforu.com/author/phani-kiran/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

用 Spark SQL 进行结构化数据处理
======
Spark SQL 是 Spark 生态系统中处理结构化格式数据的模块。它在内部使用 Spark Core API 进行处理，但对用户的使用进行了抽象。这篇文章深入浅出，告诉你 Spark SQL 3.x 的新内容。

![][1]

有了 Spark SQL，用户还可以编写 SQL 风格的查询。这对于精通结构化查询语言或 SQL 的广大用户群体来说，基本上是很有帮助的。用户也将能够在结构化数据上编写交互式和临时性的查询。Spark SQL 弥补了弹性分布式数据集（RDD）和关系表之间的差距。RDD 是 Spark 的基本数据结构。它将数据作为分布式对象存储在适合并行处理的节点集群中。RDD 很适合底层处理，但在运行时很难调试，程序员不能自动推断 schema。另外，RDD 没有内置的优化功能。Spark SQL 提供了 DataFrames 和数据集来解决这些问题。

Spark SQL 可以使用现有的 Hive 元存储、SerDes 和 UDFs。它可以使用 JDBC/ODBC 连接到现有的 BI 工具。

### 数据源

大数据处理通常需要处理不同的文件类型和数据源（关系型和非关系型）的能力。Spark SQL 支持一个统一的 DataFrame 接口来处理不同类型的源，如下所示。

*文件：*

* CSV
* Text
* JSON
* XML

*JDBC/ODBC：*

* MySQL
* Oracle
* Postgres

*带 schema 的文件：*

* AVRO
* Parquet

*Hive 表：*

* Spark SQL 也支持读写存储在 Apache Hive 中的数据。

通过 DataFrame，用户可以无缝地读取这些多样化的数据源，并对其进行转换/连接。

### Spark SQL 3.x 的新内容

在以前的版本中（Spark 2.x），查询计划是基于启发式规则和成本估算的。从解析到逻辑和物理查询计划，最后到优化的过程是连续的。这些版本对转换和行动的运行时特性几乎没有可见性。因此，由于以下原因，查询计划是次优的：

* 缺失和过时的统计数据
* 次优的启发式方法
* 错误的成本估计

Spark 3.x 通过使用运行时数据来迭代改进查询计划和优化，增强了这个过程。前一阶段的运行时统计数据被用来优化后续阶段的查询计划。这里有一个反馈回路，有助于重新规划和重新优化执行计划。

![Figure 1: Query planning][2]

#### 自适应查询执行（AQE）

查询被改变为逻辑计划，最后变成物理计划。这里的概念是“重新优化”。它利用前一阶段的可用数据，为后续阶段重新优化。正因为如此，整个查询的执行要快得多。

AQE 可以通过设置 SQL 配置来启用，如下所示（Spark 3.0 中默认为 false）：

```
spark.conf.set(“spark.sql.adaptive.enabled”,true)
```

#### 动态合并 shuffle 分区

Spark 在 shuffle 操作后确定最佳的分区数量。在 AQE 中，Spark 使用默认的分区数，即 200 个。这可以通过配置来启用。

```
spark.conf.set(“spark.sql.adaptive.coalescePartitions.enabled”,true)
```

#### 动态切换 join 策略

广播哈希是最好的连接操作。如果其中一个数据集很小，Spark 可以动态地切换到广播 join，而不是在网络上 shuffe 大量的数据。

#### 动态优化倾斜 join

如果数据分布不均匀，数据会出现倾斜，会有一些大的分区。这些分区占用了大量的时间。Spark 3.x 通过将大分区分割成多个小分区来进行优化。这可以通过设置来启用：

```
spark.conf.set(“spark.sql.adaptive.skewJoin.enabled”,true)
```

![Figure 2: Performance improvement in Spark 3.x (Source: Databricks)][3]

### 其他改进措施


此外，Spark SQL 3.x还支持以下内容。

#### 动态分区修剪

3.x 将只读取基于其中一个表的值的相关分区。这消除了解析大表的需要。

#### Join 提示

如果用户对数据有了解，这允许用户指定要使用的 join 策略。这增强了查询的执行过程。

#### 兼容 ANSI SQL

在兼容 Hive 的早期版本的 Spark 中，我们可以在查询中使用某些关键词，这样做是完全可行的。然而，这在 Spark SQL 3 中是不允许的，因为它有完整的 ANSI SQL 支持。例如，“将字符串转换为整数”会在运行时产生异常。它还支持保留关键字。

#### 较新的 Hadoop、Java 和 Scala 版本

从 Spark 3.0 开始，支持 Java 11 和 Scala 2.12。 Java 11 具有更好的原生协调和垃圾校正，从而带来更好的性能。 Scala 2.12 利用了 Java 8 的新特性，优于 2.11。

Spark 3.x 提供了这些现成的有用功能，而无需开发人员操心。这将显着提高 Spark 的整体性能。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/structured-data-processing-with-spark-sql/

作者：[Phani Kiran][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/phani-kiran/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Spark-SQL-Data-cluster.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-1-Query-planning.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-2-Performance-improvement-in-Spark-3.x-Source-Databricks.jpg
