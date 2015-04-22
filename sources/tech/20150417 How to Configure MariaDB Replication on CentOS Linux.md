Translating by ictlyh
How to Configure MariaDB Replication on CentOS Linux
================================================================================
Its a process of creating duplicate versions of a the DB. Replication process is not only copies a database, but also synchronizes changes from master to one of the slaves. But this is does not means that slave databases are identical copy of the master, because replication can be configured that only a schema of tables or columns or rows will be replicated, i.e. a partial replication. The replication ensures that those specific configured objects are kept in sync between the different databases.

### Mariadb Replication Concepts ###

**Backups** : Replication can be used for DB backups. For example, you have master -> slave replication. If master is lost (hdd fails, for example) you can restore your db from master.

**Scaling** : You can use master -> slave replication for scaling solution. For example, if you have a few big and have SQL query, using replcation you can separate this queries for each replcations nodes. Write SQL should be performed only on master, for read-only queries slave server can be used.

**Spreading solution** : You can use replication for distribution. For example, you can distribute different sales data to different databases.

**Failover solution** : For example you have, master -> slave(1) -> slave(2) -> slave(3) replication. You can write script for master monitoring , if master fails, script can quickly change slave(1) new for master master -> slave(1) -> slave(2) and your application will continue working whit out downtime

### Simple diagrammatic demonstration of replication ###

![mysql replication principle](http://blog.linoxide.com/wp-content/uploads/2015/04/mysql-replication-principle.png)

Before you start good know what is **binary log** and Ibdata1. The binary log contains a record about all changes in the db, data and structure, as well as how long each statement took to execute. Bin log consists set log files and an index. Its means that main SQL statements such as CREATE, ALTER, INSERT, UPDATE and DELETE will be putted to this log, statements, such as SELECT will not be logged. These info can be logged to general query.log file. In simple **Ibdata1** is a file which contains all tables and all info about db.

### Master server configuration ###

Good to have server updated

    sudo yum install update -y && sudo yum install upgrade -y

We are working on centos 7 server

    sudo cat /etc/redhat-release

    CentOS Linux release 7.0.1406 (Core)

Install MariaDB

    sudo yum install mariadb-server -y

Start MariaDB and enable it to start on boot of the server

    sudo systemctl start mariadb.service
    sudo systemctl enable mariadb.service

Output:

    ln -s '/usr/lib/systemd/system/mariadb.service' '/etc/systemd/system/multi-user.target.wants/mariadb.service'

Check MariaDB status

    sudo service mariadb status

or use

    sudo systemctl is-active mariadb.service

Output:

    Redirecting to /bin/systemctl status  mariadb.service
    mariadb.service - MariaDB database server
    Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled)

Set MariaDB password

    mysql -u root
    mysql> use mysql;
    mysql> update user set password=PASSWORD("SOME_ROOT_PASSWORD") where User='root';
    mysql> flush privileges;
    mysql> exit

SOME_ROOT_PASSWORD - your root password. I my case I'ill use "q" - password, then try to login:

    sudo mysql -u root -pSOME_ROOT_PASSWORD

Output:

    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 5
    Server version: 5.5.41-MariaDB MariaDB Server
    Copyright (c) 2000, 2014, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

Lets create database with table with some data

Create database/schema

    sudo mysql -u root -pSOME_ROOT_PASSWORD
    mysql> create database test_repl;

Where:

    test_repl - Name of shcema which will be replicated

Output:

    Query OK, 1 row affected (0.00 sec)

Create Persons table

    mysql> use test_repl;

    CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
    );

Output:

    mysql> MariaDB [test_repl]> CREATE TABLE Persons (
    -> PersonID int,
    -> LastName varchar(255),
    -> FirstName varchar(255),
    -> Address varchar(255),
    -> City varchar(255)
    -> );
    Query OK, 0 rows affected (0.01 sec)

Insert some data

    mysql> INSERT INTO Persons VALUES (1, "LastName1", "FirstName1", "Address1", "City1");
    mysql> INSERT INTO Persons VALUES (2, "LastName2", "FirstName2", "Address2", "City2");
    mysql> INSERT INTO Persons VALUES (3, "LastName3", "FirstName3", "Address3", "City3");
    mysql> INSERT INTO Persons VALUES (4, "LastName4", "FirstName4", "Address4", "City4");
    mysql> INSERT INTO Persons VALUES (5, "LastName5", "FirstName5", "Address5", "City5");

Output:

    Query OK, 5 row affected (0.00 sec)

Check data

    mysql> select * from Persons;

