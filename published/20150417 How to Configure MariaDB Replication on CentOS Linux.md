如何在 CentOS Linux 中配置 MariaDB 复制
================================================================================
这是一个创建数据库重复版本的过程。复制过程不仅仅是复制一个数据库，同时也包括从主节点到一个从节点的更改同步。但这并不意味着从数据库就是和主数据库完全相同的副本，因为复制可以配置为只复制表结构、行或者列，这叫做局部复制。复制保证了特定的配置对象在不同的数据库之间保持一致。

### Mariadb 复制概念 ###

**备份** ：复制可以用来进行数据库备份。例如，当你做了主->从复制。如果主节点数据丢失(比如硬盘损坏)，你可以从从节点中恢复你的数据库。

**扩展** ：你可以使用主->从复制作为扩展解决方案。例如，如果你有一些大的数据库以及SQL查询，使用复制你可以将这些查询分离到每个复制节点。写入操作的SQL应该只在主节点进行，而只读查询可以在从节点上进行。

**分发解决方案** ：你可以用复制来进行分发。例如，你可以将不同的销售数据分发到不同的数据库。

**故障解决方案** : 假如你建立有主节点->从节点1->从节点2->从节点3的复制结构。你可以为主节点写脚本监控，如果主节点出故障了，脚本可以快速的将从节点1切换为新的主节点，这样复制结构变成了主节点->从节点1->从节点2，你的应用可以继续工作而不会停机。

### 复制的简单图解示范 ###

![mysql 复制原理](http://blog.linoxide.com/wp-content/uploads/2015/04/mysql-replication-principle.png)

开始之前，你应该知道什么是**二进制日志文件**以及 Ibdata1。

二进制日志文件中包括关于数据库，数据和结构的所有更改的记录，以及每条语句的执行了多长时间。二进制日志文件包括一系列日志文件和一个索引文件。这意味着主要的SQL语句，例如CREATE, ALTER, INSERT, UPDATE 和 DELETE 会放到这个日志文件中；而例如SELECT这样的语句就不会被记录，它们可以被记录到普通的query.log文件中。

而 **Ibdata1** 简单的说据是一个包括所有表和所有数据库信息的文件。

### 主服务器配置 ###

首先升级服务器

    sudo yum install update -y && sudo yum install upgrade -y

我们工作在centos7 服务器上

    sudo cat /etc/redhat-release

    CentOS Linux release 7.0.1406 (Core)

安装 MariaDB

    sudo yum install mariadb-server -y

启动 MariaDB 并启用随服务器启动

    sudo systemctl start mariadb.service
    sudo systemctl enable mariadb.service

输出如下:

    ln -s '/usr/lib/systemd/system/mariadb.service' '/etc/systemd/system/multi-user.target.wants/mariadb.service'

检查 MariaDB 状态

    sudo service mariadb status

或者使用

    sudo systemctl is-active mariadb.service

输出如下:

    Redirecting to /bin/systemctl status  mariadb.service
    mariadb.service - MariaDB database server
    Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled)

设置 MariaDB 密码

    mysql -u root
    mysql> use mysql;
    mysql> update user set password=PASSWORD("SOME_ROOT_PASSWORD") where User='root';
    mysql> flush privileges;
    mysql> exit

这里 SOME_ROOT_PASSWORD 是你的 root 密码。 例如我用"q"作为密码，然后尝试登录：

    sudo mysql -u root -pSOME_ROOT_PASSWORD

输出如下:

    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 5
    Server version: 5.5.41-MariaDB MariaDB Server
    Copyright (c) 2000, 2014, Oracle, MariaDB Corporation Ab and others.

输入 'help;' 或 '\h' 查看帮助信息。 输入 '\c' 清空当前输入语句。

让我们创建包括一些数据的表的数据库

创建数据库/模式

    sudo mysql -u root -pSOME_ROOT_PASSWORD
    mysql> create database test_repl;

其中:

    test_repl - 将要被复制的模式的名字

输出:如下

    Query OK, 1 row affected (0.00 sec)

创建 Persons 表

    mysql> use test_repl;

    CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
    );

