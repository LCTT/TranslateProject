[#]: subject: "Are You Familiar with These Popular  Open Source Databases?"
[#]: via: "https://www.opensourceforu.com/2022/09/are-you-familiar-with-these-popular-open-source-databases/"
[#]: author: "Jishnu Saurav Mittapalli https://www.opensourceforu.com/author/jishnu-saurav-mittapalli/"
[#]: collector: "lkxed"
[#]: translator: "toknow-gh"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16374-1.html"

你应该知道的主流开源数据库
======

![][0]

> 随着数据的飞速增长，数据的组织变得至关重要。本文将简要介绍当今软件开发中最流行的数据库。

在软件系统中，数据被格式化地组织和存储，通过数据库可以以电子方式访问它们。因为数据已经成为一种非常重要的资产，对我们来说，掌握当今使用的各种数据库的基本知识是非常重要的。

我们要看的第一个数据库是 MySQL。

### MySQL

[MySQL 官网](https://www.mysql.com/cn/)

MySQL 是使用最广泛的开源数据库管理系统之一。它由<ruby>甲骨文公司<rt>Oracle Corporation</rt></ruby>所有。它可以在大多数主流操作系统上运行，如 Windows、MacOS、Linux 等。MySQL 既适用于小型应用，同时也能胜任大型应用。

#### 优点

* 适配各种操作系统
* 适配多种编程语言，如 PHP、C、C++、Perl 等
* 开源、免费
* 它支持高达 8 百万 Tb 的巨大数据量
* 可定制化
* 比其他数据库快得多

要在基于 Ubuntu 的计算机上安装并使用 MySQL，使用下面的命令：

```
$sudo apt update
$sudo apt install mysql-server
$sudo systemctl start mysql.service
```

### MariaDB

[MariaDB 官网](https://mariadb.org/)

MariaDB 是一款由 MySQL 的开发人员开发的开源关系型数据库，因其优秀的性能和与 MySQL 良好的兼容性而广受欢迎。它是当今大多数主要云产品的一部分，对其稳定性和性能起到重要作用。最近通过使用 Galera Cluster 技术，MariaDB 新增了集群功能。另外 MariaDB 还与 Oracle 数据库有（一定的）兼容性。

#### 优点

* 安装方便
* 支持大数据操作
* 高可扩展性
* 易于导入数据

要在基于 Ubuntu 的计算机上安装并使用 MariaDB，请使用以下命令:

```
$sudo apt update
$sudo apt install mysql-server
$sudo systemctl start mysql.service
```

### RethinkDB

[RethinkDB 官网](https://rethinkdb.com/)

RethinkDB 是一个开源、免费、分布式、基于文档的 NoSQL 数据库。它由 RethinkDB 公司开发。（LCTT 译注：RethinkDB 公司已于 2016 年倒闭。RethinkDB 数据库现作为开源项目继续维护。[消息来源](https://rethinkdb.com/blog/rethinkdb-shutdown/)）它可以存储具有动态模式的 JSON 文件。更重要的是，它可以将查询结果的实时更新推送给应用程序。由于它的分布式特性，它具有高度可扩展性。RethinkDB 提供了丰富的内置函数，使其成为一个高可用性的数据库。由于它是当今流行的数据库，学习如何使用它是很重要的。

#### 优点

* 适合于 Web 应用
* 易于扩展
* 内置函数多，可用性高
* 基于 JSON 动态文档

要在基于 Ubuntu 的计算机上使用 RethinkDB，下面的命令会有帮助：

```
# 添加软件仓库源 
source /etc/lsb-release && echo "deb https://download.rethinkdb.com/repository/ubuntu-$DISTRIB_CODENAME $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list

# 下载并安装 RethinkDB 的 GPG 密钥
$wget -qO- https://download.rethinkdb.com/repository/raw/pubkey.gpg | sudo apt-key add - 

$sudo apt update
$sudo apt-get install rethinkdb
$sudo systemctl start rethinkdb
```

### OrientDB

[OrientDB 官网](https://orientdb.org/)

OrientDB 是一个基于 Java 的开源 NoSQL 数据库管理系统。它支持多种数据模型，比如文档、字典、对象和图。它以图数据库的形式存储关系。下面的命令可以帮助你在 Ubuntu 机器上使用 OrientDB：

```
$sudo apt-get update
$wget -O orientdb-community-2.2.20.tar.gz http://orientdb.com/download.php?file=orientdb-community-2.2.20.tar.gz&os=linux
$tar -zxvf orientdb-community-2.2.20.tar.gz
$sudo mv ~/orientdb-community-2.2.20 /opt/orientdb
```

### CouchDB

[CouchDB 官网](https://couchdb.apache.org/)

CouchDB 是用 Erlang 开发的开源 NoSQL 数据库。它使用多种协议和格式来传输、处理和共享数据。它使用 JSON 格式存储数据，支持 MapReduce，并用 JavaScript 作为查询语言。

#### 优点

* 可以存储任何类型的数据
* 支持 MapReduce，可以高效地处理数据
* 整体结构非常简单
* 索引和检索速度快

下面的命令可以帮助你在 Ubuntu 机器上使用 CouchDB：

```
$echo "deb https://apache.bintray.com/couchdb-deb focal main" >> /etc/apt/sources.list
$sudo apt-get update
$sudo apt install apache2 couchdb -y
```

### Firebird

[Firebird 官网](https://firebirdsql.org/)

Firebird 是一个开源关系型数据库。它兼容所有操作系统，如 Linux、Windows 和 MacOS。它最初是从开源数据库 Interbase 派生而来的。

#### 优点

* 数据库功能不受限制
* 非常稳定，功能强大
* 配置和使用简单

以下命令可以帮助你在 Ubuntu 机器上使用 Firebird：

```
$sudo apt-get update
$sudo apt-get install firebird2.5-superclassic
```

### Cassandra

[Cassandra 官网](https://cassandra.apache.org/_/index.html)

Cassandra 是一个 Apache 基金会旗下的 NoSQL 数据库。它具有高度可扩展性、分布式、高性能的特点，可以很好地处理大量数据。其分布式的特性，使它没有单点故障。

#### 优点

* 高性能
* 高可扩展性
* 采用点对点架构

以下命令可以帮助你在 Ubuntu 机器上使用 Firebird：

```
$curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
$sudo apt-get update
$sudo apt-get install cassandra
$sudo systemctl enable cassandra
$sudo systemctl start cassandra
```

### PostgreSQL

[PostgreSQL 官网](https://www.postgresql.org/)

如今，PostgreSQL 是最流行的开源关系数据库管理系统之一。它易于扩展，同时还与 SQL 兼容。这个数据库管理系统经过了 30 多年的积极开发。

#### 优点

* 与 MySQL 相比，Postgres 可以存储更多种类的数据
* 支持几乎所有的 SQL 特性
* 高度可扩展

下面的命令可以帮助你在 Ubuntu 机器上使用 PostgreSQL：

```
$sudo apt-get update
$sudo apt apt install postgresql postgresql-contrib
```

### CockroachDB

[CockroachDB 官网](https://www.cockroachlabs.com/#)

CockroachDB 是一个为可靠性而生的数据库。它可以像<ruby>蟑螂<rt>cockroach</rt></ruby>一样在灾难性的情况下顽强生存、蓬勃发展。它可以处理大量的数据。还可以构建多集群数据库。

#### 优点

* 很容易部署
* 高一致性
* 分布式事务
* 高可用性
* 兼容 SQL

### Redis

[Redis 官网](https://redis.io/)

Redis 是一个基于键值的开源 NoSQL 数据存储数据库。它支持各种类型的键，使用非常方便。

### 结语

我们已经浏览了最知名和最流行的开源数据库管理系统。了解这些不同的数据库非常有趣。尝试不同的选择，发现最适合你需求的数据库。另外，一定要查看这些数据库的官方文档。

*（题图：MJ/40ba9f14-5948-431a-a899-36c6b1ff4dfe）*

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/are-you-familiar-with-these-popular-open-source-databases/

作者：[Jishnu Saurav Mittapalli][a]
选题：[lkxed][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/jishnu-saurav-mittapalli/
[b]: https://github.com/lkxed
[0]: https://img.linux.net.cn/data/attachment/album/202311/13/092356pzxmjf7xtfnqft5t.png