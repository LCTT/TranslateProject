Postgres 索引类型探索之旅
=============

在 Citus 公司，为让事情做的更好，我们与客户一起在数据建模、优化查询、和增加 [索引][3]上花费了许多时间。我的目标是为客户的需求提供更好的服务，从而创造成功。我们所做的其中一部分工作是[持续][5]为你的 Citus 集群保持良好的优化和 [高性能][4]；另外一部分是帮你了解关于 Postgres 和 Citus 你所需要知道的一切。毕竟，一个健康和高性能的数据库意味着 app 执行的更快，并且谁不愿意这样呢？ 今天，我们简化一些内容，与客户分享一些关于 Postgres 索引的信息。

Postgres 有几种索引类型， 并且每个新版本都似乎增加一些新的索引类型。每个索引类型都是有用的，但是具体使用哪种类型取决于（1）数据类型，有时是（2）表中的底层数据和（3）执行的查找类型。接下来的内容我们将介绍在 Postgres 中你可以使用的索引类型，以及你何时该使用何种索引类型。在开始之前，这里有一个我们将带你亲历的索引类型列表：

*   B-Tree
*   <ruby>倒排索引<rt>Generalized Inverted Index</rt></ruby> (GIN)
*   <ruby>倒排搜索树<rt>Generalized Inverted Seach Tree</rt></ruby> (GiST)
*   <ruby>空间分区的<rt>Space partitioned</rt></ruby> GiST (SP-GiST)
*   <ruby>块范围索引<rt>Block Range Index</rt></ruby> (BRIN)
*   Hash

现在开始介绍索引。

### 在 Postgres 中，B-Tree 索引是你使用的最普遍的索引

如果你有一个计算机科学的学位，那么 B-Tree 索引可能是你学会的第一个索引。[B-tree 索引][6] 会创建一个始终保持自身平衡的一棵树。当它根据索引去查找某个东西时，它会遍历这棵树去找到键，然后返回你要查找的数据。使用索引是大大快于顺序扫描的，因为相对于顺序扫描成千上万的记录，它可以仅需要读几个 [页][7] (当你仅返回几个记录时)。

如果你运行一个标准的 `CREATE INDEX` 语句，它将为你创建一个 B-tree 索引。 B-tree 索引在大多数的数据类型上是很有价值的，比如文本、数字和时间戳。如果你刚开始在你的数据库中使用索引，并且不在你的数据库上使用太多的 Postgres 的高级特性，使用标准的 B-Tree 索引可能是你最好的选择。

### GIN 索引，用于多值列

<ruby>倒排索引<rt>Generalized Inverted Index</rt></ruby>，一般称为 [GIN][8]，大多适用于当单个列中包含多个值的数据类型。

据 Postgres 文档： 

> “GIN 设计用于处理被索引的条目是复合值的情况，并且由索引处理的查询需要搜索在复合条目中出现的值。例如，这个条目可能是文档，查询可以搜索文档中包含的指定字符。”

包含在这个范围内的最常见的数据类型有：

*   [hStore][1]
*   Array
*   Range
*   [JSONB][2]

关于 GIN 索引中最让人满意的一件事是，它们能够理解存储在复合值中的数据。但是，因为一个 GIN 索引需要有每个被添加的单独类型的数据结构的特定知识，因此，GIN 索引并不是支持所有的数据类型。

### GiST 索引， 用于有重叠值的行

<ruby>倒排搜索树<rt>Generalized Inverted Seach Tree</rt></ruby>（GiST）索引多适用于当你的数据与同一列的其它行数据重叠时。GiST 索引最好的用处是：如果你声明一个几何数据类型，并且你希望知道两个多边型是否包含一些点时。在一种情况中一个特定的点可能被包含在一个盒子中，而与此同时，其它的点仅存在于一个多边形中。使用 GiST 索引的常见数据类型有：

*   几何类型
*   需要进行全文搜索的文本类型

GiST 索引在大小上有很多的固定限制，否则，GiST 索引可能会变的特别大。作为其代价，GiST 索引是有损的（不精确的）。

据官方文档：

> “GiST 索引是有损的，这意味着索引可能产生虚假匹配，所以需要去检查真实的表行去消除虚假匹配。 (当需要时 PostgreSQL 会自动执行这个动作)”

这并不意味着你会得到一个错误结果，它只是说明了在 Postgres 给你返回数据之前，会做了一个很小的额外工作来过滤这些虚假结果。

特别提示：同一个数据类型上 GIN 和 GiST 索引往往都可以使用。通常一个有很好的性能表现，但会占用很大的磁盘空间，反之亦然。说到 GIN 与 GiST 的比较，并没有某个完美的方案可以适用所有情况，但是，以上规则应用于大部分常见情况。

### SP-GiST 索引，用于更大的数据

