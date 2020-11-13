[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12822-1.html"
[#]: subject: "Improve your database knowledge with this MariaDB and MySQL cheat sheet"
[#]: via: "https://opensource.com/article/20/10/mariadb-mysql-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"

备忘单：提升你的 MariaDB 和 MySQL 数据库技能
======

> 阅读本文并下载我们的免费备忘单，去使用开源的数据库吧。

![](https://img.linux.net.cn/data/attachment/album/202011/14/065421hq1qocmk3rf4npq1.jpg)

当你写一个程序或配置一个服务时，你最终都要持久化存储信息。有时候，你只需要一个 INI 或者 [YAML][2] 配置文件就够了。而有时候，一个自定义格式的 XML 或者 JSON 或其他类似的文件会更好。

但也有时候你需要校验输入、快速查询信息、关联数据、通常还要熟练地处理你的用户的请求。这就是设计数据库的目的，而 [MariaDB][3]（由 [MySQL][4] 的原始开发人员开发的一个分支） 是一个极佳的选项。在本文中我使用的是 MariaDB，但这些信息同样适用于 MySQL。

通过编程语言与数据库进行交互是很普遍的。正因如此，出现了大量 Java、Python、Lua、PHP、Ruby、C++ 和其他语言的 [SQL][5] 库。然而，在使用这些库之前，理解数据库引擎做了什么以及为什么选择数据库是重要的对我们会很有帮助。本文介绍 MariaDB 和 `mysql` 命令来帮助你熟悉数据库处理数据的基本原理。

如果你还没有安装 MariaDB，请查阅我的文章 [在 Linux 上安装 MariaDB][6]。如果你没有使用 Linux，请参照 MariaDB [下载页面][7]提供的指导方法。

### 与 MariaDB 交互

你可以使用 `mysql` 命令与 MariaDB 进行交互。首先使用子命令 `ping` 确认你的服务是运行着的，在提示后输入密码：

```
$ mysqladmin -u root -p ping
Enter password:
mysqld is alive
```

为了易于读者理解，打开一个交互式的 MariaDB 会话：

```
$ mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.
Commands end with ; or \g.
[...]
Type 'help;' or '\h' for help.
Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

你现在是在一个 MariaDB 子 shell 中，提示符是 MariaDB 提示符。普通的 Bash 命令在这里不能使用，只能用 MariaDB 命令。输入 `help` （或 `?`）查看命令列表。这些是你的 MariaDB shell 的管理命令，使用它们可以定制你的 shell，但它们不属于 SQL 语言。

### 学习 SQL 基本知识

[结构化查询语言][8]是基于它们的能力定义的：一种通过有规则且一致的语法来查询数据库中的内容以得到有用的结果的方法。SQL 看起来像是普通的英文语句，有一点点生硬。例如，如果你登入数据库服务器，想查看有哪些库，输入 `SHOW DATABASES;` 并回车就能看到结果。

SQL 命令以分号作为结尾。如果你忘记输入分号，MariaDB 会认为你是想在下一行继续输入你的查询命令，在下一行你可以继续输入命令也可以输入分号结束命令。

```
MariaDB [(NONE)]> SHOW DATABASES;
+--------------------+
| DATABASE           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+
4 ROWS IN SET (0.000 sec)
```

上面的例子显示当前有四个数据库：`information_schema`、`mysql`、`performance_schema` 和 `test`。你必须指定 MariaDB 使用哪个库，才能对该库使用查询语句。指定数据库的命令是 `use`。当你选择了一个库后，MariaDB 提示框会切换为选择的库。

```
MariaDB [(NONE)]> USE test;
MariaDB [(test)]>
```

#### 显示数据库的表

数据库里有*表*，与电子表格类似：有一系列的行（在数据库中称为*记录*）和列。一个行和一个列唯一确定一个*字段*。

查看一个数据库中可用的表（可以理解为多表单电子表格中的一页），使用 SQL 关键字 `SHOW`：

```
MariaDB [(test)]> SHOW TABLES;
empty SET
```

`test` 数据库是空的，所以使用 `use` 命令切换到 `mysql` 数据库：

```
MariaDB [(test)]> USE mysql;
MariaDB [(mysql)]> SHOW TABLES;

+---------------------------+
| Tables_in_mysql           |
+---------------------------+
| column_stats              |
| columns_priv              |
| db                        |
[...]
| time_zone_transition_type |
| transaction_registry      |
| USER                      |
+---------------------------+
31 ROWS IN SET (0.000 sec)
```

这个数据库中有很多表！`mysql` 数据库是这个 MariaDB 实例的系统管理数据库。它里面包含重要数据，比如用来管理数据库权限的用户结构。这个数据库很重要，你不需要经常直接与它交互，但是使用 SQL 脚本来操作它却很常见。当你学习 MariaDB 时理解 `mysql` 数据库很有用，因为它有助于说明一些基本的 SQL 命令。

#### 检查一个表

这个实例的 `mysql` 数据库的最后一个表名为 `USER`。这个表包含了可以访问这个数据库的用户。当前里面只有一个 root 用户，但是你可以添加不同权限的用户，赋予它们查看、更新或创建数据的权限。你可以查看一个表的列首来了解一个  MariaDB 用户的所有属性：

```
> SHOW COLUMNS IN USER;
MariaDB [mysql]> SHOW COLUMNS IN USER;
+-------------+---------------+------+-----+----------+
| FIELD       | TYPE          | NULL | KEY | DEFAULT  |
+-------------+---------------+------+-----+----------+
| Host        | CHAR(60)      | NO   | PRI |          |
| USER        | CHAR(80)      | NO   | PRI |          |
| Password    | CHAR(41)      | NO   |     |          |
| Select_priv | enum('N','Y') | NO   |     | N        |
| Insert_priv | enum('N','Y') | NO   |     | N        |
| Update_priv | enum('N','Y') | NO   |     | N        |
| Delete_priv | enum('N','Y') | NO   |     | N        |
| Create_priv | enum('N','Y') | NO   |     | N        |
| Drop_priv   | enum('N','Y') | NO   |     | N        |
[...]
47 ROWS IN SET (0.001 sec)
```

#### 创建一个新的用户

不论你是否需要一个普通的账号来管理数据库或者为计算机配置数据库（例如安装 WordPress、Drupal 或 Joomla时），在 MariaDB 中多建一个用户账号是很普遍的。你可以通过向 `mysql` 数据库的 `USER` 表中添加一个用户或使用 SQL 关键字 `CREATE` 来提示 MariaDB 创建一个 MariaDB 用户。使用 `CREATE` 来创建新用户会默认执行一些有用的方法，因此你不需要手动生成所有的信息：

```
> CREATE USER 'tux'@'localhost' IDENTIFIED BY 'really_secure_password';
```

#### 查看表的字段

你可以使用 `SELECT` 关键字来查看数据库表的字段和值。这本例中，你创建了一个名为 `tux` 的用户，因此查询 `USER` 表中的列：

```
> SELECT USER,host FROM USER;
+------+------------+
| USER | host       |
+------+------------+
| root | localhost  |
[...]
| tux  | localhost  |
+------+------------+
7 ROWS IN SET (0.000 sec)
```

#### 为一个用户赋予权限

通过查看 `USER` 表列出的信息，你可以看到用户的状态。例如，新用户 `tux` 对这个数据库没有任何权限。使用 `WHERE` 语句你可以只查 `tux` 那一条记录。

```
> SELECT USER,select_priv,insert_priv,update_priv FROM USER WHERE USER='tux';
+------+-------------+-------------+-------------+
| USER | select_priv | insert_priv | update_priv |
+------+-------------+-------------+-------------+
| tux  | N           | N           | N           |
+------+-------------+-------------+-------------+
```

使用 `GRANT` 命令修改用户的权限：

```
> GRANT SELECT ON *.* TO 'tux'@'localhost';
> FLUSH PRIVILEGES;
```

验证你的修改：

```
> SELECT USER,select_priv,insert_priv,update_priv FROM USER WHERE USER='tux';
+------+-------------+-------------+-------------+
| USER | select_priv | insert_priv | update_priv |
+------+-------------+-------------+-------------+
| tux  | Y           | N           | N           |
+------+-------------+-------------+-------------+
```

`tux` 用户现在有了从所有表中查询记录的权限。

### 创建自定义的数据库

到目前为止，你一直在与默认的数据库进行交互。除了用户管理，大部分人很少会与默认的数据库进行交互。通常，你会用自定义的数据来填充创建的数据库。

#### 创建一个 MariaDB 数据库

你可能已经可以自己在 MariaDB 中创建新数据库了。创建数据库跟新建用户差不多。

```
> CREATE DATABASE example;
Query OK, 1 ROW affected (0.000 sec)
> SHOW DATABASES;
+--------------------+
| DATABASE           |
+--------------------+
| example            |
[...]
```

使用 `use` 命令来把这个新建的数据库作为当前使用的库：

```
> USE example;
```

#### 创建一个表

创建表比创建数据库要复杂，因为你必须定义列首。MariaDB 提供了很多方便的函数，可以用于创建列，引入数据类型定义，自增选项，对空值的约束，自动时间戳等等。

下面是用来描述一系列用户的一个简单的表：

```
> CREATE TABLE IF NOT EXISTS member (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(128) NOT NULL,
    -> startdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
Query OK, 0 ROWS affected (0.030 sec)
```

这个表通过使用一个自动递增的方法来唯一标识每一行。表示用户名字的字段不能为空（或 `null`），每一行被创建时会自动生成时间戳。

使用 SQL 关键字 `INSERT` 向这个表填充一些示例数据：

```
> INSERT INTO member (name) VALUES ('Alice');
Query OK, 1 ROW affected (0.011 sec)
> INSERT INTO member (name) VALUES ('Bob');
Query OK, 1 ROW affected (0.011 sec)
> INSERT INTO member (name) VALUES ('Carol');
Query OK, 1 ROW affected (0.011 sec)
> INSERT INTO member (name) VALUES ('David');
Query OK, 1 ROW affected (0.011 sec)
```

验证一下表里的数据：

```
> SELECT * FROM member;
+----+-------+---------------------+
| id | name  | startdate           |
+----+-------+---------------------+
|  1 | Alice | 2020-10-03 15:25:06 |
|  2 | Bob   | 2020-10-03 15:26:43 |
|  3 | Carol | 2020-10-03 15:26:46 |
|  4 | David | 2020-10-03 15:26:51 |
+----+-------+---------------------+
4 ROWS IN SET (0.000 sec)
```

#### 同时增加多行数据

再创建一个表：

```
> CREATE TABLE IF NOT EXISTS linux (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> distro VARCHAR(128) NOT NULL);
Query OK, 0 ROWS affected (0.030 sec)
```

填充一些示例数据，这次使用 `VALUES` 快捷方式，这样你可以一次添加多行数据。`VALUES` 关键字需要一个用括号包围的列表作为参数，也可以用逗号分隔的多个列表作为参数。

```
> INSERT INTO linux (distro)
 -> VALUES ('Slackware'), ('RHEL'),('Fedora'),('Debian');
Query OK, 4 ROWS affected (0.011 sec)
Records: 4  Duplicates: 0  Warnings: 0
> SELECT * FROM linux;
+----+-----------+
| id | distro    |
+----+-----------+
|  1 | Slackware |
|  2 | RHEL      |
|  3 | Fedora    |
|  4 | Debian    |
+----+-----------+
```

### 关联多个表

现在你有两个表，之间没有关联。两个表的数据是独立的，但是你可能需要表一中的一个值来识别表二的记录。

你可以在表一中新增一列对应表二中的值。因为两个表都有唯一的标识符（自动递增的 `id` 字段），关联的它们的最简单的方式是，使用表一中的 `id` 字段作为表二的查询条件。

在表一中创建一列用来表示表二中的一个值：

```
> ALTER TABLE member ADD COLUMN (os INT);
Query OK, 0 ROWS affected (0.012 sec)
Records: 0  Duplicates: 0  Warnings: 0
> DESCRIBE member;
DESCRIBE member;
+-----------+--------------+------+-----+---------+------+
| FIELD     | TYPE         | NULL | KEY | DEFAULT | Extra|
+-----------+--------------+------+-----+---------+------+
| id        | INT(11)      | NO   | PRI | NULL    | auto_|
| name      | VARCHAR(128) | NO   |     | NULL    |      |
| startdate | TIMESTAMP    | NO   |     | cur[...]|      |
| os        | INT(11)      | YES  |     | NULL    |      |
+-----------+--------------+------+-----+---------+------+
```

把 `linux` 表中的唯一 ID 分配给每个成员。因为记录已经存在，使用 `UPDATE` 关键字而不是 `INSERT`。尤其是当你想查询某行然后再更新某列值时。语法上，表达方式有点倒装，先更新后查询：

```
> UPDATE member SET os=1 WHERE name='Alice';
Query OK, 1 ROW affected (0.007 sec)
ROWS matched: 1  Changed: 1  Warnings: 0
```

要填充数据，请对其他名字重复执行这个过程。为了数据的多样性，在四行记录中分配三个不同的值。

#### 连接表

现在这两个表彼此有了关联，你可以使用 SQL 来展示关联的数据。数据库中有很多种连接方式，你可以尽请尝试。下面的例子是关联 `member` 表中 `os` 字段和 `linux` 表中 `id` 字段：

```
SELECT * FROM member JOIN linux ON member.os=linux.id;
+----+-------+---------------------+------+----+-----------+
| id | name  | startdate           | os   | id | distro    |
+----+-------+---------------------+------+----+-----------+
|  1 | Alice | 2020-10-03 15:25:06 |    1 |  1 | Slackware |
|  2 | Bob   | 2020-10-03 15:26:43 |    3 |  3 | Fedora    |
|  4 | David | 2020-10-03 15:26:51 |    3 |  3 | Fedora    |
|  3 | Carol | 2020-10-03 15:26:46 |    4 |  4 | Debian    |
+----+-------+---------------------+------+----+-----------+
4 ROWS IN SET (0.000 sec)
```

连接 `os` 和 `id` 字段。

在图形化的应用中，你可以想象 `os` 字段可以在下拉菜单中设置，值的来源是 `linux` 表中的 `distro` 字段。通过使用多个表中独立却有关联的数据，你可以保证数据的一致性和有效性，使用 SQL 你可以动态地关联它们。

### 下载 MariaDB 和 MySQL 备忘单

MariaDB 是企业级的数据库。它是健壮、强大、高效的数据库引擎。学习它是你向管理 web 应用和编写语言库迈出的伟大的一步。你可以[下载 MariaDB 和 MySQL 备忘单][9]，在你使用 MariaDB 时可以快速参考。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/mariadb-mysql-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP "Cheat Sheet cover image"
[2]: https://www.redhat.com/sysadmin/yaml-tips
[3]: https://mariadb.org/
[4]: https://www.mysql.com/
[5]: https://en.wikipedia.org/wiki/SQL
[6]: https://opensource.com/article/20/10/install-mariadb-and-mysql-linux
[7]: https://mariadb.org/download
[8]: https://publications.opengroup.org/c449
[9]: https://opensource.com/downloads/mariadb-mysql-cheat-sheet