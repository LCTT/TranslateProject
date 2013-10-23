各种 NoSQL 的比较 TODO: 中英文之间需要半角空格
================

即使关系型数据库依然是非常有用的工具，它们持续几十年的垄断地位就要走到头了。现在已经存在无数能撼动关系型数据库地位的 NoSQL，当然，这些 NoSQL 还无法完全取代它们。（也就是说，关系型数据库还是处理关系型事务的最佳方式。）

NoSQL 与 NoSQL 之间的区别，要远大于 SQL 与 SQL 之间的区别。所以软件架构师必须要在项目一开始就选好一款合适的 NoSQL。

考虑到这种情况，本文为大家介绍以下几种 NoSQL 之间的区别：[Cassandra][], [Mongodb][], [CouchDB][], [Redis][], [Riak][], [Couchbase (ex-Membase)][], [Hypertable][], [ElasticSearch][], [Accumulo][], [VoltDB][], [Kyoto Tycoon][], [Scalaris][], [Neo4j][]和[HBase][]:

##最流行的 NoSQL

###MongoDB 2.2版

**开发语言：** C++

**主要特性：** 保留 SQL 中一些用户友好的特性（查询、索引等）。

**许可证：** AGPL (发起者: Apache)

**数据传输、存储的格式：** 自定义，二进制（ BSON 文档格式）

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
- 支持对数据建立索引
- 数据中心意识

**应用场景：**动态查询；需要定义索引而不是 map/reduce 功能；提高大数据库性能；想使用 CouchDB 但数据的 IO 吞吐量太大，CouchDB 无法满足要求。MongoDB 可以满足你的需求。

**使用案例：**想布署 MySQL 或 PostgreSQL，但它们存在的预定义处理语句和预定义变量让你望而却步。这个时候，MongoDB 是你可以考虑的选项。

###Riak 1.2版

**开发语言：** Erlang、C、以及一些 JavaScript

**主要特性：**容错机制（当一份数据失效，服务会自动切换到备份数据，保证服务一直在线 —— 译者注）

**许可证：** Apache

**数据传输、存储的格式：** HTTP/REST 架构，自定义二进制格式

- 可存储 BLOB（binary large object，二进制大对象，比如一张图片、一个声音文件 —— 译者注）。
- 可在分部式存储和备份存储之间作协调。
- 为了保证可验证性和安全性，Riak 在 JS 和 Erlaing 中提供提交前（pre-commit）和提交后（post-commit）钩子（hook）函数（你可以在提交数据前执行一个 hook，或者在提交数据后执行一个 hook —— 译者注）。
- JS 和 Erlang 提供映射和简化（map/reduce）编程模型。
- 使用 links 和 link walking 图形化数据库（link 用于描述对象之间的关系，link walking 是一个用于查询对象关系的进程 —— 译者注）。
- 次要标记（secondaty indeces，开发者在写数据时可用多个名称来标记一个对象 —— 译者注），一次只能用一个。
- 支持大数据对象（Luwak）（Luwak 是 Riak 中的一个服务层，为大数据量对象提供简单的、面向文档的抽象，弥补了 Riak 的 Key/Value 存储格式在处理大数据对象方面的不足 —— 译者注）。
- 提供“开源”和“企业”两个版本。
- 提供“全文搜索”（可能就是允许用户在不提供 table/volume 等信息，对一个表进行文本字段的搜索，瞎猜的，望指正 —— 译者注）。
- 正在将存储后端从“Bitcask”迁移到 Google 的“LevelDB”上。
- 企业版本提供多点备份（各点地位平等，非主从架构）和SNMP监控功能。

**应用场景：**假如你想要类似 Dynamo 的数据库，但不想要它的庞大和复杂；假如你需要良好的单点可扩展性、可用性和容错能力，但不想为多点备份买单。 Riak 能满足你的需求。

**使用案例：**销售点数据收集；工厂控制系统；必须实时在线的系统；需要易于升级的网站服务器。

###CouchDB 1.2版

**开发语言：** Erlang

**主要特性：**数据一致性；易于使用

