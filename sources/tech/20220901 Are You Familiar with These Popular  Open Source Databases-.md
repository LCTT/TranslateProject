[#]: subject: "Are You Familiar with These Popular  Open Source Databases?"
[#]: via: "https://www.opensourceforu.com/2022/09/are-you-familiar-with-these-popular-open-source-databases/"
[#]: author: "Jishnu Saurav Mittapalli https://www.opensourceforu.com/author/jishnu-saurav-mittapalli/"
[#]: collector: "lkxed"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Are You Familiar with These Popular  Open Source Databases?
======
*As data grows by leaps and bounds, its organisation becomes all-important. This article briefly describes the most popular databases being used by software development teams today.*

In software systems, data is stored in an organised format and can be accessed electronically using a database. As data has become a very important asset today, it is very important for us to have a basic knowledge about the different databases in use today.
The first database that we will be looking at is MySQL.

### MySQL

MySQL is one of the most widely used open source database management systems. Owned by Oracle Corporation, it works on most major operating systems like Windows, MacOS, Linux, etc. One big benefit of MySQL is that it works really well for small and large applications.

#### Advantages

* It works well with a variety of operating systems and programming languages like PHP, C, C++, Perl, etc.
* It is open source and free.
* It supports a huge size of data of about 8 million terabytes.
* MySQL is customisable as it is open source.
* It is also much faster than other databases.
* To install and get started with MySQL on your Ubuntu based computer, use the command given below:

```
$sudo apt update
$sudo apt install mysql-server
$sudo systemctl start mysql.service
```

### MariaDB

MariaDB is popular primarily because of its good performance and compatibility with MySQL. It supports relational databases. The developers of MySQL have built MariaDB and guarantee that it is going to stay open sourced. This popular database server is part of most major cloud offerings today, and gives great importance to stability and performance. MariaDB has recently added clustering techniques using the Galera cluster, and is also compatible with Oracle databases.

#### Advantages

* Easy installation
* Supports operation on Big Data
* High scalability
* Easy import of data
* To install and get started with MariaDB on your Ubuntu based computer, use the command given below:

```
$sudo apt update
$sudo apt install mysql-server
$sudo systemctl start mysql.service
```

### RethinkDB

RethinkDB is an open source, free, distributed, and document based database server. This NoSQL database has been developed by Rethink, and can store JSON files with schemas that are dynamic. More importantly, real-time updates for query results can be pushed for applications to use. Since it is a distributed database, it is highly scalable. It has many automatic functions, making it a highly available database. As it is a popular database today, it is important that we learn how to use it.

#### Advantages

* This is basically an open source database that can be used for Web based applications.
* It is easy to scale because it’s a distributed database.
* It has many automatic functions with a high availability.
* This NoSQL database is JSON dynamic document based.
* The following commands can be helpful for using RethinkDB on your Ubuntu machine:

```
Get required packages source
/etc/lsb-release && echo” deb https://download.rethinkdb.com/repository/ubuntu-$DISTRIB_CODENAME $DISTRIB_CODENAME main” | sudo tee /etc/apt/sources.list.d/rethinkdb.list

Get required repositories
$wget -qO- https://download.rethinkdb.com/repository/raw/pubkey.gpg | sudo apt-key add
$sudo apt update
$sudo apt-get install rethinkdb
$sudo systemctl start rethinkdb
```

### OrientDB

OrientDB is a NoSQL and Java based open source database management system. This multi-model database service system supports all sorts of data like documents, dictionaries, objects, and graphs. It stores the relationships in the form of a graph database.
The following commands can be helpful for using OrientDB on your Ubuntu machine:

```
$sudo apt-get update
$wget -O orientdb-community-2.2.20.tar.gz http://orientdb.com/download.php?file=orientdb-community-2.2.20.tar.gz&os=linux
$tar -zxvf orientdb-community-2.2.20.tar.gz
$sudo mv ~/orientdb-community-2.2.20 /opt/orientdb
```

### CouchDB

CouchDB is an important NoSQL based open source database server developed in Erlang. It uses many protocols and formats to transfer, process and share data. JSON files are used to store the data, MapReduce is used as the base and JavaScript is used as the querying language.

#### Advantages

* It can store any kind of data.
* MapReduce helps in increasing its efficiency.
* The overall structure is very simple.
* Indexing and retrieval is fast.
* The following commands can help you to use CouchDB on your Ubuntu machine:

```
$echo “deb https://apache.bintray.com/couchdb-deb focal main” >> /etc/apt/sources.list
$sudo apt-get update
$sudo apt install apache2 couchdb -y
```

### Firebird

Firebird is an open source database management system that mainly works on relational databases. It is compatible with all operating systems like Linux, Windows and MacOS. It was originally forked from the Interbase repository, which was also an open source database.

#### Advantages

* The functionality of the database is not limited.
* It is a very stable and powerful database.
* The configuration and usage of the database is much simpler than other databases.
* The following commands can help you use Firebird on your Ubuntu machine:

```
$sudo apt-get update
$sudo apt-get install firebird2.5-superclassic
```

### Cassandra

Cassandra is owned and developed by Apache. This highly scalable, distributed, high performance database can handle large amounts of data and works really well. As it is distributed among many servers, it has no single point of failure. It is basically a NoSQL database, which implies it is not a relational database.

#### Advantages

* High performance
* High scalability
* Peer-to-peer architecture is used instead of master slave architecture
* The following commands can be helpful in using Firebird on your Ubuntu machine:

```
$curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
$sudo apt-get update
$sudo apt-get install cassandra
$sudo systemctl enable cassandra
$sudo systemctl start cassandra
```

### PostgreSQL

Today PostgreSQL is one of the most popular open source relational database management systems. It is easily extensible and, at the same time, is compliant with SQL. More than 30 years of active development has gone into this DBMS.

### Advantages

* In Postgres we can store a wider variety of data compared to MySQL.
* It is largely compliant with the SQL standard.
* It is also highly expandable.

The following commands can be helpful for using PostgreSQL on your Ubuntu machine:

```
$sudo apt-get update
$sudo apt apt install postgresql postgresql-contrib
```

### CockroachDB

CockroachDB is a database built for reliability, i.e., it can survive any kind of adverse situation (just like cockroaches can survive any disastrous situation and multiply). This database can handle large amounts of data. Multicluster databases can also be built.

### Advantages

* Deployment is easy
* High consistency
* Transactions are distributed
* Availability is high
* It is also compatible with SQL

### Redis

Redis is an open source, key value based data storage database. This NoSQL database is really handy because it uses different keys of various types.

We’ve gone through the most well-known and popular open source database management systems that are being used to store and manage data. Learning about these different databases can be a lot of fun. Try the different options, and use the one that fits your requirements the best. Also, do check out the official documentation of these databases.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/are-you-familiar-with-these-popular-open-source-databases/

作者：[Jishnu Saurav Mittapalli][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/jishnu-saurav-mittapalli/
[b]: https://github.com/lkxed
