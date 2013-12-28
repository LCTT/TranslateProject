[bazz2 咩哈哈哈哈哈]
15 Basic MySQL Interview Questions for Database Administrators
================================================================================
Prior to This Article, three articles has already been published in ‘[Linux Interview][1]‘ Section and all of them were highly appreciated by our notable readers, however we were receiving feedback to make this interactive learning process, section-wise. From idea to action, we are providing you **15 MySQL Interview Questions**.

![](http://www.tecmint.com/wp-content/uploads/2013/12/Mysql-Interview-Questions.png)

### 1. How would you check if MySql service is running or not? ###

> **Answer** : Issue the command “**service mysql status**” in ‘Debian’ and “**service mysqld status**” in RedHat. Check the output, and all done.

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

### 2. If the service is running/stop how would you stop/start the service? ###

> **Answer** : To start MySql service use command as **service mysqld start** and to stop use **service mysqld stop**.

    root@localhost:/home/avi# service mysql stop

    Stopping MySQL database server: mysqld.

    root@localhost:/home/avi# service mysql start

    Starting MySQL database server: mysqld.

    Checking for corrupt, not cleanly closed and upgrade needing tables..

### 3. How will you login to MySQL from Linux Shell? ###

> **Answer** : To connect or login to MySQL service, use command: **mysql -u root -p**.

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

### 4. How will you obtain list of all the databases? ###

> **Answer** : To list all currently running databases run the command on mysql shell as: **show databases**;

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

### 5. How will you switch to a database, and start working on that? ###

> **Answer** : To use or switch to a specific database run the command on mysql shell as: **use database_name**;

    mysql> use cloud; 
    Reading table information for completion of table and column names 
    You can turn off this feature to get a quicker startup with -A 

    Database changed 
    mysql>

### 6. How will you get the list of all the tables, in a database? ###

> **Answer** : To list all the tables of a database use the command on mysql shell as: **show tables**;

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

### 7. How will you get the Field Name and Type of a MySql table? ###

> **Answer** : To get the Field Name and Type of a table use the command on mysql shell as: **describe table_name**;

    mysql> describe oc_users; 
    +----------+--------------+------+-----+---------+-------+ 
    | Field    | Type         | Null | Key | Default | Extra | 
    +----------+--------------+------+-----+---------+-------+ 
    | uid      | varchar(64)  | NO   | PRI |         |       | 
    | password | varchar(255) | NO   |     |         |       | 
    +----------+--------------+------+-----+---------+-------+ 
    2 rows in set (0.00 sec)

### 8. How will you delete a table? ###

> **Answer** : To delte a specific table use the command on mysql shell as: **drop table table_name**;

    mysql> drop table lookup; 

    Query OK, 0 rows affected (0.00 sec)

### 9. What about database? How will you delete a database? ###

> **Answer** : To delte a specific database use the command on mysql shell as: **drop database database-name**;

    mysql> drop database a1; 

    Query OK, 11 rows affected (0.07 sec)

### 10. How will you see all the contents of a table? ###

> **Answer** : To view all the contents of a particular table use the command on mysql shell as: **select * from table_name**;

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

### 11. How will you see all the data in a field (say, uid), from table (say, oc_users)? ###

> **Answer** : To view all the data in a field use the command on mysql shell as: **select uid from oc_users**;

    mysql> select uid from oc_users; 
    +-----+ 
    | uid | 
    +-----+ 
    | avi | 
    +-----+ 
    1 row in set (0.03 sec)

### 12. Say you have a table ‘xyz’, which contains several fields including ‘create_time’ and ‘engine’. The field ‘engine’ is populated with two types of data ‘Memory’ and ‘MyIsam’. How will you get only ‘create_time’ and ‘engine’ from the table where engine is ‘MyIsam’? ###

> **Answer** : Use the command on mysql shell as: **select create_time, engine from xyz where engine=”MyIsam”**;

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

### 13. How will you show all the records from table ‘xrt’ where name is ‘tecmint’ and web_address is ‘tecmint.com’? ###

> **Answer** : Use the command on mysql shell as: **select * from xrt where name = “tecmint” and web_address = “tecmint.com”**;

    mysql> select  * from xrt where name = "tecmint" and web_address = “tecmint.com”;
    +---------------+---------------------+---------------+ 
    | Id                  | name                   | web_address | 
    +---------------+---------------------+----------------+ 
    | 13                 |  tecmint               | tecmint.com  |
    +---------------+---------------------+----------------+ 
    | 41                 |  tecmint               | tecmint.com  |
    +---------------+---------------------+----------------+

### 14. How will you show all the records from table ‘xrt’ where name is not ‘tecmint’ and web_address is ‘tecmint.com’? ###

> **Answer** : Use the command on mysql shell as: **select * from xrt where name != “tecmint” and web_address = “tecmint.com”**;

    mysql> select * from xrt where name != ”tecmint” and web_address = ”tecmint.com”;

    +---------------+---------------------+---------------+ 
    | Id            | name                | web_address   | 
    +---------------+---------------------+----------------+ 
    | 1173          |  tecmint            | tecmint.com   |
    +---------------+---------------------+----------------+

### 15. You need to know total number of row entry in a table. How will you achieve it? ###

> **Answer** : Use the command on mysql shell as: **select count(*) from table_name**;

    mysql> select count(*) from Tables; 

    +----------+ 
    | count(*) | 
    +----------+ 
    |      282 | 
    +----------+ 
    1 row in set (0.01 sec)

That’s all for now. How you feel about this ‘**Linux Interview Question**‘ section. Don’t forget to provide us with your valuable feedback in our comment section.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/basic-mysql-interview-questions-for-database-administrators/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/category/interview-questions/