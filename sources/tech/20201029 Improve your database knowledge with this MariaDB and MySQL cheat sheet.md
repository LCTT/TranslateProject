[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Improve your database knowledge with this MariaDB and MySQL cheat sheet)
[#]: via: (https://opensource.com/article/20/10/mariadb-mysql-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Improve your database knowledge with this MariaDB and MySQL cheat sheet
======
Read this article and download our free cheat sheet to get started using
an open source database.
![Cheat Sheet cover image][1]

When you're writing an application or configuring one for a server, eventually, you will need to store persistent information. Sometimes, a configuration file, such as an INI or [YAML][2] file will do. Other times, a custom file format designed in XML or JSON or similar is better.

But sometimes you need something that can validate input, search through information quickly, make connections between related data, and generally handle your users' work adeptly. That's what a database is designed to do, and [MariaDB][3] (a fork of [MySQL][4] by some of its original developers) is a great option. I use MariaDB in this article, but the information applies equally to MySQL.

It's common to interact with a database through programming languages. For this reason, there are [SQL][5] libraries for Java, Python, Lua, PHP, Ruby, C++, and many others. However, before using these libraries, it helps to have an understanding of what's happening with the database engine and why your choice of database is significant. This article introduces MariaDB and the `mysql` command to familiarize you with the basics of how a database handles data.

If you don't have MariaDB yet, follow the instructions in my article about [installing MariaDB on Linux][6]. If you're not on Linux, use the instructions provided on the MariaDB [download page][7].

### Interact with MariaDB

You can interact with MariaDB using the `mysql` command. First, verify that your server is up and running using the `ping` subcommand, entering your MariaDB password when prompted:


```
$ mysqladmin -u root -p ping
Enter password:
mysqld is alive
```

To make exploring SQL easy, open an interactive MariaDB session:


```
$ mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.
Commands end with ; or \g.
[...]
Type 'help;' or '\h' for help.
Type '\c' to clear the current input statement.

MariaDB [(none)]&gt;
```

This places you in a MariaDB subshell, and your prompt is now a MariaDB prompt. Your usual Bash commands don't work here. You must use MariaDB commands. To see a list of MariaDB commands, type `help` (or just `?`). These are administrative commands for your MariaDB shell, so they're useful for customizing your shell, but they aren't part of the SQL language.

### Learn SQL basics

The [Structured Query Language (SQL)][8] is named after what it provides: a method to inquire about the contents of a database in a predictable and consistent syntax in order to receive useful results. SQL reads a lot like an ordinary English sentence, if a little robotic. For instance, if you've signed into a database server and you need to understand what you have to work with, type `SHOW DATABASES;` and press Enter for the results.

SQL commands are terminated with a semicolon. If you forget the semicolon, MariaDB assumes you want to continue your query on the next line, where you can either do so or terminate the query with a semicolon.


```
MariaDB [(NONE)]&gt; SHOW DATABASES;
+--------------------+
| DATABASE           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+
4 ROWS IN SET (0.000 sec)
```

This shows there are four databases present: information_schema, mysql, performance_schema, and test. To issue queries to a database, you must select which database you want MariaDB to use. This is done with the MariaDB command `use`. Once you choose a database, your MariaDB prompt changes to reflect the active database.


```
MariaDB [(NONE)]&gt; USE test;
MariaDB [(test)]&gt;
```

#### Show database tables

Databases contain _tables_, which can be visualized in the same way a spreadsheet is: as a series of rows (called _records_ in a database) and columns. The intersection of a row and a column is called a _field_.

To see the tables available in a database (you can think of them as tabs in a multi-sheet spreadsheet), use the SQL keyword `SHOW` again:


```
MariaDB [(test)]&gt; SHOW TABLES;
empty SET
```

The `test` database doesn't have much to look at, so use the `use` command to switch to the `mysql` database.


```
MariaDB [(test)]&gt; USE mysql;
MariaDB [(mysql)]&gt; SHOW TABLES;

+---------------------------+
| Tables_in_mysql           |
+---------------------------+
| column_stats              |
| columns_priv              |
| db                        |
[...]
| time_zone_transition_type |
| transaction_registry      |
| USER                      |
+---------------------------+
31 ROWS IN SET (0.000 sec)
```

There are a lot more tables in this database! The `mysql` database is the system management database for this MariaDB instance. It contains important data, including an entire user structure to manage database privileges. It's an important database, and you don't always have to interact with it directly, but it's not uncommon to manipulate it in SQL scripts. It's also useful to understand the `mysql` database when you're learning MariaDB because it can help demonstrate some basic SQL commands.

#### Examine a table

The last table listed in this instance's `mysql` database is titled `user`. This table contains data about users permitted to access the database. Right now, there's only a root user, but you can add other users with varying privileges to control whether each user can view, update, or create data. To get an idea of all the attributes a MariaDB user can have, you can view column headers in a table:


```
&gt; SHOW COLUMNS IN USER;
MariaDB [mysql]&gt; SHOW COLUMNS IN USER;
+-------------+---------------+------+-----+----------+
| FIELD       | TYPE          | NULL | KEY | DEFAULT  |
+-------------+---------------+------+-----+----------+
| Host        | CHAR(60)      | NO   | PRI |          |
| USER        | CHAR(80)      | NO   | PRI |          |
| Password    | CHAR(41)      | NO   |     |          |
| Select_priv | enum('N','Y') | NO   |     | N        |
| Insert_priv | enum('N','Y') | NO   |     | N        |
| Update_priv | enum('N','Y') | NO   |     | N        |
| Delete_priv | enum('N','Y') | NO   |     | N        |
| Create_priv | enum('N','Y') | NO   |     | N        |
| Drop_priv   | enum('N','Y') | NO   |     | N        |
[...]
47 ROWS IN SET (0.001 sec)
```

#### Create a new user

Whether you need help from a fellow human to administer a database or you're setting up a database for a computer to use (for example, in a WordPress, Drupal, or Joomla installation), it's common to need an extra user account within MariaDB. You can create a MariaDB user either by adding it to the `user` table in the `mysql` database, or you can use the SQL keyword `CREATE` to prompt MariaDB to do it for you. The latter features some helper functions so that you don't have to generate all the information manually:


```
`> CREATE USER 'tux'@'localhost' IDENTIFIED BY 'really_secure_password';`
```

#### View table fields

You can view fields and values in a database table with the `SELECT` keyword. In this example, you created a user called `tux`, so select the columns in the `user` table:


```
&gt; SELECT USER,host FROM USER;
+------+------------+
| USER | host       |
+------+------------+
| root | localhost  |
[...]
| tux  | localhost  |
+------+------------+
7 ROWS IN SET (0.000 sec)
```

#### Grant privileges to a user

By looking at the column listing on the `user` table, you can explore a user's status. For instance, the new user `tux` doesn't have permission to do anything with the database. Using the `WHERE` statement, you can view only the record for `tux`:


```
&gt; SELECT USER,select_priv,insert_priv,update_priv FROM USER WHERE USER='tux';
+------+-------------+-------------+-------------+
| USER | select_priv | insert_priv | update_priv |
+------+-------------+-------------+-------------+
| tux  | N           | N           | N           |
+------+-------------+-------------+-------------+
```

Use the `GRANT` command to modify user permissions:


```
&gt; GRANT SELECT ON *.* TO 'tux'@'localhost';
&gt; FLUSH PRIVILEGES;
```

Verify your change:


```
&gt; SELECT USER,select_priv,insert_priv,update_priv FROM USER WHERE USER='tux';
+------+-------------+-------------+-------------+
| USER | select_priv | insert_priv | update_priv |
+------+-------------+-------------+-------------+
| tux  | Y           | N           | N           |
+------+-------------+-------------+-------------+
```

User `tux` now has privileges to select records from all tables.

### Create a custom database

So far, you've interacted just with the default databases. Most people rarely interact much with the default databases outside of user management. Usually, you create a database and populate it with tables full of custom data.

#### Create a MariaDB database

You may already be able to guess how to create a new database in MariaDB. It's a lot like creating a new user:


```
&gt; CREATE DATABASE example;
Query OK, 1 ROW affected (0.000 sec)
&gt; SHOW DATABASES;
+--------------------+
| DATABASE           |
+--------------------+
| example            |
[...]
```

Make this new database your active one with the `use` command:


```
`> USE example;`
```

#### Create a table

Creating a table is more complex than creating a database because you must define column headings. MariaDB provides many convenience functions for you to use when creating columns, including data type definitions, automatic incrementing options, constraints to avoid empty values, automated timestamps, and more.

Here's a simple table to describe a set of users:


```
&gt; CREATE TABLE IF NOT EXISTS member (
    -&gt; id INT AUTO_INCREMENT PRIMARY KEY,
    -&gt; name VARCHAR(128) NOT NULL,
    -&gt; startdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
Query OK, 0 ROWS affected (0.030 sec)
```

This table provides a unique identifier to each row by using an auto-increment function. It contains a field for a user's name, which cannot be empty (or `null`), and generates a timestamp when the record is created.

Populate this table with some sample data using the `INSERT` SQL keyword:


```
&gt; INSERT INTO member (name) VALUES ('Alice');
Query OK, 1 ROW affected (0.011 sec)
&gt; INSERT INTO member (name) VALUES ('Bob');
Query OK, 1 ROW affected (0.011 sec)
&gt; INSERT INTO member (name) VALUES ('Carol');
Query OK, 1 ROW affected (0.011 sec)
&gt; INSERT INTO member (name) VALUES ('David');
Query OK, 1 ROW affected (0.011 sec)
```

Verify the data in the table:


```
&gt; SELECT * FROM member;
+----+-------+---------------------+
| id | name  | startdate           |
+----+-------+---------------------+
|  1 | Alice | 2020-10-03 15:25:06 |
|  2 | Bob   | 2020-10-03 15:26:43 |
|  3 | Carol | 2020-10-03 15:26:46 |
|  4 | David | 2020-10-03 15:26:51 |
+----+-------+---------------------+
4 ROWS IN SET (0.000 sec)
```

#### Add multiple rows at once

Now create a second table:


```
&gt; CREATE TABLE IF NOT EXISTS linux (
    -&gt; id INT AUTO_INCREMENT PRIMARY KEY,
    -&gt; distro VARCHAR(128) NOT NULL,
Query OK, 0 ROWS affected (0.030 sec)
```

Populate it with some sample data, this time using a little `VALUES` shortcut so you can add multiple rows in one command. The `VALUES` keyword expects a list in parentheses, but it can take multiple lists separated by commas:


```
&gt; INSERT INTO linux (distro)
 -&gt; VALUES ('Slackware'), ('RHEL'),('Fedora'),('Debian');
Query OK, 4 ROWS affected (0.011 sec)
Records: 4  Duplicates: 0  Warnings: 0
&gt; SELECT * FROM linux;
+----+-----------+
| id | distro    |
+----+-----------+
|  1 | Slackware |
|  2 | RHEL      |
|  3 | Fedora    |
|  4 | Debian    |
+----+-----------+
```

### Create relationships between tables

You now have two tables, but there's no relationship between them. They each contain independent data, but you might need to associate a member of the first table to a specific item listed in the second.

To do that, you can create a new column for the first table that corresponds to something in the second. Because both tables were designed with unique identifiers (the auto-incrementing `id` field), the easiest way to connect them is to use the `id` field of one as a selector for the other.

Create a new column in the first table to represent a value in the second table:


```
&gt; ALTER TABLE member ADD COLUMN (os INT);
Query OK, 0 ROWS affected (0.012 sec)
Records: 0  Duplicates: 0  Warnings: 0
&gt; DESCRIBE member;
DESCRIBE member;
+-----------+--------------+------+-----+---------+------+
| FIELD     | TYPE         | NULL | KEY | DEFAULT | Extra|
+-----------+--------------+------+-----+---------+------+
| id        | INT(11)      | NO   | PRI | NULL    | auto_|
| name      | VARCHAR(128) | NO   |     | NULL    |      |
| startdate | TIMESTAMP    | NO   |     | cur[...]|      |
| os        | INT(11)      | YES  |     | NULL    |      |
+-----------+--------------+------+-----+---------+------+
```

Using the unique IDs of the `linux` table, assign a distribution to each member. Because the records already exist, use the `UPDATE` SQL keyword rather than `INSERT`. Specifically, you want to select one row and then update the value of one column. Syntactically, this is expressed a little in reverse, with the update happening first and the selection matching last:


```
&gt; UPDATE member SET os=1 WHERE name='Alice';
Query OK, 1 ROW affected (0.007 sec)
ROWS matched: 1  Changed: 1  Warnings: 0
```

Repeat this process for the other names in the `member` table to populate it with data. For variety, assign three different distributions across the four rows (doubling up on one).

#### Join tables

Now that these two tables relate to one another, you can use SQL to display the associated data. There are many kinds of joins in databases, and you can try them all once you know the basics. Here's a basic join to correlate the values found in the `os` field of the `member` table to the `id` field of the `linux` table:


```
SELECT * FROM member JOIN linux ON member.os=linux.id;
+----+-------+---------------------+------+----+-----------+
| id | name  | startdate           | os   | id | distro    |
+----+-------+---------------------+------+----+-----------+
|  1 | Alice | 2020-10-03 15:25:06 |    1 |  1 | Slackware |
|  2 | Bob   | 2020-10-03 15:26:43 |    3 |  3 | Fedora    |
|  4 | David | 2020-10-03 15:26:51 |    3 |  3 | Fedora    |
|  3 | Carol | 2020-10-03 15:26:46 |    4 |  4 | Debian    |
+----+-------+---------------------+------+----+-----------+
4 ROWS IN SET (0.000 sec)
```

The `os` and `id` fields form the join.

In a graphical application, you can imagine that the `os` field might be set by a drop-down menu, the values for which are drawn from the contents of the `distro` field of the `linux` table. By using separate tables for unique but related sets of data, you ensure the consistency and validity of data, and thanks to SQL, you can associate them dynamically later.

### [Download the MariaDB and MySQL cheat sheet][9]

MariaDB is an enterprise-grade database. It's designed and proven to be a robust, powerful, and fast database engine. Learning it is a great step toward using it to do things like managing web applications or programming language libraries. As a quick reference when you're using MariaDB, [download our MariaDB and MySQL cheat sheet][9].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/mariadb-mysql-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://www.redhat.com/sysadmin/yaml-tips
[3]: https://mariadb.org/
[4]: https://www.mysql.com/
[5]: https://en.wikipedia.org/wiki/SQL
[6]: https://opensource.com/article/20/10/install-mariadb-and-mysql-linux
[7]: https://mariadb.org/download
[8]: https://publications.opengroup.org/c449
[9]: https://opensource.com/downloads/mariadb-mysql-cheat-sheet
