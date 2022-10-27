[#]: subject: "A guide to database replication with open source"
[#]: via: "https://opensource.com/article/21/8/database-replication-open-source"
[#]: author: "John Lafleur https://opensource.com/users/john-lafleur"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A guide to database replication with open source
======
Why choose log-based Change Data Capture (CDC) replication for
databases. Learn about the open source options available to you.
![Cloud and databsae incons][1]

In the world of constantly evolving data, one question often pops up: How is it possible to seamlessly replicate data that is growing exponentially and coming from an increasing number of sources? This article explains some of the foundational open source technologies that may help commoditize database replication tasks into data warehouses, lakes, or other databases.

One popular replication technology is **Change Data Capture (CDC)**, a pattern that allows row-level data changes at the source database to be quickly identified, captured, and delivered in real-time to the destination data warehouse, lake, or other database. With CDC, only the data that has changed since the last replication—categorized by insert, update, and delete operations—is in scope. This incremental design approach makes CDC significantly more efficient than other database replication patterns, such as a full-database replication. With full-database replication, the entire source database table with potentially millions of rows is scanned and copied over to the destination.

### Open source CDC

[Debezium][2] is an open source distributed CDC platform that leverages Apache Kafka to transport data changes. It continuously monitors databases, ensuring that each row-level change is sent to the destination in exactly the same order they were committed to the database. However, using Debezium in a do-it-yourself replication project can be a heavy lift. It requires a deep understanding of concepts related to the source and destination systems, Kafka, and Debezium internals. For example, just take a look at all the details required for a [Debezium MySQL connector][3].

[Airbyte][4] is an open source data integration engine that allows you to consolidate your data in your data warehouses, lakes, and databases. Airbyte leverages Debezium and does all the heavy lifting. Indeed, within Airbyte, Debezium is run as an embedded library. This engineering design allows for using Debezium without needing to use Apache Kafka or another language runtime. This [video][5] shows how you can use CDC to replicate a PostgreSQL database with Airbyte in a matter of minutes. The open source code is available for use with Postgres, MySQL, and MSSQL and will soon be for all other major databases that enable it.

### What are some typical CDC use cases for databases?

Databases lie at the core of today's data infrastructures, and several different use cases apply.

#### 1\. Squash the overhead across your transactional databases and network

With CDC in place, it's possible to deliver data changes as a continuous stream without placing unnecessary overhead on source database systems. This means that databases can focus on doing the more valuable tasks that they are engineered for, resulting in higher throughput and lower latency for apps. With CDC, only incremental data changes are transferred over the network, reducing data transfer costs, minimizing network saturation, and eliminating the need for fine-tuning the system to handle peak batch traffic.

#### 2\. Keep transactional and analytical databases synchronized

With data being generated at dizzying rates, extracting insights from data is key to an organization's success. CDC captures live data changes from the transactional database and ships those regularly to the analytical database or warehouse, where they can be analyzed to extract deeper insights. For example, imagine that you're an online travel company. You can capture real-time online booking activity at the database tier (let's say using PostgreSQL) and send these transactions to your analytical database to learn more about your customer's buying patterns and preferences.

#### 3\. Migrate data from legacy systems to next-generation data platforms

With the shift towards modernizing legacy database systems by going to cloud-based database instances, moving data to these newer platforms has become more critical than ever. With CDC, data is synchronized periodically, allowing you to modernize your data platforms at your own pace while maintaining both your legacy and next-generation data platforms in the interim. This setup ensures flexibility and can keep business operational without missing a heartbeat.

#### 4\. Warm up a dynamic data cache for applications

Caching is a standard technique for improving application performance, but data caches must be warmed up (or loaded with data) for them to be effective. With a warm data cache, the application can access data quickly, bypassing the core database. For example, this pattern is extremely beneficial for an application that does many data lookups because loading this lookup data in a cache can offload the read workload from the core database. Using CDC, the data cache can be dynamically updated all the time. For example, selective lookup tables in the database can be loaded into a cache during the initial warm-up cycle. Any future modifications in the lookup table data will incrementally be propagated to update the cache.

### What CDC implementations exist and what database should you pick?

CDC has been around for quite some time, and over the years, several different widely-used implementations have sprung up across other products. However, not all CDC implementations are created equal, and you need to pick the proper implementation to get a clear picture of the data changes. I summarize some of these implementations and the challenges of using each of them in the list below:

#### Date modified

This approach tracks metadata across every row in the table, including who created the row, who recently modified the row, and when the row was created and modified.

**Challenges**:

  * Not easy to track data deletes since the date_modified field no longer exists for a deleted row.
  * Needs additional compute resources to process the date_modified field. If indexing is used on the date_modified field, the index will need additional compute and storage resources.



#### Binary diffs

This implementation calculates the difference in state between the current data and the previous data.

**Challenges**:

  * Calculating state differences can be complex and does not scale well when data volumes are large.
  * Needs additional compute resources and cannot be done in real-time.



#### Database trigger

This method needs database triggers to be created with logic to manage the metadata within the same table or in a separate book-keeping table.

**Challenges**:

  * Triggers must fire for every transaction, and this can slow down the transactional workload.
  * The data engineer must write additional complex rollback logic to handle the case of a transaction failure.
  * If the table schema is modified, the trigger must be manually updated with the latest schema changes.
  * SQL language differences across the different database systems mean that triggers are not easily portable and might need to be re-written.



#### Log-based

This implementation reads data directly from the database logs and journal files to minimize the impact of the capture process. Since database logs and journal files exist in every transactional database product, the experience is transparent. This means it does not require any logical changes in terms of database objects or the application running on top of the database.

**Challenges**:

  * If the destination database system is down, the source database system logs will need to be kept intact until the sync happens.
  * Database operations that bypass the log file will not be captured. This is a corner case for most relational database use-cases since logs are required to guarantee [ACID][6] behaviors.
    * For example, a **TRUNCATE** table statement might not log data, and in this case, forced logging through a query hint or configuration might be required.



When it comes to production databases, the choice is clear: Log-based CDC is the way forward due to its reliability, ability to scale under massive data volumes, and ease of use without requiring any database or app changes.

### Conclusion

I hope this article was useful to explain why log-based CDC replication for databases matters and the new open source options available to you. These options provide endless replication possibilities, just as Airbyte made log-based CDC replication much easier.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/database-replication-open-source

作者：[John Lafleur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/john-lafleur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_cloud_database.png?itok=lhhU42fg (Cloud and databsae incons)
[2]: https://github.com/debezium/
[3]: https://debezium.io/documentation/reference/1.6/connectors/mysql.html
[4]: https://airbyte.io/
[5]: https://www.youtube.com/watch?v=NMODvLgZvuE
[6]: https://en.wikipedia.org/wiki/ACID
