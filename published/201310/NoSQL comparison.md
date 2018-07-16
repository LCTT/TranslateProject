各种 NoSQL 的比较
================

即使关系型数据库依然是非常有用的工具，但它们持续几十年的垄断地位就要走到头了。现在已经存在无数能撼动关系型数据库地位的 NoSQL，当然，这些 NoSQL 还无法完全取代它们。（也就是说，关系型数据库还是处理关系型事务的最佳方式。）

NoSQL 与 NoSQL 之间的区别，要远大于不同的 SQL 数据库之间的区别，所以软件架构师必须要在项目一开始就选好一款合适的 NoSQL。

考虑到这种情况，本文为大家介绍以下几种 NoSQL 之间的区别：[Cassandra][], [Mongodb][], [CouchDB][], [Redis][], [Riak][], [Couchbase (ex-Membase)][], [Hypertable][], [ElasticSearch][], [Accumulo][], [VoltDB][], [Kyoto Tycoon][], [Scalaris][], [Neo4j][]和[HBase][]：

##最流行的 NoSQL

###MongoDB 2.2版

**开发语言：** C++

**主要特性：** 保留 SQL 中一些用户友好的特性（查询、索引等）

**许可证：** AGPL （驱动: 采用Apache许可协议）

**数据传输格式：** 自定义，二进制（ BSON 文档格式）

- 主/从备份（支持自动故障切换功能）
- 自带数据分片功能
- 通过 javascript 表达式提供数据查询
- 服务器端完全支持 javascript 脚本
- 比 CouchDB 更好的升级功能
- 数据存储使用内存映射文件技术
- 功能丰富，性能不俗
- 最好开启日志功能（使用 --journal 参数）
- 在 32 位系统中，内存限制在 2.5GB
- 空数据库占用 192MB 空间
- 使用 GridFS（不是真正的文件系统）来保存大数据和元数据
- 支持对地理数据建立索引
- 可用于数据中心

**应用场景：** 

- 动态查询
- 喜欢定义索引，而不是使用 map/reduce 功能
- 高性能的大数据访问
- 想使用 CouchDB 但数据变化频度太大

**使用案例：** 

想布署 MySQL 或 PostgreSQL，但预先定义数据字典让你望而却步。这个时候，MongoDB 是你可以考虑的选项

###Riak 1.2版

**开发语言：** Erlang、C、以及一些 JavaScript

**主要特性：** 容错机制（当一份数据失效，服务会自动切换到备份数据，保证服务一直在线 —— 译者注）

**许可证：** Apache

**数据传输格式：** HTTP/REST 架构，或自定义二进制格式

- 可存储 BLOB（binary large object，二进制大对象，比如一张图片、一个声音文件 —— 译者注）
- 可在分布式存储和复制存储之间作协调
- 为了保证可验证性和安全性，Riak 在 JS 和 Erlaing 中提供提交前（pre-commit）和提交后（post-commit）钩子（hook）函数（你可以在提交数据前执行一个 hook，或者在提交数据后执行一个 hook —— 译者注）
- JS 和 Erlang 提供映射和简化（map/reduce）编程模型
- 使用 links 和 link walking ，用于图形化数据库（link 用于描述对象之间的关系，link walking 是一个用于查询对象关系的进程 —— 译者注）
- 次要标记（secondaty indeces，开发者在写数据时可用多个名称来标记一个对象 —— 译者注），一次只能用一个
- 支持大数据对象（Luwak）（Luwak 是 Riak 中的一个服务层，为大数据量对象提供简单的、面向文档的抽象，弥补了 Riak 的 Key/Value 存储格式在处理大数据对象方面的不足 —— 译者注）
- 提供“开源”和“企业”两个版本
- 基于Riak搜索的全文检索、建立索引和查询
- 正在将存储后端从“Bitcask”迁移到 Google 的“LevelDB”上
- 企业版本提供无主模式的多点复制（各点地位平等，非主从架构）和SNMP监控功能

**应用场景：** 

- 假如你想要类似 Dynamo 的数据库，但不想要它的庞大和复杂
- 假如你需要良好的单点可扩展性、可用性和容错能力，但不想为多点备份买单。 

