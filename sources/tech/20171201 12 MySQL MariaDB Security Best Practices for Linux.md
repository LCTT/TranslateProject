translating by zrszrszr 
12 MySQL/MariaDB Security Best Practices for Linux
============================================================

MySQL is the world’s most popular open source database system and MariaDB (a fork of MySQL) is the world’s fastest growing open source database system. After installing MySQL server, it is insecure in it’s default configuration, and securing it is one of the essential tasks in general database management.

This will contribute to hardening and boosting of overall Linux server security, as attackers always scan vulnerabilities in any part of a system, and databases have in the past been key target areas. A common example is the brute-forcing of the root password for the MySQL database.

In this guide, we will explain useful MySQL/MariaDB security best practice for Linux.

### 1\. Secure MySQL Installation

This is the first recommended step after installing MySQL server, towards securing the database server. This script facilitates in improving the security of your MySQL server by asking you to:

*   set a password for the root account, if you didn’t set it during installation.

*   disable remote root user login by removing root accounts that are accessible from outside the local host.

*   remove anonymous-user accounts and test database which by default can be accessed by all users, even anonymous users.

```
# mysql_secure_installation
```

After running it, set the root password and answer the series of questions by entering [Yes/Y] and press [Enter].

 [![Secure MySQL Installation](https://www.tecmint.com/wp-content/uploads/2017/12/Secure-MySQL-Installation.png)][2] 

Secure MySQL Installation

### 2\. Bind Database Server To Loopback Address

This configuration will restrict access from remote machines, it tells the MySQL server to only accept connections from within the localhost. You can set it in main configuration file.

```
# vi /etc/my.cnf	                   [RHEL/CentOS]	
# vi /etc/mysql/my.conf                    [Debian/Ubuntu] 
OR
# vi /etc/mysql/mysql.conf.d/mysqld.cnf    [Debian/Ubuntu] 
```

Add the following line below under `[mysqld]` section.

```
bind-address = 127.0.0.1
```

### 3\. Disable LOCAL INFILE in MySQL

As part of security hardening, you need to disable local_infile to prevent access to the underlying filesystem from within MySQL using the following directive under `[mysqld]` section.

```
local-infile=0
```

### 4\. Change MYSQL Default Port

The Port variable sets the MySQL port number that will be used to listen on TCP/ IP connections. The default port number is 3306 but you can change it under the [mysqld] section as shown.

```
Port=5000
```

### 5\. Enable MySQL Logging

Logs are one of the best ways to understand what happens on a server, in case of any attacks, you can easily see any intrusion-related activities from log files. You can enable MySQL logging by adding the following variable under the `[mysqld]` section.

```
log=/var/log/mysql.log
```

### 6\. Set Appropriate Permission on MySQL Files

Ensure that you have appropriate permissions set for all mysql server files and data directories. The /etc/my.conf file should only be writeable to root. This blocks other users from changing database server configurations.

```
# chmod 644 /etc/my.cnf
```

### 7\. Delete MySQL Shell History

All commands you execute on MySQL shell are stored by the mysql client in a history file: ~/.mysql_history. This can be dangerous, because for any user accounts that you will create, all usernames and passwords typed on the shell will recorded in the history file.

```
# cat /dev/null > ~/.mysql_history
```

### 8\. Don’t Run MySQL Commands from Commandline

As you already know, all commands you type on the terminal are stored in a history file, depending on the shell you are using (for example ~/.bash_history for bash). An attacker who manages to gain access to this history file can easily see any passwords recorded there.

It is strongly not recommended to type passwords on the command line, something like this:

```
# mysql -u root -ppassword_
```
 [![Connect MySQL with Password](https://www.tecmint.com/wp-content/uploads/2017/12/Connect-MySQL-with-Password.png)][3] 

Connect MySQL with Password

When you check the last section of the command history file, you will see the password typed above.

```
# history 
```
 [![Check Command History](https://www.tecmint.com/wp-content/uploads/2017/12/Check-Command-History.png)][4] 

Check Command History

The appropriate way to connect MySQL is.

```
# mysql -u root -p
Enter password:
```

### 9\. Define Application-Specific Database Users

For each application running on the server, only give access to a user who is in charge of a database for a given application. For example, if you have a wordpress site, create a specific user for the wordpress site database as follows.

```
# mysql -u root -p
MariaDB [(none)]> CREATE DATABASE osclass_db;
MariaDB [(none)]> CREATE USER 'osclassdmin'@'localhost' IDENTIFIED BY 'osclass@dmin%!2';
MariaDB [(none)]> GRANT ALL PRIVILEGES ON osclass_db.* TO 'osclassdmin'@'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;
MariaDB [(none)]> exit
```

and remember to always remove user accounts that are no longer managing any application database on the server.

### 10\. Use Additional Security Plugins and Libraries

MySQL includes a number of security plugins for: authenticating attempts by clients to connect to mysql server, password-validation and securing storage for sensitive information, which are all available in the free version.

You can find more here: [https://dev.mysql.com/doc/refman/5.7/en/security-plugins.html][5]

### 11\. Change MySQL Passwords Regularly

This is a common piece of information/application/system security advice. How often you do this will entirely depend on your internal security policy. However, it can prevent “snoopers” who might have been tracking your activity over an long period of time, from gaining access to your mysql server.

```
MariaDB [(none)]> USE mysql;
MariaDB [(none)]> UPDATE user SET password=PASSWORD('YourPasswordHere') WHERE User='root' AND Host = 'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;
```

### 12\. Update MySQL Server Package Regularly

It is highly recommended to upgrade mysql/mariadb packages regularly to keep up with security updates and bug fixes, from the vendor’s repository. Normally packages in default operating system repositories are outdated.

```
# yum update
# apt update
```

After making any changes to the mysql/mariadb server, always restart the service.

```
# systemctl restart mariadb		#RHEL/CentOS
# systemctl restart mysql		#Debian/Ubuntu
```

Read Also: [15 Useful MySQL/MariaDB Performance Tuning and Optimization Tips][6]

That’s all! We love to hear from you via the comment form below. Do share with us any MySQL/MariaDB security tips missing in the above list.

--------------------------------------------------------------------------------

via: https://www.tecmint.com/mysql-mariadb-security-best-practices-for-linux/

作者：[ Aaron Kili  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/learn-mysql-mariadb-for-beginners/
[2]:https://www.tecmint.com/wp-content/uploads/2017/12/Secure-MySQL-Installation.png
[3]:https://www.tecmint.com/wp-content/uploads/2017/12/Connect-MySQL-with-Password.png
[4]:https://www.tecmint.com/wp-content/uploads/2017/12/Check-Command-History.png
[5]:https://dev.mysql.com/doc/refman/5.7/en/security-plugins.html
[6]:https://www.tecmint.com/mysql-mariadb-performance-tuning-and-optimization/
[7]:https://www.tecmint.com/author/aaronkili/
[8]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[9]:https://www.tecmint.com/free-linux-shell-scripting-books/
