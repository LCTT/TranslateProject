NoSQL： 如何在 Ubuntu 16.04 上安装 OrientDB
============================================================

 ![OrientDB NoSQL DBMS](https://www.unixmen.com/wp-content/uploads/2017/07/orientdb-696x318.png "orientdb") 

### 说明 - 非关系型数据库（NoSQL）和 OrientDB

通常在我们提及数据库的时候，想到的是两个主要的分类：使用用于用户和应用程序之间进行对接的一种被称为结构化查询语言（**S**tructured **Q**uery **L**anguage ，缩写 SQL）的关系型数据库管理系统（**R**elational **D**ata **b**ase **M**anagement **S**ystem，缩写 RDBMS） 以及非关系型数据库管理系统（non-relational database management systems 或称 NoSQL 数据库）。

这两种模型在如何处理（存储）数据的方面存在着巨大的差异。

#### 关系数据库管理系统

在关系模型中（如 MySQL，或者其分支 MariaDB），一个数据库是一个表的集合，其中每个表包含一个或多个以列组织的数据分类。数据库的每行包含一个唯一的数据实例，其分类由列定义。 

举个例子，想象一个包含客户的表。每一行相当于一个客户，而其中的每一列分别对应名字、地址以及其他所必须的信息。

而另一个表可能是包含订单、产品、客户、日期以及其它的种种。而这个数据库的使用者则可以获得一个满足其需要的视图，例如一个客户在一个特定的价格范围购买产品的报告。

#### 非关系型数据库管理系统

在非关系型数据库（或称为<ruby>不仅仅是数据库<rt>Not only SQL</rt></ruby>）管理系统中，数据库被设计为使用不同的方式存储数据，比如文档存储、键值对存储、图形关系存储以及其他方式存储。使用此种形式实现的数据库系统专门被用于大型数据库集群和大型 Web 应用。现今，非关系型数据库被用于某些大公司，如谷歌和亚马逊。

##### 文档存储数据库

文档存储数据库是将数据用文档的形式存储。这种类型的运用通常表现为 JavaScript 和 JSON，实际上，XML 和其他形式的存储也是可以被采用的。这里的一个例子就是 MongoDB。

##### 键值对存储数据库

这是一个由唯一的<ruby>键<rt>key</rt></ruby>配对一个<ruby>值<rt>value</rt></ruby>的简单模型。这个系统在高速缓存方面具有高性能和高度可扩展性。这里的例子包括 BerkeleyDB 和 MemacacheDB。

##### 图形关系数据库

正如其名，这种数据库通过使用<ruby>图<rt>graph</rt></ruby>模型存储数据，这意味着数据通过节点和节点之间的互连进行组织。这是一个可以随着时间的推移和使用而发展的灵活模型。这个系统应用于那些强调映射关系的地方。这里的例子有 IBM Graphs、Neo4j 以及 **OrientDB**。

### OrientDB

[OrientDB][3] 是一个多模式的非关系型数据库管理系统。正如开发它的公司所说的“_它是一个将图形关系与文档、键值对、反应性、面向对象和地理空间模型结合在一起的**可扩展的、高性能的数据库**_”。

OrientDB 还支持 SQL ，经过扩展可以用来操作树和图。

### 目标

这个教程旨在教会大家如何在运行 Ubuntu 16.04 的服务器上下载并配置 OrientDB 社区版。

### 下载 OrientDB

我们可以从最新的服务端上通过输入下面的指令来下载最新版本的 OrientDB。

```
$ wget -O orientdb-community-2.2.22.tar.gz http://orientdb.com/download.php?file=orientdb-community-2.2.22.tar.gz&os=linux
```

这里下载的是一个包含预编译二进制文件的压缩包，所以我们可以使用 `tar` 指令来操作解压它：

```
$ tar -zxf orientdb-community-2.2.22.tar.gz
```

将从中提取出来的文件夹整体移动到 `/opt`：

```
# mv orientdb-community-2.2.22 /opt/orientdb
```

### 启动 OrientDB 服务器

启动 OrientDB 服务器需要运行 `orientdb/bin/` 目录下的 shell 脚本：

```
# /opt/orientdb/bin/server.sh
```

如果你是第一次开启 OrientDB 服务器，安装程序还会显示一些提示信息，以及提醒你设置 OrientDB 的 root 用户密码：

```
+---------------------------------------------------------------+
| WARNING: FIRST RUN CONFIGURATION |
+---------------------------------------------------------------+
| This is the first time the server is running. Please type a |
| password of your choice for the 'root' user or leave it blank |
| to auto-generate it. |
| |
| To avoid this message set the environment variable or JVM |
| setting ORIENTDB_ROOT_PASSWORD to the root password to use. |
+---------------------------------------------------------------+

Root password [BLANK=auto generate it]: ********
Please confirm the root password: ********
```

在完成这些后，OrientDB 数据库服务器将成功启动：

```
INFO OrientDB Server is active v2.2.22 (build fb2b7d321ea8a5a5b18a82237049804aace9e3de). [OServer]
```

从现在开始，我们需要用第二个终端来与 OrientDB 服务器进行交互。

若要强制停止 OrientDB 执行 `Ctrl+C` 即可。

### 配置守护进程

此时，我们可以认为 OrientDB 仅仅是一串 shell 脚本，可以用编辑器打开 `/opt/orientdb/bin/orientdb.sh`：

```
# $EDITOR /opt/orientdb/bin/orientdb.sh
```

在它的首段，我们可以看到：

```
#!/bin/sh
# OrientDB service script
#
# Copyright (c) OrientDB LTD (http://orientdb.com/)

# chkconfig: 2345 20 80
# description: OrientDb init script
# processname: orientdb.sh

# You have to SET the OrientDB installation directory here
ORIENTDB_DIR="YOUR_ORIENTDB_INSTALLATION_PATH"
ORIENTDB_USER="USER_YOU_WANT_ORIENTDB_RUN_WITH"
```

我们需要配置`ORIENTDB_DIR` 以及 `ORIENTDB_USER`.

然后创建一个用户，例如我们创建一个名为 `orientdb` 的用户，我们需要输入下面的指令：

```
# useradd -r orientdb -s /sbin/nologin
```

`orientdb` 就是我们在 `ORIENTDB_USER` 处输入的用户。

再更改 `/opt/orientdb` 目录的所有权：

```
# chown -R orientdb:orientdb /opt/orientdb
```

改变服务器配置文件的权限：

```
# chmod 640 /opt/orientdb/config/orientdb-server-config.xml
```

#### 下载系统守护进程服务

OrientDB 的压缩包包含一个服务文件 `/opt/orientdb/bin/orientdb.service`。我们将其复制到 `/etc/systemd/system` 文件夹下：

```
# cp /opt/orientdb/bin/orientdb.service /etc/systemd/system
```

编辑该服务文件：

```
# $EDITOR /etc/systemd/system/orientdb.service
```

其中 `[service]` 内容块看起来应该是这样的：

```
[Service]
User=ORIENTDB_USER
Group=ORIENTDB_GROUP
ExecStart=$ORIENTDB_HOME/bin/server.sh
```

将其改成如下样式：

```
[Service]
User=orientdb 
Group=orientdb 
ExecStart=/opt/orientdb/bin/server.sh
```

保存并退出。

重新加载系统守护进程：

```
# systemctl daemon-reload
```

启动 OrientDB 并使其开机自启动：

```
# systemctl start orientdb
# systemctl enable orientdb
```

确认 OrientDB 的状态：

```
# systemctl status orientdb
```

上述指令应该会输出：

```
● orientdb.service - OrientDB Server
 Loaded: loaded (/etc/systemd/system/orientdb.service; disabled; vendor preset: enabled)
 Active: active (running) ...
```

流程就是这样了！OrientDB 社区版成功安装并且正确运行在我们的服务器上了。

### 总结

在这个指导中，我们看到了一些关系型数据库管理系统（RDBMS）以及非关系型数据库管理系统（NoSQL DBMS）的简单对照。我们也安装 OrientDB 社区版的服务器端并完成了其基础的配置。

这是我们部署完全的 OrientDB 基础设施的第一步，也是我们用于管理大型系统数据的起步。

--------------------------------------------------------------------------------

via: https://www.unixmen.com/nosql-install-orientdb-ubuntu-16-04/

作者：[Giuseppe Molica][a]
译者：[a92667237](https://github.com/a972667237)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:https://www.unixmen.com/wp-content/uploads/2017/07/orientdb.png
[3]:https://orientdb.com/