**使用案例：** 

销售点数据收集；工厂控制系统；必须实时在线的系统；需要易于升级的网站服务器

###CouchDB 1.2版

**开发语言：** Erlang

**主要特性：** 数据一致性；易于使用

**许可证：** Apache

**数据传输格式：** HTTP/REST

- 双向复制！（一种同步技术，每个备份点都有一份它们自己的拷贝，允许用户在存储点断线的情况下修改数据，当存储节点重新上线时，CouchDB 会对所有节点同步这些修改 —— 译者注）
- 支持持续同步或者点对点同步
- 支持冲突检测
- 支持主主互备！（多个数据库实时同步数据，起到备份和分摊用户并行访问量的作用 —— 译者注）
- 多版本并发控制（MVCC），写操作时不需要阻塞读操作（或者说不需要锁住数据库的读取操作）
- 向下兼容以前版本的数据
- 可靠的 crash-only 设计（所谓 crash-only，就是程序出错时，只需重启下程序，丢弃内存的所有数据，不需要执行复杂的数据恢复操作 —— 译者注）
- 需要实时压缩数据
- 视图（文档是 CouchDB 的核心概念，CouchDB 中的视图声明了如何从文档中提取数据，以及如何对提取出来的数据进行处理 —— 译者注）：内嵌映射和简化（map/reduce）编程模型
- 格式化的views字段：lists（包含把视图运行结果转换成非 JSON 格式的方法）和 shows（包含把文档转换成非 JSON 格式的方法）（在 CouchDB 中，一个 Web 应用是与一个设计文档相对应的。在设计文档中可以包含一些特殊的字段，views 字段包含永久的视图定义 —— 译者注）
- 能够进行服务器端文档验证
- 能够提供身份认证功能
- 通过 _changes 函数实时更新数据！
- 链接处理（attachment：couchDB 的每份文档都可以有一个 attachment，就像一份 email 有它的网址 —— 译者注）
- 有个 [CouchApps][1]（第三方JS的应用）

**应用场景：** 

- 用于随机数据量多、需要预定义查询的地方
- 用于版本控制比较重要的地方

**使用案例：** 

可用于客户关系管理（CRM），内容管理系统（CMS）；可用于主主互备甚至多机互备

###Redis 2.4版

**开发语言：** C/C++

**主要特性：** 快到掉渣

**许可证：** BSD

**数据传输格式：** 类似 Telnet 式的交换

- Redis 是一个内存数据库（in-memory database，简称 IMDB，将数据放在内存进行读写，这才是“快到掉渣”的真正原因 —— 译者注），磁盘只是提供数据持久化（即将内存的数据写到磁盘）的功能（这类数据库被称为“disk backed”数据库）
- 当前不支持将磁盘作为 swap 分区，虚拟内存（VM）和 Diskstore 方式都没加到此版本（Redis 的数据持久化共有4种方式：定时快照、基于语句追加、虚拟内存、diskstore。其中 VM 方式由于性能不好以及不稳定的问题，已经被作者放弃，而 diskstore 方式还在实验阶段 —— 译者注）
- 主从备份
- 存储结构为简单的 key/value 或 hash 表
- 但是[操作比较复杂][2]，比如：ZREVRANGEBYSCORE
- 支持 INCR（INCR key 就是将key中存储的数值加一 —— 译者注）命令（对限速和统计有帮助）
- 支持sets数据类型（以及 union/diff/inter）
- 支持 lists （以及 queue/blocking pop）
- 支持 hash sets （多级对象）
- 支持 sorted sets（高效率的表，在范围查找方面有优势）
- 支持事务处理！
- 缓存中的数据可被标记为过期
- Pub/Sub 实现了消息订阅和推送！

**应用场景：** 

- 适合布署快速多变的小规模数据（可以完全运行在存在中）

**使用案例：** 

股价系统、分析系统、实时数据收集系统、实时通信系统、以及取代 memcached

##Google Bigtable 的衍生品

###HBase 0.92.0 版

**开发语言：** Java

**主要特性：** 支持几十亿行*几百万列的大表

**许可证：** Apache 

**数据传输格式：** HTTP/REST （也支持 Thrift 开发框架）

