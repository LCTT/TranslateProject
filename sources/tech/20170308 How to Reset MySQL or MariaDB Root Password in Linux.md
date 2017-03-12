How to Reset MySQL or MariaDB Root Password in Linux
============================================================

If you are setting up a MySQL or MariaDB database server for the first time, chances are you will be running mysql_secure_installation soon afterwards to implement basic security settings.

One of these settings is the password for the database root account – which you must keep private and use only when strictly required. If you forget the password or need to reset it (for example, when a database administrator changes roles – or is laid off!).

**Suggested Read:** [Change MySQL or MariaDB Root Password][1]

This article will come in handy. We will explain how to reset or recover forgottent MySQL or MariaDB root password in Linux.

Although we will use a MariaDB server in this article, the instructions should work for MySQL as well.

### Recover MySQL or MariaDB root Password

To begin, stop the database service and check the service status, we should see the environment variable we set previously:

```
------------- SystemD ------------- 
# systemctl stop mariadb
------------- SysVinit -------------
# /etc/init.d/mysqld stop
```

Next, start the service with `--skip-grant-tables`:

```
------------- SystemD ------------- 
# systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
# systemctl start mariadb
# systemctl status mariadb
------------- SysVinit -------------
# mysqld_safe --skip-grant-tables &
```
[
 ![Start MySQL/MariaDB with Skip Tables](http://www.tecmint.com/wp-content/uploads/2017/03/Start-MySQL-with-Skip-Tables.png) 
][2]

Start MySQL/MariaDB with Skip Tables

This will allow you to connect to the database server as root without a password (you may need to switch to a different terminal to do so):

```
# mysql -u root
```

From then on, follow the steps outlined below.

```
MariaDB [(none)]> USE mysql;
MariaDB [(none)]> UPDATE user SET password=PASSWORD('YourNewPasswordHere') WHERE User='root' AND Host = 'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;
```

Finally, stop the service, unset the environment variable and start the service once again:

```
------------- SystemD ------------- 
# systemctl stop mariadb
# systemctl unset-environment MYSQLD_OPTS
# systemctl start mariadb
------------- SysVinit -------------
# /etc/init.d/mysql stop
# /etc/init.d/mysql start
```

This will cause the previous changes to take effect, allowing you to connect to the database server using the new password.

##### Summary

In this article we have discussed how to reset the MariaDB / MySQL root password. As always, feel free to use the comment form below to drop us a note if you have any questions or feedback. We look forward to hearing from you!

SHARE[+][3][0][4][6][5][12][6][
 ![Ask Anything](http://www.tecmint.com/wp-content/themes/tecmint/images/help.png) 
][7]</article>

### If You Appreciate

--------------------------------------------------------------------------------

作者简介：

Gabriel Cánepa is a GNU/Linux sysadmin and web developer from Villa Mercedes, San Luis, Argentina. He works for a worldwide leading consumer product company and takes great pleasure in using FOSS tools to increase productivity in all areas of his daily work.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/reset-mysql-or-mariadb-root-password/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/change-mysql-mariadb-root-password/
[2]:http://www.tecmint.com/wp-content/uploads/2017/03/Start-MySQL-with-Skip-Tables.png
[3]:http://www.tecmint.com/reset-mysql-or-mariadb-root-password/#
[4]:http://www.tecmint.com/reset-mysql-or-mariadb-root-password/#
[5]:http://www.tecmint.com/reset-mysql-or-mariadb-root-password/#
[6]:http://www.tecmint.com/reset-mysql-or-mariadb-root-password/#
[7]:http://www.tecmint.com/reset-mysql-or-mariadb-root-password/#comments
[8]:http://www.tecmint.com/author/gacanepa/
[9]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[10]:http://www.tecmint.com/free-linux-shell-scripting-books/
