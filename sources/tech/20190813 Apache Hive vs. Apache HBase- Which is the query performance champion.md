[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Apache Hive vs. Apache HBase: Which is the query performance champion?)
[#]: via: (https://opensource.com/article/19/8/apache-hive-vs-apache-hbase)
[#]: author: (Alex Bekker https://opensource.com/users/egor14https://opensource.com/users/sachinpb)

Apache Hive vs. Apache HBase: Which is the query performance champion?
======
Let's look closely at the Apache Hive and Apache HBase to understand
which one can cope better with query performance.
![computer screen ][1]

It's super easy to get lost in the world of big data technologies. There are so many of them that it seems a day never passes without the advent of a new one. Still, such fast development is only half the trouble. The real problem is that it's difficult to understand the functionality and the intended use of the existing technologies.

To find out what technology suits their needs, IT managers often contrast them. We've also conducted an academic study to make a clear distinction between Apache Hive and Apache HBase—two important technologies that are frequently used in [Hadoop implementation projects][2].

### Data model comparison

#### Apache Hive's data model

To understand Apache Hive's data model, you should get familiar with its three main components: a table, a partition, and a bucket.

Hive's **table** doesn't differ a lot from a relational database table (the main difference is that there are no relations between the tables). Hive's tables can be managed or external. To understand the difference between these two types, let's look at the _load data_ and _drop a table_ operations. When you load data into a **managed table**, you actually move the data from Hadoop Distributed File System's (HDFS) inner data structures into the Hive directory (which is also in HDFS). And when you drop such a table, you delete the data it contains from the directory. In the case of **external tables**, Hive doesn't load the data into the Hive directory but creates a "ghost-table" that indicates where actual data is physically stored in HDFS. So, when you drop an external table, the data is not affected.

Both managed and external tables can be further broken down to **partitions**. A partition represents the rows of the table grouped together based on a **partition key**. Each partition is stored as a separate folder in the Hive directory. For instance, the table below can be partitioned based on a country, and the rows for each country will be stored together. Of course, this example is simplified. In real life, you'll deal with more than three partitions and much more than four rows in each, and partitioning will help you significantly reduce your partition key query execution time.

**Customer ID** | **Country** | **State/Province** | **City** | **Gender** | **Family status** | …
---|---|---|---|---|---|---
00001 | US | Nebraska | Beatrice | F | Single | …
00002 | Canada | Ontario | Toronto | F | Married | …
00003 | Brasil | Para | Belem | M | Married | …
00004 | Canada | Ontario | Toronto | M | Married | …
00005 | US | Nebraska | Aurora | M | Single | …
00006 | US | Arizona | Phoenix | F | Single | …
|  |  |  |  |  |
00007 | US | Texas | Austin | F | Married |
… | … |  |  | … | … | …

You can break your data further into **buckets**, which are even easier to manage and enable faster query execution. Let's take the partition with the US data from our previous example and cluster it into buckets based on the Customer ID column. When you specify the number of buckets, Hive applies a hash function to the chosen column, which assigns a hash value to each row in the partition and then "packs" the rows into a certain number of buckets. So, if we have 10 million Customer IDs in the partition and specify the number of buckets as 50, each bucket will contain about 200,000 rows. As a result, if you need to find the data about a particular customer, Hive will directly go to the relevant bucket to find the info.

#### Apache HBase's data model

HBase also stores data in **tables**. The cells in an HBase table are organized by **row keys** and **column families*****.*** Each column family has a set of storage properties (for example, row keys encryption and data compression rules). In addition, there are **column qualifiers** to ease data management. Neither row keys nor column qualifiers have a data type assigned (they are always treated as bytes).

**Row key**

**Geography**

**Demographics**

**Customer ID**

**Country**

**State**

**City**

**Gender**

**Family status**

…

00001

US

Texas

Austin

F

Single

…

00002

Canada

Ontario

Toronto

F

Married

…

00003

Brasil

Para

Belem

M

Married

…

00004

Canada

Ontario

Toronto

M

Married

…

00005

US

Arizona

Phoenix

M

Single

…

00006

US

Nebraska

Aurora

F

Single

…

00007

US

Nebraska

Beatrice

F

Married

 

 

…

 

 

…

…

…

Every **cell** has a timestamp, or, in other words, bears the mark of when it was created. This info is crucial during the read operations, as it allows identifying the most recent (and therefore more up-to-date) data versions. You can specify a timestamp during a write operation, otherwise, HBase gives the cell a current timestamp automatically.

Data in a table is **lexicographically sorted based on row keys**, and to store closely related data together, a developer needs to design a good algorithm for row key composition.

_As to_ **partitioning**, HBase does it automatically based on the row keys. Still, you can manage the process by changing the start and end row keys for each partition.

#### Key takeaways on data models

  1. Both Hive and HBase are capable of organizing data in a way to enable quick access to the required data and reduce query execution time (though their approach to partitioning is different).
  2. Both Hive and HBase act as data management agents. When somebody says that Hive or HBase stores data, it really means the data is stored in a data store (usually in HDFS). This means the success of your Hadoop endeavor goes beyond either/or technology choices and strongly depends on other [important factors][3], such as calculating the required cluster size correctly and integrating all the architectural components seamlessly.



### Query performance

#### Hive as an analytical query engine

Hive is specifically designed to enable data analytics. To successfully perform this task, it uses its dedicated **Hive Query Language** (HiveQL), which is very similar to analytics-tuned SQL.

Initially, Hive converted HiveQL queries into Hadoop MapReduce jobs, simplifying the lives of developers who could bypass more complicated MapReduce code. Running queries in Hive usually took some time, since Hive scanned all the available data sets, if not specified otherwise. It was possible to limit the volume of scanned data by specifying the partitions and buckets that Hive had to address. Anyway, that was batch processing. Nowadays, Apache Hive is also able to convert queries into Apache Tez or Apache Spark jobs.

The earliest versions of Hive did not provide **record-level updates, inserts, and deletes**, which was one of the most serious limitations in Hive. This functionality appeared only in version 0.14.0 (though with some [constraints][4]: for example, your table's file format should be [ORC][5]).

#### HBase as a data manager that supports queries

Being a data manager, HBase alone is not intended for analytical queries. It doesn't have a dedicated query language. To run CRUD (create, read, update, and delete) and search queries, it has a JRuby-based shell, which offers **simple data manipulation possibilities**, such as Get, Put, and Scan. For the first two operations, you should specify the row key, while scans run over a whole range of rows.

HBase's primary purpose is to offer a random data input/output for HDFS. At the same time, one can surely say that HBase contributes to fast analytics by enabling consistent reads. This is possible due to the fact that HBase writes data to only one server, which doesn't require comparing multiple data versions from different nodes. Besides, HBase **handles append operations very well.** It also enables **updates and deletes**, but copes with these two not so perfectly.

#### Indexing

In Hive 3.0.0, indexing was removed. Prior to that, it was possible to create indexes on columns, though the advantages of faster queries should have been weighted against the cost of indexing during write operations and extra space for storing the indexes. Anyway, Hive's data model, with its ability to group data into buckets (which can be created for any column, not only for the keyed one), offers an approach similar to the one that indexing provides.

HBase enables multi-layered indexing. But again, you have to think about the trade-off between gaining read query response vs. slower writes and the costs associated with storing indexes.

#### Key takeaways on query performance

  1. Running analytical queries is exactly the task for Hive. HBase's initial task is to ingest data as well as run CRUD and search queries.
  2. While HBase handles row-level updates, deletes, and inserts well, the Hive community is working to eliminate this stumbling block.



### To sum it up

There are many similarities between Hive and HBase. Both are data management agents, and both are strongly interconnected with HDFS. The main difference between these two is that HBase is tailored to perform CRUD and search queries while Hive does analytical ones. These two technologies complement each other and are frequently used together in Hadoop consulting projects so businesses can make the most of both applications' strengths.

Introduction to Apache Hadoop, an open source software framework for storage and large scale...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/apache-hive-vs-apache-hbase

作者：[Alex Bekker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/egor14https://opensource.com/users/sachinpb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK (computer screen )
[2]: https://www.scnsoft.com/services/big-data/hadoop
[3]: https://www.scnsoft.com/blog/hadoop-implementation-milestones
[4]: http://community.cloudera.com/t5/Batch-SQL-Apache-Hive/Update-and-Delete-are-not-working-in-Hive/td-p/57358/page/3
[5]: https://orc.apache.org/
