ucasFL translating
MyCLI – A MySQL/MariaDB Client with Auto-completion and Syntax-highlighting
============================================================

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][11] | [4 Free Shell Scripting eBooks][12]

MyCLI is an easy-to-use command line (CLI) interface for the popular database management systems: MySQL, MariaDB, and Percona with auto-completion and syntax highlighting. It is built using prompt_toolkitand requires Python 2.7, 3.3, 3.4, 3.5, and 3.6\. It supports secure connections over SSL to the MySQL server.

#### MyCLI Features

*   When you first start it, a config file is automatically created at ~/.myclirc.

*   Supports auto-completion while typing SQL keywords as well as tables, views and columns in the database.

*   Also supports smart-completion which is enabled by default and will offer suggestions for context-sensitive completion.

For instance:

```
SELECT * FROM <Tab> - this will just show table names. 
SELECT * FROM users WHERE <Tab> - this will simply show column names. 
```

*   Supports syntax highlighting using Pygments.

*   Support for SSL connections.

*   Offers support for multiline queries.

*   It optionally logs every query and its output to a file (note that this is disabled by default).

*   Allows you to save favorite queries (save a query using \fs alias and run it with \f alias).

*   Supports timing of SQL statements and table rendering.

*   Prints tabular data in an appealing way.

### How to Install MyCLI for MySQL and MariaDB in Linux

On Debian/Ubuntu distributions, you can easily install the mycli package using [apt command][6] as follows:

```
$ sudo apt-get update
$ sudo apt-get install mycli
```

Likewise, Fedora 22+ has a package available for mycli, you can install it using [dnf command][7] as below:

```
$ sudo dnf install mycli
```

For other Linux distributions such as RHEL/CentOS, you’ll need Python pip tool to install mycli. Start by installing pip with the commands below:

```
$ sudo yum install pip	
```

Once pip is installed, you can install mycli as follows:

```
$ sudo pip install mycli
```

### How to Use MyCLI for MySQL and MariaDB in Linux

Once mycli installed, you can use it like this:

```
$ mycli -u root -h localhost 
```

#### Auto-completion

Easy completions such as keywords and sql-functions.

![MySQL Auto Completion](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Auto-completion.png)

MySQL Auto Completion

#### Smart-completion

Table name completions after the ‘FROM’ keyword.

![MySQL Smart Completion](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Smart-Completion.png)

MySQL Smart Completion

#### Alias support

A column completions will work even when table names are aliased.

![MySQL Alias Support](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Alias-Support.png)

MySQL Alias Support

#### Syntax-highlighting

Syntax highlighting for MySQL.

![MySQL Syntax Highlighting](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Syntax-Highlighting.png)

MySQL Syntax Highlighting

#### Formatted SQL Output

MySQL Output is automatically piped through [less command][8].

![MySQL Formatted Output](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Pager.png)

MySQL Formatted Output

To login into mysql and select a database at the same time, you may use a similar command as follows.

```
$ mycli local_database
$ mycli -h localhost -u root app_db
$ mycli mysql://amjith@localhost:3306/django_poll
```

For more usage options, type:

```
$ mycli --help
```

MyCLI Homepage: [http://mycli.net/index][9]

Do check out some useful articles for MySQL administration.

1.  [20 MySQL (Mysqladmin) Commands for Database Administration in Linux][1]

2.  [How to Change a Default MySQL/MariaDB Data Directory in Linux][2]

3.  [4 Useful Commandline Tools to Monitor MySQL Performance in Linux][3]

4.  [How to Change Root Password of MySQL or MariaDB in Linux][4]

5.  [MySQL Backup and Restore Commands for Database Administration][5]

That’s all! In this guide, we showed how to install and use mycli with simple commands in Linux. Do share your thought concerning this article via the feedback form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.



---------

via: https://www.tecmint.com/mycli-mysql-client-with-auto-completion-syntax-highlighting/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/mysqladmin-commands-for-database-administration-in-linux/
[2]:https://www.tecmint.com/change-default-mysql-mariadb-data-directory-in-linux/
[3]:https://www.tecmint.com/mysql-performance-monitoring/
[4]:https://www.tecmint.com/change-mysql-mariadb-root-password/
[5]:https://www.tecmint.com/mysql-backup-and-restore-commands-for-database-administration/
[6]:https://www.tecmint.com/apt-advanced-package-command-examples-in-ubuntu/
[7]:https://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/
[8]:https://www.tecmint.com/linux-more-command-and-less-command-examples/
[9]:http://mycli.net/index
[10]:https://www.tecmint.com/author/aaronkili/
[11]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[12]:https://www.tecmint.com/free-linux-shell-scripting-books/