**许可证：** Apache

**数据传输格式：** HTTP/REST

- 双向复制（一种同步技术，每个备份点都有一份它们自己的拷贝，允许用户在存储点断线的情况下修改数据，当存储节点重新上线时，CouchDB 会对所有节点同步这些修改 —— 译者注）。
- 支持持续同步或者点对点同步。
- 支持冲突检测。
- 支持主主互备（多个数据库时时同步数据，起到备份和分摊用户并行访问量的作用 —— 译者注）。
- 多版本并发控制（MVCC），写操作时不需要阻塞读操作（或者说不需要锁住数据库）。
- 向下兼容。
- 可靠的 crash-only 设计（所谓 crash-only，就是程序出错时，只需重启下程序，丢弃内存的所有数据，不需要执行复杂的数据恢复操作 —— 译者注）。
- 需要实时压缩数据。
- 视图（文档是 CouchDB 的核心概念，CouchDB 中的视图声明了如何从文档中提取数据，以及如何对提取出来的数据进行处理 —— 译者注）：内嵌映射和简化（map/reduce）编程模型。
- 格式化的views字段：lists（包含把视图运行结果转换成非 JSON 格式的方法）和 shows（包含把文档转换成非 JSON 格式的方法）（在 CouchDB 中，一个 Web 应用是与一个设计文档相对应的。在设计文档中可以包含一些特殊的字段，views 字段包含永久的视图定义 —— 译者注）。
- 可能会提供服务器端文档验证的功能。
- 可能提供身份认证功能。
- 通过 _changes 函数实时更新数据。
- 链接处理（attachment：couchDB 的每份文档都可以有一个 attachment，就像一份 email 有它的网址 —— 译者注）。
- 有个 CouchApps（第三方JS的应用）。

**应用场景：**用于随机数据量多、需要预定义查询的地方；用于版本控制比较重要的地方。

**使用案例：**可用于客户关系管理（CRM），内容管理系统（CMS）；可用于主主互备甚至多机互备。

###Redis 2.4版

**开发语言：** C/C++

**主要特性：**快到掉渣

**许可证：** BSD

**数据传输方式：** 类似 Telnet

- Redis 是一个内存数据库（in-memory database，简称 IMDB，将数据放在内存进行读写，这才是“快到掉渣”的真正原因 —— 译者注），磁盘只是提供数据持久化（即将内存的数据写到磁盘）的功能（这类数据库被称为“disk backed”数据库）。
- 当前不支持将磁盘作为 swap 分区，虚拟内存（VM）和 Diskstore 方式都没加到此版本（Redis 的数据持久化共有4种方式：定时快照、基于语句追加、虚拟内存、diskstore。其中 VM 方式由于性能不好以及不稳定的问题，已经被作者放弃，而 diskstore 方式还在实验阶段 —— 译者注）。
- 主从备份
- 存储结构为简单的 key/value 或 hash 表。
- 但是操作比较复杂，比如：ZREVRANGEBYSCORE。
- 支持 INCR（INCR key 就是将key中存储的数值加一 —— 译者注）命令（对限速和统计有帮助）。
- 支持sets数据类型（以及 union/diff/inter）。
- 支持 lists （以及 queue/blocking pop）。
- 支持 hash sets （多级对象）。
- 支持 sorted sets（高效率的表，在范围查找方面有优势）。
- 支持事务处理。
- 缓存中的数据可被标记为过期
- Pub/Sub 操作能让用户发送信息。

**应用场景：**适合布署快速多变的小规模数据（可以完全运行在存在中）。

**使用案例：**股价系统、分析系统、实时数据收集系统、实时通信系统、以及取代 memcached。

##Clones of Google's Bigtable

###HBase (V0.92.0)

**Written in:** Java

**Main point:** Billions of rows X millions of columns

**License:** Apache

**Protocol:** HTTP/REST (also Thrift)

