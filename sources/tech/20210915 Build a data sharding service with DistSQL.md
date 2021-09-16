[#]: subject: "Build a data sharding service with DistSQL"
[#]: via: "https://opensource.com/article/21/9/distsql"
[#]: author: "Meng Haoran https://opensource.com/users/haoran-meng"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Build a data sharding service with DistSQL
======
Database sharding demonstrates the additional functionality of DistSQL.
![Person standing in front of a giant computer screen with numbers, data][1]

If you're reading this, then you're probably familiar with the data query and programming language, SQL (Structured Query Language). It's also used as the standard language for management systems for accessing data, querying, updating, and managing relational database systems. Like standard SQL, DistSQL, or Distributed SQL, it is a built-in SQL language unique to ShardingSphere that provides incremental functional capabilities beyond standard SQL. Leveraging ShardingSphere's powerful SQL parsing engine, DistSQL provides a syntax structure and syntax validation system like that of standard SQL, making DistSQL more flexible while maintaining regularity. ShardingSphere's Database Plus concept aims at creating an open source distributed database system that is both functional and relevant to the actual database business. DistSQL is built on top of the traditional database to provide SQL capabilities that are both standards-compliant and feature ShardingSphere's functionality to enhance conventional database management.

### Original design intention of DistSQL

Over its years of rapid development, ShardingSphere has become unique in the database middleware space as the kernel has gradually stabilized, and the core functionality has continuously been honed. As an open source leader in Asia, ShardingSphere keeps pursuing its exploration of a distributed database ecosystem. Redefining the boundary between middleware and database to allow developers to leverage Apache ShardingSphere as if they were using a database natively is DistSQL's design goal. It is also an integral part of ShardingSphere's ability to transform from a developer-oriented framework and middleware to an operations-oriented infrastructure product.

### DistSQL syntax system

DistSQL has been designed from the outset to be standards-oriented, considering the habits of both database developers and operators. The syntax of DistSQL is based on the standard SQL language, maintaining readability and ease of use while retaining the maximum amount of ShardingSphere's own features and providing the highest possible number of customization options for users to cope with different business scenarios.

Developers familiar with SQL and ShardingSphere can get started quickly.

Standard SQL provides different types of syntaxes such as DQL, DDL, DML, DCL, etc., to define various functional SQL statements. DistSQL defines a syntax system of its own, as well.

In ShardingSphere, the DistSQL syntax is currently divided into three main types: RDL, RQL, and RAL.

  * RDL (Resource &amp; Rule Definition Language) - Resource rule definition language for creating, modifying, and deleting resources and rules.
  * RQL (Resource &amp; Rule Query Language) - Resource rule query language for querying and presenting resources and rules.
  * RAL (Resource &amp; Rule Administrate Language) - Resource rule administration language for incremental functional operations such as hint, transaction type switching, and query of a sharding execution plan.



DistSQL's syntax builds a bridge for ShardingSphere to move towards a distributed database. It is still being improved as more ideas are implemented, so DistSQL will become increasingly powerful. Developers who are interested are welcome to join ShardingSphere and contribute ideas and code to DistSQL.

For more detailed syntax rules, please refer to the official [documentation][2].

For the project's community, please refer to the official [Slack channel][3].

### DistSQL in practice

Having understood the design concept and syntax system of DistSQL, let's demonstrate how to build a data sharding service based on ShardingSphere.

#### Environment preparation

  * Start MySQL services
  * Create a MySQL database for sharding
  * Start the Zookeeper service
  * Turn on the distributed governance configuration and start [ShardingSphere-Proxy][4]



#### Practical demonstration

1\. Connect to the launched ShardingSphere-Proxy using the MySQL command line.

2\. Create and query the distributed database `sharding_db`:


```
mysql&gt; CREATE DATABASE sharding_db;
Query OK, 0 ROWS affected (0.04 sec)

mysql&gt; SHOW DATABASES;
+-------------+
| SCHEMA_NAME |
+-------------+
| sharding_db |
+-------------+
1 ROW IN SET (0.04 sec)
```

3\. Use the newly created database:


```
mysql&gt; USE sharding_db;
No connection. Trying TO reconnect...
Connection id: 2
CURRENT DATABASE: *** NONE ***

DATABASE changed
```

4\. Execute RDL to configure two data source resources, `ds_1` and `ds_2`, for sharding:


```
mysql&gt; ADD RESOURCE ds_1 (
    -&gt; HOST=127.0.0.1,
    -&gt; PORT=3306,
    -&gt; DB=ds_1,
    -&gt; USER=root,
    -&gt; PASSWORD=root123456
    -&gt; );
Query OK, 0 ROWS affected (0.53 sec)

mysql&gt;
mysql&gt; ADD RESOURCE ds_2 (
    -&gt; HOST=127.0.0.1,
    -&gt; PORT=3306,
    -&gt; DB=ds_2,
    -&gt; USER=root,
    -&gt; PASSWORD=root123456
    -&gt; );
Query OK, 0 ROWS affected (0.02 sec)
```

5\. Execute RQL to query the newly added data source resources:


```
    mysql&gt; SHOW RESOURCES FROM sharding_db;
    +------+-------+-----------+------+------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | name | TYPE  | host      | port | db   | attribute                                                                                                                                                   |
    +------+-------+-----------+------+------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | ds_1 | MySQL | 127.0.0.1 | 3306 | ds_1 | {"maxLifetimeMilliseconds":1800000,"readOnly":FALSE,"minPoolSize":1,"idleTimeoutMilliseconds":60000,"maxPoolSize":50,"connectionTimeoutMilliseconds":30000} |
    | ds_2 | MySQL | 127.0.0.1 | 3306 | ds_2 | {"maxLifetimeMilliseconds":1800000,"readOnly":FALSE,"minPoolSize":1,"idleTimeoutMilliseconds":60000,"maxPoolSize":50,"connectionTimeoutMilliseconds":30000} |
    +------+-------+-----------+------+------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
    2 ROWS IN SET (0.13 sec)
```

6\. Execute RDL to create a sharding rule for the `t_order` table:


```
mysql&gt; CREATE SHARDING TABLE RULE t_order(
    -&gt; RESOURCES(ds_1,ds_2),
    -&gt; SHARDING_COLUMN=order_id,
    -&gt; TYPE(NAME=hash_mod,PROPERTIES("sharding-count"=4)),
    -&gt; GENERATED_KEY(COLUMN=order_id,TYPE(NAME=snowflake,PROPERTIES("worker-id"=123)))
    -&gt; );
Query OK, 0 ROWS affected (0.06 sec)
```

7\. Execute RQL to query the sharding rules:


```
    mysql&gt; SHOW SHARDING TABLE RULES FROM sharding_db;
    +---------+-----------------+-------------------+----------------------+------------------------+-------------------------------+--------------------------------+-------------------+---------------------+----------------------------+-----------------------------+-------------------+------------------+-------------------+
    | TABLE   | actualDataNodes | actualDataSources | databaseStrategyType | databaseShardingColumn | databaseShardingAlgorithmType | databaseShardingAlgorithmProps | tableStrategyType | tableShardingColumn | tableShardingAlgorithmType | tableShardingAlgorithmProps | keyGenerateColumn | keyGeneratorType | keyGeneratorProps |
    +---------+-----------------+-------------------+----------------------+------------------------+-------------------------------+--------------------------------+-------------------+---------------------+----------------------------+-----------------------------+-------------------+------------------+-------------------+
    | t_order |                 | ds_1,ds_2         |                      |                        |                               |                                | hash_mod          | order_id            | hash_mod                   | sharding-COUNT=4            | order_id          | snowflake        | worker-id=123     |
    +---------+-----------------+-------------------+----------------------+------------------------+-------------------------------+--------------------------------+-------------------+---------------------+----------------------------+-----------------------------+-------------------+------------------+-------------------+
    1 ROW IN SET (0.01 sec)
```

In addition to querying all sharding rules under the current database, RQL can also query individual tables for sharding rules with the following statement:

`SHOW SHARDING TABLE RULE t_order FROM sharding_db`

Creating and querying the `t_order` sharding table:


```
mysql&gt; CREATE TABLE `t_order`(
    -&gt; `order_id` INT NOT NULL,
    -&gt; `user_id` INT NOT NULL,
    -&gt; `status` VARCHAR(45) DEFAULT NULL,
    -&gt; PRIMARY KEY (`order_id`)
    -&gt; )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
Query OK, 0 ROWS affected (0.28 sec)

mysql&gt; SHOW TABLES;
+-----------------------+
| Tables_in_sharding_db |
+-----------------------+
| t_order               |
+-----------------------+
1 ROW IN SET (0.01 sec)
```

After successfully creating the sharding table `t_order` on the ShardingSphere-Proxy side, ShardingSphere automatically creates the sharding table based on the sharding rules of the `t_order` table by connecting to the underlying databases `ds_1` and `ds_2` via the client-side.


```
mysql&gt; USE ds_1;
DATABASE changed
mysql&gt; SHOW TABLES;
+----------------+
| Tables_in_ds_1 |
+----------------+
| t_order_0      |
| t_order_2      |
+----------------+
2 ROWS IN SET (0.01 sec)

[/code] [code]

mysql&gt; USE ds_2;
DATABASE changed
mysql&gt; SHOW TABLES;
+----------------+
| Tables_in_ds_2 |
+----------------+
| t_order_1      |
| t_order_3      |
+----------------+
2 ROWS IN SET (0.00 sec)
```

Once the sharding table is created, continue to execute the SQL statement on the ShardingSphere-Proxy side to insert the data:


```
mysql&gt; INSERT INTO t_order VALUES(1, 1, 'ok');
Query OK, 1 ROW affected (0.06 sec)

mysql&gt; INSERT INTO t_order VALUES(2, 2, 'disabled');
Query OK, 1 ROW affected (0.00 sec)

mysql&gt; INSERT INTO t_order VALUES(3, 3, 'locked');
Query OK, 1 ROW affected (0.01 sec)

mysql&gt; SELECT * FROM t_order;
+----------+---------+----------+
| order_id | user_id | STATUS   |
+----------+---------+----------+
|        1 |       1 | ok       |
|        2 |       2 | disabled |
|        3 |       3 | locked   |
+----------+---------+----------+
3 ROWS IN SET (0.06 sec)
```

Query the execution plan via RAL:


```
mysql&gt; preview SELECT * FROM t_order;
+-----------------+------------------------------------------------+
| datasource_name | SQL                                            |
+-----------------+------------------------------------------------+
| ds_1            | SELECT * FROM t_order_0 ORDER BY order_id ASC  |
| ds_1            | SELECT * FROM t_order_2 ORDER BY order_id ASC  |
| ds_2            | SELECT * FROM t_order_1 ORDER BY order_id ASC  |
| ds_2            | SELECT * FROM t_order_3 ORDER BY order_id ASC  |
+-----------------+------------------------------------------------+
4 ROWS IN SET (0.02 sec)
```

This completes the ShardingSphere data sharding service using DistSQL. Compared to the previous version of the ShardingSphere proxy, which was profile-driven, DistSQL is more developer-friendly and flexible in managing resources and rules. Moreover, the SQL-driven approach enables seamless interfacing between DistSQL and standard SQL.


```
schemaName: sharding_db
dataSources:
  ds_0:
    url: jdbc:mysql://127.0.0.1:3306/ds_1?serverTimezone=UTC&amp;useSSL=false
    username: root
    password: root123456
    connectionTimeoutMilliseconds: 30000
    idleTimeoutMilliseconds: 60000
    maxLifetimeMilliseconds: 1800000
    maxPoolSize: 50
    minPoolSize: 1
  ds_1:
    url: jdbc:mysql://127.0.0.1:3306/ds_2?serverTimezone=UTC&amp;useSSL=false
    username: root
    password: root123456
    connectionTimeoutMilliseconds: 30000
    idleTimeoutMilliseconds: 60000
    maxLifetimeMilliseconds: 1800000
    maxPoolSize: 50
    minPoolSize: 1
rules:
\- !SHARDING
  tables:
    t_order:
      actualDataNodes: ds_${0..1}.t_order_${0..1}
      tableStrategy:
        standard:
          shardingColumn: order_id
          shardingAlgorithmName: t_order_inline
      keyGenerateStrategy:
        column: order_id
        keyGeneratorName: snowflake
    t_order_item:
      actualDataNodes: ds_${0..1}.t_order_item_${0..1}
      tableStrategy:
        standard:
          shardingColumn: order_id
          shardingAlgorithmName: t_order_item_inline
      keyGenerateStrategy:
        column: order_item_id
        keyGeneratorName: snowflake
  bindingTables:
   - t_order,t_order_item
  defaultDatabaseStrategy:
    standard:
      shardingColumn: user_id
      shardingAlgorithmName: database_inline
  defaultTableStrategy:
    none:

  shardingAlgorithms:
    database_inline:
      type: INLINE
      props:
        algorithm-expression: ds_${user_id % 2}
    t_order_inline:
      type: INLINE
      props:
        algorithm-expression: t_order_${order_id % 2}
    t_order_item_inline:
      type: INLINE
      props:
        algorithm-expression: t_order_item_${order_id % 2}
  keyGenerators:
    snowflake:
      type: SNOWFLAKE
      props:
        worker-id: 123

[/code] [code]

1\. CREATE a distributed DATABASE
CREATE DATABASE sharding_db;

2\. ADD DATA resources
ADD RESOURCE ds_1 (
HOST=127.0.0.1,
PORT=3306,
DB=ds_1,
USER=root,
PASSWORD=root123456
);
ADD RESOURCE ds_2 (
HOST=127.0.0.1,
PORT=3306,
DB=ds_2,
USER=root,
PASSWORD=root123456
);

3\. CREATE sharding rules
CREATE SHARDING TABLE RULE t_order(
RESOURCES(ds_1,ds_2),
SHARDING_COLUMN=order_id,
TYPE(NAME=hash_mod,PROPERTIES("sharding-count"=4)),
GENERATED_KEY(COLUMN=order_id,TYPE(NAME=snowflake,PROPERTIES("worker-id"=123)))
);
```

In the above example, only a small part of the DistSQL syntax is demonstrated. In addition to creating and querying resources and rules via `CREATE` and `SHOW` statements, DistSQL also provides additional operations such as `ALTRE DROP` and supports configuration control of data sharding's core functions, read and write separation, data encryption, and database discovery.

### Conclusion

As one of the new features released in Apache ShardingSphere's 5.0.0-beta, DistSQL will continue to build on this release to improve syntax and increasingly powerful functions. DistSQL has opened up endless possibilities for ShardingSphere to explore the distributed database space. In the future, DistSQL will be used as a link to connect more functions and provide one-click operations.

For example, it'll allow the analysis of the overall database status with one click, connect with elastic migration, provide one-click data expansion and shrinkage, and connect with control to realize one-click master-slave switch and change database status. Open source and JavaScript enthusiasts are warmly welcomed to join the Slack community or check the project's GitHub page to learn more about ShardingSphere's latest developments.

* * *

_This article is adapted from the author's [original publication][5]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/distsql

作者：[Meng Haoran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/haoran-meng
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://shardingsphere.apache.org/document/current/en/features/dist-sql/syntax/
[3]: https://join.slack.com/t/apacheshardingsphere/shared_invite/zt-sbdde7ie-SjDqo9~I4rYcR18bq0SYTg
[4]: https://shardingsphere.apache.org/document/current/cn/quick-start/shardingsphere-proxy-quick-start/
[5]: https://shardingsphere.apache.org/blog/en/material/jul_26_an_introduction_to_distsql/
