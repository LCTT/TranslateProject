[#]: subject: "Drop your database for PostgreSQL"
[#]: via: "https://opensource.com/article/22/9/drop-your-database-for-postgresql"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 PostgreSQL 建立你的数据库
======
Postgres 是最灵活的数据库之一，并且它是开源的。

数据库是一种有组织性且灵活地存储信息的工具。电子表格在本质上就是一个数据库，但是图形化应用程序这一限制使得大多数的电子表格应用程序对程序员毫无用处。随着 [边缘计算][3] 和物联网设备成为重要的平台，开发者们需要更有效且轻量级的方法，来存储、处理、查询大量的数据。我最爱的一种结合是使用 [Lua 连接][4] PostgreSQL 数据库。无论你使用什么编程语言，Postgres 一定是数据库的绝佳选择，但是在使用 Postgres 之前，首先你需要知道一些基本的东西。

### 安装 Postgres

在 linux 上安装 PostgreSQL，要使用你的软件库。在 Fedora，CentOS，Megeia 等类似的 linux 版本上使用命令：

```
$ sudo dnf install postgresql postgresql-server
```

在 Debian， Linux Mint， Elementary 等类似的 linux 版本上使用命令：

```
$ sudo apt install postgresql postgresql-contrib
```

在 macOs 和 Windows 上，可以从官网 [postgresql.org][5] 下载安装包。

### 配置 Postgres

Most distributions install the Postgres database without *starting* it, but provide you with a script or [systemd service][6] to help it start reliably. However, before you start PostgreSQL, you must create a database cluster.
大多数发行版安装 Postgres 数据库时没有启动它，但是为你提供了一个脚本或 [systemd 服务][6]，能够可靠地启动 Postgres。但是，在启动 PostgreSQL 之前，必须创建一个数据库集群。

#### Fedora

在 Fedora，CentOS 等类似的版本上，Postgres 安装包中提供了一个 Postgres 配置脚本。运行这个脚本，可以进行简单地配置：

```
$ sudo /usr/bin/postgresql-setup --initdb
[sudo] password:
 * Initializing database in '/var/lib/pgsql/data'
 * Initialized, logs are in /var/lib/pgsql/initdb_postgresql.log
```

#### Debian

在基于 Debian 的发行版上，在安装 Postgres 的过程中，配置会通过 `apt` 自动完成。

#### 其他版本

最后，如果你是在其他版本上运行的，那么你可以直接使用 Postgres 提供的一些工具。`initdb` 命令会创建一个数据库集群，但是这个命令必须在 `postgres` 用户下运行，你可以使用 `sudo` 来暂时地成为 `postgres` 用户：

```
$ sudo -u postgres \
"initdb -D /var/lib/pgsql/data \
--locale en_US.UTF-8 --auth md5 --pwprompt"
```

### 运行 Postgres

现在，数据库集群已经存在了，使用 `initdb` 的输出中提供给你的命令或者使用 systemd 启动 Postgres 服务器：

```
$ sudo systemctl start postgresql
```

### 创建一个数据库用户

使用 `createuser` 命令来创建一个数据库用户。`postgres` 用户是 Postgres 安装的超级用户。

```
$ sudo -u postgres createuser --interactive --password bogus
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) n
Password:
```

### 创建一个数据库

使用 `createdb` 命令来创建一个新的数据库。在这个例子中，我创建了数据库 `exampledb`，并把该数据库的拥有者分配给用户 `bogus`。

```
$ createdb exampledb --owner bogus
```

### 与 PostgreSQL 交互

你可以使用 `psql` 命令来与 PostgreSQL 中的数据库进行交互。这个命令提供了一个交互界面，所以你可以用它来查看和更新你的数据库。你需要指定要使用的用户和数据库，来连接到一个数据库。

```
$ psql --user bogus exampledb
psql (XX.Y)
Type "help" for help.

exampledb=>
```

### 创建一个表

数据库包含很多表。这些表可以可视化为表格，有很多行（在数据库中称为 *记录*）和很多列。行和列的交集称为 *字段*。

结构化查询语言（SQL）是以它提供的内容而命名的，它能提供可预测且一致的语法，来查询数据库内容，从而收到有用的结果。

目前，你的数据库是空的，没有任何的表。你可以用 `CTEATE` 语句来创建一个表。结合使用 `IF NOT EXISTS` 是很有用的，它可以避免破坏现有的表。

在你创建一个表之前，想想看你希望这个表包含哪一种数据（在 SQL 术语中称为“数据类型”）。在这个例子中，我创建了一个表，包含两列，有唯一标识符的一列和最多九个字符的可变长的一列。
```
exampledb=> CREATE TABLE IF NOT EXISTS my_sample_table(
exampledb(> id SERIAL,
exampledb(> wordlist VARCHAR(9) NOT NULL
);
```

关键字 `SERIAL` 并不是一个数据类型。`SERIAL` 是 [PostgreSQL 中的一个特殊的标记][7]，它可以创建一个自动递增的整数字段。关键字 `VARCHAR` 是一个数据类型，表示限制内字符数的可变字符。在此例中，我指定了最多 9 个字符。PostgreSQL 中有很多数据类型，因此请参阅项目文档以获取选项列表。

### 插入数据

你可以使用 `INSERT` 语句来给你的新表插入一些样本数据：

```
exampledb=> INSERT INTO my_sample_table (wordlist) VALUES ('Alice');
INSERT 0 1
```

如果你尝试在 `wordlist` 域中输入超过 9 个字符，则数据输入将会失败：

```
exampledb=> INSERT INTO my_sample_table (WORDLIST) VALUES ('Alexandria');
ERROR:  VALUE too long FOR TYPE CHARACTER VARYING(9)
```

### 改变表或者列

当你需要改变一个域的定义时，你可以使用 `ALTER` 这一 SQL 关键字。例如，如果你想改变 `wordlist` 域中最多只能有 9 个字符的限制，你可以重新设置这个数据类型。

```
exampledb=> ALTER TABLE my_sample_table
ALTER COLUMN wordlist SET DATA TYPE VARCHAR(10);
ALTER TABLE
exampledb=> INSERT INTO my_sample_table (WORDLIST) VALUES ('Alexandria');
INSERT 0 1
```

### 查询表中的内容

SQL 是一种查询语言，因此你可以通过查询来查看数据库的内容。查询可以是很简单的，也可以涉及连接多个不同表之间的复杂关系。要查看表中的所有内容，请使用 `*` 上的 `SELECT` 关键字（`*` 是通配符）：
```
exampledb=> SELECT * FROM my_sample_table;
 id |  wordlist
\----+------------
  1 | Alice
  2 | Bob
  3 | Alexandria
(3 ROWS)
```

### 更多信息

PostgreSQL 可以处理很多数据，但是对于任何数据库来说，关键之处在于你是如何设计你的数据库的，以及数据存储下来之后你是怎么查询数据的。在 [OECD.org][8] 上可以找到一个相对较大的公共数据集，你可以使用它来尝试一些先进的数据库技术。

首先，将数据下载为逗号分隔值格式（CSV）的文件，并将文件另存为 `Downloads` 文件夹中的 `land-cover.csv`。

在文本编辑器或电子表格应用程序中浏览数据，来了解有哪些列，以及每列包含哪些类型的数据。仔细查看数据，并留意错误情况。例如，`COU` 列指的是国家代码，例如 `AUS` 表示澳大利亚和 `GRC` 表示希腊，在奇怪的 `BRIICS` 之前，这一列的值通常是 3 个字符。

在你理解了这些数据项后，你就可以准备一个 Postgres 数据库了。

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

### 引入数据

Postgres 可以使用特殊的元命令 `\copy` 来直接引入 CSV 数据：
```
landcoverdb=> \copy land_cover from '~/land-cover.csv' with csv header delimiter ','
COPY 22113
```

That's 22,113 records imported. Seems like a good start!
插入了 22113 条记录。这是一个很好的开始！

### 查询数据

用 `SELECT` 语句可以查询这 22113 条记录的所有列，此外 Postgres 将输出通过管道传输到屏幕上，因此你可以轻松地滚动鼠标来查看输出的结果。更进一步，你可以使用高级SQL，来获得一些有用的视图。

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
下面是样例的一些输出：

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

SQL 是一种很丰富的语言，超出了本文的讨论范围。通读 SQL 的内容，看看你是否可以对上面的查询语句进行修改，以提供不同的数据集。

### 拓展数据库

PostgreSQL 是伟大的开源数据库之一。有了它，你可以为结构化数据设计存储库，然后使用 SQL 以不同的方式查询它，以便能够获得有关该数据的新视角。Postgres 也能与许多语言集成，包括Python，Lua，Groovy，Java等，因此无论你使用什么工具集，你都可以充分利用好这个出色的数据库。

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