- Modeled after Google's BigTable
- Uses Hadoop's HDFS as storage
- Map/reduce with Hadoop
- Query predicate push down via server side scan and get filters
- Optimizations for real time queries
- A high performance Thrift gateway
- HTTP supports XML, Protobuf, and binary
- Jruby-based (JIRB) shell
- Rolling restart for configuration changes and minor upgrades
- Random access performance is like MySQL
- A cluster consists of several different types of nodes

**Best used:** Hadoop is probably still the best way to run Map/Reduce jobs on huge datasets. Best if you use the Hadoop/HDFS stack already.

**For example:** Search engines. Analysing log data. Any place where scanning huge, two-dimensional join-less tables are a requirement.

###Cassandra (1.2)

**Written in:** Java

**Main point:** Best of BigTable and Dynamo

**License:** Apache

**Protocol:** Thrift & custom binary CQL3

- Tunable trade-offs for distribution and replication (N, R, W)
- Querying by column, range of keys (Requires indices on anything that you want to search on)
- BigTable-like features: columns, column families
- Can be used as a distributed hash-table, with an "SQL-like" language, CQL (but no JOIN!)
- Data can have expiration (set on INSERT)
- Writes can be much faster than reads (when reads are disk-bound)
- Map/reduce possible with Apache Hadoop
- All nodes are similar, as opposed to Hadoop/HBase
- Very good and reliable cross-datacenter replication

**Best used:** When you write more than you read (logging). If every component of the system must be in Java. ("No one gets fired for choosing Apache's stuff.")

**For example:** Banking, financial industry (though not necessarily for financial transactions, but these industries are much bigger than that.) Writes are faster than reads, so one natural niche is data analysis.

###Hypertable (0.9.6.5)

**Written in:** C++

**Main point:** A faster, smaller HBase

**License:** GPL 2.0

**Protocol:** Thrift, C++ library, or HQL shell

- Implements Google's BigTable design
- Run on Hadoop's HDFS
- Uses its own, "SQL-like" language, HQL
- Can search by key, by cell, or for values in column families.
- Search can be limited to key/column ranges.
- Sponsored by Baidu
- Retains the last N historical values
- Tables are in namespaces
- Map/reduce with Hadoop

**Best used:** If you need a better HBase.

**For example:** Same as HBase, since it's basically a replacement: Search engines. Analysing log data. Any place where scanning huge, two-dimensional join-less tables are a requirement.

###Accumulo (1.4)

**Written in:** Java and C++

**Main point:** A BigTable with Cell-level security

**License:** Apache

**Protocol:** Thrift

- Another BigTable clone, also runs of top of Hadoop
- Cell-level security
- Bigger rows than memory are allowed
- Keeps a memory map outside Java, in C++ STL
- Map/reduce using Hadoop's facitlities (ZooKeeper & co)
- Some server-side programming

**Best used:** If you need a different HBase.

**For example:** Same as HBase, since it's basically a replacement: Search engines. Analysing log data. Any place where scanning huge, two-dimensional join-less tables are a requirement.

##Special-purpose

###Neo4j (V1.5M02)

**Written in:** Java

**Main point:** Graph database - connected data

**License:** GPL, some features AGPL/commercial

**Protocol:** HTTP/REST (or embedding in Java)

- Standalone, or embeddable into Java applications
- Full ACID conformity (including durable data)
- Both nodes and relationships can have metadata
- Integrated pattern-matching-based query language ("Cypher")
- Also the "Gremlin" graph traversal language can be used
- Indexing of nodes and relationships
- Nice self-contained web admin
- Advanced path-finding with multiple algorithms
- Indexing of keys and relationships
- Optimized for reads
- Has transactions (in the Java API)
- Scriptable in Groovy
- Online backup, advanced monitoring and High Availability is AGPL/commercial licensed

**Best used:** For graph-style, rich or complex, interconnected data. Neo4j is quite different from the others in this sense.

**For example:** For searching routes in social relations, public transport links, road maps, or network topologies.

###ElasticSearch (0.20.1)

**Written in:** Java

**Main point:** Advanced Search

**License:** Apache

**Protocol:** JSON over HTTP (Plugins: Thrift, memcached)

