15个 MySQL 基础面试题，DBA 们准备好了吗？
================================================================================

此前我们已经有发表过Linux 面试基础问答之[一][1]、[二][2]和[三][3]共3篇文章，获得读者的好评，同时我们得到反馈，有些读者希望这种交互式学习方法能够做得更加灵活。心动不如行动，我们这就为您奉上 **15个 MySQL 面试题**

![](http://www.tecmint.com/wp-content/uploads/2013/12/Mysql-Interview-Questions.png)


### 问题1：你如何确定 MySQL 是否处于运行状态？ ###

> **答案**： Debian 上运行命令 **service mysql status**，在RedHat 上运行命令 **service mysqld status**。然后看看输出即可。

-

    root@localhost:/home/avi# service mysql status

    /usr/bin/mysqladmin  Ver 8.42 Distrib 5.1.72, for debian-linux-gnu on i486
    Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Server version 5.1.72-2
    Protocol version 10
    Connection Localhost via UNIX socket
    UNIX socket /var/run/mysqld/mysqld.sock
    Uptime: 1 hour 22 min 49 sec

    Threads: 1  Questions: 112138  Slow queries: 1  Opens: 1485  Flush tables: 1  Open tables: 64  Queries per second avg: 22.567.


### 问题2：如何开启或停止 MySQL 服务？ ###

>  **答案**：运行命令 **service mysqld start** 开启服务；运行命令 **service mysqld stop** 停止服务。

-

    root@localhost:/home/avi# service mysql stop

    Stopping MySQL database server: mysqld.

    root@localhost:/home/avi# service mysql start

    Starting MySQL database server: mysqld.

    Checking for corrupt, not cleanly closed and upgrade needing tables..

### 问题3：如何通过 Shell 登入 MySQL？ ###

>  **答案**：运行命令 **mysql -u root -p**

-

    root@localhost:/home/avi# mysql -u root -p 
    Enter password: 
    Welcome to the MySQL monitor.  Commands end with ; or \g. 
    Your MySQL connection id is 207 
    Server version: 5.1.72-2 (Debian) 

    Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved. 

    Oracle is a registered trademark of Oracle Corporation and/or its 
    affiliates. Other names may be trademarks of their respective 
    owners. 

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement. 

    mysql>

### 问题4：如何列出所有数据库？ ###

>  **答案**：运行命令 **show databases;**

-

    mysql> show databases; 
    +--------------------+ 
    | Database           | 
    +--------------------+ 
    | information_schema | 
    | a1                 | 
    | cloud              | 
    | mysql              | 
    | phpmyadmin         | 
    | playsms            | 
    | sisso              | 
    | test               | 
    | ukolovnik          | 
    | wordpress          | 
    +--------------------+ 
    10 rows in set (0.14 sec)

### 问题5： 如何切换到某个数据库并在上面工作？ ###

>  **答案**：运行命令 **use database_name;** 进入名为 database_name 的数据库。

-

    mysql> use cloud; 
    Reading table information for completion of table and column names 
    You can turn off this feature to get a quicker startup with -A 

    Database changed 
    mysql>

### 问题6：如何列出某个数据库内所有表？ ###

>  **答案**：在当前数据库运行命令 **show tables;**

-

    mysql> show tables; 
    +----------------------------+ 
    | Tables_in_cloud            | 
    +----------------------------+ 
    | oc_appconfig               | 
    | oc_calendar_calendars      | 
    | oc_calendar_objects        | 
    | oc_calendar_repeat         | 
    | oc_calendar_share_calendar | 
    | oc_calendar_share_event    | 
    | oc_contacts_addressbooks   | 
    | oc_contacts_cards          | 
    | oc_fscache                 | 
    | oc_gallery_sharing         | 
    +----------------------------+ 
    10 rows in set (0.00 sec)

### 问题7：如何获取表内所有 Field 对象的名称和类型？ ###

>  **答案**：运行命令 **describe table_name;**

-

    mysql> describe oc_users; 
    +----------+--------------+------+-----+---------+-------+ 
    | Field    | Type         | Null | Key | Default | Extra | 
    +----------+--------------+------+-----+---------+-------+ 
    | uid      | varchar(64)  | NO   | PRI |         |       | 
    | password | varchar(255) | NO   |     |         |       | 
    +----------+--------------+------+-----+---------+-------+ 
    2 rows in set (0.00 sec)

### 问题8：如何删除表？ ###

>  **答案**：运行命令 **drop table table_name;**

-

    mysql> drop table lookup; 

    Query OK, 0 rows affected (0.00 sec)

### 问题9：如何删除数据库？ ###

>  **答案**：运行命令 **drop database database-name;**

-

    mysql> drop database a1; 

    Query OK, 11 rows affected (0.07 sec)

### 问题10：如何查看表内所有数据？ ###

>  **答案**：运行命令 **select * from table_name;**

-

    mysql> select * from engines; 
    +------------+---------+----------------------------------------------------------------+--------------+------+------------+ 
    | ENGINE     | SUPPORT | COMMENT                                                        | TRANSACTIONS | XA   | SAVEPOINTS | 
    +------------+---------+----------------------------------------------------------------+--------------+------+------------+ 
    | InnoDB     | YES     | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        | 
    | MRG_MYISAM | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         | 
    | BLACKHOLE  | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         | 
    | CSV        | YES     | CSV storage engine                                             | NO           | NO   | NO         | 
    | MEMORY     | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         | 
    | FEDERATED  | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       | 
    | ARCHIVE    | YES     | Archive storage engine                                         | NO           | NO   | NO         | 
    | MyISAM     | DEFAULT | Default engine as of MySQL 3.23 with great performance         | NO           | NO   | NO         | 
    +------------+---------+----------------------------------------------------------------+--------------+------+------------+ 
    8 rows in set (0.00 sec)

### 问题11：如何从表（比如 oc_users ）中获取一个 field 对象（比如 uid）的所有数据？ ###

>  **答案**：运行命令 **select uid from oc_users;**

-

    mysql> select uid from oc_users; 
    +-----+ 
    | uid | 
    +-----+ 
    | avi | 
    +-----+ 
    1 row in set (0.03 sec)

### 问题12：假设你有一个名为 ‘xyz’ 的表，它存在多个字段，如 ‘create_time’ 和 ‘engine’。名为 engine 的字段由 ‘Memoty’ 和 ‘MyIsam’ 两种数值组成。如何只列出 ‘create_time’ 和 ‘engine’ 这两列并且 engine 的值为 ‘MyIsam’？ ###

>  **答案**：运行命令 **select create_time, engine from xyz where engine = ”MyIsam”;**

-

    mysql> select create_time, engine from xyz where engine="MyIsam";

    +---------------------+--------+ 
    | create_time         | engine | 
    +---------------------+--------+ 
    | 2013-12-15 13:43:27 | MyISAM | 
    | 2013-12-15 13:43:27 | MyISAM | 
    | 2013-12-15 13:43:27 | MyISAM | 
    | 2013-12-15 13:43:27 | MyISAM | 
    | 2013-12-15 13:43:27 | MyISAM | 
    | 2013-12-15 13:43:27 | MyISAM | 
    | 2013-12-15 13:43:27 | MyISAM | 
    | 2013-12-15 13:43:27 | MyISAM | 
    | 2013-10-23 14:56:38 | MyISAM | 
    | 2013-10-23 14:56:38 | MyISAM | 
    | 2013-10-23 14:56:38 | MyISAM | 
    | 2013-10-23 14:56:38 | MyISAM | 
    | 2013-10-23 14:56:38 | MyISAM | 
    | 2013-10-23 14:56:38 | MyISAM | 
    | 2013-10-23 14:56:38 | MyISAM | 
    +---------------------+--------+ 
    132 rows in set (0.29 sec)

### 问题13：如何列出表 ‘xrt’ 内 name 域值为 ‘tecmint’，web_address 域值为 ‘tecmint.com’ 的所有数据？ ###

>  **答案**：运行命令 **select * from xrt where name = “tecmint” and web_address = “tecmint.com”;**

-

    mysql> select  * from xrt where name = "tecmint" and web_address = “tecmint.com”;
    +---------------+---------------------+---------------+ 
    | Id                  | name                   | web_address | 
    +---------------+---------------------+----------------+ 
    | 13                 |  tecmint               | tecmint.com  |
    +---------------+---------------------+----------------+ 
    | 41                 |  tecmint               | tecmint.com  |
    +---------------+---------------------+----------------+

### 问题14：如何列出表 ‘xrt’ 内 name 域值不为 ‘tecmint’，web_address 域值为 ‘tecmint.com’ 的所有数据？ ###

>  **答案**：运行命令 **select * from xrt where name != "tecmint" and web_address = "tecmint.com";**

-

    mysql> select * from xrt where name != ”tecmint” and web_address = ”tecmint.com”;

    +---------------+---------------------+---------------+ 
    | Id            | name                | web_address   | 
    +---------------+---------------------+----------------+ 
    | 1173          |  tecmint            | tecmint.com   |
    +---------------+---------------------+----------------+

### 问题15：如何知道表内行数？

>  **答案**：运行命令 **select count(*) from table_name;**

-

    mysql> select count(*) from Tables; 

    +----------+ 
    | count(*) | 
    +----------+ 
    |      282 | 
    +----------+ 
    1 row in set (0.01 sec)

以上是文章的全部内容。这篇‘**Linux 面试题**’对您有任何帮助吗？别忘了在下面留言，写出您的宝贵意见。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/basic-mysql-interview-questions-for-database-administrators/

译者：[bazz2](https://github.com/bazz2) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-2315-1.html
[2]:http://linux.cn/article-2370-1.html
[3]:http://linux.cn/article-2371-1.html
