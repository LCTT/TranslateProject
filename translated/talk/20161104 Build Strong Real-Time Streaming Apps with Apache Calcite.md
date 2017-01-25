# 用 Apache Calcite 构建强大的实时流应用

 ![Calcite](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/calcite.jpg?itok=CUZmjPjy "Calcite ") 

Calcite 是一个数据框架，它允许你创建自定义数据库功能，微软开发者 Atri Sharma 在 Apache 即将到来的 11 月 14-16 日在西班牙塞维利亚举行的 Big Data Europe 中解释。[Creative Commons Zero][2]

Wikimedia Commons: Parent Géry

[Apache Calcite][7] 数据管理框架包含许多典型的数据库管理系统，但省略了其他部分，如存储数据和算法来处理数据。 Microsoft 在 Azure Data Lake 的软件工程师 Atri Sharma 在西班牙塞维利亚的即将到来的 [Apache：Big Data][6] 会议上的演讲中将讨论使用 [Apache Calcite][5]的高级查询规划能力。我们与 Sharma 讨论了解有关 Calcite 的更多信息，以及现有程序如何利用其功能。

 ![Atri Sharma](https://www.linux.com/sites/lcom/files/styles/floated_images/public/atri-sharma.jpg?itok=77cvZWfw "Atri Sharma") 

Atri Sharma，微软 Azure Data Lake 的软件工程师，已经[授权使用][1]

**Linux.com：你能提供一些关于 Apache Calcite 的背景吗？ 它有什么作用？

Atri Sharma：Calcite是一个框架，它是许多数据库内核的基础。Calcite 允许你构建自定义数据库功能并使用 Calcite 所需的资源。例如，Hive 使用 Calcite 进行基于成本的查询优化、Drill 和 Kylin 使用 Calcite 进行 SQL 解析和优化、Apex 使用 Calcite 进行流式 SQL。

**Linux.com：有哪些是使得 Apache Calcite 与其他框架不同的特性？

Atri：Calcite 是独一无二的，它允许你建立自己的数据平台。 Calcite 不直接管理你的数据，而是允许你使用 Calcite 的库来定义你自己的组件。 例如，它允许使用 Calcite 中可用的 Planner 定义自定义查询优化器，而不是提供通用查询优化器。

**Linux.com：Apache Calcite 本身不会存储或处理数据。 它如何影响程序开发？

Atri：Calcite 是数据库内核中的依赖项。它面向希望扩展其功能的数据管理平台，而无需从头开始编写大量功能。

** Linux.com：谁应该使用它？ 你能举几个例子吗？**

Atri：任何旨在扩展其功能的数据管理平台都应使用 Calcite。 我们是你下一个高性能数据库的基础！

具体来说，我认为最大的例子是 Hive 使用 Calcite 用于查询优化、Flink 解析和流 SQL 处理。 Hive 和 Flink 是成熟的数据管理引擎，并使用 Calcite 高度专业目的。这是对 Calcite 应用进一步加强数据管理平台核心的一个好的案例研究。

**Linux.com：你有哪些期待的新功能？

Atri：流 SQL 增强是令我非常兴奋的事情。这些功能令人兴奋，因为它们将使 Calcite 的用户能够更快地开发实时流式应用程序，并且这些程序的强大和功能将是多方面的。流程序是新的事实，并且在流 SQL 中具有查询优化的优点对于大部分人将是非常有用的。此外，关于暂存表的讨论还在进行，所以请继续关注！

--------------------------------------------------------------------------------

via: https://www.linux.com/news/build-strong-real-time-streaming-apps-apache-calcite

作者：[AMBER ANKERHOLZ][a]

译者：[geekpi](https://github.com/geekpi)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/aankerholz
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/atri-sharmajpg
[4]:https://www.linux.com/files/images/calcitejpg
[5]:https://calcite.apache.org/
[6]:http://events.linuxfoundation.org/events/apache-big-data-europe
[7]:https://calcite.apache.org/
