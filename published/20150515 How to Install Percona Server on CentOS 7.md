如何在 CentOS 7 上安装 Percona服务器
================================================================================

在这篇文章中我们将了解关于 Percona 服务器，一个开源的MySQL，MariaDB的替代品。InnoDB的数据库引擎使得Percona 服务器非常有吸引力，如果你需要的高性能，高可靠性和高性价比的解决方案，它将是一个很好的选择。

在下文中将介绍在CentOS 7上Percona 服务器的安装，以及备份当前数据，配置的步骤和如何恢复备份。

### 1.什么是Percona，为什么使用它 ###

Percona是一个MySQL，MariaDB数据库的开源替代品，它是MySQL的一个分支，相当多的改进和独特的功能使得它比MYSQL更可靠，性能更强，速度更快，它与MYSQL完全兼容，你甚至可以在Oracle的MySQL与Percona之间使用复制。

#### 在Percona中独具特色的功能 ####

- 分区适应哈希搜索
- 快速校验算法
- 缓冲池预加载
- 支持FlashCache

#### MySQL企业版和Percona中的特有功能 ####

- 从不同的服务器导入表
- PAM认证
- 审计日志
- 线程池

现在，你肯定很兴奋地看到这些好的东西整合在一起，我们将告诉你如何安装和对Percona Server做基本配置。

### 2. 备份你的数据库 ###

接下来，在命令行下使用SQL命令创建一个mydatabases.sql文件，来重建或恢复salesdb和employeedb数据库，根据你的设置替换数据库名称，如果没有安装MySQL则跳过此步：

	mysqldump -u root -p --databases employeedb salesdb > mydatabases.sql

复制当前的配置文件，如果你没有安装MYSQL也可跳过：

    cp my.cnf my.cnf.bkp

### 3.删除之前的SQL服务器 ###

停止MYSQL/MariaDB，如果它们还在运行：

    systemctl stop mysql.service
    
卸载MariaDB和MYSQL：

    yum remove MariaDB-server MariaDB-client MariaDB-shared mysql mysql-server

移动重命名放在/var/lib/mysql当中的MariaDB文件。这比仅仅只是移除更为安全快速，这就像2级即时备份。:)

    mv /var/lib/mysql /var/lib/mysql_mariadb
    
### 4.使用二进制包安装Percona ###

你可以在众多Percona安装方法中选择，在CentOS中使用Yum或者RPM包安装通常是更好的主意，所以这些是本文介绍的方式，下载源文件编译后安装在本文中并没有介绍。

从Yum仓库中安装：

首先，你需要设置Percona的Yum库:

    yum install http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm

接下来安装Percona:

    yum install Percona-Server-client-56 Percona-Server-server-56

上面的命令安装Percona的服务器和客户端、共享库，可能需要Perl和Perl模块，以及其他依赖的需要，如DBI::MySQL。如果这些尚未安装，可能需要安装更多的依赖包。

使用RPM包安装：

我们可以使用wget命令下载所有的rpm包:

    wget -r -l 1 -nd -A rpm -R "*devel*,*debuginfo*" \
    http://www.percona.com/downloads/Percona-Server-5.5/Percona-Server-5.5.42-37.1/binary/redhat/7/x86_64/

使用rpm工具，一次性安装所有的rpm包：

    rpm -ivh Percona-Server-server-55-5.5.42-rel37.1.el7.x86_64.rpm \
    Percona-Server-client-55-5.5.42-rel37.1.el7.x86_64.rpm \
    Percona-Server-shared-55-5.5.42-rel37.1.el7.x86_64.rpm

注意在上面命令语句中最后的反斜杠'\'（只是为了换行方便）。如果您安装单独的软件包，记住要解决依赖关系，在安装客户端之前要先安装共享包，在安装服务器之前请先安装客户端。

### 5.配置Percona服务器 ###

#### 恢复之前的配置 ####

当我们从MariaDB迁移过来时，你可以将之前的my.cnf的备份文件恢复回来。

    cp /etc/my.cnf.bkp /etc/my.cnf

