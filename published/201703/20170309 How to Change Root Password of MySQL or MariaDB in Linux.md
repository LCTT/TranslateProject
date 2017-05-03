在 Linux 中修改 MySQL 或 MariaDB 的 Root 密码
============================================================

如果你是第一次[安装 MySQL 或 MariaDB][1]，你可以执行 `mysql_secure_installation` 脚本来实现基本的安全设置。

其中的一个设置是数据库的 root 密码 —— 该密码必须保密，并且只在必要的时候使用。如果你需要修改它（例如，当数据库管理员换了人 —— 或者被解雇了！）。

**建议阅读：**[在 Linux 中恢复 MySQL 或 MariaDB 的 Root 密码][2]

这篇文章迟早会派上用场的。我们讲说明怎样来在 Linux 中修改 MySQL 或 MariaDB 数据库服务器的 root 密码。

尽管我们会在本文中使用 MariaDB 服务器，但本文中的用法说明对 MySQL 也有效。

### 修改 MySQL 或 MariaDB 的 root 密码

你知道 root 密码，但是想要重置它，对于这样的情况，让我们首先确定 MariaDB 正在运行：

```
------------- CentOS/RHEL 7 and Fedora 22+ ------------- 
# systemctl is-active mariadb
------------- CentOS/RHEL 6 and Fedora -------------
# /etc/init.d/mysqld status
```

[
 ![Check MySQL Status](http://www.tecmint.com/wp-content/uploads/2017/03/Check-MySQL-Status.png) 
][3]

*检查 MysQL 状态*

如果上面的命令返回中没有 `active` 这个关键词，那么该服务就是停止状态，你需要在进行下一步之前先启动数据库服务：

```
------------- CentOS/RHEL 7 and Fedora 22+ ------------- 
# systemctl start mariadb
------------- CentOS/RHEL 6 and Fedora -------------
# /etc/init.d/mysqld start
```

接下来，我们将以 root 登录进数据库服务器：

```
# mysql -u root -p
```

为了兼容不同版本，我们将使用下面的声明来更新 mysql 数据库的用户表。注意，你需要将 `YourPasswordHere` 替换为你为 root 选择的新密码。

```
MariaDB [(none)]> USE mysql;
MariaDB [(none)]> UPDATE user SET password=PASSWORD('YourPasswordHere') WHERE User='root' AND Host = 'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;
```

要验证是否操作成功，请输入以下命令退出当前 MariaDB 会话。

```
MariaDB [(none)]> exit;
```

然后，敲回车。你现在应该可以使用新密码连接到服务器了。

[
 ![Change MySQL/MariaDB Root Password](http://www.tecmint.com/wp-content/uploads/2017/03/Change-MySQL-Root-Password.png) 
][4]

*修改 MysQL/MariaDB Root 密码*


##### 小结

在本文中，我们说明了如何修改 MariaDB / MySQL 的 root 密码 —— 或许你知道当前所讲的这个方法，也可能不知道。

像往常一样，如果你有任何问题或者反馈，请尽管使用下面的评论框来留下你宝贵的意见或建议，我们期待着您的留言。

--------------------------------------------------------------------------------

作者简介：

Gabriel Cánepa是一位来自阿根廷圣路易斯的 Villa Mercedes 的 GNU/Linux 系统管理员和 web 开发者。他为世界范围内的主要的消费产品公司工作，也很钟情于在他日常工作的方方面面中使用 FOSS 工具来提高生产效率。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/change-mysql-mariadb-root-password/

作者：[Gabriel Cánepa][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/install-mariadb-in-centos-7/
[2]:http://www.tecmint.com/reset-mysql-or-mariadb-root-password/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-MySQL-Status.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Change-MySQL-Root-Password.png
[5]:http://www.tecmint.com/author/gacanepa/
[6]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[7]:http://www.tecmint.com/free-linux-shell-scripting-books/
