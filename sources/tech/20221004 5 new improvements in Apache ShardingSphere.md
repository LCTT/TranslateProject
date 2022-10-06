[#]: subject: "5 new improvements in Apache ShardingSphere"
[#]: via: "https://opensource.com/article/22/9/improvements-apache-shardingsphere"
[#]: author: "Yacine Si Tayeb, PhD https://opensource.com/users/y2so"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 new improvements in Apache ShardingSphere
======
ShardingSphere supports multiple databases, and each improvement in the 5.2.0 release takes more work off your hands.

Apache ShardingSphere, a powerful distributed database, recently released a major update to optimize and enhance its features, performance, testing, documentation, and examples. In short, the project continues to work hard at development to make it easier for you to manage your organization's data.

### 1. SQL audit for data sharding

The problem: When a user executes an SQL query without the sharding feature in large-scale data sharding scenarios, the SQL query is routed to the underlying database for execution. As a result, many database connections are occupied, and businesses are severely affected by a timeout or other issues. Worse still, should the user perform an **UPDATE**/**DELETE** operation, a large amount of data may be incorrectly updated or deleted.

ShardingSphere's solution: As of version 5.2.0, ShardingSphere provides the SQL audit for data sharding feature and allows users to configure audit strategies. The strategy specifies multiple audit algorithms, and users can decide whether audit rules should be disabled. SQL execution is strictly prohibited if any audit algorithm fails to pass.

Here's the configuration of an SQL audit for data sharding:

```
rules:
- !SHARDING
  tables:
    t_order:
      actualDataNodes: ds_${0..1}.t_order_${0..1}
      tableStrategy:
        standard:
          shardingColumn: order_id
          shardingAlgorithmName: t_order_inline
      auditStrategy:
        auditorNames:
          - sharding_key_required_auditor
        allowHintDisable: true
  defaultAuditStrategy:
    auditorNames:
      - sharding_key_required_auditor
    allowHintDisable: true  auditors:
    sharding_key_required_auditor:
      type: DML_SHARDING_CONDITIONS
```

Given complex business scenarios, this new feature allows you to dynamically disable the audit algorithm by using SQL hints so that partial business SQL operations can be executed.

ShardingSphere has a built-in **DML disables full-route audit** algorithm. You can also implement a **ShardingAuditAlgorithm** interface to gain advanced SQL audit functions:

```
/* ShardingSphere hint: disableAuditNames=sharding_key_required_auditor */ SELECT * FROM t_order;
```

### 2. SQL execution process management

The ShardingSphere MySQL database provides a **SHOW PROCESSLIST** statement, allowing you to view the currently running thread. You can kill the thread with the **KILL** statement for SQL that takes too long to be temporarily terminated.

![MySQL KILL command result][2]

Image by: (Duan Zhengqiang, CC BY-SA 4.0)

The **SHOW PROCESSLIST** and **KILL** statements are widely used in daily operation and maintenance management. To enhance your ability to manage ShardingSphere, version 5.2.0 supports the MySQL **SHOW PROCESSLIST** and **KILL** statements. When you execute a **DDL**/**DML** statement through ShardingSphere, ShardingSphere automatically generates a unique UUID identifier and stores the SQL execution information in each instance.

When you execute the **SHOW PROCESSLIST** statement, ShardingSphere processes the SQL execution information based on the current operating mode.

If the current mode is cluster mode, ShardingSphere collects and synchronizes the SQL execution information of each compute node through the governance center and then returns the summary to the user. If the current mode is the standalone mode, ShardingSphere only returns SQL execution information in the current compute node.

You get to determine whether to execute the **KILL** statement based on the result returned by **SHOW PROCESSLIST**, and ShardingSphere cancels the SQL in execution based on the ID in the **KILL** statement.

### 3. Shardingsphere-on-cloud

[Shardingsphere-on-cloud][3] is a project of Apache ShardingSphere providing cloud-oriented solutions. Version 0.1.0 has been released, and it has been officially voted as a sub-project of Apache ShardingSphere.

Shardinsphere-on-cloud will continue releasing configuration templates, deployment scripts, and other automation tools for ShardingSphere on the cloud.

It will also polish the engineering practices in terms of high availability, data migration, observability, shadow DB, security, and audit, optimize the delivery mode of Helm Charts, and continue to enhance its cloud-native management capabilities through Kubernetes Operator. There are already introductory issues in the project repository to help those interested in getting Go, Database, and Cloud up and running quickly.

### 4. Access port

In version 5.2.0, [ShardingSphere-Proxy][4] can monitor specified IP addresses and integrate openGauss database drivers by default. [ShardingSphere-JDBC][5] supports c3p0 data sources, and a **Connection.prepareStatement** can specify the columns.

### 5. Distributed transaction

The original logical database-level transaction manager has been adjusted to a global manager, supporting distributed transactions across multiple logical databases. XA transactions are now automatically managed by ShardingSphere, which removes the XA statement's ability to control distributed transactions.

### Use ShardingSphere for distributed data

ShardingSphere supports multiple databases, and each improvement takes more work off your hands. The establishment of the shardingsphere-on-cloud sub-project shows ShardingSphere's commitment to being cloud-native. The greater ShardingSphere community welcomes anyone interested in Go, databases, and the cloud to join the shardingsphere-on-cloud sub-project!

*[The article was first published on Medium.com and has been republished with permission.][6]*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/improvements-apache-shardingsphere

作者：[Yacine Si Tayeb, PhD][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/y2so
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/data_metrics_analytics_desktop_laptop.png
[2]: https://opensource.com/sites/default/files/2022-09/Picture1.png
[3]: https://github.com/apache/shardingsphere-on-cloud
[4]: https://shardingsphere.apache.org/document/current/en/quick-start/shardingsphere-proxy-quick-start/
[5]: https://shardingsphere.apache.org/document/current/en/overview/#shardingsphere-jdbc
[6]: https://faun.pub/apache-shardingsphere-5-2-0-is-released-bringing-new-cloud-native-possibilities-8d674d964a93
