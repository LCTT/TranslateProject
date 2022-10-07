[#]: subject: "Drop your database for PostgreSQL"
[#]: via: "https://opensource.com/article/22/9/drop-your-database-for-postgresql"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Drop your database for PostgreSQL
======
Postgres is one of the most flexible databases available, and it's open source.
Postgres是最灵活的数据库之一，并且它是开源的。

Databases are tools to store information in an organized but flexible way. A spreadsheet is essentially a database, but the constraints of a graphical application render most spreadsheet applications useless to programmers. With [Edge][3] and IoT devices becoming significant target platforms, developers need powerful but lightweight solutions for storing, processing, and querying large amounts of data. One of my favourite combinations is the PostgreSQL database and [Lua bindings][4], but the possibilities are endless. Whatever language you use, Postgres is a great choice for a database, but you need to know some basics before adopting it.
数据库是一种有组织性且灵活地存储信息的工具。电子表格在本质上就是一个数据库，但是图形化应用程序这一限制使得大多数的电子表格应用程序对程序员毫无用处。随着边缘计算和物联网设备成为重要的平台，开发者们需要更有效且轻量级的方法，来存储、处理、查询大量的数据。我最爱的一种结合是使用 Lua 连接 PostgreSQL 数据库，但是它可以带来无限可能（？？？）。无论你使用什么编程语言，Postgres一定是数据库的绝佳选择，但是在使用 Postgres 之前，首先你需要知道一些基本的东西。

### Install Postgres
安装 Postgres

To install PostgreSQL on Linux, use your software repository. On Fedora, CentOS, Mageia, and similar:
在 linux 上安装 PostgreSQL，要使用你的软件库。在 Fedora，CentOS，Megeia 等类似的 linux 版本上使用命令：

```
$ sudo dnf install postgresql postgresql-server
```

On Debian, Linux Mint, Elementary, and similar:
在 Debian， Linux Mint， Elementary 等类似的 linux 版本上使用命令：

```
$ sudo apt install postgresql postgresql-contrib
```

On macOS and Windows, download an installer from [postgresql.org][5].
在 macOs 和 Windows 上，可以从官网下载安装包。

### Setting up Postgres
配置 Postgres

Most distributions install the Postgres database without *starting* it, but provide you with a script or [systemd service][6] to help it start reliably. However, before you start PostgreSQL, you must create a database cluster.
大多数发行版安装 Postgres 数据库时没有启动它，但为你提供了一个脚本或[systemd服务][6]，能够可靠地启动 Postgres。但是，在启动 PostgreSQL 之前，必须创建一个数据库集群。

#### Fedora
Fedora

On Fedora, CentOS, or similar, there's a Postgres setup script provided in the Postgres package. Run this script for easy configuration:
在 Fedora，CentOS，等类似的版本上，Postgres 安装包中提供了一个 Postgres 配置脚本。运行这个脚本，可以简单地配置：

```
$ sudo /usr/bin/postgresql-setup --initdb
[sudo] password:
 * Initializing database in '/var/lib/pgsql/data'
 * Initialized, logs are in /var/lib/pgsql/initdb_postgresql.log
```

#### Debian
Debian

On Debian-based distributions, setup is performed automatically by `apt` during installation.
在基于 Debian 的发行版上，在安装 Postgres 中，配置会通过 apt 自动完成。

#### Everything else
其他

Finally, if you're running something else, then you can just use the toolchain provided by Postgres itself. The `initdb` command creates a database cluster, but you must run it as the `postgres` user, an identity you may temporarily assume using `sudo` :
最后，如果你在其他版本上运行的，那么你可以直接使用 Postgres 提供的一些工具。initdb命令会创建一个数据库集群，但是这个命令必须在 postgres 用户下运行，你可以使用 sudo 来暂时地成为 postgres 用户：

```
$ sudo -u postgres \
"initdb -D /var/lib/pgsql/data \
--locale en_US.UTF-8 --auth md5 --pwprompt"
```

### Start Postgres
运行 Postgres

Now that a cluster exists, start the Postgres server using either the command provided to you in the output of `initdb` or with systemd:
现在数据库集群已经存在了，使用 initdb 输出中提供给你的命令或者使用 systemd 启动 Postgres 服务器：

```
$ sudo systemctl start postgresql
```

### Creating a database user
创建一个数据库用户

To create a Postgres user, use the `createuser` command. The `postgres` user is the superuser of the Postgres install,
使用 createuser 命令来创建一个数据库用户。postgres 用户是 Postgres 安装的超级用户。
```
$ sudo -u postgres createuser --interactive --password bogus
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) n
Password:
```

### Create a database
创建一个数据库

To create a new database, use the `createdb` command. In this example, I create the database `exampledb` and assign ownership of it to the user `bogus` :
使用 createdb 命令来创建一个新的数据库。在这个例子中，我创建了数据库 exampledb，并把该数据库的拥有者分配给用户 bogus。

```
$ createdb exampledb --owner bogus
```

### Interacting with PostgreSQL
与 PostgreSQL 交互

You can interact with a PostgreSQL database using the `psql` command. This command provides an interactive shell so you can view and update your databases. To connect to a database, specify the user and database you want to use:
你可以使用 psql 命令来与 PostgreSQL 中的一个数据库进行交互。这个命令提供了一个交互界面，所以你可以查看和更新你的数据库。你需要指定要使用的用户和数据库，来连接到一个数据库。

```
$ psql --user bogus exampledb
psql (XX.Y)
Type "help" for help.

exampledb=>
```

### Create a table
创建一个表

Databases contain tables, which can be visualized as a spreadsheet. There's a series of rows (called *records* in a database) and columns. The intersection of a row and a column is called a *field*.
数据库包含很多表。这些表可以可视化为表格，有很多行（在数据库中称为记录）和很多列。行和列的交集称为字段。

The Structured Query Language (SQL) is named after what it provides: A method to inquire about the contents of a database in a predictable and consistent syntax to receive useful results.
结构化查询语言（SQL）是以它提供的内容而命名的，它能提供可预测且一致的语法，来查询数据库内容，从而收到有用的结果。

Currently, your database is empty, devoid of any tables. You can create a table with the `CREATE` query. It's useful to combine this with the `IF NOT EXISTS` statement, which prevents PostgreSQL from clobbering an existing table.
目前，你的数据库是空的，没有任何的表。你可以用 CTEATE 语句来创建一个表。结合使用 IF NOT EXISTS 是很有用的，它可以避免破坏现有的表。

Before you createa table, think about what kind of data (the "data type" in SQL terminology) you anticipate the table to contain. In this example, I create a table with one column for a unique identifier and one column for some arbitrary text up to nine characters.
在你创建一个表之前，想想看你希望这个表包含哪一种数据（在 SQL 术语中称为“数据类型”）。在这个例子中，我创建了一个表，包含两列，有唯一标识符的一列和最多九个字符的可变长的一列。
```
exampledb=> CREATE TABLE IF NOT EXISTS my_sample_table(
exampledb(> id SERIAL,
exampledb(> wordlist VARCHAR(9) NOT NULL
);
```

The `SERIAL` keyword isn't actually a data type. It's [special notation in PostgreSQL][7] that creates an auto-incrementing integer field. The `VARCHAR` keyword is a data type indicating a variable number of characters within a limit. In this code, I've specified a maximum of 9 characters. There are lots of data types in PostgreSQL, so refer to the project documentation for a list of options.
SERIAL 关键字并不是一个数据类型。SERIAL 是 PostgreSQL 中的一个特殊的标记，它可以创建一个自动递增的整数字段。VARCHAR 关键字是一个数据类型，表示限制内字符数的可变字符。在此代码中，我指定了最多 9 个字符。PostgreSQL 中有很多数据类型，因此请参阅项目文档以获取选项列表。

### Insert data
插入数据
You can populate your new table with some sample data by using the `INSERT` SQL keyword:
你可以使用 INSERT 语句来给你的新表插入一些样本数据。

```
exampledb=> INSERT INTO my_sample_table (wordlist) VALUES ('Alice');
INSERT 0 1
```

Your data entry fails, should you attempt to put more than 9 characters into the `wordlist` field:
如果你尝试在“wordlist”字段中输入超过 9 个字符，则数据输入将失败：

```
exampledb=> INSERT INTO my_sample_table (WORDLIST) VALUES ('Alexandria');
ERROR:  VALUE too long FOR TYPE CHARACTER VARYING(9)
```

### Alter a table or column

When you need to change a field definition, you use the `ALTER` SQL keyword. For instance, should you decide that a nine character limit for `wordlist`, you can increase its allowance by setting its data type:

```
exampledb=> ALTER TABLE my_sample_table
ALTER COLUMN wordlist SET DATA TYPE VARCHAR(10);
ALTER TABLE
exampledb=> INSERT INTO my_sample_table (WORDLIST) VALUES ('Alexandria');
INSERT 0 1
```

### View data in a table

SQL is a query language, so you view the contents of a database through queries. Queries can be simple, or it can involve joining complex relationships between several different tables. To see everything in a table, use the `SELECT` keyword on `*` (an asterisk is a wildcard):

```
exampledb=> SELECT * FROM my_sample_table;
 id |  wordlist
\----+------------
  1 | Alice
  2 | Bob
  3 | Alexandria
(3 ROWS)
```

### More data

PostgreSQL can handle a lot of data, but as with any database the key to success is how you design your database for storage and what you do with the data once you've got it stored. A relatively large public data set can be found on [OECD.org][8], and using this you can try some advanced database techniques.

First, download the data as comma-separated values (CSV) and save the file as `land-cover.csv` in your `Downloads` folder.

Browse the data in a text editor or spreadsheet application to get an idea of what columns there are, and what kind of data each column contains. Look at the data carefully and keep an eye out for exceptions to an apparent rule. For instance, the `COU` column, containing a country code such as `AUS` for Australia and `GRC` for Greece, tends to be 3 characters until the oddity `BRIICS`.

Once you understand the data you're working with, you can prepare a Postgres database:

```
$ createdb landcoverdb --owner bogus
$ psql --user bogus landcoverdb
landcoverdb=> create table land_cover(
country_code varchar(6),
country_name varchar(76),
small_subnational_region_code varchar(5),
small_subnational_region_name varchar(14),
large_subnational_region_code varchar(17),
large_subnational_region_name varchar(44),
measure_code varchar(13),
measure_name varchar(29),
land_cover_class_code varchar(17),
land_cover_class_name varchar(19),
year_code integer,
year_value integer,
unit_code varchar(3),
unit_name varchar(17),
power_code integer,
power_name varchar(9),
reference_period_code varchar(1),
reference_period_name varchar(1),
value float(8),
flag_codes varchar(1),
flag_names varchar(1));
```

### Importing data

Postgres can import CSV data directly using the special metacommand `\copy` :

```
landcoverdb=> \copy land_cover from '~/land-cover.csv' with csv header delimiter ','
COPY 22113
```

That's 22,113 records imported. Seems like a good start!

### Querying data

A broad `SELECT` statement to see all columns of all 22,113 records is possible, and Postgres very nicely pipes the output to a screen pager so you can scroll through the output at a leisurely pace. However, using advanced SQL you can get some useful views of what's otherwise some pretty raw data.

```
landcoverdb=> SELECT
    lcm.country_name,
    lcm.year_value,
    SUM(lcm.value) sum_value
FROM land_cover lcm
JOIN (
    SELECT
        country_name,
        large_subnational_region_name,
        small_subnational_region_name,
        MAX(year_value) max_year_value
    FROM land_cover
    GROUP BY country_name,
        large_subnational_region_name,
        small_subnational_region_name
) AS lcmyv
ON
    lcm.country_name = lcmyv.country_name AND
    lcm.large_subnational_region_name = lcmyv.large_subnational_region_name AND
    lcm.small_subnational_region_name = lcmyv.small_subnational_region_name AND
    lcm.year_value = lcmyv.max_year_value
GROUP BY lcm.country_name,
    lcm.large_subnational_region_name,
    lcm.small_subnational_region_name,
    lcm.year_value
ORDER BY country_name,
    year_value;
```

Here's some sample output:

```
\---------------+------------+------------
 Afghanistan    |       2019 |  743.48425
 Albania        |       2019 |  128.82532
 Algeria        |       2019 |  2417.3281
 American Samoa |       2019 |   100.2007
 Andorra        |       2019 |  100.45613
 Angola         |       2019 |  1354.2192
 Anguilla       |       2019 | 100.078514
 Antarctica     |       2019 |  12561.907
[...]
```

SQL is a rich langauge, and so it's beyond the scope of this article. Read through the SQL code and see if you can modify it to provide a different set of data.

### Open database

PostgreSQL is one of the great open source databases. With it, you can design repositories for structured data, and then use SQL to view it in different ways so you can gain fresh perspectives on that data. Postgres integrates with many languages, including Python, Lua, Groovy, Java, and more, so regardless of your toolset, you can probably make use of this excellent database.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/drop-your-database-for-postgresql

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[chai001125](https://github.com/chai001125)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png
[2]: https://creativecommons.org/licenses/by/3.0/us/
[3]: https://www.redhat.com/en/topics/edge-computing/what-is-edge-computing?intcmp=7013a000002qLH8AAM
[4]: https://github.com/arcapos/luapgsql
[5]: https://www.postgresql.org/download/
[6]: https://opensource.com/article/21/4/sysadmins-love-systemd
[7]: https://www.postgresql.org/docs/current/datatype-numeric.html#DATATYPE-SERIAL
[8]: https://stats.oecd.org/Index.aspx?DataSetCode=LAND_COVER
