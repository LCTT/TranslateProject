translating by lujun9972
MariaDB administration commands for beginners
======
Earlier we have learned to [**install & secure MariaDB server on Centos/RHEL 7**][1], which is now the default database of RHEL/CentOS 7 onwards.We will now discuss some useful MariaDB administration commands. These are some very basic commands that will get you started with using MariaDB & these can also be used with MySQL, since Mariadb is forked out version of MySQL only.

**(Recommended Read:[MongoDB installation & configuration on RHEL/CentOS][2])**

## MariaDB Administration Commands

### Checking version of your MariaDB installation

To check the current version of your DB installation, type following command in your terminal

```
$ mysql -version
```

This command provide you with the current version of DB. Alternatively you can also run below mentioned command for detailed view on version,

```
$ mysqladmin -u root -p version
```

### Logging into mariadb

To log into the mariadb server, run

```
$ mysql -u root -p
```

& then enter password to login to the session.

### Showing all database

To show all the databases that your maridb currently has, run

```
$ show databases;
```

after you are logged into mariadb.

### Creating new databases

To create a new database in mariadb, run

```
$ create database dan;
```

when logged into mariabdb. To create a database directly from terminal, run

```
$ mysqladmin -u user -p create dan
```

Here, **dan** is the name of the new database.

### Deleting a database

To delete a database, run

```
$ drop database dan;
```

from the logged in session of mariadb. Alternatively you can also use,

```
$ mysqladmin -u root -p drop dan
```

**Note:-** If you are getting an  'access denied' error while running the mysqladmin commands, that might be because we have not given rights to root. To do so, run the command mentioned in point 7, replacing name of the user with root.

### Creating new user

To create a new user for database, run

```
$ CREATE USER 'dan'@'localhost' IDENTIFIED BY 'password';
```

### Granting access to user for a database

For providing access to user for a single database, run

```
$ GRANT ALL PRIVILEGES ON test.* to 'dan'@'localhost';
```

This will provide user dan complete access over database named test. We can also grant SELECT, INSERT , DELETE permissions to user.

To provide access to all database, replace test with * i.e.

```
$ GRANT ALL PRIVILEGES ON *.* to 'dan'@'localhost';
```

### Creating backup/dump of database

To create of a single database, run the following command from your terminal window,

```
$ mysqldump -u root -p database_name>db_backup.sql
```

To create backup of multiple databases in single command,

```
$ mysqldump -u root -p - - databases db1 db2 > db12_backup.sql
```

To create dump of all databases in single command,

```
$ mysqldump -u root -p - - all-databases >all_dbs.sql
```

### Restoring database from the dump

To restore database from a dump, run

```
$ mysql -u root -p database_name<db_backup.sql
```

But this command will work only when there is no previous database by the same name. if you want to restore database data to any already created database, we need to use 'mysqlimport ' command,

```
$ mysqlimport -u root -p database_name<db_backup.sql
```

### Changing password for a user in mariadb

We are going to change password of 'root' for this example but you can use the below process to change password of any user,

Login into mariadb& select 'mysql' database ,

```
$ mysql -u root -p
$ use mysql;
```

& then run the following ,

```
$ update user set password=PASSWORD( 'your_new_password_here') where User='root';
```

Next, reload the privileges,

```
$ flush privileges;
```

& then exit the session.

This was our tutorial on some useful MariaDB administration commands. Please do leave your comments or suggestions in the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/mariadb-administration-commands-beginners/

作者：[Shusain ][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/installing-configuring-mariadb-rhelcentos/
[2]:http://linuxtechlab.com/mongodb-installation-configuration-rhelcentos/