空间分区 GiST （SP-GiST）索引采用来自 [Purdue][9] 研究的空间分区树。 SP-GiST 索引经常用于当你的数据有一个天然的聚集因素，并且不是一个平衡树的时候。 电话号码是一个非常好的例子 (至少 US 的电话号码是)。 它们有如下的格式：

*   3 位数字的区域号
*   3 位数字的前缀号 (与以前的电话交换机有关)
*   4 位的线路号

这意味着第一组前三位处有一个天然的聚集因素，接着是第二组三位，然后的数字才是一个均匀的分布。但是，在电话号码的一些区域号中，存在一个比其它区域号更高的饱合状态。结果可能导致树非常的不平衡。因为前面有一个天然的聚集因素，并且数据不对等分布，像电话号码一样的数据可能会是 SP-GiST 的一个很好的案例。

### BRIN 索引， 用于更大的数据

块范围索引（BRIN）专注于一些类似 SP-GiST 的情形，它们最好用在当数据有一些自然排序，并且往往数据量很大时。如果有一个以时间为序的 10 亿条的记录，BRIN 也许就能派上用场。如果你正在查询一组很大的有自然分组的数据，如有几个邮编的数据，BRIN 能帮你确保相近的邮编存储在磁盘上相近的地方。

当你有一个非常大的比如以日期或邮编排序的数据库， BRIN 索引可以让你非常快的跳过或排除一些不需要的数据。此外，与整体数据量大小相比，BRIN 索引相对较小，因此，当你有一个大的数据集时，BRIN 索引就可以表现出较好的性能。

### Hash 索引， 总算不怕崩溃了

Hash 索引在 Postgres 中已经存在多年了，但是，在 Postgres 10 发布之前，对它们的使用一直有个巨大的警告，它不是 WAL-logged 的。这意味着如果你的服务器崩溃，并且你无法使用如 [wal-g][10] 故障转移到备机或从存档中恢复，那么你将丢失那个索引，直到你重建它。 随着 Postgres 10 发布，它们现在是 WAL-logged 的，因此，你可以再次考虑使用它们 ，但是，真正的问题是，你应该这样做吗?

Hash 索引有时会提供比 B-Tree 索引更快的查找，并且创建也很快。最大的问题是它们被限制仅用于“相等”的比较操作，因此你只能用于精确匹配的查找。这使得 hash 索引的灵活性远不及通常使用的 B-Tree 索引，并且，你不能把它看成是一种替代品，而是一种用于特殊情况的索引。

### 你该使用哪个？

我们刚才介绍了很多，如果你有点被吓到，也很正常。 如果在你知道这些之前， `CREATE INDEX` 将始终为你创建使用 B-Tree 的索引，并且有一个好消息是，对于大多数的数据库， Postgres 的性能都很好或非常好。 :) 如果你考虑使用更多的 Postgres 特性，下面是一个当你使用其它 Postgres 索引类型的备忘清单：

*   B-Tree - 适用于大多数的数据类型和查询
*   GIN - 适用于 JSONB/hstore/arrays
*   GiST - 适用于全文搜索和几何数据类型
*   SP-GiST - 适用于有天然的聚集因素但是分布不均匀的大数据集
*   BRIN - 适用于有顺序排列的真正的大数据集
*   Hash - 适用于相等操作，而且，通常情况下 B-Tree 索引仍然是你所需要的。

如果你有关于这篇文章的任何问题或反馈，欢迎加入我们的 [slack channel][11]。

--------------------------------------------------------------------------------

via: https://www.citusdata.com/blog/2017/10/17/tour-of-postgres-index-types/

作者：[Craig Kerstiens][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.citusdata.com/blog/2017/10/17/tour-of-postgres-index-types/
[1]:https://www.citusdata.com/blog/2016/07/14/choosing-nosql-hstore-json-jsonb/
[2]:https://www.citusdata.com/blog/2016/07/14/choosing-nosql-hstore-json-jsonb/
[3]:https://www.citusdata.com/blog/2017/10/11/index-all-the-things-in-postgres/
[4]:https://www.citusdata.com/blog/2017/09/29/what-performance-can-you-expect-from-postgres/
[5]:https://www.citusdata.com/product/cloud
[6]:https://en.wikipedia.org/wiki/B-tree
[7]:https://www.8kdata.com/blog/postgresql-page-layout/
[8]:https://www.postgresql.org/docs/10/static/gin.html
[9]:https://www.cs.purdue.edu/spgist/papers/W87R36P214137510.pdf
[10]:https://www.citusdata.com/blog/2017/08/18/introducing-wal-g-faster-restores-for-postgres/
[11]:https://slack.citusdata.com/
[12]:https://twitter.com/share?url=https://www.citusdata.com/blog/2017/10/17/tour-of-postgres-index-types/&text=A%20tour%20of%20Postgres%20Index%20Types&via=citusdata
[13]:https://www.linkedin.com/shareArticle?mini=true&url=https://www.citusdata.com/blog/2017/10/17/tour-of-postgres-index-types/
