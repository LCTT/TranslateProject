Why is the ibdata1 file continuously growing in MySQL?
================================================================================
![ibdata1 file](https://www.percona.com/blog/wp-content/uploads/2013/08/ibdata1-file.jpg)

We receive this question about the ibdata1 file in MySQL very often in [Percona Support][1].

The panic starts when the monitoring server sends an alert about the storage of the MySQL server – saying that the disk is about to get filled.

After some research you realize that most of the disk space is used by the InnoDB’s shared tablespace ibdata1. You have [innodb_file_per_table][2] enabled, so the question is:

### What is stored in ibdata1? ###

When you have innodb_file_per_table enabled, the tables are stored in their own tablespace but the shared tablespace is still used to store other InnoDB’s internal data:

- data dictionary aka metadata of InnoDB tables
- change buffer
- doublewrite buffer
- undo logs

Some of them can be configured on [Percona Server][3] to avoid becoming too large. For example you can set a maximum size for change buffer with [innodb_ibuf_max_size][4] or store the doublewrite buffer on a separate file with [innodb_doublewrite_file][5].

In MySQL 5.6 you can also create external UNDO tablespaces so they will be in their own files instead of stored inside ibdata1. Check following [documentation link][6].

### What is causing the ibdata1 to grow that fast? ###

Usually the first command that we need to run when there is a MySQL problem is:

    SHOW ENGINE INNODB STATUSG

That will show us very valuable information. We start checking the **TRANSACTIONS** section and we find this:

    ---TRANSACTION 36E, ACTIVE 1256288 sec
    MySQL thread id 42, OS thread handle 0x7f8baaccc700, query id 7900290 localhost root
    show engine innodb status
    Trx read view will not see trx with id >= 36F, sees < 36F

This is the most common reason, a pretty old transaction created 14 days ago. The status is **ACTIVE**, that means InnoDB has created a snapshot of the data so it needs to maintain old pages in **undo** to be able to provide a consistent view of the database since that transaction was started. If your database is heavily write loaded that means lots of undo pages are being stored.

If you don’t find any long-running transaction you can also monitor another variable from the INNODB STATUS, the “**History list length.**” It shows the number of pending purge operations. In this case the problem is usually caused because the purge thread (or master thread in older versions) is not capable to process undo records with the same speed as they come in.

### How can I check what is being stored in the ibdata1? ###

Unfortunately MySQL doesn’t provide information of what is being stored on that ibdata1 shared tablespace but there are two tools that will be very helpful. First a modified version of innochecksum made by Mark Callaghan and published in [this bug report][7].

It is pretty easy to use:

    # ./innochecksum /var/lib/mysql/ibdata1
    0 bad checksum
    13 FIL_PAGE_INDEX
    19272 FIL_PAGE_UNDO_LOG
    230 FIL_PAGE_INODE
    1 FIL_PAGE_IBUF_FREE_LIST
    892 FIL_PAGE_TYPE_ALLOCATED
    2 FIL_PAGE_IBUF_BITMAP
    195 FIL_PAGE_TYPE_SYS
    1 FIL_PAGE_TYPE_TRX_SYS
    1 FIL_PAGE_TYPE_FSP_HDR
    1 FIL_PAGE_TYPE_XDES
    0 FIL_PAGE_TYPE_BLOB
    0 FIL_PAGE_TYPE_ZBLOB
    0 other
    3 max index_id

It has 19272 UNDO_LOG pages from a total of 20608. **That’s the 93% of the tablespace**.

The second way to check the content of a tablespace are the [InnoDB Ruby Tools][8] made by Jeremy Cole. It is a more advanced tool to examine the internals of InnoDB. For example we can use the space-summary parameter to get a list with every page and its data type. We can use standard Unix tools to get the number of **UNDO_LOG** pages:

    # innodb_space -f /var/lib/mysql/ibdata1 space-summary | grep UNDO_LOG | wc -l
    19272

Altough in this particular case innochecksum is faster and easier to use I recommend you to play with Jeremy’s tools to learn more about the data distribution inside InnoDB and its internals.

OK, now we know where the problem is. The next question:

### How can I solve the problem? ###

The answer to this question is easy. If you can still commit that query, do it. If not you’ll have to kill the thread to start the rollback process. That will just stop ibdata1 from growing but it is clear that your software has a bug or someone made a mistake. Now that you know how to identify where is the problem you need to find who or what is causing it using your own debugging tools or the general query log.

If the problem is caused by the purge thread then the solution is usually to upgrade to a newer version where you can use a dedicated purge thread instead of the master thread. More information on the following [documentation link][9].

### Is there any way to recover the used space? ###

No, it is not possible at least in an easy and fast way. InnoDB tablespaces never shrink… see the following [10-year old bug report][10] recently updated by James Day (thanks):

When you delete some rows, the pages are marked as deleted to reuse later but the space is never recovered. The only way is to start the database with fresh ibdata1. To do that you would need to take a full logical backup with mysqldump. Then stop MySQL and remove all the databases, ib_logfile* and ibdata* files. When you start MySQL again it will create a new fresh shared tablespace. Then, recover the logical dump.

### Summary ###

When the ibdata1 file is growing too fast within MySQL it is usually caused by a long running transaction that we have forgotten about. Try to solve the problem as fast as possible (commiting or killing a transaction) because you won’t be able to recover the wasted disk space without the painfully slow mysqldump process.

Monitoring the database to avoid these kind of problems is also very recommended. Our [MySQL Monitoring Plugins][11] includes a Nagios script that can alert you if it finds a too old running transaction.

--------------------------------------------------------------------------------

via: https://www.percona.com/blog/2013/08/20/why-is-the-ibdata1-file-continuously-growing-in-mysql/

作者：[Miguel Angel Nieto][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.percona.com/blog/author/miguelangelnieto/
[1]:https://www.percona.com/products/mysql-support
[2]:http://dev.mysql.com/doc/refman/5.5/en/innodb-parameters.html#sysvar_innodb_file_per_table
[3]:https://www.percona.com/software/percona-server
[4]:https://www.percona.com/doc/percona-server/5.5/scalability/innodb_insert_buffer.html#innodb_ibuf_max_size
[5]:https://www.percona.com/doc/percona-server/5.5/performance/innodb_doublewrite_path.html?id=percona-server:features:percona_innodb_doublewrite_path#innodb_doublewrite_file
[6]:http://dev.mysql.com/doc/refman/5.6/en/innodb-performance.html#innodb-undo-tablespace
[7]:http://bugs.mysql.com/bug.php?id=57611
[8]:https://github.com/jeremycole/innodb_ruby
[9]:http://dev.mysql.com/doc/innodb/1.1/en/innodb-improved-purge-scheduling.html
[10]:http://bugs.mysql.com/bug.php?id=1341
[11]:https://www.percona.com/software/percona-monitoring-plugins