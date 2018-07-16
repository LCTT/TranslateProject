[小白技巧]如何在Linux上检查MySQL数据表的存储引擎类型
================================================================================
> **提问**: 我想要知道我的MySQL数据库是MyISAM还是Innodb类型。我该如何检查MySQL数据库表的类型？

MySQl主要使用两种存储引擎：**MyISAM 和 Innodb**。MyISAM是非事务的，因此拥有读取更快，然而InnoDB完全支持细颗粒度的事务锁定（比如：commit/rollback）。当你创建一张新的MySQL表时，你要选择它的类型（也就是存储引擎）。如果没有选择，你就会使用与预设置的默认引擎。

如果你想要知道已经存在的MySQL数据表的类型，这里有几种方法达到。

### 方法一 ###

如果你可以访问phpMyAdmin，你可以从phpMyAdmin找出默认的数据库类型。从phpMyAdmin中选中数据库来查看它的表列表。在“Type”一列的下面，你会看到每个表的数据表类型。

![](https://farm4.staticflickr.com/3871/14526575875_c1da3d9c7a_z.jpg)

### 方法二 ###

如果你可以直接登录MySQL服务器，另外一种鉴别存储引擎的方法是登录MySQL服务器后运行下面的MySQL命令：

    mysql> SELECT ENGINE FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'my_database' AND TABLE_NAME = 'my_table';

上面的命令会显示在'my_database'数据库中'my_table'表的引擎类型。

### 方法三 ###

还有一种检查引擎的方法是使用mysqlshow,是一种命令行下的显示数据库信息的工具。mysqlshow在[MySQL 客户端安装包][1]中有。要使用mysqlshow，你需要提供MySQL服务器登录凭据。

下面的命令会显示特定的数据库信息。在“Engine”一列下面，你可以看到每个表使用的引擎。

    $ mysqlshow -u <mysql_user> -p -i <database-name>

![](https://farm4.staticflickr.com/3845/14340200549_8fbe7ea7b5_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-mysql-storage-engine-type-linux.html

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/06/how-to-install-mysql-server-and-client-on-linux.html