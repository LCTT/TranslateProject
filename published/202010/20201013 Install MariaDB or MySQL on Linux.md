[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12743-1.html)
[#]: subject: (Install MariaDB or MySQL on Linux)
[#]: via: (https://opensource.com/article/20/10/mariadb-mysql-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在 Linux 上安装 MariaDB 或 MySQL
======

> 开始在 Linux 系统上使用开源的 SQL 数据库吧。

![](https://img.linux.net.cn/data/attachment/album/202010/22/144122hkkqrs2dhi9c7kif.jpg)

[MariaDB][2] 和 [MySQL][3] 都是使用 SQL 的开源数据库，并且共享相同的初始代码库。MariaDB 是 MySQL 的替代品，你可以使用相同的命令（`mysql`）与 MySQL 和 MariaDB 数据库进行交互。因此，本文同时适用于 MariaDB 和 MySQL。

### 安装 MariaDB

你可以使用你的 Linux 发行版的包管理器安装 MariaDB。在大多数发行版上，MariaDB 分为服务器包和客户端包。服务器包提供了数据库“引擎”，即 MariaDB 在后台运行（通常在物理服务器上）的部分，它监听数据输入或数据输出请求。客户端包提供了 `mysql` 命令，你可以用它来与服务器通信。

在 RHEL、Fedora、CentOS 或类似的发行版上：

```
$ sudo dnf install mariadb mariadb-server
```

在 Debian、Ubuntu、Elementary 或类似的发行版上：

```
$ sudo apt install mariadb-client mariadb-server
```

其他操作系统可能会以不同的打包系统封装 MariaDB，所以你可能需要搜索你的软件仓库来了解你的发行版的维护者是如何提供它的。

### 启动 MariaDB

因为 MariaDB 被设计为部分作为数据库服务器，它可以在一台计算机上运行，并从另一台计算机上进行管理。只要你能访问运行它的计算机，你就可以使用 `mysql` 命令来管理数据库。在写这篇文章时，我在本地计算机上运行了 MariaDB，但你同样可与远程系统上托管的 MariaDB 数据库进行交互。

在启动 MariaDB 之前，你必须创建一个初始数据库。在初始化其文件结构时，你应该定义你希望 MariaDB 使用的用户。默认情况下，MariaDB 使用当前用户，但你可能希望它使用一个专用的用户帐户。你的包管理器可能为你配置了一个系统用户和组。使用 `grep` 查找是否有一个 `mysql` 组：

```
$ grep mysql /etc/group
mysql:x:27:
```

你也可以在 `/etc/passwd` 中寻找这个专门的用户，但通常情况下，有组就会有用户。如果没有专门的 `mysql` 用户和组，可以在 `/etc/group` 中寻找一个明显的替代品（比如 `mariadb`）。如果没有，请阅读你的发行版文档来了解 MariaDB 是如何运行的。

假设你的安装使用 `mysql`，初始化数据库环境：

```
$ sudo mysql_install_db --user=mysql
Installing MariaDB/MySQL system tables in '/var/lib/mysql'...
OK
[...]
```

这一步的结果显示了接下来你必须执行的配置 MariaDB 的任务：

```
PLEASE REMEMBER TO SET A PASSWORD FOR THE MariaDB root USER !
To do so, start the server, then issue the following commands:

'/usr/bin/mysqladmin' -u root password 'new-password'
'/usr/bin/mysqladmin' -u root -h $(hostname) password 'new-password'

Alternatively you can run:
'/usr/bin/mysql_secure_installation'

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.
```

使用你的发行版的初始化系统启动 MariaDB：

```
$ sudo systemctl start mariadb
```

在启动时启用 MariaDB 服务器：

```
$ sudo systemctl enable --now mariadb
```

现在你已经有了一个 MariaDB 服务器，为它设置一个密码：

```
mysqladmin -u root password 'myreallysecurepassphrase'
mysqladmin -u root -h $(hostname) password 'myreallysecurepassphrase'
```

最后，如果你打算在生产服务器上使用它，请在上线前运行 `mysql_secure_installation` 命令。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/mariadb-mysql-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://mariadb.org/
[3]: https://www.mysql.com/
