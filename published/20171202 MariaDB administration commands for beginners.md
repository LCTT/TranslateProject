为初学者准备的 MariaDB 管理命令
======
之前我们学过了[在 Centos/RHEL 7 上安装 MariaDB 服务器并保证其安全 ][1]，使之成为了 RHEL/CentOS 7 的默认数据库。现在我们再来看看一些有用的 MariaDB 管理命令。这些都是些使用 MariaDB 最基础的命令，而且他们对 MySQL 也同样适合，因为 Mariadb 就是 MySQL 的一个分支而已。

**(推荐阅读：[在 RHEL/CentOS 上安装并配置 MongoDB][2])**

## MariaDB 管理命令

### 查看 MariaDB 安装的版本

要查看所安装数据库的当前版本，在终端中输入下面命令

```
$ mysql -version
```

该命令会告诉你数据库的当前版本。此外你也可以运行下面命令来查看版本的详细信息，

```
$ mysqladmin -u root -p version
```

### 登陆 mariadb

要登陆 mariadb 服务器，运行

```
$ mysql -u root -p
```

然后输入密码登陆

### 列出所有的数据库

要列出 maridb 当前拥有的所有数据库，在你登陆到 mariadb 中后运行

```
$ show databases;
```

### 创建新数据库

在 mariadb 中创建新数据库，登陆 mariabdb 后运行

```
$ create database dan;
```

若想直接在终端创建数据库，则运行

```
$ mysqladmin -u user -p create dan
```

这里，**dan** 就是新数据库的名词

### 删除数据库

要删除数据库，在已登陆的 mariadb 会话中运行

```
$ drop database dan;
```

此外你也可以运行，

```
$ mysqladmin -u root -p drop dan
```

**注意：-** 若在运行 mysqladmin 命令时提示 'access denied' 错误，这应该是由于我们没有给 root 授权。要对 root 授权，请参照第 7 点方法，只是要将用户改成 root。

### 创建新用户

为数据库创建新用户，运行

```
$ CREATE USER 'dan'@'localhost' IDENTIFIED BY 'password';
```

### 授权用户访问某个数据库

授权用户访问某个数据库，运行

```
$ GRANT ALL PRIVILEGES ON test。* to 'dan'@'localhost';
```

这会赋予用户 dan 对名为 test 的数据库完全操作的权限。我们也可以限定为用户只赋予 SELECT，INSERT，DELETE 权限。

要赋予访问所有数据库的权限，将 test 替换成 * .像这样。

```
$ GRANT ALL PRIVILEGES ON *。* to 'dan'@'localhost';
```

### 备份/导出 数据库

要创建单个数据库的备份，在终端窗口中运行下列命令，

```
$ mysqldump -u root -p database_name>db_backup.sql
```

若要一次性创建多个数据库的备份则运行，

```
$ mysqldump -u root -p - - databases db1 db2 > db12_backup.sql
```

要一次性导出多个数据库，则运行，

```
$ mysqldump -u root -p - - all-databases >all_dbs.sql
```

### 从备份中恢复数据库

要从备份中恢复数据库，运行

```
$ mysql -u root -p database_name<db_backup.sql
```

但这条命令成功的前提是预先没有存在同名的数据库。如果想要恢复数据库数据到已经存在的数据库中，则需要用到 'mysqlimport' 命令，

```
$ mysqlimport -u root -p database_name<db_backup.sql
```

### 更改 mariadb 用户的密码

本例中我们会修改 ‘root’ 的密码，但修改其他用户的密码也是一样的过程，

登陆 mariadb 并切换到 'mysql' 数据库，

```
$ mysql -u root -p
$ use mysql;
```

然后运行下面命令，

```
$ update user set password=PASSWORD( 'your_new_password_here') where User='root';
```

下一步，重新加载权限，

```
$ flush privileges;
```

然后退出会话。

我们的教程至此就结束了，在本教程中我们学习了一些有用的 MariaDB 管理命令。欢迎您的留言。


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/mariadb-administration-commands-beginners/

作者：[Shusain ][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/installing-configuring-mariadb-rhelcentos/
[2]:http://linuxtechlab.com/mongodb-installation-configuration-rhelcentos/
