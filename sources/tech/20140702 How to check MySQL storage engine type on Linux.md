How to check MySQL storage engine type on Linux
================================================================================
> **Question**: I need to know whether my MySQL database table is MyISAM or Innodb type. How can I check the type of a MySQL database table? 

There are two major MySQL storage engines used: **MyISAM and Innodb**. MyISAM is non-transactional, and thus can be faster for reads, while InnoDB fully supports transactions (e.g., commit/rollback) with finer-grain locking. When you create a new MySQL table, you choose its type (i.e., storage engine). Without any choice, you will simply use a pre-configured default engine.

If you would like to know the type of an existing MySQL database table, there are a couple of ways to do it.

### Method One ###

If you have access to phpMyAdmin, you can find out the database type from phpMyAdmin. Simply choose your database from phpMyAdmin to see a list of its tables. Under "Type" column, you will see the database type for each table.

![](https://farm4.staticflickr.com/3871/14526575875_c1da3d9c7a_z.jpg)

### Method Two ###

If you can log in to a MySQL server directly, another way to identify the storage engine is to run the following MySQL command inside your MySQL server after logging in.

    mysql> SELECT ENGINE FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'my_database' AND TABLE_NAME = 'my_table';

The above command will show the engine type of a table called 'my_table' in 'my_database' database.

### Method Three ###

Yet another method to check the MySQL engine is to use mysqlshow, a command-line utility which shows database information. The mysqlshow utility comes with [MySQL client package installation][1]. To use mysqlshow, you need to supply MySQL server login credential.

The following command will show information about a particular database. Under "Engine" column, you will see the storage engine for each table.

    $ mysqlshow -u <mysql_user> -p -i <database-name>

![](https://farm4.staticflickr.com/3845/14340200549_8fbe7ea7b5_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-mysql-storage-engine-type-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/06/how-to-install-mysql-server-and-client-on-linux.html