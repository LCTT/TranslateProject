[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to save time with TiDB)
[#]: via: (https://opensource.com/article/19/3/how-save-time-tidb)
[#]: author: (Morgan Tocker https://opensource.com/users/morgo)

How to save time with TiDB
======

TiDB, an open source-compatible, cloud-based database engine, simplifies many of MySQL database administrators' common tasks.

![Team checklist][1]

Last November, I wrote about key [differences between MySQL and TiDB][2], an open source-compatible, cloud-based database engine, from the perspective of scaling both solutions in the cloud. In this follow-up article, I'll dive deeper into the ways [TiDB][3] streamlines and simplifies administration.

If you come from a MySQL background, you may be used to doing a lot of manual tasks that are either not required or much simpler with TiDB.

The inspiration for TiDB came from the founders managing sharded MySQL at scale at some of China's largest internet companies. Since requirements for operating a large system at scale are a key concern, I'll look at some typical MySQL database administrator (DBA) tasks and how they translate to TiDB.

[![TiDB architecture][4]][5]

In [TiDB's architecture][5]:

  * SQL processing is separated from data storage. The SQL processing (TiDB) and storage (TiKV) components independently scale horizontally.
  * PD (Placement Driver) acts as the cluster manager and stores metadata.
  * All components natively provide high availability, with PD and TiKV using the [Raft consensus algorithm][6].
  * You can access your data via either MySQL (TiDB) or Spark (TiSpark) protocols.



### Adding/fixing replication slaves

**tl;dr:** It doesn't happen in the same way as in MySQL.

Replication and redundancy of data are automatically managed by TiKV. You also don't need to worry about creating initial backups to seed replicas, as _both_ the provisioning and replication are handled for you.

Replication is also quorum-based using the Raft consensus algorithm, so you don't have to worry about the inconsistency problems surrounding failures that you do with asynchronous replication (the default in MySQL and what many users are using).

TiDB does support its own binary log, so it can be used for asynchronous replication between clusters.

### Optimizing slow queries

**tl;dr:** Still happens in TiDB

There is no real way out of optimizing slow queries that have been introduced by development teams.

As a mitigating factor though, if you need to add breathing room to your database's capacity while you work on optimization, the TiDB's architecture allows you to horizontally scale.

### Upgrades and maintenance

**tl;dr:** Still required, but generally easier

Because the TiDB server is stateless, you can roll through an upgrade and deploy new TiDB servers. Then you can remove the older TiDB servers from the load balancer pool, shutting down them once connections have drained.

Upgrading PD is also quite straightforward since only the PD leader actively answers requests at a time. You can perform a rolling upgrade and upgrade PD's non-leader peers one at a time, and then change the leader before upgrading the final PD server.

For TiKV, the upgrade is marginally more complex. If you want to remove a node, I recommend first setting it to be a follower on each of the regions where it is currently a leader. After that, you can bring down the node without impacting your application. If the downtime is brief, TiKV will recover with its regional peers from the Raft log. In a longer downtime, it will need to re-copy data. This can all be managed for you, though, if you choose to deploy using Ansible or Kubernetes.

### Manual sharding

**tl;dr:** Not required

Manual sharding is mainly a pain on the part of the application developers, but as a DBA, you might have to get involved if the sharding is naive or has problems such as hotspots (many workloads do) that require re-balancing.

In TiDB, re-sharding or re-balancing happens automatically in the background. The PD server observes when data regions (TiKV's term for chunks of data in key-value form) get too small, too big, or too frequently accessed.

You can also explicitly configure PD to store regions on certain TiKV servers. This works really well when combined with MySQL partitioning.

### Capacity planning

**tl;dr:** Much easier

Capacity planning on a MySQL database can be a little bit hard because you need to plan your physical infrastructure requirements two to three years from now. As data grows (and the working set changes), this can be a difficult task. I wouldn't say it completely goes away in the cloud either, since changing a master server's hardware is always hard.

TiDB splits data into approximately 100MiB chunks that it distributes among TiKV servers. Because this increment is much smaller than a full server, it's much easier to move around and redistribute data. It's also possible to add new servers in smaller increments, which is easier on planning.

### Scaling

**tl;dr:** Much easier

This is related to capacity planning and sharding. When we talk about scaling, many people think about very large _systems,_ but that is not exclusively how I think of the problem:

  * Scaling is being able to start with something very small, without having to make huge investments upfront on the chance it could become very large.
  * Scaling is also a people problem. If a system requires too much internal knowledge to operate, it can become hard to grow as an engineering organization. The barrier to entry for new hires can become very high.



Thus, by providing automatic sharding, TiDB can scale much easier.

### Schema changes (DDL)

**tl;dr:** Mostly better

The data definition language (DDL) supported in TiDB is all online, which means it doesn't block other reads or writes to the system. It also doesn't block the replication stream.

That's the good news, but there are a couple of limitations to be aware of:

  * TiDB does not currently support all DDL operations, such as changing the primary key or some "change data type" operations.
  * TiDB does not currently allow you to chain multiple DDL changes in the same command, e.g., _ALTER TABLE t1 ADD INDEX (x), ADD INDEX (y)_. You will need to break these queries up into individual DDL queries.



This is an area that we're looking to improve in [TiDB 3.0][7].

### Creating one-off data dumps for the reporting team

**tl;dr:** May not be required

DBAs loathe manual tasks that create one-off exports of data to be consumed by another team, perhaps in an analytics tool or data warehouse.

This is often required when the types of queries that are be executed on the dataset are analytical. TiDB has hybrid transactional/analytical processing (HTAP) capabilities, so in many cases, these queries should work fine. If your analytics team is using Spark, you can also use the [TiSpark][8] connector to allow them to connect directly to TiKV.

This is another area we are improving with [TiFlash][7], a column store accelerator. We are also working on a plugin system to support external authentication. This will make it easier to manage access by the reporting team.

### Conclusion

In this post, I looked at some common MySQL DBA tasks and how they translate to TiDB. If you would like to learn more, check out our [TiDB Academy course][9] designed for MySQL DBAs (it's free!).

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/how-save-time-tidb

作者：[Morgan Tocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/morgo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://opensource.com/article/18/11/key-differences-between-mysql-and-tidb
[3]: https://github.com/pingcap/tidb
[4]: https://opensource.com/sites/default/files/uploads/tidb_architecture.png (TiDB architecture)
[5]: https://pingcap.com/docs/architecture/
[6]: https://raft.github.io/
[7]: https://pingcap.com/blog/tidb-3.0-beta-stability-at-scale/
[8]: https://github.com/pingcap/tispark
[9]: https://pingcap.com/tidb-academy/
