如何重置 MySQL 或 MariaDB 的 Root 密码
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Reset-MySQL-Or-MariaDB-Root-Password-720x340.png)

几个月前，我在[Ubuntu 18.04 上安装了 LAMP][1]。今天，我尝试以 root 用户身份登录数据库，但我完全忘记了密码。经过一阵 Google 搜索并浏览一些文章后，我成功重置了密码。对于那些想知道如何做到这一点的人，这个简短的教程解释了如何在类 Unix 操作系统中重置 MySQL 或 MariaDB Root 密码。

### 重置 MySQL 或 MariaDB Root 密码

首先，停止数据库。

如果你使用 MySQL，请输入以下命令并下按回车键。

```
$ sudo systemctl stop mysql
```

对于 MariaDB：

```
$ sudo systemctl stop mariadb
```

接下来，使用以下命令在没有权限检查的情况下重新启动数据库：

```
$ sudo mysqld_safe --skip-grant-tables &
```

这里， `--skip-grant-tables` 选项让你在没有密码和所有权限的情况下进行连接。如果使用此选项启动服务器，它还会启用 `--skip-networking` 选项，这用于防止其他客户端连接到数据库服务器。并且，`&` 符号用于在后台运行命令，因此你可以在以下步骤中输入其他命令。请注意，上述命令很危险，并且你的数据库会变得不安全。你应该只在短时间内运行此命令以重置密码。

接下来，以 root 用户身份登录 MySQL/MariaDB 服务器：

```
$ mysql
```

在 **mysql >** 或 **MariaDB [(none)] >** 提示符下，运行以下命令重置 root 用户密码：

```
UPDATE mysql.user SET Password=PASSWORD('NEW-PASSWORD') WHERE User='root';
```

使用你自己的密码替换上述命令中的 **NEW-PASSWORD**。

然后，输入以下命令退出 mysql 控制台。

```
FLUSH PRIVILEGES;
exit
```

最后，关闭之前使用 `--skip-grant-tables` 选项运行的数据库。为此，运行：

```
$ sudo mysqladmin -u root -p shutdown
```

系统将要求你输入在上一步中设置的 MySQL/MariaDB 用户密码。

现在，使用以下命令正常启动 MySQL/MariaDB 服务：

```
$ sudo systemctl start mysql
```

对于 MariaDB：

```
$ sudo systemctl start mariadb
```

使用以下命令验证密码是否确实已更改：

```
$ mysql -u root -p
```

今天就是这些了。还有更多好东西。敬请期待！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-reset-mysql-or-mariadb-root-password/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/install-apache-mariadb-php-lamp-stack-ubuntu-16-04/
