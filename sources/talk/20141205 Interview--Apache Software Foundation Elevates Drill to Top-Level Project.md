Interview: Apache Software Foundation Elevates Drill to Top-Level Project
================================================================================
![](http://i1311.photobucket.com/albums/s669/webworkerdaily/tomer_zps5e1225aa.png)

The Apache Software Foundation (ASF) has [announced][1] that [Apache Drill][2] has graduated from the Apache Incubator to become a Top-Level Project (TLP).

Apache Drill is billed as the world's first schema-free SQL query engine that delivers real-time insights by removing the constraint of building and maintaining schemas before data can be analyzed.

Drill enables rapid application development on Apache Hadoop and also allows enterprise BI analysts to access Hadoop in a self-service fashion.  OStatic caught up with Tomer Shiran (shown here), a member of the Drill Project Management Committee, to get his thoughts. Here they are in an interview. 

**Can you provide a brief overview of what Drill is and what kinds of users it can make a difference for?**

Drill is the world's first distributed, schema-free SQL engine. Analysts and developers can use Drill to interactively explore data in Hadoop and other NoSQL databases, such as HBase and MongoDB. There's no need to explicitly define and maintain schemas, as Drill can automatically leverage the structure that's embedded in the data. 

This enables self-service data exploration, which is not possible with traditional data warehouses or SQL-on-Hadoop solutions like Hive and Impala, in which DBAs must manage schemas and transform the data before it can be analyzed.

**What level of community involvement with Drill already exists?**

Drill is an Apache project, so it's not owned by any vendor. Developers in the community can contribute to Drill. MapR currently employs the largest number of contributors, but we're seeing an increasing number of contributions from other companies, and that trend has been accelerating in recent months. 

For example, the MongoDB storage plugin (enabling queries on MongoDB) was contributed by developers at Intuit.

**Hadoop has a lot of momentum on the Big Data front. How can Drill help organizations leveraging Hadoop?**

Drill is the ideal interactive SQL engine for Hadoop. One of the main reasons organizations choose Hadoop is due to its flexibility and agility. Unlike traditional databases, getting data into Hadoop is easy, and users can load data in any shape or size on their own. Early attempts at SQL on Hadoop (eg, Hive, Impala) force schemas to be created and maintained even for self-describing data like JSON, Parquet and HBase tables. 

These systems also require data to be transformed before it can be queried. Drill is the only SQL engine for Hadoop that doesn't force schemas to be defined before data can be queried, and doesn't require any data transformations. In other words, Drill maintains the flexibility and agility paradigms that made Hadoop popular, thus making it the natural technology for data exploration and BI on Hadoop.

**What does Drill's status as a top-level project at Apache mean for its development and future?**

Drill's graduation to a top-level project is an indication that Drill has established a strong community of users and developers. Graduation is a decision made by the Apache Software Foundation (ASF) board, and it provides confidence to Drill's potential users and contributors that the project has a strong foundation. From a governance standpoint, a top-level project has its own board (also known as PMC). The PMC Chair (Jacques Nadeau) is a VP at Apache.

**How do you think Drill will evolve over the next several years?**

Drill has a large and growing community of contributors. Drill 1.0 will be out in Q1'15. We'll see many new features over the next several years. Here are a just a few examples of initiatives that are currently under way:

Drill currently supports HDFS, HBase and MongoDB. Additional data sources are being added, including Cassandra and RDBMS (all JDBC-enabled databases, including Oracle and MySQL). A single query can incorporate/join data from different sources. In the next year, Drill will become the standard SQL engine for modern datastores (which are all schema-free in nature): Hadoop, NoSQL databases - HBase/MongoDB/Cassandra, and search - Elasticsearch/Solr.

A single enterprise or cloud provider will be able to serve multiple groups/departments/organizations, each having its own workloads and SLA requirements. For example, in Drill 1.0 will support user impersonation, meaning that a query can only access the data that the user is authorized to access, and this will work with all supported data sources (Hadoop, HBase, MongoDB, etc.)

Drill will support not only SELECT and CREATE TABLE ... AS SELECT (CTAS) queries, but also INSERT/UPDATE/DELETE, enabling Drill to be used for operational applications (in addition to data exploration and analytics). Drill will also support the ultra-low latency and high concurrency required for such use cases.

Full TPC-DS support. Unlike other SQL-on-Hadoop technologies, Drill is designed to support the ANSI SQL standard as opposed to a SQL-like language. This provides better support for BI and other tools. Drill will be able to run TPC-DS, unmodified, in 2015.

--------------------------------------------------------------------------------

via: http://ostatic.com/blog/interview-apache-software-foundation-elevates-drill-to-top-level-project

作者：[Sam Dean][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ostatic.com/member/samdean
[1]:https://blogs.apache.org/foundation/entry/the_apache_software_foundation_announces66
[2]:http://drill.apache.org/