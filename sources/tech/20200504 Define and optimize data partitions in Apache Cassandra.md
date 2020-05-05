[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Define and optimize data partitions in Apache Cassandra)
[#]: via: (https://opensource.com/article/20/5/apache-cassandra)
[#]: author: (Anil Inamdar https://opensource.com/users/anil-inamdar)

Define and optimize data partitions in Apache Cassandra
======
Apache Cassandra is built for speed and scalability; here's how to get
the most out of those benefits.
![Person standing in front of a giant computer screen with numbers, data][1]

Apache Cassandra is a database. But it's not just any database; it's a replicating database designed and tuned for scalability, high availability, low-latency, and performance. Cassandra can help your data survive regional outages, hardware failure, and what many admins would consider excessive amounts of data.

Having a thorough command of data partitions enables you to achieve superior Cassandra cluster design, performance, and scalability. In this article, I'll examine how to define partitions and how Cassandra uses them, as well as the most critical best practices and known issues you ought to be aware of.

To set the scene: partitions are chunks of data that serve as the atomic unit for key database-related functions like data distribution, replication, and indexing. Distributed data systems commonly distribute incoming data into these partitions, performing the partitioning with simple mathematical functions such as identity or hashing, and using a "partition key" to group data by partition. For example, consider a case where server logs arrive as incoming data. Using the "identity" partitioning function and the timestamps of each log (rounded to the hour value) for the partition key, we can partition this data such that each partition holds one hour of the logs.

### Data partitions in Cassandra

Cassandra operates as a distributed system and adheres to the data partitioning principles described above. With Cassandra, data partitioning relies on an algorithm configured at the cluster level, and a partition key configured at the table level.

![Cassandra data partition][2]

Cassandra Query Language (CQL) uses the familiar SQL table, row, and column terminologies. In the example diagram above, the table configuration includes the partition key within its primary key, with the format: Primary Key = Partition Key + [Clustering Columns].

A primary key in Cassandra represents both a unique data partition and a data arrangement inside a partition. Data arrangement information is provided by optional clustering columns. Each unique partition key represents a set of table rows managed in a server, as well as all servers that manage its replicas.

### Defining primary keys in CQL

The following four examples demonstrate how a primary key can be represented in CQL syntax. The sets of rows produced by these definitions are generally considered a partition.

#### Definition 1 (partition key: log_hour, clustering columns: none)


```
CREATE TABLE server_logs(
   log_hour TIMESTAMP PRIMARYKEY,
   log_level text,
   message text,
   server text
   )
```

Here, all rows that share a **log_hour** go into the same partition.

#### Definition 2 (partition key: log_hour, clustering columns: log_level)


```
CREATE TABLE server_logs(
   log_hour TIMESTAMP,
   log_level text,
   message text,
   server text,
   PRIMARY KEY (log_hour, log_level)
   )
```

This definition uses the same partition key as Definition 1, but here all rows in each partition are arranged in ascending order by **log_level**.

#### Definition 3 (partition key: log_hour, server, clustering columns: none)


```
CREATE TABLE server_logs(
   log_hour TIMESTAMP,
   log_level text,
   message text,
   server text,
   PRIMARY KEY ((log_hour, server))
   )
```

In this definition, all rows share a **log_hour** for each distinct **server** as a single partition.

#### Definition 4 (partition key: log_hour, server, clustering columns: log_level)


```
CREATE TABLE server_logs(
   log_hour TIMESTAMP,
   log_level text,
   message text,
   server text,
   PRIMARY KEY ((log_hour, server),log_level)
   )WITH CLUSTERING ORDER BY (column3 DESC);
```

This definition uses the same partition as Definition 3 but arranges the rows within a partition in descending order by **log_level**.

### How Cassandra uses the partition key

Cassandra relies on the partition key to determine which node to store data on and where to locate data when it's needed. Cassandra performs these read and write operations by looking at a partition key in a table, and using tokens (a long value out of range -2^63 to +2^63-1) for data distribution and indexing. These tokens are mapped to partition keys by using a partitioner, which applies a partitioning function that converts any partition key to a token. Through this token mechanism, every node of a Cassandra cluster owns a set of data partitions. The partition key then enables data indexing on each node.

![Cassandra cluster with 3 nodes and token-based ownership][3]

A Cassandra cluster with three nodes and token-based ownership. This is a simplistic representation: the actual implementation uses [Vnodes][4].

### Data partition impacts on Cassandra clusters

Careful partition key design is crucial to achieving the ideal partition size for the use case. Getting it right allows for even data distribution and strong I/O performance. Partition size has several impacts on Cassandra clusters you need to be aware of:

  * Read performance—In order to find partitions in SSTables files on disk, Cassandra uses data structures that include caches, indexes, and index summaries. Partitions that are too large reduce the efficiency of maintaining these data structures – and will negatively impact performance as a result. Cassandra releases have made strides in this area: in particular, version 3.6 and above of the Cassandra engine introduce storage improvements that deliver better performance for large partitions and resilience against memory issues and crashes.
  * Memory usage— Large partitions place greater pressure on the JVM heap, increasing its size while also making the garbage collection mechanism less efficient.
  * Cassandra repairs—Large partitions make it more difficult for Cassandra to perform its repair maintenance operations, which keep data consistent by comparing data across replicas.
  * Tombstone eviction—Not as mean as it sounds, Cassandra uses unique markers known as "tombstones" to mark data for deletion. Large partitions can make that deletion process more difficult if there isn't an appropriate data deletion pattern and compaction strategy in place.



While these impacts may make it tempting to simply design partition keys that yield especially small partitions, the data access pattern is also highly influential on ideal partition size (for more information, read this in-depth guide to [Cassandra data modeling][5]). The data access pattern can be defined as how a table is queried, including all of the table's **select** queries. Ideally, CQL select queries should have just one partition key in the **where** clause—that is to say, Cassandra is most efficient when queries can get needed data from a single partition, instead of many smaller ones.

### Best practices for partition key design

Following best practices for partition key design helps you get to an ideal partition size. As a rule of thumb, the maximum partition size in Cassandra should stay under 100MB. Ideally, it should be under 10MB. While Cassandra versions 3.6 and newer make larger partition sizes more viable, careful testing and benchmarking must be performed for each workload to ensure a partition key design supports desired cluster performance.

Specifically, these best practices should be considered as part of any partition key design:

  * The goal for a partition key must be to fit an ideal amount of data into each partition for supporting the needs of its access pattern.
  * A partition key should disallow unbounded partitions: those that may grow indefinitely in size over time. For instance, in the **server_logs** examples above, using the server column as a partition key would create unbounded partitions as the number of server logs continues to increase. In contrast, using **log_hour** limits each partition to an hour of data.
  * A partition key should also avoid creating a partition skew, in which partitions grow unevenly, and some are able to grow without limit over time. In the **server_logs** examples, using the server column in a scenario where one server generates considerably more logs than others would produce a partition skew. To avoid this, a useful technique is to introduce another attribute from the table to force an even distribution, even if it's necessary to create a dummy column to do so.
  * It's helpful to partition time-series data with a partition key that uses a time element as well as other attributes. This protects against unbounded partitions, enables access patterns to use the time attribute in querying specific data, and allows for time-bound data deletion. The examples above each demonstrate this by using the **log_hour** time attribute.



Several tools are available to help test, analyze, and monitor Cassandra partitions to check that a chosen schema is efficient and effective. By carefully designing partition keys to align well with the data and needs of the solution at hand, and following best practices to optimize partition size, you can utilize data partitions that more fully deliver on the scalability and performance potential of a Cassandra deployment.

Dani and Jon will give a three hour tutorial at OSCON this year called: Becoming friends with...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/apache-cassandra

作者：[Anil Inamdar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/anil-inamdar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://opensource.com/sites/default/files/uploads/apache_cassandra_1_0.png (Cassandra data partition)
[3]: https://opensource.com/sites/default/files/uploads/apache_cassandra_2_0.png (Cassandra cluster with 3 nodes and token-based ownership)
[4]: https://www.instaclustr.com/cassandra-vnodes-how-many-should-i-use/
[5]: https://www.instaclustr.com/resource/6-step-guide-to-apache-cassandra-data-modelling-white-paper/