#### 创建一个新的my.cnf文件 ####

如果你需要一个适合你需求的新的配置文件或者你并没有备份配置文件，你可以使用以下方法，通过简单的几步生成新的配置文件。

下面是Percona-server软件包自带的my.cnf文件

    # Percona Server template configuration

    [mysqld]
    #
    # Remove leading # and set to the amount of RAM for the most important data
    # cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
    # innodb_buffer_pool_size = 128M
    #
    # Remove leading # to turn on a very important data integrity option: logging
    # changes to the binary log between backups.
    # log_bin
    #
    # Remove leading # to set options mainly useful for reporting servers.
    # The server defaults are faster for transactions and fast SELECTs.
    # Adjust sizes as needed, experiment to find the optimal values.
    # join_buffer_size = 128M
    # sort_buffer_size = 2M
    # read_rnd_buffer_size = 2M
    datadir=/var/lib/mysql
    socket=/var/lib/mysql/mysql.sock

    # Disabling symbolic-links is recommended to prevent assorted security risks
    symbolic-links=0

    [mysqld_safe]
    log-error=/var/log/mysqld.log
    pid-file=/var/run/mysqld/mysqld.pid

根据你的需要配置好my.cnf后，就可以启动该服务了：

    systemctl restart mysql.service

如果一切顺利的话，它已经准备好执行SQL命令了，你可以用以下命令检查它是否已经正常启动：

    mysql -u root -p -e 'SHOW VARIABLES LIKE "version_comment"'

如果你不能够正常启动它，你可以在**/var/log/mysql/mysqld.log**中查找原因，该文件可在my.cnf的[mysql_safe]的log-error中设置。

	tail /var/log/mysql/mysqld.log

你也可以在/var/lib/mysql/文件夹下查找格式为[主机名].err的文件，就像下面这个例子：

    tail /var/lib/mysql/centos7.err

如果还是没找出原因，你可以试试strace：

    yum install strace && systemctl stop mysql.service && strace -f -f mysqld_safe
    
上面的命令挺长的，输出的结果也相对简单，但绝大多数时候你都能找到无法启动的原因。

### 6.保护你的数据 ###

好了，你的关系数据库管理系统已经准备好接收SQL查询，但是把你宝贵的数据放在没有最起码安全保护的服务器上并不可取，为了更为安全最好使用mysql_secure_install来安装，这个工具可以帮助你删除未使用的默认功能，并设置root的密码，限制使用此用户进行访问。只需要在shell中执行该命令，并参照屏幕上的说明操作。

	mysql_secure_install

### 7.还原备份 ###

如果您参照之前的设置，现在你可以恢复数据库，只需再用mysqldump一次。

    mysqldump -u root -p < mydatabases.sql
    
恭喜你，你刚刚已经在你的CentOS上成功安装了Percona，你的服务器已经可以正式投入使用；你可以像使用MySQL一样使用它，你的服务器与它完全兼容。

### 总结 ###

为了获得更强的性能你需要对配置文件做大量的修改，但这里也有一些简单的选项来提高机器的性能。当使用InnoDB引擎时，将innodb_file_per_table设置为on，它将在一个文件中为每个表创建索引表，这意味着每个表都有它自己的索引文件，它使系统更强大和更容易维修。

可以修改innodb_buffer_pool_size选项，InnoDB应该有足够的缓存池来应对你的数据集，大小应该为当前可用内存的70%到80%。

将innodb-flush-method设置为O_DIRECT，关闭写入高速缓存，如果你使用了RAID，这可以提升性能，因为在底层已经完成了缓存操作。

如果你的数据并不是十分关键并且并不需要对数据库事务正确执行的四个基本要素完全兼容，可以将innodb_flush_log_at_trx_commit设置为2，这也能提升系统的性能。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/percona-server-centos-7/

作者：[Carlos Alberto][a]
译者：[FatJoe123](https://github.com/FatJoe123)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/carlosal/
