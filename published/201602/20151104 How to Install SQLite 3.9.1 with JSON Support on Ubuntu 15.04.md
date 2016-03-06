如何在 Ubuntu 15.04 上安装带 JSON 支持的 SQLite 3.9.1
================================================================================
欢迎阅读我们关于SQLite 的文章，SQLite 是当今世界上使用最广泛的 SQL 数据库引擎，它基本不需要配置，不需要设置或管理就可以运行。SQLite 是一个是开放领域（public-domain）的软件，是一个关系型数据库管理系统（RDBMS），用来在一个大数据表中存储用户定义的记录。对于数据存储和管理来说，数据库引擎要处理复杂的查询命令，这些命令可能会从多个表获取数据然后生成报告和数据总结。

SQLite 是一个非常小、轻量级，不需要独立的服务进程或系统。它可以运行在 UNIX，Linux，Mac OS-X，Android，iOS 和 Windows 上，已经被大量的软件程序使用，如 Opera, Ruby On Rails, Adobe System, Mozilla Firefox, Google Chrome 和 Skype。

### 1) 基本需求: ###

在绝大部分支持 SQLite 的平台上安装 SQLite 基本上并没有复杂的要求。

让我们在 CLI  或者 Secure Shell 上使用 sudo 或者 root 权限登录 Ubuntu 服务器。然后更新系统，这样子就可以让操作系统的软件更新到新版本。

在 Ubuntu 上，使用如下的命令来更新系统的软件源。

    # apt-get update

如果你要在新安装的 Ubuntu 上部署 SQLite，那么你需要安装一些基础的系统管理工具，如 wget, make, unzip, gcc。

要安装 wget，可以使用下面的命令，如果系统提示的话，输入 Y ：

    # apt-get install wget make gcc

### 2) 下载 SQLite ###

要下载 SQLite ，最好是在 [SQLite 官网][1]下载，如下所示

![SQLite download](http://blog.linoxide.com/wp-content/uploads/2015/10/Selection_014.png)

你也可以直接复制资源的连接然后在命令行使用 wget 下载，如下所示：

    # wget https://www.sqlite.org/2015/sqlite-autoconf-3090100.tar.gz

![wget SQLite](http://blog.linoxide.com/wp-content/uploads/2015/10/23.png)

下载完成之后，解压缩安装包，切换工作目录到解压缩后的 SQLite 目录，使用下面的命令。

    # tar -zxvf sqlite-autoconf-3090100.tar.gz

### 3) 安装 SQLite ###

现在我们要开始安装、配置刚才下载的 SQLite。在 Ubuntu 上编译、安装 SQLite，运行配置脚本：

    root@ubuntu-15:~/sqlite-autoconf-3090100# ./configure –prefix=/usr/local

![SQLite Installation](http://blog.linoxide.com/wp-content/uploads/2015/10/35.png)

配置要上面的安装位置前缀（prefix）之后，运行下面的命令编译安装包。
```
root@ubuntu-15:~/sqlite-autoconf-3090100# make
source='sqlite3.c' object='sqlite3.lo' libtool=yes \
DEPDIR=.deps depmode=none /bin/bash ./depcomp \
/bin/bash ./libtool --tag=CC --mode=compile gcc -DPACKAGE_NAME=\"sqlite\" -DPACKAGE_TARNAME=\"sqlite\" -DPACKAGE_VERSION=\"3.9.1\" -DPACKAGE_STRING=\"sqlite\ 3.9.1\" -DPACKAGE_BUGREPORT=\"http://www.sqlite.org\" -DPACKAGE_URL=\"\" -DPACKAGE=\"sqlite\" -DVERSION=\"3.9.1\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\" -DHAVE_FDATASYNC=1 -DHAVE_USLEEP=1 -DHAVE_LOCALTIME_R=1 -DHAVE_GMTIME_R=1 -DHAVE_DECL_STRERROR_R=1 -DHAVE_STRERROR_R=1 -DHAVE_POSIX_FALLOCATE=1 -I. -D_REENTRANT=1 -DSQLITE_THREADSAFE=1 -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_RTREE -g -O2 -c -o sqlite3.lo sqlite3.c
```

运行完上面的命令之后，要在 Ubuntu 上完成 SQLite 的安装得运行下面的命令。

    # make install

![SQLite Make Install](http://blog.linoxide.com/wp-content/uploads/2015/10/44.png)

### 4) 测试 SQLite 安装 ###

要保证 SQLite 3.9 安装成功了，运行下面的命令。

    # sqlite3

SQLite 的版本会显示在命令行。

![Testing SQLite Installation](http://blog.linoxide.com/wp-content/uploads/2015/10/53.png)

### 5) 使用 SQLite ###

SQLite 很容易上手。要获得详细的使用方法，在SQLite 控制台里输入下面的命令。

    sqlite> .help

这里会显示全部可用的命令和详细说明。

![SQLite Help](http://blog.linoxide.com/wp-content/uploads/2015/10/62.png)

现在开始最后一部分，使用一点 SQLite 命令创建数据库。

要创建一个新的数据库需要运行下面的命令。

    # sqlite3 test.db

然后创建一张新表。

    sqlite> create table memos(text, priority INTEGER);

接着使用下面的命令插入数据。

    sqlite> insert into memos values('deliver project description', 15);
    sqlite> insert into memos values('writing new artilces', 100);

要查看插入的数据可以运行下面的命令。

    sqlite> select * from memos;
    deliver project description|15
    writing new artilces|100

或者使用下面的命令离开。

    sqlite> .exit

![Using SQLite3](http://blog.linoxide.com/wp-content/uploads/2015/10/73.png)

### 结论 ###

通过本文你可以了解如果安装支持 JSON1 的最新版的 SQLite，SQLite 从 3.9.0 开始支持 JSON1。这是一个非常棒的库，可以内嵌到应用程序，利用它可以很有效而轻量的管理资源。我们希望你能觉得本文有所帮助，请随意地向我们反馈你遇到的问题和困难。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-sqlite-json-ubuntu-15-04/

作者：[Kashif Siddique][a]
译者：[oska874](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:https://www.sqlite.org/download.html
