[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Start using virtual tables in Apache Cassandra 4.0)
[#]: via: (https://opensource.com/article/20/10/virtual-tables-apache-cassandra)
[#]: author: (Ben Bromhead https://opensource.com/users/ben-bromhead)

Start using virtual tables in Apache Cassandra 4.0
======
What they are and how to use them.
![Computer laptop in space][1]

Among the [many additions][2] in the recent [Apache Cassandra 4.0 beta release][3], virtual tables is one that deserves some attention.

In previous versions of Cassandra, users needed access to Java Management Extensions ([JMX][4]) to examine Cassandra details such as running compactions, clients, metrics, and a variety of configuration settings. Virtual tables removes these challenges. Cassandra 4.0 beta enables users to query those details and data as Cassandra Query Language (CQL) rows from a read-only system table.

Here is how the JMX-based mechanism in previous Cassandra versions worked. Imagine a user wants to check on the compaction status of a particular node in a cluster. The user first has to establish a JMX connection to run `nodetool compactionstats` on the node. This requirement immediately presents the user with a few complications. Is the user's client configured for JMX access? Are the Cassandra nodes and firewall configured to allow JMX access? Are the proper measures for security and auditing prepared and in place? These are only some of the concerns users had to contend with when dealing with in previous versions of Cassandra.

With Cassandra 4.0, virtual tables make it possible for users to query the information they need by utilizing their previously configured driver. This change removes all overhead associated with implementing and maintaining JMX access.

Cassandra 4.0 creates two new keyspaces to help users leverage virtual tables: `system_views` and `system_virtual_schema`. The `system_views` keyspace contains all the valuable information that users seek, usefully stored in a number of tables. The `system_virtual_schema` keyspace, as the name implies, stores all necessary schema information for those virtual tables.

![system_views and system_virtual_schema keyspaces and tables][5]

(Ben Bromhead, [CC BY-SA 4.0][6])

It's important to understand that the scope of each virtual table is restricted to its node. Any query of virtual tables will return data that is valid only for the node that acts as its coordinator, regardless of consistency. To simplify for this requirement, support has been added to several drivers to specify the coordinator node in these queries (the Python, DataStax Java, and other drivers now offer this support).

To illustrate, examine this `sstable_tasks` virtual table. This virtual table displays all operations on [SSTables][7], including compactions, cleanups, upgrades, and more.

![Querying the sstable_tasks virtual table][8]

(Ben Bromhead, [CC BY-SA 4.0][6])

If a user were to run `nodetool compactionstats` in a previous Cassandra version, this is the same type of information that would be displayed. Here, the query finds that the node currently has one active compaction. It also displays its progress and its keyspace and table. Thanks to the virtual table, a user can gather this information quickly, and just as efficiently gain the insight needed to correctly diagnose the cluster's health.

To be clear, Cassandra 4.0 doesn't eliminate the need for JMX access: JMX is still the only option for querying some metrics. That said, users will welcome the ability to pull key cluster metrics simply by using CQL. Thanks to the convenience afforded by virtual tables, users may be able to reinvest time and resources previously devoted to JMX tools into Cassandra itself. Client-side tooling should also begin to leverage the advantages offered by virtual tables.

If you are interested in the Cassandra 4.0 beta release and its virtual tables feature, [try it out][3].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/virtual-tables-apache-cassandra

作者：[Ben Bromhead][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ben-bromhead
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://www.instaclustr.com/apache-cassandra-4-0-beta-released/
[3]: https://cassandra.apache.org/download/
[4]: https://en.wikipedia.org/wiki/Java_Management_Extensions
[5]: https://opensource.com/sites/default/files/uploads/cassandra_virtual-tables.png (system_views and system_virtual_schema keyspaces and tables)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://cassandra.apache.org/doc/latest/architecture/storage_engine.html#sstables
[8]: https://opensource.com/sites/default/files/uploads/cassandra_virtual-tables_sstable_tasks.png (Querying the sstable_tasks virtual table)