输出如下:

    mysql> MariaDB [test_repl]> CREATE TABLE Persons (
    -> PersonID int,
    -> LastName varchar(255),
    -> FirstName varchar(255),
    -> Address varchar(255),
    -> City varchar(255)
    -> );
    Query OK, 0 rows affected (0.01 sec)

插入一些数据

    mysql> INSERT INTO Persons VALUES (1, "LastName1", "FirstName1", "Address1", "City1");
    mysql> INSERT INTO Persons VALUES (2, "LastName2", "FirstName2", "Address2", "City2");
    mysql> INSERT INTO Persons VALUES (3, "LastName3", "FirstName3", "Address3", "City3");
    mysql> INSERT INTO Persons VALUES (4, "LastName4", "FirstName4", "Address4", "City4");
    mysql> INSERT INTO Persons VALUES (5, "LastName5", "FirstName5", "Address5", "City5");

输出如下:

    Query OK, 5 row affected (0.00 sec)

检查数据

    mysql> select * from Persons;

输出如下:

    +----------+-----------+------------+----------+-------+
    | PersonID | LastName  | FirstName  | Address  | City  |
    +----------+-----------+------------+----------+-------+
    |        1 | LastName1 | FirstName1 | Address1 | City1 |
    |        1 | LastName1 | FirstName1 | Address1 | City1 |
    |        2 | LastName2 | FirstName2 | Address2 | City2 |
    |        3 | LastName3 | FirstName3 | Address3 | City3 |
    |        4 | LastName4 | FirstName4 | Address4 | City4 |
    |        5 | LastName5 | FirstName5 | Address5 | City5 |
    +----------+-----------+------------+----------+-------+

### 配置 MariaDB 复制 ###

你需要在主节点服务器上编辑 my.cnf文件来启用二进制日志以及设置服务器id。我会使用vi文本编辑器，但你可以使用任何你喜欢的，例如nano，joe。

    sudo vi /etc/my.cnf 

将下面的一些行写到[mysqld]部分。


    log-basename=master
    log-bin
    binlog-format=row
    server_id=1

输出如下:

![mariadb 配置主节点](http://blog.linoxide.com/wp-content/uploads/2015/04/mariadb-config.png)

然后重启 MariaDB:

    sudo service mariadb restart

登录到 MariaDB 并查看二进制日志文件:

sudo mysql -u root -pq test_repl

mysql> SHOW MASTER STATUS;

输出如下:

    +--------------------+----------+--------------+------------------+
    | File               | Position | Binlog_Do_DB | Binlog_Ignore_DB |
    +--------------------+----------+--------------+------------------+
    | mariadb-bin.000002 |     3913 |              |                  |
    +--------------------+----------+--------------+------------------+

**记住** : "File" 和 "Position" 的值。在从节点中你需要使用这些值

创建用来复制的用户

    mysql> GRANT REPLICATION SLAVE ON *.* TO replication_user IDENTIFIED BY 'bigs3cret' WITH GRANT OPTION;
    mysql> flush privileges;

输出如下:

    Query OK, 0 rows affected (0.00 sec)
    Query OK, 0 rows affected (0.00 sec)

在数据库中检查用户

    mysql> select * from mysql.user WHERE user="replication_user"\G;

输出如下:

    mysql> select * from mysql.user WHERE user="replication_user"\G;
    *************************** 1. row ***************************
    Host: %
    User: replication_user
    Password: *2AF30E7AEE9BF3AF584FB19653881D2D072FA49C
    Select_priv: N
    .....

从主节点创建 DB dump (将要被复制的所有数据的快照)

    mysqldump -uroot -pSOME_ROOT_PASSWORD  test_repl > full-dump.sql

其中:

    SOME_ROOT_PASSWORD - 你设置的root用户的密码
    test_repl - 将要复制的数据库的名称;

你需要在从节点中恢复 mysql dump (full-dump.sql)。重复需要这个。

### 从节点配置 ###

所有这些命令需要在从节点中进行。

假设我们已经更新/升级了包括有最新的MariaDB服务器的 CentOS 7.x，而且你可以用root账号登陆到MariaDB服务器(这在这篇文章的第一部分已经介绍过) 

登录到Maria 数据库控制台并创建数据库

    mysql -u root -pSOME_ROOT_PASSWORD;
    mysql> create database test_repl;
    mysql> exit;

在从节点恢复主节点的数据

    mysql -u root -pSOME_ROOT_PASSWORD test_repl < full-dump.sql

其中:

full-dump.sql - 你在测试服务器中创建的DB Dump。

登录到Maria 数据库并启用复制

    mysql>     CHANGE MASTER TO
    MASTER_HOST='82.196.5.39',
    MASTER_USER='replication_user',
    MASTER_PASSWORD='bigs3cret',
    MASTER_PORT=3306,
    MASTER_LOG_FILE='mariadb-bin.000002',
    MASTER_LOG_POS=3913,
    MASTER_CONNECT_RETRY=10;

![mariadb 启用复制](http://blog.linoxide.com/wp-content/uploads/2015/04/setup-replication.png)

其中:

    MASTER_HOST - 主节点服务器的IP
    MASTER_USER - 主节点服务器中的复制用户
    MASTER_PASSWORD - 复制用户密码
    MASTER_PORT - 主节点中的mysql端口
    MASTER_LOG_FILE - 主节点中的二进制日志文件名称
    MASTER_LOG_POS - 主节点中的二进制日志文件位置

开启从节点模式

    mysql> slave start;

输出如下:

    Query OK, 0 rows affected (0.00 sec)

检查从节点状态

    mysql> show slave status\G;

输出如下:

    *************************** 1. row ***************************
    Slave_IO_State: Waiting for master to send event
    Master_Host: 82.196.5.39
    Master_User: replication_user
    Master_Port: 3306
    Connect_Retry: 10
    Master_Log_File: mariadb-bin.000002
    Read_Master_Log_Pos: 4175
    Relay_Log_File: mariadb-relay-bin.000002
    Relay_Log_Pos: 793
    Relay_Master_Log_File: mariadb-bin.000002
    Slave_IO_Running: Yes
    Slave_SQL_Running: Yes
    Replicate_Do_DB:
    Replicate_Ignore_DB:
    Replicate_Do_Table:
    Replicate_Ignore_Table:
    Replicate_Wild_Do_Table:
    Replicate_Wild_Ignore_Table:
    Last_Errno: 0
    Last_Error:
    Skip_Counter: 0
    Exec_Master_Log_Pos: 4175
    Relay_Log_Space: 1089
    Until_Condition: None
    Until_Log_File:
    Until_Log_Pos: 0
    Master_SSL_Allowed: No
    Master_SSL_CA_File:
    Master_SSL_CA_Path:
    Master_SSL_Cert:
    Master_SSL_Cipher:
    Master_SSL_Key:
    Seconds_Behind_Master: 0
    Master_SSL_Verify_Server_Cert: No
    Last_IO_Errno: 0
    Last_IO_Error:
    Last_SQL_Errno: 0
    Last_SQL_Error:
    Replicate_Ignore_Server_Ids:
    Master_Server_Id: 1
    1 row in set (0.00 sec)

到这里所有步骤都应该没问题，也不应该出现错误。

### 测试复制 ###

在主节点服务器中添加一些条目到数据库

    mysql -u root -pSOME_ROOT_PASSWORD test_repl

    mysql> INSERT INTO Persons VALUES (6, "LastName6", "FirstName6", "Address6", "City6");
    mysql> INSERT INTO Persons VALUES (7, "LastName7", "FirstName7", "Address7", "City7");
    mysql> INSERT INTO Persons VALUES (8, "LastName8", "FirstName8", "Address8", "City8");

到从节点服务器中查看复制数据

    mysql -u root -pSOME_ROOT_PASSWORD test_repl

    mysql> select * from Persons;

    +----------+-----------+------------+----------+-------+
    | PersonID | LastName  | FirstName  | Address  | City  |
    +----------+-----------+------------+----------+-------+
    ...................
    |        6 | LastName6 | FirstName6 | Address6 | City6 |
    |        7 | LastName7 | FirstName7 | Address7 | City7 |
    |        8 | LastName8 | FirstName8 | Address8 | City8 |
    +----------+-----------+------------+----------+-------+

你可以看到数据已经被复制到从节点。这意味着复制能正常工作。希望你能喜欢这篇文章。如果你有任何问题请告诉我们。

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/configure-mariadb-replication-centos-linux/

作者：[Bobbin Zachariah][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/