- 仿造 Google 的 BigTable
- 使用 Hadoop 的 HDFS 文件系统作为存储
- 使用 Hadoop 的映射和简化（map/reduce）编程模型
- 查询条件被推送到服务器端，由服务器端执行扫描和过滤
- 对实时查询进行优化
- 高性能的 Thrift gateway（访问 HBase 的接口之一，特点是利用 Thrift 序列化支持多种语言，可用于异构系统在线访问 HBase 表数据 —— 译者注）
- 使用 HTTP 通信协议，支持 XML、Protobuf 以及二进制格式
- 支持基于 Jruby（JIRB）的shell
- 当配置信息有更改时，支持 rolling restart（轮流重启数据节点）
- 随机读写性能与 MySQL 一样
- 一个集群可由不同类型的结点组成

**应用场景：** 

- Hadoop 可能是在大数据上跑 Map/Reduce 业务的最佳选择
- 如果你已经搭建了 Hadoop/HDFS 架构，HBase 也是你最佳的选择。

**使用案例：** 

搜索引擎；日志分析系统；扫描大型二维非关系型数据表。

###Cassandra 1.2版

**开发语言：** Java

**主要特性：** BigTable 和 Dynamo的完美结合（Cassandra 以 Amazon 专有的完全分布式的 Dynamo 为基础，结合了Google BigTable基于 Column Family 的数据模型 —— 译者注）

**许可证：** Apache

**数据传输格式：** Thrift 和自定义二进制 CQL3（即 Cassandra 查询语言第3版 —— 译者注）

- 可以灵活调整对数据的分布式或备份式存储（通过设置N，R，W之间的关系）（NRW是数据库布署模型中的概念，N是存储网络中复制数据的节点数，R是网络中读数据的节点数，W是网络中写数据的节点数。一个环境中N值是固定的，设置不同的WR值组合能在数据可用性和数据一致性之间取得不同的平衡，可参考 CAP 定理 —— 译者注）
- 按列查询，按keys值排序后存储（需要包含你想要搜索的任何信息）（Cassandra 的数据模型借鉴自 BigTable 的列式存储，列式存储可以理解成这样，将行ID、列簇号，列号以及时间戳一起，组成一个Key，然后将Value按Key的顺序进行存储 —— 译者注）
- 类似 BigTable 的特性：列、列簇
- 支持分布式 hash 表，使用“类 SQL” 语言 —— CQL（但没有 SQL 中的 JOIN 语句）
- 可以为数据设置一个过期时间（使用 INSERT 指令）
- 写性能远高于读性能（读性能的瓶颈是磁盘 IO）
- 可使用 Hadoop 的映射和简化（map/reduce）编程模型
- 所有节点都相似，这点与 Hadop/HBase 架构不同
- 可靠的跨数据中心备份解决方案

**应用场景：** 

- 写操作多于读操作的环境（比如日志系统）
- 如果系统全部由 JAVA 组成（“没人会因为使用了 Apache 许可下的产品而被炒鱿鱼”（此句貌似是网上有人针对“Apache considered harmful”一文所作的回应 —— 译者注））

**使用案例：** 

银行、金融机构；写性能强于读性能，所以 Cassandra 天生就是用来作数据分析的。

###Hypertable 0.9.6.5版

**开发语言：** C++

**主要特性：** HBase 的精简版，但比 HBase 更快

**许可证：** GPL 2.0

**数据传输格式：** Thrift，C++库，或者 HQL shell

- 采用与 Google BigTable 相似的设计
- 运行在 Hadoop HDFS 之上
- 使用自己的“类 SQL”语言 —— HQL
- 可以根据 key 值、单元（cell）进行查找，可以在列簇上查找
- 查询数据可以指定 key 或者列的范围
- 由百度公司赞助（百度早在2009年就成为这个项目的赞助商了 —— 好吧译者表示有点大惊小怪了:P）
- 能保留一个值的 N 个历史版本
- 表在命名空间内定义
- 使用 Hadoop 的 Map/reduce 模型

**应用场景：** 

- 假如你需要一个更好的HBase，就用Hypertable吧

**使用案例：** 

