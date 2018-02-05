MyCLI ：一个支持自动补全和语法高亮的 MySQL/MariaDB 客户端
====

MyCLI 是一个易于使用的命令行客户端，可用于受欢迎的数据库管理系统 MySQL、MariaDB 和 Percona，支持自动补全和语法高亮。它是使用 `prompt_toolkit` 库写的，需要 Python 2.7、3.3、3.4、3.5 和 3.6 的支持。MyCLI 还支持通过 SSL 安全连接到 MySQL 服务器。

#### MyCLI 的特性

*   当你第一次使用它的时候，将会自动创建一个文件 `~/.myclirc`。
*   当输入 SQL 的关键词和数据库中的表、视图和列时，支持自动补全。
*   默认情况下也支持智能补全，能根据上下文的相关性提供补全建议。

比如：

```
SELECT * FROM <Tab> - 这将显示出数据库中的表名。
SELECT * FROM users WHERE <Tab> - 这将简单的显示出列名称。
```

*   通过使用 `Pygents` 支持语法高亮
*   支持 SSL 连接
*   提供多行查询支持
*   它可以将每一个查询和输出记录到一个文件中（默认情况下禁用）。
*   允许保存收藏一个查询（使用 `\fs 别名` 保存一个查询，并可使用 `\f 别名` 运行它）。
*   支持 SQL 语句执行和表查询计时
*   以更吸引人的方式打印表格数据

### 如何在 Linux 上为 MySQL 和 MariaDB 安装 MyCLI

在 Debian/Ubuntu 发行版上，你可以很容易的像下面这样使用 [`apt` 命令][6] 来安装 MyCLI 包：

```
$ sudo apt-get update
$ sudo apt-get install mycli
```

同样，在 Fedora 22+ 上也有 MyCLI 的可用包，你可以像下面这样使用 [`dnf` 命令][7] 来安装它：

```
$ sudo dnf install mycli
```

对于其他 Linux 发行版，比如 RHEL/CentOS，你需要使用 Python 的 `pip` 工具来安装 MyCLI。首先，使用下面的命令来安装 pip：

```
$ sudo yum install pip	
```

安装好 `pip` 以后，你可以像下面这样安装 MyCLI：

```
$ sudo pip install mycli
```

### 在 Linux 中如何使用 MyCLI 连接 MySQL 和 MariaDB

安装好 MyCLI 以后，你可以像下面这样使用它：

```
$ mycli -u root -h localhost 
```

#### 自动补全

对于关键词和 SQL 函数可以进行简单的自动补全：

![MySQL Auto Completion](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Auto-completion.png)

*MySQL 自动补全*

#### 智能补全

当输入 `FROM` 关键词以后会进行表名称的补全：

![MySQL Smart Completion](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Smart-Completion.png)

*MySQL 智能补全*

#### 别名支持

当表的名称设置别名以后，也支持列名称的补全：

![MySQL Alias Support](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Alias-Support.png)

*MySQL 别名支持*

#### 语法高亮

支持 MySQL 语法高亮：

![MySQL Syntax Highlighting](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Syntax-Highlighting.png)

*MySQL 语法高亮*

#### 格式化 SQL 的输出

MySQL 的输出会通过 [`less` 命令][8] 进行格式化输出：

![MySQL Formatted Output](https://www.tecmint.com/wp-content/uploads/2017/06/MySQL-Pager.png)

*MySQL 格式化输出*

要登录 MySQL 并同时选择数据库，你可以使用和下面类似的命令：

```
$ mycli local_database
$ mycli -h localhost -u root app_db
$ mycli mysql://amjith@localhost:3306/django_poll
```

更多使用选项，请输入：

```
$ mycli --help
```

MyCLI 主页： [http://mycli.net/index][9]

记得阅读一些关于 MySQL 管理的有用文章：

1.  [在 Linux 中用于数据库管理的 20 个 MySQL（Mysqladmin）命令][1]
2.  [如何在 Linux 中更改默认的 MySQL/MariaDB 数据目录][2]
3.  [在 Linux 中监测 MySQL 性能的 4 个实用命令行工具][3]
4.  [如何在 Linux 中更改 MySQL 或 MariaDB 的 Root 密码][4]
5.  [MySQL 备份和恢复数据库管理命令 ][5]

这就是本文的全部内容了。在这篇指南中，我们展示了如何通过一些简单的命令在 Linux 中安装和使用 MyCLI。记得通过下面的反馈表向我们分享你关于这篇文章的想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili是一名 Linux 和 F.O.S.S 的爱好者，未来的 Linux 系统管理员、网站开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并乐于分享知识。

---------

via: https://www.tecmint.com/mycli-mysql-client-with-auto-completion-syntax-highlighting/

作者：[Aaron Kili][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

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
