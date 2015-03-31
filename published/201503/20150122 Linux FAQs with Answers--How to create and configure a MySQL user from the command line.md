Linux有问必答：如何通过命令行创建和设置一个MySQL用户
================================================================================

> **问题**：我想要在MySQL服务器上创建一个新的用户帐号，并且赋予他适当的权限和资源限制。如何通过命令行的方式来创建并且设置一个MySQL用户呢？

要访问一个MySQL服务器，你需要使用一个用户帐号登录其中方可进行。每个MySQL用户帐号都有许多与之相关连的属性，例如用户名、密码以及权限和资源限制。"权限"定义了特定用户能够在MySQL服务器中做什么，而"资源限制"为用户设置了一系列服务器资源的使用许可。创建或更新一个用户涉及到了对用户帐号所有属性的管理。

下面展示了如何在Linux中创建和设置一个MySQL用户。

首先以root身份登录到MySQL服务器中。

    $ mysql -u root -p

当验证提示出现的时候，输入MySQL的root帐号的密码。

![](https://farm8.staticflickr.com/7482/16024190060_fff53d8840_b.jpg)

### 创建一个MySQL用户 ###

使用如下命令创建一个用户名和密码分别为"myuser"和"mypassword"的用户。

    mysql> CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';

一旦用户被创建后，包括加密的密码、权限和资源限制在内的所有帐号细节都会被存储在一个名为**user**的表中，这个表则存在于**mysql**这个特殊的数据库里。

运行下列命令，验证帐号是否创建成功

    mysql> SELECT host, user, password FROM mysql.user WHERE user='myuser';

### 赋予MySQL用户权限 ###

一个新建的MySQL用户没有任何访问权限，这就意味着你不能在MySQL数据库中进行任何操作。你得赋予用户必要的权限。以下是一些可用的权限：

- **ALL**: 所有可用的权限
- **CREATE**: 创建库、表和索引
- **LOCK_TABLES**: 锁定表
- **ALTER**: 修改表
- **DELETE**: 删除表
- **INSERT**: 插入表或列
- **SELECT**: 检索表或列的数据
- **CREATE_VIEW**: 创建视图
- **SHOW_DATABASES**: 列出数据库
- **DROP**: 删除库、表和视图 

运行以下命令赋予"myuser"用户特定权限。

    mysql> GRANT <privileges> ON <database>.<table> TO 'myuser'@'localhost';

以上命令中，`<privileges>` 代表着用逗号分隔的权限列表。如果你想要将权限赋予任意数据库（或表），那么使用星号（*）来代替数据库（或表）的名字。

例如，为所有数据库/表赋予 CREATE 和 INSERT 权限：

    mysql> GRANT CREATE, INSERT ON *.* TO 'myuser'@'localhost';

验证给用户赋予的全权限：

    mysql> SHOW GRANTS FOR 'myuser'@'localhost';

![](https://farm8.staticflickr.com/7556/16209665261_923282bddd_c.jpg)

将全部的权限赋予所有数据库/表：

    mysql> GRANT ALL ON *.* TO 'myuser'@'localhost';

你也可以将用户现有的权限删除。使用以下命令废除"myuser"帐号的现有权限：

    mysql> REVOKE <privileges> ON <database>.<table> FROM 'myuser'@'localhost';

### 为用户添加资源限制 ###

在MySQL中，你可以为单独的用户设置MySQL的资源使用限制。可用的资源限制如下：

- **MAX\_QUERIES\_PER\_HOUR**: 允许的每小时最大请求数量
- **MAX\_UPDATES\_PER\_HOUR**: 允许的每小时最大更新数量
- **MAX\_CONNECTIONS\_PER\_HOUR**: 允许的每小时最大连接（译者注：[其与 MySQL全局变量： max\_user\_connections 共同决定用户到数据库的同时连接数量](http://dev.mysql.com/doc/refman/5.0/en/user-resources.html)）数量
- **MAX\_USER\_CONNECTIONS**: 对服务器的同时连接量

使用以下命令为"myuser"帐号增加一个资源限制：

    mysql> GRANT USAGE ON <database>.<table> TO 'myuser'@'localhost' WITH <resource-limits>;

在 `<resource-limits>` 中你可以指定多个使用空格分隔开的资源限制。

例如，增加 MAX_QUERIES_PER_HOUR 和 MAX_CONNECTIONS_PER_HOUR 资源限制：

    mysql> GRANT USAGE ON *.* TO 'myuser'@'localhost' WITH MAX_QUERIES_PER_HOUR 30 MAX_CONNECTIONS_PER_HOUR 6;

验证用户的资源限制：

    mysql> SHOW GRANTS FOR 'myuser'@'localhost;

![](https://farm8.staticflickr.com/7537/16025443759_5cb4177bc6_c.jpg)

创建和设置一个MySQL用户最后的一个重要步骤：

    mysql> FLUSH PRIVILEGES;

如此一来更改便生效了。现在MySQL用户帐号就可以使用了。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/create-configure-mysql-user-command-line.html

译者：[Ping](http://weibo.com/370321376)  
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出