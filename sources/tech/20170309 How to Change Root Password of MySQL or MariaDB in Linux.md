How to Change Root Password of MySQL or MariaDB in Linux
============================================================


If you’re [installing MySQL or MariaDB in Linux][1] for the first time, chances are you will be executing mysql_secure_installation script to secure your MySQL installation with basic settings.

One of these settings is, database root password – which you must keep secret and use only when it is required. If you need to change it (for example, when a database administrator changes roles – or is laid off!).

**Suggested Read:** [Recover MySQL or MariaDB Root Password in Linux][2]

This article will come in handy. We will explain how to change a root password of MySQL or MariaDB database server in Linux.

Although we will use a MariaDB server in this article, the instructions should work for MySQL as well.

### Change MySQL or MariaDB Root Password

You know the root password and want to reset it, in this case, let’s make sure MariaDB is running:

```
------------- CentOS/RHEL 7 and Fedora 22+ ------------- 
# systemctl is-active mariadb
------------- CentOS/RHEL 6 and Fedora -------------
# /etc/init.d/mysqld status
```
[
 ![Check MySQL Status](http://www.tecmint.com/wp-content/uploads/2017/03/Check-MySQL-Status.png) 
][3]

Check MySQL Status

If the above command does not return the word `active` as output or its stopped, you will need to start the database service before proceeding:

```
------------- CentOS/RHEL 7 and Fedora 22+ ------------- 
# systemctl start mariadb
------------- CentOS/RHEL 6 and Fedora -------------
# /etc/init.d/mysqld start
```

Next, we will login to the database server as root:

```
# mysql -u root -p
```

For compatibility across versions, we will use the following statement to update the user table in the mysql database. Note that you need to replace `YourPasswordHere` with the new password you have chosen for root.

```
MariaDB [(none)]> USE mysql;
MariaDB [(none)]> UPDATE user SET password=PASSWORD('YourPasswordHere') WHERE User='root' AND Host = 'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;
```

To validate, exit your current MariaDB session by typing.

```
MariaDB [(none)]> exit;
```

and then press Enter. You should now be able to connect to the server using the new password.

[
 ![Change MySQL/MariaDB Root Password](http://www.tecmint.com/wp-content/uploads/2017/03/Change-MySQL-Root-Password.png) 
][4]

Change MySQL/MariaDB Root Password

##### Summary

In this article we have explained how to change the MariaDB / MySQL root password – whether you know the current one or not.

As always, feel free to drop us a note if you have any questions or feedback using our comment form below. We look forward to hearing from you!

--------------------------------------------------------------------------------

作者简介：

Gabriel Cánepa is a GNU/Linux sysadmin and web developer from Villa Mercedes, San Luis, Argentina. He works for a worldwide leading consumer product company and takes great pleasure in using FOSS tools to increase productivity in all areas of his daily work.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/change-mysql-mariadb-root-password/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/install-mariadb-in-centos-7/
[2]:http://www.tecmint.com/reset-mysql-or-mariadb-root-password/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-MySQL-Status.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Change-MySQL-Root-Password.png
[5]:http://www.tecmint.com/author/gacanepa/
[6]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[7]:http://www.tecmint.com/free-linux-shell-scripting-books/
