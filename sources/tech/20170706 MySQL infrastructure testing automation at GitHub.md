MonkeyDEcho translated

[MySQL infrastructure testing automation at GitHub][31]
============================================================

Our MySQL infrastructure is a critical component to GitHub. MySQL serves GitHub.com, GitHub’s API, authentication and more. Every `git` request touches MySQL in some way. We are tasked with keeping the data available, and maintaining its integrity. Even while our MySQL clusters serve traffic, we need to be able to perform tasks such as heavy duty cleanups, ad-hoc updates, online schema migrations, cluster topology refactoring, pooling and load balancing and more. We have the infrastructure to automate away such operations; in this post we share a few examples of how we build trust in our infrastructure through continuous testing. It is essentially how we sleep well at night.

### Backups[][36]

It is incredibly important to take backups of your data. If you are not taking backups of your database, it is likely a matter of time before this will become an issue. Percona [Xtrabackup][37]is the tool we have been using for issuing full backups for our MySQL databases. If there is data that we need to be certain is saved, we have a server that is backing up the data.

In addition to the full binary backups, we run logical backups several times a day. These backups allow our engineers to get a copy of recent data. There are times that they would like a complete set of data from a table so they can test an index change on a production sized table or see data from a certain point of time. Hubot allows us to restore a backed up table and will ping us when the table is ready to use.

