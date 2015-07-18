为什么 mysql 里的 ibdata1 文件不断的增长？
================================================================================
![ibdata1 file](https://www.percona.com/blog/wp-content/uploads/2013/08/ibdata1-file.jpg)

我们在 [Percona 支持栏目][1]经常收到关于 MySQL 的 ibdata1 文件的这个问题。

当监控服务器发送一个关于 MySQL 服务器存储的报警时，恐慌就开始了 —— 就是说磁盘快要满了。

一番调查后你意识到大多数地盘空间被 InnoDB 的共享表空间 ibdata1 使用。而你已经启用了 [innodb\_file\_per\_table][2]，所以问题是：

### ibdata1存了什么？ ###

当你启用了 `innodb_file_per_table`，表被存储在他们自己的表空间里，但是共享表空间仍然在存储其它的 InnoDB 内部数据：

- 数据字典，也就是 InnoDB 表的元数据
- 变更缓冲区
- 双写缓冲区
- 撤销日志

其中的一些在 [Percona 服务器][3]上可以被配置来避免增长过大的。例如你可以通过 [innodb\_ibuf\_max\_size][4] 设置最大变更缓冲区，或设置 [innodb\_doublewrite\_file][5] 来将双写缓冲区存储到一个分离的文件。

MySQL 5.6 版中你也可以创建外部的撤销表空间，所以它们可以放到自己的文件来替代存储到 ibdata1。可以看看这个[文档][6]。

### 什么引起 ibdata1 增长迅速？ ###

当 MySQL 出现问题通常我们需要执行的第一个命令是：

    SHOW ENGINE INNODB STATUS/G

这将展示给我们一些很有价值的信息。我们从** TRANSACTION（事务）**部分开始检查，然后我们会发现这个：

    ---TRANSACTION 36E, ACTIVE 1256288 sec
    MySQL thread id 42, OS thread handle 0x7f8baaccc700, query id 7900290 localhost root
    show engine innodb status
    Trx read view will not see trx with id >= 36F, sees < 36F

这是一个最常见的原因，一个14天前创建的相当老的事务。这个状态是**活动的**，这意味着 InnoDB 已经创建了一个数据的快照，所以需要在**撤销**日志中维护旧页面，以保障数据库的一致性视图，直到事务开始。如果你的数据库有大量的写入任务，那就意味着存储了大量的撤销页。

如果你找不到任何长时间运行的事务，你也可以监控INNODB STATUS 中的其他的变量，“**History list length（历史记录列表长度）**”展示了一些等待清除操作。这种情况下问题经常发生，因为清除线程（或者老版本的主线程）不能像这些记录进来的速度一样快地处理撤销。

### 我怎么检查什么被存储到了 ibdata1 里了？ ###

很不幸，MySQL 不提供查看什么被存储到 ibdata1 共享表空间的信息，但是有两个工具将会很有帮助。第一个是马克·卡拉汉制作的一个修改版 innochecksum ，它发布在[这个漏洞报告][7]里。

它相当易于使用：

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

全部的 20608 中有 19272 个撤销日志页。**这占用了表空间的 93%**。

第二个检查表空间内容的方式是杰里米·科尔制作的 [InnoDB Ruby 工具][8]。它是个检查 InnoDB 的内部结构的更先进的工具。例如我们可以使用 space-summary 参数来得到每个页面及其数据类型的列表。我们可以使用标准的 Unix 工具来统计**撤销日志**页的数量：

    # innodb_space -f /var/lib/mysql/ibdata1 space-summary | grep UNDO_LOG | wc -l
    19272

尽管这种特殊的情况下，innochedcksum 更快更容易使用，但是我推荐你使用杰里米的工具去了解更多的 InnoDB 内部的数据分布及其内部结构。

好，现在我们知道问题所在了。下一个问题：

### 我该怎么解决问题？ ###

这个问题的答案很简单。如果你还能提交语句，就做吧。如果不能的话，你必须要杀掉线程开始回滚过程。那将停止 ibdata1 的增长，但是很显然，你的软件会出现漏洞，有些人会遇到错误。现在你知道如何去鉴定问题所在，你需要使用你自己的调试工具或普通的查询日志来找出谁或者什么引起的问题。

如果问题发生在清除线程，解决方法通常是升级到新版本，新版中使用一个独立的清除线程替代主线程。更多信息查看该[文档][9]

### 有什么方法回收已使用的空间么？ ###

没有，目前还没有一个容易并且快速的方法。InnoDB 表空间从不收缩...参见[10 年之久的漏洞报告][10]，最新更新自詹姆斯·戴（谢谢）：

当你删除一些行，这个页被标为已删除稍后重用，但是这个空间从不会被回收。唯一的方法是使用新的 ibdata1 启动数据库。要做这个你应该需要使用 mysqldump 做一个逻辑全备份，然后停止 MySQL 并删除所有数据库、ib_logfile\*、ibdata1\* 文件。当你再启动 MySQL 的时候将会创建一个新的共享表空间。然后恢复逻辑备份。

### 总结 ###

当 ibdata1 文件增长太快，通常是 MySQL 里长时间运行的被遗忘的事务引起的。尝试去解决问题越快越好（提交或者杀死事务），因为不经过痛苦缓慢的 mysqldump 过程，你就不能回收浪费的磁盘空间。

也是非常推荐监控数据库以避免这些问题。我们的 [MySQL 监控插件][11]包括一个 Nagios 脚本，如果发现了一个太老的运行事务它可以提醒你。

--------------------------------------------------------------------------------

via: https://www.percona.com/blog/2013/08/20/why-is-the-ibdata1-file-continuously-growing-in-mysql/

作者：[Miguel Angel Nieto][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[wxy](https://github.com/wxy)

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
