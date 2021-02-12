[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "A hands-on tutorial of SQLite3"
[#]: via: "https://opensource.com/article/21/2/sqlite3-cheat-sheet"
[#]: author: "Klaatu https://opensource.com/users/klaatu"


SQLite3 实践教程
======



开始使用这个功能强大且通用的数据库吧。你可以先下载 SQLite 备忘单。

![Cheat Sheet cover image][1]

应用程序经常需要保存数据。 无论您的用户是创建简单的文本文档，复杂的图形布局，游戏进度还是错综复杂的客户和订单号列表，通常都暗示着正在生成数据。 有很多方法可以存储数据以供重复使用。 您可以将文本转储为 INI，[YAML][2]，XML 或 JSON 等格式，可以输出原始的二进制数据，也可以将数据存储在结构化数据库中。 SQLite 是一个自包含的轻量级数据库，可轻松创建，解析，查询，修改和传输数据。

**下载 [SQLite3 备忘录][3]**

SQLite 一直致力于[公共领域][4]，[从技术上讲，它没有版权，因此不需要许可证][5]。 如果您需要许可证，则可以[购买所有权担保][6]。 SQLite 非常常见，大约有 1 万亿个 SQLite 数据库正在使用中。 在每个基于 Webkit 的 Web 浏览器，现代电视机，汽车多媒体系统以及无数其他软件应用程序中， Android 和 iOS 设备， macOS 和 Windows 10 计算机，大多数 Linux 系统上都包含多个数据库。


总而言之，它是用于存储和组织数据的一个可靠而简单的系统。


**安装**

您的系统上可能已经有 SQLite 库，但是您需要安装其命令行工具才能直接使用它。 在 Linux上，您可能已经安装了这些工具。 工具提供的命令是 **sqlite3** （而不仅仅是 **sqlite**）。

如果没有在您的 Linux 或 BSD 上安装 SQLite，您则可以从软件仓库中或 ports tree 中安装 SQLite，也可以从源代码或已编译的二进制文件进行[下载并安装][7]。

在 macOS 或 Windows 上，您可以从 [sqlite.org][7] 下载并安装 SQLite 工具。

### 使用 SQLite

通过编程语言与数据库进行交互是很常见的。 因此，像 Java，Python，Lua，PHP，Ruby，C ++ 以及其他编程语言都提供了 SQLite 的接口（或“绑定”）。 但是，在使用这些库之前，使用基本的命令有助于了解数据库引擎实际发生的情况以及选择数据库的重要性。 本文向您介绍 SQLite 和  **sqlite3**  命令，以便您熟悉该数据库如何处理数据的基础知识。

### 与 SQLite 交互

您可以使用 **sqlite3** 命令与 SQLite 进行交互。 该命令提供了一个交互式的 shell 程序，以便您可以查看和更新数据库。


```
$ sqlite3
SQLite version 3.34.0 2020-12-01 16:14:00
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite&gt;
```

该命令将您使您处于 SQLite 的子 shell 中，因此现在的提示是 SQLite 的提示。 您以前使用的 Bash 命令在这里将不再适用。 您必须使用 SQLite 命令。 要查看 SQLite 命令列表，请输入 **. help **：


```
sqlite&gt; .help
.archive ...             Manage SQL archives
.auth ON|OFF             SHOW authorizer callbacks
.backup ?DB? FILE        Backup DB (DEFAULT "main") TO FILE
.bail ON|off             Stop after hitting an error.  DEFAULT OFF
.binary ON|off           Turn BINARY output ON OR off.  DEFAULT OFF
.cd DIRECTORY            CHANGE the working directory TO DIRECTORY
[...]
```

这些命令中的一些是二进制的，而其他一些则需要唯一的参数（如文件名，路径等）。 这些是 SQLite Shell 的管理命令，不是用于数据库查询。 数据库以结构化查询语言（SQL）进行查询，许多 SQLite 查询与您从 [MySQL][8] 和 [MariaDB][9] 数据库中已经知道的查询相同。 但是，数据类型和功能不同，因此，如果您熟悉另一个数据库，请特别注意细微的差异。

### 创建数据库

启动 SQLite 时，可以打开内存中的提示，也可以选择要打开的数据库：


```
`$ sqlite3 mydatabase.db`
```

如果还没有数据库，则可以在 SQLite 提示符下创建一个数据库：


```
`sqlite> .open mydatabase.db`
```
现在，您的硬盘驱动器上有一个空文件，可以用作 SQLite 数据库。 文件扩展名 **.db** 是任意的。 您也可以使用 **.sqlite** 或任何您想要的后缀。

### 创建一个表

数据库包含一些 _表_，可以将其可视化为电子表格。 有许多的行（在数据库中称为 _记录_ ）和列。 行和列的交集称为 _域_。

结构化查询语言（SQL）以其提供的名称命名：是一种以可预测且一致的语法查询数据库内容以接收有用的结果的方法。 SQL 读起来很像普通的英语句子，即使有点像机器人一样。 当前，您的数据库是一个没有任何表的空数据库。

你可以使用 **CREATE** 来创建一个新表，你可以和 **IF NOT EXISTS** 结合使用。以便不会破坏现在已有的同名的表。

您无法在 SQLite 中创建一个没有任何字段的空表，因此在尝试 **CREATE** 语句之前，必须考虑预期表将存储的数据类型。 在此示例中，我将使用以下列创建一个名为 _member_ 的表：

  * 唯一标识符
  * 人名
  * 记录创建的时间和日期

#### 唯一标识符


最好用唯一的编号来引用记录，幸运的是，SQLite 认识到这一点，创建一个名叫 **rowid** 的列来自动实现这一点。


无需 SQL 语句即可创建此字段。


#### 数据类型


对于我的示例表中，我正在创建一个 _name_ 列来保存 **TEXT** 类型的数据。 为了防止在没有指定字段数据的情况下创建记录，可以添加 **NOT NULL** 指令。

用 **name TEXT NOT NULL** 语句来创建。

SQLite 中有五种数据类型（实际上是 _储存类别_）：

  * TEXT: 文本字符串
  * INTEGER: 一个数字
  * REAL: 一个浮点数（小数位数无限制）
  * BLOB: 二进制数据（例如，.jpeg或.webp图像）
  * NULL: 空值


#### 日期和时间戳

SQLite 有一个方便的日期和时间戳功能。 它本身不是数据类型，而是 SQLite 中的一个函数，它根据所需的格式生成字符串或整数。 在此示例中，我将其保留为默认值。


创建此字段的 SQL 语句是：**datestamp DATETIME DEFAULT CURRENT_TIMESTAMP**

### 创表语句


在 SQLite 中创建此示例表的完整 SQL：


```
sqlite&gt; CREATE TABLE
...&gt; IF NOT EXISTS
...&gt; member (name TEXT NOT NULL,
...&gt; datestamp DATETIME DEFAULT CURRENT_TIMESTAMP
```

在此代码示例中，我在语句的分句后按了回车键。以使其更易于阅读。 SQLite 除非以分号（**;**）终止，否则不会运行您的命令。

您可以使用 SQLite 命令 **.tables** 验证表是否已创建：


```
sqlite&gt; .tables
member
```

### 查看表中的所有列

您可以使用 **PRAGMA** 语句验证表包含哪些列和行：


```
sqlite&gt; PRAGMA table_info(member);
0|name|TEXT|1||0
1|datestamp|CURRENT_TIMESTAMP|0||0
```

### 数据输入

您可以使用 **INSERT** 语句将一些示例数据填充到表中：


```
&gt; INSERT INTO member (name) VALUES ('Alice');
&gt; INSERT INTO member (name) VALUES ('Bob');
&gt; INSERT INTO member (name) VALUES ('Carol');
&gt; INSERT INTO member (name) VALUES ('David');
```

查看表中的数据


```
&gt; SELECT * FROM member;
Alice|2020-12-15 22:39:00
Bob|2020-12-15 22:39:02
Carol|2020-12-15 22:39:05
David|2020-12-15 22:39:07
```

#### 添加多行数据

现在创建第二个表：


```
&gt; CREATE TABLE IF NOT EXISTS linux (
...&gt; distro TEXT NOT NULL)
```

填充一些示例数据，这一次使用多个 **VALUES**  的快捷方式，因此您可以在一个命令中添加多行。 关键字 **VALUES** 期望在括号中列出一个列表，但可以采用多个用逗号分隔列表：


```
&gt; INSERT INTO linux (distro)
...&gt; VALUES ('Slackware'), ('RHEL'),
...&gt; ('Fedora'),('Debian');
```

### 修改表

您现在有两个表，但是到目前为止，两者之间没有任何关系。 它们每个都包含独立的数据，但是可能您可能需要将第一个表的成员与第二个表中列出的特定项相关联。

为此，您可以为第一个表创建一个新列，该列对应于第二个表。 由于两个表都设计有唯一标识符（这要归功于 SQLite 的自动创建），所以连接它们的最简单方法是将其中一个的 **rowid** 字段用作另一个的选择器。

在第一个表中创建一个新列，以存储第二个表中的值：


```
`> ALTER TABLE member ADD os INT;`
```

使用 **linux** 表中的唯一标识符，作为 member 表中每一条记录中 os 字段的值。因为记录已经存在。因此你可以使用 **UPDATE** 语句而不是使用 **INSERT** 语句来更新数据。需要特别注意的是，你首先需要选中特定的一行来然后才能更新其中的某个字段。从句法上讲，这有点相反，更新首先发生，选择匹配最后发生：


```
`> UPDATE member SET os=1 WHERE name='Alice';`
```


对 **member**  表中的其他行重复相同的过程。更新 os 字段，为了数据多样性，在四行记录上分配三种不同的发行版。

### 联接表

现在，这两个表相互关联，您可以使用 SQL 显示关联的数据。 数据库中有多种 _joins_ ，但是一旦掌握了基础知识，就可以尝试全部使用。 这是一个基本联接，用于将 member 表的 os 字段中的值与 linux 表的 id 字段相关联：


```
&gt; SELECT * FROM member INNER JOIN linux ON member.os=linux.rowid;
Alice|2020-12-15 22:39:00|1|Slackware
Bob|2020-12-15 22:39:02|3|Fedora
Carol|2020-12-15 22:39:05|3|Fedora
David|2020-12-15 22:39:07|4|Debian
```

**os** 和 **id** 字段形成了关联

在一个图形应用程序中，你可以想象 os 字段是一个下拉选项按钮，其中的值是 **linux** 表中 **distro** 字段中的数据。通过将相关的数据集通过唯一的字段相关联，可以确保数据的一致性和有效性，并且借助 SQL，您可以在以后动态地关联它们。


### 了解更多

SQLite 是一个非常有用的独立，可移植的开源数据库。 学习以交互方式使用它是迈向针对 Web 应用程序进行管理或通过编程语言库使用它的重要的第一步。

如果您喜欢 SQLite，也可以尝试由同一位作者 Richard Hipp 博士的 [Fossil][10]。

在学习和使用 SQLite 时，有一些常用命令可能会有所帮助，所以请立即下载我们的 **[SQLite3备忘单][3] **！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/sqlite3-cheat-sheet

作者：[Klaatu][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/klaatu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP "Cheat Sheet cover image"
[2]: https://www.redhat.com/sysadmin/yaml-beginners
[3]: https://opensource.com/downloads/sqlite-cheat-sheet
[4]: https://sqlite.org/copyright.html
[5]: https://directory.fsf.org/wiki/License:PublicDomain
[6]: https://www.sqlite.org/purchase/license?
[7]: https://www.sqlite.org/download.html
[8]: https://www.mysql.com/
[9]: https://mariadb.org/
[10]: https://opensource.com/article/20/11/fossil