![tomkrouper](https://avatars2.githubusercontent.com/tomkrouper?v=3&s=22)
**tomkrouper**.mysql backup-list locations
![hubot](https://avatars1.githubusercontent.com/hubot?v=3&s=22)
**Hubot**
```
+-----------+------------+---------------+---------------------+---------------------+----------------------------------------------+
| Backup ID | Table Name | Donor Host    | Backup Start        | Backup End          | File Name                                    |
+-----------+------------+---------------+---------------------+---------------------+----------------------------------------------+
|   1699494 | locations  | db-mysql-0903 | 2017-07-01 22:09:17 | 2017-07-01 22:09:17 | backup-mycluster-locations-1498593122.sql.gz |
|   1699133 | locations  | db-mysql-0903 | 2017-07-01 16:11:37 | 2017-07-01 16:11:39 | backup-mycluster-locations-1498571521.sql.gz |
|   1698772 | locations  | db-mysql-0903 | 2017-07-01 10:09:21 | 2017-07-01 10:09:22 | backup-mycluster-locations-1498549921.sql.gz |
|   1698411 | locations  | db-mysql-0903 | 2017-07-01 04:12:32 | 2017-07-01 04:12:32 | backup-mycluster-locations-1498528321.sql.gz |
|   1698050 | locations  | db-mysql-0903 | 2017-06-30 22:18:23 | 2017-06-30 22:18:23 | backup-mycluster-locations-1498506721.sql.gz |
| ...
|   1262253 | locations  | db-mysql-0088 | 2016-08-01 01:58:51 | 2016-08-01 01:58:54 | backup-mycluster-locations-1470034801.sql.gz |
|   1064984 | locations  | db-mysql-0088 | 2016-04-04 13:07:40 | 2016-04-04 13:07:43 | backup-mycluster-locations-1459494001.sql.gz |
+-----------+------------+---------------+---------------------+---------------------+----------------------------------------------+

```

![tomkrouper](https://avatars2.githubusercontent.com/tomkrouper?v=3&s=22)
**tomkrouper**.mysql restore 1699133
![hubot](https://avatars1.githubusercontent.com/hubot?v=3&s=22)
**Hubot**A restore job has been created for the backup job 1699133\. You will be notified in #database-ops when the restore is complete.
![hubot](https://avatars1.githubusercontent.com/hubot?v=3&s=22)
**Hubot**[@tomkrouper][1]: the locations table has been restored as locations_2017_07_01_16_11 in the restores database on db-mysql-0482

The data is loaded onto a non-production database which is accessible to the engineer requesting the restore.

The last way we keep a “backup” of data around is we use [delayed replicas][38]. This is less of a backup and more of a safeguard. For each production cluster we have a host that has replication delayed by 4 hours. If a query is run that shouldn’t have, we can run `mysql panic` in chatops. This will cause all of our delayed replicas to stop replication immediately. This will also page the on-call DBA. From there we can use delayed replica to verify there is an issue, and then fast forward the binary logs to the point right before the error. We can then restore this data to the master, thus recovering data to that point.

Backups are great, however they are worthless if some unknown or uncaught error occurs corrupting the backup. A benefit of having a script to restore backups is it allows us to automate the verification of backups via cron. We have set up a dedicated host for each cluster that runs a restore of the latest backup. This ensures that the backup ran correctly and that we are able to retrieve the data from the backup.

Depending on dataset size, we run several restores per day. Restored servers are expected to join the replication stream and to be able to catch up with replication. This tests not only that we took a restorable backup, but also that we correctly identified the point in time at which it was taken and can further apply changes from that point in time. We are alerted if anything goes wrong in the restore process.

We furthermore track the time the restore takes, so we have a good idea of how long it will take to build a new replica or restore in cases of emergency.

The following is an output from an automated restore process, written by Hubot in our robots chat room.

![hubot](https://avatars1.githubusercontent.com/hubot?v=3&s=22)
**Hubot**gh-mysql-backup-restore: db-mysql-0752: restore_log.id = 4447 
gh-mysql-backup-restore: db-mysql-0752: Determining backup to restore for cluster 'prodcluster'. 
gh-mysql-backup-restore: db-mysql-0752: Enabling maintenance mode 
gh-mysql-backup-restore: db-mysql-0752: Setting orchestrator downtime 
gh-mysql-backup-restore: db-mysql-0752: Disabling Puppet 
gh-mysql-backup-restore: db-mysql-0752: Stopping MySQL 
gh-mysql-backup-restore: db-mysql-0752: Removing MySQL files 
gh-mysql-backup-restore: db-mysql-0752: Running gh-xtrabackup-restore 
gh-mysql-backup-restore: db-mysql-0752: Restore file: xtrabackup-notify-2017-07-02_0000.xbstream 
gh-mysql-backup-restore: db-mysql-0752: Running gh-xtrabackup-prepare 
gh-mysql-backup-restore: db-mysql-0752: Starting MySQL 
gh-mysql-backup-restore: db-mysql-0752: Update file ownership 
gh-mysql-backup-restore: db-mysql-0752: Upgrade MySQL 
gh-mysql-backup-restore: db-mysql-0752: Stopping MySQL 
gh-mysql-backup-restore: db-mysql-0752: Starting MySQL 
gh-mysql-backup-restore: db-mysql-0752: Backup Host: db-mysql-0034 
gh-mysql-backup-restore: db-mysql-0752: Setting up replication 
gh-mysql-backup-restore: db-mysql-0752: Starting replication 
gh-mysql-backup-restore: db-mysql-0752: Replication catch-up 
gh-mysql-backup-restore: db-mysql-0752: Restore complete (replication running) 
gh-mysql-backup-restore: db-mysql-0752: Enabling Puppet 
gh-mysql-backup-restore: db-mysql-0752: Disabling maintenance mode 
gh-mysql-backup-restore: db-mysql-0752: Setting orchestrator downtime 
gh-mysql-backup-restore: db-mysql-0752: Restore process complete. 

One thing we use backups for is adding a new replica to an existing set of MySQL servers. We will initiate the build of a new server, and once we are notified it is ready, we can start a restore of the latest backup for that particular cluster. We have a script in place that runs all of the restore commands that we would otherwise have to do by hand. Our automated restore system essentially uses the same script. This simplifies the system build process and allows us to have a host up and running with a handful of chat commands opposed to dozens of manual processes. Shown below is a restore kicked manually in chat:

![jessbreckenridge](https://avatars3.githubusercontent.com/jessbreckenridge?v=3&s=22)
**jessbreckenridge**.mysql backup-restore -H db-mysql-0007 -o -r magic_word=daily_rotating_word
![hubot](https://avatars1.githubusercontent.com/hubot?v=3&s=22)
**Hubot**[@jessbreckenridge][2] gh-mysql-backup-restore: db-mysql-0007: Determining backup to restore for cluster 'mycluster'. 
[@jessbreckenridge][3] gh-mysql-backup-restore: db-mysql-0007: restore_log.id = 4449 
[@jessbreckenridge][4] gh-mysql-backup-restore: db-mysql-0007: Enabling maintenance mode
[@jessbreckenridge][5] gh-mysql-backup-restore: db-mysql-0007: Setting orchestrator downtime 
[@jessbreckenridge][6] gh-mysql-backup-restore: db-mysql-0007: Disabling Puppet 
[@jessbreckenridge][7] gh-mysql-backup-restore: db-mysql-0007: Stopping MySQL 
[@jessbreckenridge][8] gh-mysql-backup-restore: db-mysql-0007: Removing MySQL files 
[@jessbreckenridge][9] gh-mysql-backup-restore: db-mysql-0007: Running gh-xtrabackup-restore 
[@jessbreckenridge][10] gh-mysql-backup-restore: db-mysql-0007: Restore file: xtrabackup-mycluster-2017-07-02_0015.xbstream 
[@jessbreckenridge][11] gh-mysql-backup-restore: db-mysql-0007: Running gh-xtrabackup-prepare 
[@jessbreckenridge][12] gh-mysql-backup-restore: db-mysql-0007: Update file ownership 
[@jessbreckenridge][13] gh-mysql-backup-restore: db-mysql-0007: Starting MySQL 
[@jessbreckenridge][14] gh-mysql-backup-restore: db-mysql-0007: Upgrade MySQL 
[@jessbreckenridge][15] gh-mysql-backup-restore: db-mysql-0007: Stopping MySQL 
[@jessbreckenridge][16] gh-mysql-backup-restore: db-mysql-0007: Starting MySQL 
[@jessbreckenridge][17] gh-mysql-backup-restore: db-mysql-0007: Setting up replication 
[@jessbreckenridge][18] gh-mysql-backup-restore: db-mysql-0007: Starting replication 
[@jessbreckenridge][19] gh-mysql-backup-restore: db-mysql-0007: Backup Host: db-mysql-0201 
[@jessbreckenridge][20] gh-mysql-backup-restore: db-mysql-0007: Replication catch-up 
[@jessbreckenridge][21] gh-mysql-backup-restore: db-mysql-0007: Replication behind by 4589 seconds, waiting 1800 seconds before next check. 
[@jessbreckenridge][22] gh-mysql-backup-restore: db-mysql-0007: Restore complete (replication running) 
[@jessbreckenridge][23] gh-mysql-backup-restore: db-mysql-0007: Enabling puppet 
[@jessbreckenridge][24] gh-mysql-backup-restore: db-mysql-0007: Disabling maintenance mode 

### Failovers[][39]

[We use orchestrator][40] to perform automated failovers for masters and intermediate masters. We expect `orchestrator` to correctly detect master failure, designate a replica for promotion, heal the topology under said designated replica, make the promotion. We expect VIPs to change, pools to change, clients to reconnect, `puppet` to run essential components on promoted master, and more. A failover is a complex task that touches many aspects of our infrastructure.

To build trust in our failovers we set up a  _production-like_ , test cluster, and we continuously crash it to observe failovers.

The  _production-like_  cluster is a replication setup that is identical in all aspects to our production clusters: types of hardware, operating systems, MySQL versions, network environments, VIP, `puppet` configurations, [haproxy setup][41], etc. The only thing different to this cluster is that it doesn’t send/receive production traffic.

We emulate a write load on the test cluster, while avoiding replication lag. The write load is not too heavy, but has queries that are intentionally contending to write on same datasets. This isn’t too interesting in normal times, but proves to be useful upon failovers, as we will shortly describe.

Our test cluster has representative servers from three data centers. We would  _like_  the failover to promote a replacement replica from within the same data center. We would  _like_ to be able to salvage as many replicas as possible under such constraint. We  _require_  that both apply whenever possible. `orchestrator` has no prior assumption on the topology; it must react on whatever the state was at time of the crash.

We, however, are interested in creating complex and varying scenarios for failovers. Our failover testing script prepares the grounds for the failover:

*   It identifies existing master

*   It refactors the topology to have representatives of all three data centers under the master. Different DCs have different network latencies and are expected to react in different timing to master’s crash.

*   It chooses a crash method. We choose from shooting the master (`kill -9`) or network partitioning it: `iptables -j REJECT` (nice-ish) or `iptables -j DROP`(unresponsive).

The script proceeds to crash the master by chosen method, and waits for `orchestrator` to reliably detect the crash and to perform failover. While we expect detection and promotion to both complete within `30` seconds, the script relaxes this expectation a bit, and sleeps for a designated time before looking into failover results. It will then:

*   Check that a new (different) master is in place

*   There is a good number of replicas in the cluster

*   The master is writable

*   Writes to the master are visible on the replicas

*   Internal service discovery entries are updated (identity of new master is as expected; old master removed)

*   Other internal checks

These tests confirm that the failover was successful, not only MySQL-wise but also on our larger infrastructure scope. A VIP has been assumed; specific services have been started; information got to where it was supposed to go.

The script further proceeds to restore the failed server:

*   Restoring it from backup, thereby implicitly testing our backup/restore procedure

*   Verifying server configuration is as expected (the server no longer believes it’s the master)

*   Returning it to the replication cluster, expecting to find data written on the master

Consider the following visualization of a scheduled failover test: from having a well-running cluster, to seeing problems on some replicas, to diagnosing the master (`7136`) is dead, to choosing a server to promote (`a79d`), refactoring the topology below that server, to promoting it (failover successful), to restoring the dead master and placing it back into the cluster.

![automated master failover](https://githubengineering.com/images/mysql-infrastructre-testing-automation/orchestrator-failover-demo-2000.gif)

#### What would a test failure look like?

Our testing script uses a stop-the-world approach. A single failure in any of the failover components fails the entire test, disabling any future automated tests until a human resolves the matter. We get alerted and proceed to check the status and logs.

The script would fail on an unacceptable detection or failover time; on backup/restore issues; on losing too many servers; on unexpected configuration following the failover; etc.

We need to be certain `orchestrator` connects the servers correctly. This is where the contending write load comes useful: if set up incorrectly, replication is easily susceptible to break. We would get `DUPLICATE KEY` or other errors to suggest something went wrong.

This is particularly important as we make improvements and introduce new behavior to `orchestrator`, and allows us to test such changes in a safe environment.

#### Coming up: chaos testing

The testing procedure illustrated above will catch (and has caught) problems on many parts of our infrastructure. Is it enough?

In a production environment there’s always something else. Something about the particular test method that won’t apply to our production clusters. They don’t share the same traffic and traffic manipulation, nor the exact same set of servers. The types of failure can vary.

We are designing chaos testing for our production clusters. Chaos testing would literally destroy pieces in our production, but on expected schedule and under sufficiently controlled manner. Chaos testing introduces a higher level of trust in the recovery mechanism and affects (thus tests) larger parts of our infrastructure and application.

This is delicate work: while we acknowledge the need for chaos testing, we also wish to avoid unnecessary impact to our service. Different tests will differ in risk level and impact, and we will work to ensure availability of our service.

### Schema migrations[][42]

[We use gh-ost][43] to run live schema migrations. `gh-ost` is stable, but also under active developments, with major new features being added or planned.

`gh-ost` migrates tables by copying data onto a  _ghost_  table, applying ongoing changes intercepted by the binary logs onto the  _ghost_  table, even as the original table is being written to. It then swaps the  _ghost_  table in place of the original table. At migration completion GitHub proceeds to work with a table generated and populated by `gh-ost`.

At this time almost all of GitHub’s MySQL data has been recreated by `gh-ost`, and most of it multiple times. We must have high trust in `gh-ost` to let it tamper with our data over and over again, even in face of active development. Here’s how we gain this trust.

`gh-ost` provides a testing-in-production capability. It supports running a migration on a replica, in much the same way as it would run on the master: `gh-ost` would connect to the replica and treat it as if it were the master. It would parse its binary logs the same way it would for a real master migration. However it would copy rows and apply binlog events to the replica, and avoid making writes onto the master.

We run `gh-ost`-dedicated replicas in production. These replicas do not serve production traffic. Each such replica retrieves the current list of production tables and iterates them in random order. One by one it picks a table and performs a replica-migration on that table. The migration doesn’t actually modify table structure, but instead runs a trivial `ENGINE=InnoDB`. The test runs the migration even as the table is being used in production, thus copying real production data and applying true production traffic off the binary logs.

These migrations can be audited. Here’s how we can inspect status of running tests from chat:

![ggunson](https://avatars0.githubusercontent.com/ggunson?v=3&s=22)
**ggunson**.migration test-status
![hubot](https://avatars1.githubusercontent.com/hubot?v=3&s=22)
**Hubot**
```
# Migrating `prod`.`pull_requests`; Ghost table is `prod`.`_pull_requests_gho`
# Migrating ghost-db-mysql-0007:3306; inspecting ghost-db-mysql-0007:3306; executing on ghost-db-mysql-0007
# Migration started at Mon Jan 30 02:13:39 -0800 2017
# chunk-size: 2500; max-lag-millis: 1500ms; max-load: Threads_running=30; critical-load: Threads_running=1000; nice-ratio: 0.000000
# throttle-additional-flag-file: /tmp/gh-ost.throttle
# panic-flag-file: /tmp/ghost-test-panic.flag
# Serving on unix socket: /tmp/gh-ost.test.sock
Copy: 57992500/86684838 66.9%; Applied: 57708; Backlog: 1/100; Time: 3h28m38s(total), 3h28m36s(copy); streamer: mysql-bin.000576:142993938; State: migrating; ETA: 1h43m12s
```

When a test migration completes copying of table data it stops replication and performs the cut-over, replacing the original table with the  _ghost_  table, and then swaps back. We’re not interested in actually replacing the data. Instead we are left with both the original table and the  _ghost_  table, which should both be identical. We verify that by checksumming the entire table data for both tables.

A test can complete with:

*   _success_ : All went well and checksum is identical. We expect to see this.

*   _failure_ : Execution problem. This can occasionally happen due to the migration process being killed, a replication issue etc., and is typically unrelated to `gh-ost` itself.

*   _checksum failure_ : table data inconsistency. For a tested branch, this call for fixes. For an ongoing `master` branch test, this would imply immediate blocking of production migrations. We don’t get the latter.

Test results are audited, sent to robot chatrooms, sent as events to our metrics systems. Each vertical line in the following graph represents a successful migration test:

![automated master failover](https://githubengineering.com/images/mysql-infrastructre-testing-automation/gh-ost-tests-results-as-events.png)

These tests run continuously. We are notified by alerts in case of failures. And of course we can always visit the robots chatroom to know what’s going on.

#### Testing new versions

We continuously improve `gh-ost`. Our development flow is based on `git` branches, which we then offer to merge via [pull requests][44].

A submitted `gh-ost` pull request goes through Continuous Integration (CI) which runs basic compilation and unit tests. Once past this, the PR is technically eligible for merging, but even more interestingly it is [eligible for deployment via Heaven][45]. Being the sensitive component in our infrastructure that it is, we take care to deploy `gh-ost` branches for intensive testing before merging into `master`.

![shlomi-noach](https://avatars3.githubusercontent.com/shlomi-noach?v=3&s=22)
**shlomi-noach**.deploy gh-ost/fix-reappearing-throttled-reasons to prod/ghost-db-mysql-0007
![hubot](https://avatars1.githubusercontent.com/hubot?v=3&s=22)
**Hubot**[@shlomi-noach][25] is deploying gh-ost/fix-reappearing-throttled-reasons (baee4f6) to production (ghost-db-mysql-0007). 
[@shlomi-noach][26]'s production deployment of gh-ost/fix-reappearing-throttled-reasons (baee4f6) is done! (2s) 
[@shlomi-noach][27], make sure you watch for exceptions in haystack
![jonahberquist](https://avatars0.githubusercontent.com/jonahberquist?v=3&s=22)
**jonahberquist**.deploy gh-ost/interactive-command-question to prod/ghost-db-mysql-0012
![hubot](https://avatars1.githubusercontent.com/hubot?v=3&s=22)
**Hubot**[@jonahberquist][28] is deploying gh-ost/interactive-command-question (be1ab17) to production (ghost-db-mysql-0012). 
[@jonahberquist][29]'s production deployment of gh-ost/interactive-command-question (be1ab17) is done! (2s) 
[@jonahberquist][30], make sure you watch for exceptions in haystack
![shlomi-noach](https://avatars3.githubusercontent.com/shlomi-noach?v=3&s=22)
**shlomi-noach**.wcid gh-ost
![hubot](https://avatars1.githubusercontent.com/hubot?v=3&s=22)
**Hubot**shlomi-noach testing fix-reappearing-throttled-reasons 41 seconds ago: ghost-db-mysql-0007 
jonahberquist testing interactive-command-question 7 seconds ago: ghost-db-mysql-0012 

Nobody is in the queue.

Some PRs are small and do not affect the data itself. Changes to status messages, interactive commands etc. are of lesser impact to the `gh-ost` app. Others pose significant changes to the migration logic and operation. We would tests these rigorously, running through our production tables fleet until satisfied these changes do not pose data corruption threat.

### Summary[][46]

Throughout testing we build trust in our systems. By automating these tests, in production, we get repetitive confirmation that everything is working as expected. As we continue to develop our infrastructure we also follow up by adapting tests to cover the newest changes.

Production always surprises with scenarios not covered by tests. The more we test on production environment, the more input we get on our app’s expectations and our infrastructure’s capabilities.

--------------------------------------------------------------------------------

via: https://githubengineering.com/mysql-testing-automation-at-github/

作者：[tomkrouper ][a], [Shlomi Noach][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/tomkrouper
[b]:https://github.com/shlomi-noach
[1]:https://github.com/tomkrouper
[2]:https://github.com/jessbreckenridge
[3]:https://github.com/jessbreckenridge
[4]:https://github.com/jessbreckenridge
[5]:https://github.com/jessbreckenridge
[6]:https://github.com/jessbreckenridge
[7]:https://github.com/jessbreckenridge
[8]:https://github.com/jessbreckenridge
[9]:https://github.com/jessbreckenridge
[10]:https://github.com/jessbreckenridge
[11]:https://github.com/jessbreckenridge
[12]:https://github.com/jessbreckenridge
[13]:https://github.com/jessbreckenridge
[14]:https://github.com/jessbreckenridge
[15]:https://github.com/jessbreckenridge
[16]:https://github.com/jessbreckenridge
[17]:https://github.com/jessbreckenridge
[18]:https://github.com/jessbreckenridge
[19]:https://github.com/jessbreckenridge
[20]:https://github.com/jessbreckenridge
[21]:https://github.com/jessbreckenridge
[22]:https://github.com/jessbreckenridge
[23]:https://github.com/jessbreckenridge
[24]:https://github.com/jessbreckenridge
[25]:https://github.com/shlomi-noach
[26]:https://github.com/shlomi-noach
[27]:https://github.com/shlomi-noach
[28]:https://github.com/jonahberquist
[29]:https://github.com/jonahberquist
[30]:https://github.com/jonahberquist
[31]:https://githubengineering.com/mysql-testing-automation-at-github/
[32]:https://github.com/tomkrouper
[33]:https://github.com/tomkrouper
[34]:https://github.com/shlomi-noach
[35]:https://github.com/shlomi-noach
[36]:https://githubengineering.com/mysql-testing-automation-at-github/#backups
[37]:https://www.percona.com/software/mysql-database/percona-xtrabackup
[38]:https://dev.mysql.com/doc/refman/5.6/en/replication-delayed.html
[39]:https://githubengineering.com/mysql-testing-automation-at-github/#failovers
[40]:http://githubengineering.com/orchestrator-github/
[41]:https://githubengineering.com/context-aware-mysql-pools-via-haproxy/
[42]:https://githubengineering.com/mysql-testing-automation-at-github/#schema-migrations
[43]:http://githubengineering.com/gh-ost-github-s-online-migration-tool-for-mysql/
[44]:https://github.com/github/gh-ost/pulls
[45]:https://githubengineering.com/deploying-branches-to-github-com/
[46]:https://githubengineering.com/mysql-testing-automation-at-github/#summary