与HBase一样，就是搜索引擎被换了下；分析日志数据的系统；适用于浏览大规模二维非关系型数据表。

###Accumulo 1.4版

**开发语言：** Java 和 C++

**主要特性：** 一个有着单元级安全的 BigTable

**许可证：** Apache

**数据传输格式：** Thrift

- 另一个 BigTable 的复制品，也是跑在 Hadoop 的上层
- 单元级安全保证
- 允许使用比内存容量更大的数据列
- 通过 C++ 的 STL 可保持数据从 JAVA 环境的内存映射出来
- 使用 Hadoop 的 Map/reduce 模型
- 支持在服务器端编程

**应用场景：** 

- HBase的替代品

**使用案例：** 

与HBase一样，就是搜索引擎被换了下；分析日志数据的系统；适用于浏览大规模二维非关系型数据表。

##特殊用途

###Neo4j V1.5M02 版

**开发语言：** Java

**主要特性：** 图形化数据库

**许可证：** GPL，AGPL（商业用途）

**数据传输格式：** HTTP/REST（或内嵌在 Java 中）

- 可独立存在，或内嵌在 JAVA 的应用中
- 完全的 ACID 保证（包括正在处理的数据）
- 节点和节点的关系都可以拥有原数据
- 集成基于“模式匹配”的查询语言（Cypher）
- 支持“Gremlin”图形转化语言
- 可对节点与节点关系进行索引
- 良好的自包含网页管理技术
- 多个算法实现高级文件查找功能
- 可对 key 与 key 的关系进行索引
- 优化读性能
- 在 JAVA API 中实现事务处理
- 可运行脚本 Groovy 脚本
- 在商用版本中提供在线备份，高级监控和高可用性功能

**应用场景：** 

- 适用于用图形显示复杂的交互型数据。

**使用案例：** 

搜寻社交关系网、公共传输链、公路路线图、或网络拓扑结构

###ElasticSearch 0.20.1 版

**开发语言：** Java

**主要特性：** 高级搜索

**许可证：** Apache

**数据传输格式：** 通过 HTTP 使用 JSON 进行数据索引（插件：Thrift, memcached）

- 以 JSON 形式保存数据
- 提供版本升级功能
- 有父文档和子文档功能
- 文档有过期时间
- 提供复杂多样的查询指令，可使用脚本
- 支持写操作一致性的三个级别：ONE、QUORUM、ALL
- 支持通过分数排序
- 支持通过地理位置排序
- 支持模糊查询（通过近似数据查询等方式实现）
- 支持异步复制
- 自动升级，也可通过设置脚本升级
- 可以维持自动的“统计组”（对调试很有帮助）
- 只有一个开发者（kimchy）

**应用场景：** 

- 当你有可伸缩性很强的项目并且想拥有“高级搜索”功能。

**使用案例：** 

可布署一个约会服务，提供不同年龄、不同地理位置、不同品味的客户的交友需求。或者可以布署一个基于多项参数的排行榜。

##其他

（不怎么有名，但值得在这里介绍一下）

###Couchbase (ex-Membase) 2.0 版

**开发语言：** Erlang 和 C

**主要特性：** 兼容 Memcache，但数据是持久化的，并且支持集群

**许可证：** Apache

**数据传输格式：** 缓存和扩展（memcached + extensions）

- 通过 key 访问数据非常快（20万以上IOPS）
- 数据保存在磁盘（不像 Memcache 保存在内存中 —— 译者注）
- 在主主互备中，所有节点数据是一致的
- 提供类似 Memcache 将数据保存在内存的功能
- 支持重复数据删除功能
- 友好的集群管理 Web 界面
- 支持池和多丛结构的代理（利用 Moxi 项目）
- 支持 Map/reduce 模式
- 支持跨数据中心备份

**应用场景：** 

- 适用于低延迟数据访问系统，高并发和高可用系统。

**使用案例：** 

低延迟可用于广告定投；高并发可用于在线游戏（如星佳公司）。

###VoltDB 2.8.4.1版

**开发语言：** Java

**主要特性：** 快速的事务处理和数据变更

**许可证：** GPL 3

**数据传输格式：** 专有方式

