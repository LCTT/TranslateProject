Best of PostgreSQL 10 for the DBA
============================================================


Last week a new PostgreSQL major version with the number 10 was released! Announcement, release notes and the „What’s new“ overview can be found from [here][3], [here][4]and [here][5] – it’s highly recommended reading, so check them out. As usual there have been already quite some blog postings covering all the new stuff, but I guess everyone has their own angle on what is important so as with version 9.6 I’m again throwing in my impressions on the most interesting/relevant features here.

As always, users who upgrade or initialize a fresh cluster, will enjoy huge performance wins (e.g. better parallelization with parallel index scans, merge joins and uncorrelated sub-queries, faster aggregations, smarter joins and aggregates on remote servers) out of the box without doing anything, but here I would like to look more at the things that you won’t get out of the box but you actually need to take some steps to start benefiting from them. List of below highlighted features is compiled from a DBA’s viewpoint here, soon a post on changes from a developer’s point of view will also follow.

### Upgrading considerations

First some hints on upgrading from an existing setup – this time there are some small things that could cause problems when migrating from 9.6 or even older versions, so before the real deal one should definitely test the upgrade on a separate replica and go through the full list of possible troublemakers from the release notes. Most likely pitfalls to watch out for:

*   All functions containing „xlog“ have been renamed to use „wal“ instead of „xlog“

The latter naming could be confused with normal server logs so a „just in case“ change. If using any 3rd party backup/replication/HA tools check that they are all at latest versions.

*   pg_log folder for server logs (error messages/warnings etc) has been renamed to just „log“

Make sure to verify that your log parsing/grepping scripts (if having any) work.

*   By default queries will make use of up to 2 background processes

If using the default 10 postgresql.conf settings on a machine with low number of CPUs you may see resource usage spikes as parallel processing is enabled by default now – which is a good thing though as it should mean faster queries. Set max_parallel_workers_per_gather to 0 if old behaviour is needed.

*   Replication connections from localhost are enabled now by default

To ease testing etc, localhost and local Unix socket replication connections are now enabled in „trust“ mode (without password) in pg_hba.conf! So if other non-DBA user also have access to real production machines, make sure you change the config.

### My favourites from a DBA’s point of view

*   Logical replication

The long awaited feature enables easy setup and minimal performance penalties for application scenarios where you only want to replicate a single table or a subset of tables or all tables, meaning also zero downtime upgrades for following major versions! Historically (Postgres 9.4+ required) this could be achieved only by usage of a 3rd party extension or slowish trigger based solutions. The top feature of version 10 for me.

*   Declarative partitioning

Old way of managing partitions via inheritance and creating triggers to re-route inserts to correct tables was bothersome to say the least, not to mention the performance impact. Currently supported are „range“ and „list“ partitioning schemes. If someone is missing „hash“ partitioning available in some DB engines, one could use „list“ partitioning with expressions to achieve the same.

*   Usable Hash indexes

Hash indexes are now WAL-logged thus crash safe and received some performance improvements so that for simple searches they’re actually faster than standard B-tree indexes for bigger amounts of data. Bigger index size though too.

*   Cross-column optimizer statistics

Such stats needs to be created manually on a set if columns of a table, to point out that the values are actually somehow dependent on each other. This will enable to counter slow query problems where the planner thinks there will be very little data returned (multiplication of probabilities yields very small numbers usually) and will choose for example a „nested loop“ join that does not perform well on bigger amounts of data.

*   Parallel snapshots on replicas

Now one can use the pg_dump tool to speed up backups on standby servers enormously by using multiple processes (the –jobs flag).

*   Better tuning of parallel processing worker behaviour

See max_parallel_workers and min_parallel_table_scan_size / min_parallel_index_scan_size parameters. The default values (8MB, 512KB) for the latter two I would recommend to increase a bit though.

*   New built-in monitoring roles for easier tooling

New roles pg_monitor, pg_read_all_settings, pg_read_all_stats, and pg_stat_scan_tables make life a lot easier for all kinds of monitoring tasks – previously one had to use superuser accounts or some SECURITY DEFINER wrapper functions.

*   Temporary (per session) replication slots for safer replica building

*   A new Contrib extension for checking validity of B-tree indexes

Does couple of smart checks to discover structural inconsistencies and stuff not covered by page level checksums. Hope to check it out more deeply in nearer future.

*   Psql query tool supports now basic branching (if/elif/else)

This would for example enable having a single maintenance/monitoring script with version specific branching (different column names for pg_stat* views etc) instead of many version specific scripts.

```
SELECT :VERSION_NAME = '10.0' AS is_v10 \gset 
\if :is_v10
    SELECT 'yippee' AS msg;
\else
    SELECT 'time to upgrade!' AS msg;
\endif
```

That’s it for this time! Lot of other stuff didn’t got listed of course, so for full time DBAs I’d definitely suggest to look at the notes more thoroughly. And a big thanks to those 300+ people who contributed their effort to this particularly exciting release!

--------------------------------------------------------------------------------

via: http://www.cybertec.at/best-of-postgresql-10-for-the-dba/

作者：[ Kaarel Moppel][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.cybertec.at/author/kaarel-moppel/
[1]:http://www.cybertec.at/author/kaarel-moppel/
[2]:http://www.cybertec.at/best-of-postgresql-10-for-the-dba/
[3]:https://www.postgresql.org/about/news/1786/
[4]:https://www.postgresql.org/docs/current/static/release-10.html
[5]:https://wiki.postgresql.org/wiki/New_in_postgres_10
