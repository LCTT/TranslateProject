各种NoSQL的比较
================

即使关系型数据库依然是非常有用的工具，它们持续几十年的垄断地位就要走到头了。现在已经存在无数能撼动关系型数据库地位的NoSQL，当然，这些NoSQL还无法完全取代它们。（也就是说，关系型数据库还是处理关系型事务的最佳方式。）

NoSQL与NoSQL之间的区别，要远大于SQL与SQL之间的区别。所以软件架构师必须要在项目一开始就选好一款合适的NoSQL。

考虑到这种情况，本文为大家介绍以下几种NoSQL之间的区别：[Cassandra][], [Mongodb][], [CouchDB][], [Redis][], [Riak][], [Couchbase (ex-Membase)][], [Hypertable][], [ElasticSearch][], [Accumulo][], [VoltDB][], [Kyoto Tycoon][], [Scalaris][], [Neo4j][]和[HBase][]:

##最流行的NoSQL

###MongoDB (2.2)

**编程语言：** C++

**要点：** 保留SQL中一些用户友好的特性（查询、索引等）。

**许可证：** AGPL (发起者: Apache)

**支持的数据结构：** 自定义，二进制（BSON）

- 主/从备份（支持自动故障切换功能）
- 自带数据分片功能
- 通过javascript表达式提供数据查询
- 服务器端完全支持javascript脚本
- 比CouchDB更好的升级功能
- 数据存储使用内存映射文件技术
- 功能丰富，性能不俗
- 最好开启日志功能（使用--journal参数）
- 在32位系统中，内存限制在2.5GB
- 空数据库占用192MB空间
- 使用GridFS（不是真正的文件系统）来保存大数据和元数据
- 支持对数据建立索引
- 数据中心意识

**应用场景：**动态查询；需要定义索引而不是map/reduce功能；提高大数据库性能；想使用CouchDB但数据IO量太大，CouchDB无法满足要求。

**For example:** For most things that you would do with MySQL or PostgreSQL, but having predefined columns really holds you back.
**案例：**想布署MySQL或PostgreSQL，但它们存在的预定义处理语句和预定义变量让你望而却步。

###Riak (V1.2)

**Written in:** Erlang & C, some JavaScript

**Main point:** Fault tolerance

**License:** Apache

**Protocol:** HTTP/REST or custom binary

- Stores blobs
- Tunable trade-offs for distribution and replication
- Pre- and post-commit hooks in JavaScript or Erlang, for validation and security.
- Map/reduce in JavaScript or Erlang
- Links & link walking: use it as a graph database
- Secondary indices: but only one at once
- Large object support (Luwak)
- Comes in "open source" and "enterprise" editions
- Full-text search, indexing, querying with Riak Search
- In the process of migrating the storing backend from "Bitcask" to Google's "LevelDB"
- Masterless multi-site replication replication and SNMP monitoring are commercially licensed

**Best used:** If you want something Dynamo-like data storage, but no way you're gonna deal with the bloat and complexity. If you need very good single-site scalability, availability and fault-tolerance, but you're ready to pay for multi-site replication.

**For example:** Point-of-sales data collection. Factory control systems. Places where even seconds of downtime hurt. Could be used as a well-update-able web server.

###CouchDB (V1.2)

**Written in:** Erlang

**Main point:** DB consistency, ease of use

**License:** Apache

**Protocol:** HTTP/REST

- Bi-directional (!) replication,
- continuous or ad-hoc,
- with conflict detection,
- thus, master-master replication. (!)
- MVCC - write operations do not block reads
- Previous versions of documents are available
- Crash-only (reliable) design
- Needs compacting from time to time
- Views: embedded map/reduce
- Formatting views: lists & shows
- Server-side document validation possible
- Authentication possible
- Real-time updates via '_changes' (!)
- Attachment handling
- thus, CouchApps (standalone js apps)

**Best used:** For accumulating, occasionally changing data, on which pre-defined queries are to be run. Places where versioning is important.

**For example:** CRM, CMS systems. Master-master replication is an especially interesting feature, allowing easy multi-site deployments.

###Redis (V2.4)

**Written in:** C/C++

**Main point:** Blazing fast

**License:** BSD

**Protocol:** Telnet-like

- Disk-backed in-memory database,
- Currently without disk-swap (VM and Diskstore were abandoned)
- Master-slave replication
- Simple values or hash tables by keys,
- but complex operations like ZREVRANGEBYSCORE.
- INCR & co (good for rate limiting or statistics)
- Has sets (also union/diff/inter)
- Has lists (also a queue; blocking pop)
- Has hashes (objects of multiple fields)
- Sorted sets (high score table, good for range queries)
- Redis has transactions (!)
- Values can be set to expire (as in a cache)
- Pub/Sub lets one implement messaging (!)

**Best used:** For rapidly changing data with a foreseeable database size (should fit mostly in memory).

**For example:** Stock prices. Analytics. Real-time data collection. Real-time communication. And wherever you used memcached before.

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
