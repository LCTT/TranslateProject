Cassandra 和 Spark 数据处理一窥
==============================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/osdc_520x292_opendata_0613mm.png?itok=mzC0Tb28)

Apache Cassandra 数据库近来引起了很多的兴趣，这主要源于现代云端软件对于可用性及性能方面的要求。

那么，Apache Cassandra 是什么？它是一种为高可用性及线性可扩展性优化的分布式的联机交易处理 (OLTP) 数据库。具体说到 Cassandra 的用途时，可以想想你希望贴近用户的系统，比如说让我们的用户进行交互的系统、需要保证实时可用的程序等等，如：产品目录，物联网，医疗系统，以及移动应用。对这些程序而言，下线时间意味着利润降低甚至导致其他更坏的结果。Netfilix 是这个在 2008 年开源的项目的早期使用者，他们对此项目的贡献以及带来的成功让这个项目名声大噪。

Cassandra 于2010年成为了 Apache 软件基金会的顶级项目，并从此之后就流行起来。现在，只要你有 Cassadra 的相关知识，找工作时就能轻松不少。想想看，NoSQL 语言和开源技术能达到企业级 SQL 技术的高度，真让人觉得十分疯狂而又不可思议的。这引出了一个问题。是什么让它如此的流行？

因为采用了[亚马逊发表的 Dynamo 论文][1]中率先提出的设计，Cassandra 有能力在大规模的硬件及网络故障时保持实时在线。由于采用了点对点模式，在没有单点故障的情况下，我们能幸免于机架故障甚至全网中断。我们能在不影响用户体验的前提下处理数据中心故障。一个能考虑到故障的分布式系统才是一个没有后顾之忧的分布式系统，因为老实说，故障是迟早会发生的。有了 Cassandra， 我们可以直面残酷的生活并将之融入数据库的结构和功能中。

我们能猜到你现在在想什么，“但我只有关系数据库相关背景，难道这样的转变不会很困难吗？”这问题的答案介于是和不是之间。使用 Cassandra 建立数据模型对有关系数据库背景的开发者而言是轻车熟路。我们使用表格来建立数据模型，并使用 CQL （ Cassandra 查询语言）来查询数据库。然而，与 SQL 不同的是，Cassandra 支持更加复杂的数据结构，例如嵌套和用户自定义类型。举个例子，当要储存对一个小猫照片的点赞数目时，我们可以将整个数据储存在一个包含照片本身的集合之中从而获得更快的顺序查找而不是建立一个独立的表。这样的表述在 CQL 中十分的自然。在我们照片表中，我们需要记录名字，URL以及给此照片点赞过的人。

![](https://opensource.com/sites/default/files/resize/screen_shot_2016-05-06_at_7.17.33_am-350x198.png)

在一个高性能系统中，毫秒级处理都能对用户体验和客户维系产生影响。昂贵的 JOIN 操作制约了我们通过增加不可预见的网络调用而扩容的能力。当我们将数据反范式化使其能通过尽可能少的请求就可获取时，我们即可从磁盘空间成本的降低中获益并获得可预期的、高性能应用。我们将反范式化同 Cassandra 一同介绍是因为它提供了很有吸引力的的折衷方案。

很明显，我们不会局限于对于小猫照片的点赞数量。Canssandra 是一款为高并发写入优化的方案。这使其成为需要时常吞吐数据的大数据应用的理想解决方案。实时应用和物联网方面的应用正在稳步增长，无论是需求还是市场表现，我们也会不断的利用我们收集到的数据来寻求改进技术应用的方式。

这就引出了我们的下一步，我们已经提到了如何以一种现代的、性价比高的方式储存数据，但我们应该如何获得更多的动力呢？具体而言，当我们收集到了所需的数据，我们应该怎样处理呢？如何才能有效的分析几百 TB 的数据呢？如何才能实时的对我们所收集到的信息进行反馈，并在几秒而不是几小时的时间利作出决策呢？Apache Spark 将给我们答案。

Spark 是大数据变革中的下一步。 Hadoop 和 MapReduce 都是革命性的产品，它们让大数据界获得了分析所有我们所取得的数据的机会。Spark 对性能的大幅提升及对代码复杂度的大幅降低则将大数据分析提升到了另一个高度。通过 Spark，我们能大批量的处理计算，对流处理进行快速反应，通过机器学习作出决策，并通过图遍历来理解复杂的递归关系。这并非只是为你的客户提供与快捷可靠的应用程序连接（Cassandra 已经提供了这样的功能），这更是能洞悉 Canssandra 所储存的数据，作出更加合理的商业决策并同时更好地满足客户需求。

你可以看看 [Spark-Cassandra Connector][2] (开源) 并动手试试。若想了解更多关于这两种技术的信息，我们强烈推荐名为 [DataStax Academy][3] 的自学课程

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/5/basics-cassandra-and-spark-data-processing

作者：[Jon Haddad][a],[Dani Traphagen][b]
译者：[KevinSJ](https://github.com/KevinSJ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twitter.com/rustyrazorblade
[b]: https://opensource.com/users/dtrapezoid
[1]: http://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf
[2]: https://github.com/datastax/spark-cassandra-connector
[3]: https://academy.datastax.com/
[4]: http://conferences.oreilly.com/oscon/open-source-us/public/schedule/detail/49162
[5]: https://twitter.com/dtrapezoid
[6]: https://twitter.com/rustyrazorblade