Output:

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

### Configure MariaDB for replication ###

You'll need to edit the my.cnf file on the Master server to enable binary logging and set the server's id. I will use vi text editor, but use can use any suitable for your such as nano, joe etc.

    sudo vi /etc/my.cnf 

and put to config in [mysqld] section such lines.


    log-basename=master
    log-bin
    binlog-format=row
    server_id=1

Output:

![mariadb config master](http://blog.linoxide.com/wp-content/uploads/2015/04/mariadb-config.png)

Then restart MariaDB:

    sudo service mariadb restart

Login to MariaDB and check binary logs:

sudo mysql -u root -pq test_repl

mysql> SHOW MASTER STATUS;

Output:

    +--------------------+----------+--------------+------------------+
    | File               | Position | Binlog_Do_DB | Binlog_Ignore_DB |
    +--------------------+----------+--------------+------------------+
    | mariadb-bin.000002 |     3913 |              |                  |
    +--------------------+----------+--------------+------------------+

**Remember** : "File" and "Position" values.  YOU WILL NEED THIS VALUE AT SLAVE SERVER

Create user for replication

    mysql> GRANT REPLICATION SLAVE ON *.* TO replication_user IDENTIFIED BY 'bigs3cret' WITH GRANT OPTION;
    mysql> flush privileges;

Output:

    Query OK, 0 rows affected (0.00 sec)
    Query OK, 0 rows affected (0.00 sec)

Check user in db

    mysql> select * from mysql.user WHERE user="replication_user"\G;

Output:

    mysql> select * from mysql.user WHERE user="replication_user"\G;
    *************************** 1. row ***************************
    Host: %
    User: replication_user
    Password: *2AF30E7AEE9BF3AF584FB19653881D2D072FA49C
    Select_priv: N
    .....

Create DB dump (snapshot of all data which will be replicated) form master

    mysqldump -uroot -pSOME_ROOT_PASSWORD  test_repl > full-dump.sql

Where:

    SOME_ROOT_PASSWORD - password for root user that you have setup
    test_repl - name of the data base which will be replicated;

You need to recover mysql dump (full-dump.sql) at slave server. Its needed for replication.

### Slave server configuration ###

All this commands you need to perform at slave server

Lets assume that we have fresh/updated CentOS 7.x server with latest mariaDB server and you can login as root to maria DB server (this was descripbed in first part of the article)

Login to Maria DB console and create DB

    mysql -u root -pSOME_ROOT_PASSWORD;
    mysql> create database test_repl;
    mysql> exit;

Recover data from master at slave server

    mysql -u root -pSOME_ROOT_PASSWORD test_repl < full-dump.sql

Where:

full-dump.sql - its DB Dump that you have create at test server.

Login to Maria DB and setup replication

    mysql>     CHANGE MASTER TO
    MASTER_HOST='82.196.5.39',
    MASTER_USER='replication_user',
    MASTER_PASSWORD='bigs3cret',
    MASTER_PORT=3306,
    MASTER_LOG_FILE='mariadb-bin.000002',
    MASTER_LOG_POS=3913,
    MASTER_CONNECT_RETRY=10;

![mariadb setup replication](http://blog.linoxide.com/wp-content/uploads/2015/04/setup-replication.png)

Where:

    MASTER_HOST - IP of the master server.
    MASTER_USER - replication user at master server
    MASTER_PASSWORD - replication user password
    MASTER_PORT - mysql port at master
    MASTER_LOG_FILE - bin-log file name form master
    MASTER_LOG_POS - bin-log position file at master

Start slave mode

    mysql> slave start;

Output:

    Query OK, 0 rows affected (0.00 sec)

Check slave status

    mysql> show slave status\G;

Output:

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

At this step all shoul be ok, and not erros should be here.

### Test the replication ###

At MAIN/MASTER server add some entities to DB

    mysql -u root -pSOME_ROOT_PASSWORD test_repl

    mysql> INSERT INTO Persons VALUES (6, "LastName6", "FirstName6", "Address6", "City6");
    mysql> INSERT INTO Persons VALUES (7, "LastName7", "FirstName7", "Address7", "City7");
    mysql> INSERT INTO Persons VALUES (8, "LastName8", "FirstName8", "Address8", "City8");

Then go to the SLAVE server and check replicated data

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

You can see the data is replicated to slave server. Its mean that replication is working. Hope you enjoyed the article. Let us know if you have any questions.

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/configure-mariadb-replication-centos-linux/

作者：[Bobbin Zachariah][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/