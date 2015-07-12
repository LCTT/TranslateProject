为什么mysql里的ibdata1文件不断的增长？
================================================================================
![ibdata1 file](https://www.percona.com/blog/wp-content/uploads/2013/08/ibdata1-file.jpg)

我们在[Percona支持][1]经常收到关于MySQL的ibdata1文件的这个问题。

当监控服务器发送一个关于MySQL服务器存储的报警恐慌就开始了 - 就是说磁盘快要满了。

一番调查后你意识到大多数地盘空间被InnDB的共享表空间ibdata1使用。你已经启用了[innodb_file_per_table][2]，所以问题是：

### ibdata1存了什么？ ###

当你启用了innodb_file_per_table，表被存储在他们自己的表空间里，但是共享表空间仍然在存储其他InnoDB的内部数据：

- 数据字典也就是InnoDB表的元数据
- 交换缓冲区
- 双写缓冲区
- 撤销日志

在[Percona服务器][3]上有一些是可以被配置来避免增长过大的。例如你可以通过[innodb_ibuf_max_size][4]设置最大交换缓冲区或设置[innodb_doublewrite_file][5]存储双写缓冲区到一个分离的文件。

MySQL 5.6版中你也可以创建额外的撤销表空间所以他们将会有他们自己的文件来替代存储到ibdata1。照着[文档链接][6]检查。

### 什么引起ibdata1增长迅速？ ###

当MySQL出现问题通常我们需要执行的第一个命令是：

    SHOW ENGINE INNODB STATUSG（这里我觉得应该是STATUS/G）

这将展示给我们一些很有价值的信息。我们开始检查**事务**部分，然后我们会发现这个：

    ---TRANSACTION 36E, ACTIVE 1256288 sec
    MySQL thread id 42, OS thread handle 0x7f8baaccc700, query id 7900290 localhost root
    show engine innodb status
    Trx read view will not see trx with id >= 36F, sees < 36F

这是一个最常见的原因，一个14天前创建的相当老的老事务。这个状态是**活动的**，这意味着InnoDB已经创建了一个快照数据，所以需要在**撤销**日志中维护旧页面，以保障数据库的一致性视图，直到事务开始。如果你的数据库是写负载大，那就意味着大量的撤销页已经被存储了。

如果你找不到任何长时间运行的事务，你也可以监控INNODB状态中的其他的变量，“**历史记录列表长度**”展示了一些等待清除操作。这种情况下问题经常发生，因为清除线程（或者老版本的主线程）不能以这些记录进来的速度处理撤销。

### 我怎么检查什么被存储到了ibdata1里了？ ###

很不幸MySQL不提供什么被存储到ibdata1共享表空间的信息但是有两个工具将会很有帮助。第一个是马克·卡拉汉制作的一个修订版本的innochecksum并且发布在[这个漏洞报告][7]。

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

全部的20608中有19272个撤销日志页。**这是表空间的93%**。

第二个检查表空间内容的方式是杰里米科尔制作的[InnoDB Ruby工具][8]。它是个更先进的工具来检查InnoDB的内部结构。例如我们可以使用space-summary参数来得到每个页面及其数据类型的列表。我们可以使用标准的Unix工具**撤销日志**页的数量：

    # innodb_space -f /var/lib/mysql/ibdata1 space-summary | grep UNDO_LOG | wc -l
    19272

尽管这种特殊的情况innochedcksum更快更容易使用，我推荐你使用杰里米的工具去学习更多的InnoDB内部数据分布和内部结构。

好，现在我们知道问题所在。下一个问题：

### 我能怎么解决问题？ ###

这个问题的答案很简单。如果你还能提交语句，就做吧。如果不能你必须要杀掉进程开始回滚进程。那将停止ibdata1的增长但是很清楚你的软件有一个漏洞或者出了一些错误。现在你知道如何去鉴定问题所在，你需要使用你自己的调试工具或普通语句日志找出谁或者什么引起的问题。

如果问题发生在清除线程，解决方法通常是升级到新版本，新版中使用一个独立的清除线程替代主线程。更多信息查看[文档链接][9]

### 有什么方法恢复已使用的空间么？ ###

没有，目前不可能有一个容易并且快速的方法。InnoDB表空间从不收缩...见[10年老漏洞报告][10]最新更新自詹姆斯（谢谢）：

当你删除一些行，这个页被标为已删除稍后重用，但是这个空间从不会被恢复。只有一种方式来启动数据库使用新的ibdata1。做这个你应该需要使用mysqldump做一个逻辑全备份。然后停止MySQL并删除所有数据库、ib_logfile*、ibdata1*文件。当你再启动MySQL的时候将会创建一个新的共享表空间。然后恢复逻辑仓库。

### 总结 ###

当ibdata1文件增长太快，通常是MySQL里长时间运行的被遗忘的事务引起的。尝试去解决问题越快越好（提交或者杀死事务）因为没有痛苦缓慢的mysqldump执行你不能恢复浪费的磁盘空间。

监控数据库避免这些问题也是非常推荐的。我们的[MySQL监控插件][11]包括一个Nagios脚本，如果发现了一个太老的运行事务它可以提醒你。

--------------------------------------------------------------------------------

via: https://www.percona.com/blog/2013/08/20/why-is-the-ibdata1-file-continuously-growing-in-mysql/

作者：[Miguel Angel Nieto][a]
译者：[wyangsun](https://github.com/wyangsun)
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