- Stores JSON documents
- Has versioning
- Parent and children documents
- Documents can time out
- Very versatile and sophisticated querying, scriptable
- Write consistency: one, quorum or all
- Sorting by score (!)
- Geo distance sorting
- Fuzzy searches (approximate date, etc) (!)
- Asynchronous replication
- Atomic, scripted updates (good for counters, etc)
- Can maintain automatic "stats groups" (good for debugging)
- Still depends very much on only one developer (kimchy).

**Best used:** When you have objects with (flexible) fields, and you need "advanced search" functionality.

**For example:** A dating service that handles age difference, geographic location, tastes and dislikes, etc. Or a leaderboard system that depends on many variables.

##The "long tail"

(Not widely known, but definitely worthy ones)

###Couchbase (ex-Membase) (2.0)

**Written in:** Erlang & C

**Main point:** Memcache compatible, but with persistence and clustering

**License:** Apache

**Protocol:** memcached + extensions

- Very fast (200k+/sec) access of data by key
- Persistence to disk
- All nodes are identical (master-master replication)
- Provides memcached-style in-memory caching buckets, too
- Write de-duplication to reduce IO
- Friendly cluster-management web GUI
- Connection proxy for connection pooling and multiplexing (Moxi)
- Incremental map/reduce
- Cross-datacenter replication

**Best used:** Any application where low-latency data access, high concurrency support and high availability is a requirement.

**For example:** Low-latency use-cases like ad targeting or highly-concurrent web apps like online gaming (e.g. Zynga).

###VoltDB (2.8.4.1)

**Written in:** Java

**Main point:** Fast transactions and rapidly changing data

**License:** GPL 3

**Protocol:** Proprietary

- In-memory relational database.
- Can export data into Hadoop
- Supports ANSI SQL
- Stored procedures in Java
- Cross-datacenter replication

**Best used:** Where you need to act fast on massive amounts of incoming data.

**For example:** Point-of-sales data analysis. Factory control systems.

###Scalaris (0.5)

**Written in:** Erlang

**Main point:** Distributed P2P key-value store

**License:** Apache

**Protocol:** Proprietary & JSON-RPC

- In-memory (disk when using Tokyo Cabinet as a backend)
- Uses YAWS as a web server
- Has transactions (an adapted Paxos commit)
- Consistent, distributed write operations
- From CAP, values Consistency over Availability (in case of network partitioning, only the bigger partition - works)

**Best used:** If you like Erlang and wanted to use Mnesia or DETS or ETS, but you need something that is accessible from more languages (and scales much better than ETS or DETS).

**For example:** In an Erlang-based system when you want to give access to the DB to Python, Ruby or Java programmers.

###Kyoto Tycoon (0.9.56)

**Written in:** C++

**Main point:** A lightweight network DBM

**License:** GPL

**Protocol:** HTTP (TSV-RPC or REST)

- Based on Kyoto Cabinet, Tokyo Cabinet's successor
- Multitudes of storage backends: Hash, Tree, Dir, etc (everything from Kyoto Cabinet)
- Kyoto Cabinet can do 1M+ insert/select operations per sec (but Tycoon does less because of overhead)
- Lua on the server side
- Language bindings for C, Java, Python, Ruby, Perl, Lua, etc
- Uses the "visitor" pattern
- Hot backup, asynchronous replication
- background snapshot of in-memory databases
- Auto expiration (can be used as a cache server)

**Best used:** When you want to choose the backend storage algorithm engine very precisely. When speed is of the essence.

**For example:** Caching server. Stock prices. Analytics. Real-time data collection. Real-time communication. And wherever you used memcached before.

Of course, all these systems have much more features than what's listed here. I only wanted to list the key points that I base my decisions on. Also, development of all are very fast, so things are bound to change.

P.s.: And no, there's no date on this review. There are version numbers, since I update the databases one by one, not at the same time. And believe me, the basic properties of databases don't change that much.

---

via: http://kkovacs.eu/cassandra-vs-mongodb-vs-couchdb-vs-redis

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[chenjintao]:http://linux.cn/space/chenjintao
[校对者ID]:http://linux.cn/space/校对者ID

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
