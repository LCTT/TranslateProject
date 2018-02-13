循序渐进学习如何在 MariaDB 中配置主从复制
======

在我们前面的教程中，我们已经学习了 [如何安装和配置 MariaDB][1]，也学习了 [管理 MariaDB 的一些基础命令][2]。现在我们来学习，如何在 MariaDB 服务器上配置一个主从复制。

复制是用于为我们的数据库创 建多个副本，这些副本可以在其它数据库上用于运行查询，像一些非常繁重的查询可能会影响主数据库服务器的性能，或者我们可以使用它来做数据冗余，或者兼具以上两个目的。我们可以将这个过程自动化，即主服务器到从服务器的复制过程自动进行。执行备份而不影响在主服务器上的写操作。

因此，我们现在去配置我们的主-从复制，它需要两台安装了 MariaDB 的机器。它们的 IP 地址如下：

-  **主服务器 -** 192.168.1.120 **主机名 -** master.ltechlab.com
-  **从服务器 -** 192.168.1.130 **主机名 -** slave.ltechlab.com

MariaDB 安装到这些机器上之后，我们继续进行本教程。如果你需要安装和配置 MariaDB 的教程，请查看[**这个教程**][1]。

### 第 1 步 - 主服务器配置

我们现在进入到 MariaDB 中的一个命名为 `important` 的数据库，它将被复制到我们的从服务器。为开始这个过程，我们编辑名为 `/etc/my.cnf` 的文件，它是 MariaDB 的配置文件。

```
$ vi /etc/my.cnf
```

在这个文件中找到 `[mysqld]` 节，然后输入如下内容：

```
[mysqld]
log-bin
server_id=1
replicate-do-db=important
bind-address=192.168.1.120
```

保存并退出这个文件。完成之后，需要重启 MariaDB 服务。

```
$ systemctl restart mariadb
```

接下来，我们登入我们的主服务器上的 Mariadb 实例。

```
$ mysql -u root -p
```

在它上面创建一个命名为 `slaveuser` 的为主从复制使用的新用户，然后运行如下的命令为它分配所需要的权限：

```
STOP SLAVE;
GRANT REPLICATION SLAVE ON *.* TO  'slaveuser'@'%' IDENTIFIED BY 'iamslave';
FLUSH PRIVILEGES;
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
```

**注意：** 我们配置主从复制需要 `MASTER_LOG_FILE` 和 `MASTER_LOG_POS` 的值，它可以通过 `show master status` 来获得，因此，你一定要确保你记下了它们的值。

这些命令运行完成之后，输入 `exit` 退出这个会话。

### 第 2 步 - 创建一个数据库备份，并将它移动到从服务器上

现在，我们需要去为我们的数据库 `important` 创建一个备份，可以使用 `mysqldump` 命令去备份。

```
$ mysqldump -u root -p important > important_backup.sql
```

备份完成后，我们需要重新登录到 MariaDB 数据库，并解锁我们的表。

```
$ mysql -u root -p
$ UNLOCK TABLES;
```

然后退出这个会话。现在，我们移动我们刚才的备份到从服务器上，它的 IP 地址是：192.168.1.130。

在主服务器上的配置已经完成了，现在，我们开始配置从服务器。

### 第 3 步：配置从服务器

我们再次去编辑（从服务器上的） `/etc/my.cnf` 文件，找到配置文件中的 `[mysqld]` 节，然后输入如下内容：

```
[mysqld]
server-id = 2
replicate-do-db=important
[ …]
```

现在，我们恢复我们主数据库的备份到从服务器的 MariaDB 上，运行如下命令：

```
$ mysql -u root -p < /data/ important_backup.sql
```

当这个恢复过程结束之后，我们将通过登入到从服务器上的 MariaDB，为数据库 `important` 上的用户 'slaveuser' 授权。

```
$ mysql -u root -p
```

```
GRANT ALL PRIVILEGES ON important.* TO 'slaveuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

接下来，为了这个变化生效，重启 MariaDB。

```
$ systemctl restart mariadb
```

### 第 4 步：启动复制

记住，我们需要 `MASTER_LOG_FILE` 和 `MASTER_LOG_POS` 变量的值，它可以通过在主服务器上运行 `SHOW MASTER STATUS` 获得。现在登入到从服务器上的 MariaDB，然后通过运行下列命令，告诉我们的从服务器它应该去哪里找主服务器。

```
STOP SLAVE;
CHANGE MASTER TO MASTER_HOST= '192.168.1.110′, MASTER_USER='slaveuser', MASTER_PASSWORD='iamslave', MASTER_LOG_FILE='mariadb-bin.000001′, MASTER_LOG_POS=460;
SLAVE START;
SHOW SLAVE STATUS\G;
```

**注意：** 请根据你的机器的具体情况来改变主服务器的配置。

### 第 5 步：测试复制

我们将在我们的主服务器上创建一个新表来测试主从复制是否正常工作。因此，登入到主服务器上的 MariaDB。

```
$ mysql -u root -p
```

选择数据库为 `important`：

```
use important;
```

在这个数据库上创建一个名为 `test` 的表：

```
create table test (c int);
```

然后在这个表中插入一些数据：

```
insert into test (c) value (1);
```

检索刚才插入的值是否存在：

```
select * from test;
```

你将会看到刚才你插入的值已经在这个新建的表中了。

现在，我们登入到从服务器的数据库中，查看主从复制是否正常工作。

```
$ mysql -u root -p
$ use important;
$ select * from test;
```

你可以看到与前面在主服务器上的命令输出是一样的。因此，说明我们的主从服务工作正常，没有发生任何问题。

我们的教程结束了，请在下面的评论框中留下你的查询/问题。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/creating-master-slave-replication-mariadb/

作者：[Shusain][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:https://linux.cn/article-8320-1.html
[2]:https://linux.cn/article-9306-1.html