- 运行在内存的关系型数据库
- 可以将数据导入到 Hadoop
- 支持 ANSI SQL
- 在 JAVA 环境中保存操作过程
- 支持跨数据中心备份

**应用场景：** 

- 适用于在大量传入数据中保证快速反应能力的场合。

**使用案例：** 

销售点数据分析系统；工厂控制系统。

###Scalaris 0.5版

**开发语言：** Erlang

**主要特性：** 分布式 P2P 键值存储

**许可证：** Apache

**数据传输和存储的方式：** 自有方式和 基于JSON的远程过程调用协议

- 数据保存在内存中（使用 Tokyo Cabinet 作为后台时，数据可以持久化到磁盘中）
- 使用 YAWS 作为 Web 服务器
- Has transactions (an adapted Paxos commit)
- 支持事务处理（基于 Paxos 提交）（Paxos 是一种基于消息传递模型的一致性算法 —— 译者注）
- 支持分布式数据的一致性写操作
- 根据 CAP 定理，数据一致性要求高于数据可用性（前提是在一个比较大的网络分区环境下工作）（CAP 定理：数据一致性consistency、数据可用性availability、分隔容忍partition tolerance是分布式计算系统的三个属性，一个分布式计算系统不可能同时满足全部三项）

**应用场景：** 

- 如果你喜欢 Erlang 并且想要使用 Mnesia 或 DETS 或 ETS，但你需要一个能使用多种语言（并且可扩展性强于 ETS 和 DETS）的技术，那就选它吧。

**使用案例：** 

使用基于 Erlang 的系统，但是想通过 Python、Ruby 或 JAVA 访问数据库

###Kyoto Tycoon 0.9.56版

**开发语言：** C++

**主要特性：** 轻量级网络数据库管理系统

**许可证：** GPL

**数据传输和存储的方式：** HTTP (TSV-RPC or REST)

- 基于 Kyoto Cabinet, 是 Tokyo Cabinet 的成功案例
- 支持多种存储后端：Hash，树、目录等等（所有概念都是从 Kyoto Cabinet 那里来的）
- Kyoto Cabinet 可以达到每秒100万次插入/查询操作（但是 Tycoon 由于瓶颈问题，性能比 Cabinet 要差点）
- 服务器端支持 Lua 脚本语言
- 支持 C、JAVA、Python、Ruby、Perl、Lua 等语言
- 使用访问者模式开发（visitor patten：让开发者能在不修改类层次结构的前提下，定义该类层次结构的操作 —— 不明白就算了，译者也不明白）
- 支持热备、异步备份
- 支持内存数据库在后端执行快照
- 自动过期处理（可用来布署一个缓存服务器）

**应用场景：** 

- 当你想要一个很精准的后端存储算法引擎，并且速度是刚需的时候，玩玩 Kyoto Tycoon 吧。

**使用案例：** 

缓存服务器；股价查询系统；数据分析系统；实时数据控制系统；实时交互系统；memcached的替代品。

当然，上述系统的特点肯定不止列出来这么点。我只是列出了我认为很关键的信息。另外科技发展迅猛，技术改变得非常快。

附：现在下定论比较孰优孰劣还为时过早。上述数据库的版本号以及特性我会一个一个慢慢更新。相信我，这些数据库的特性不会变得很快。

---

via: http://kkovacs.eu/cassandra-vs-mongodb-vs-couchdb-vs-redis

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[Cassandra]:http://cassandra.apache.org/
[Mongodb]:http://www.mongodb.org/
[CouchDB]:http://couchdb.apache.org/
[Redis]:http://redis.io/
[Riak]:http://basho.com/riak/
[Couchbase (ex-Membase)]:http://www.couchbase.org/membase
[Hypertable]:http://hypertable.org/
[ElasticSearch]:http://www.elasticsearch.org/
[Accumulo]:http://accumulo.apache.org/
[VoltDB]:http://voltdb.com/
[Kyoto Tycoon]:http://fallabs.com/kyototycoon/
[Scalaris]:https://code.google.com/p/scalaris/
[Neo4j]:http://neo4j.org/
[HBase]:http://hbase.apache.org/

[1]:http://couchapp.org/
[2]:http://redis.io/commands
