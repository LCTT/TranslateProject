15 个有用的 MySQL/MariaDB 性能调整和优化技巧
================================================================================
MySQL 是一个强大的开源关系数据库管理系统或简称 RDBMS。它于 1995 年发布（20年前）。它采用结构化查询语言，这可能是数据库内容管理中最流行的选择。最新的 MySQL 版本是5.6.25，于 2015 年 5 月 29 日发行。

关于 MySQL 一个有趣的事实是它的名字来自于 Michael Widenius（MySQL 的创始人）的女儿。尽管有许多关于 MySQL 有趣的传闻，本文旨在向你展示一些有用的实践，以帮助你管理你的 MySQL 服务器。

![MySQL 性能优化](http://www.tecmint.com/wp-content/uploads/2015/06/MySQL-Performance-Tuning1.png)

MySQL 性能优化

2009 年 4 月，MySQL 被 Oracle 收购。其结果是成立了一个叫 MariaDB 的 MySQL 社区。创建的主要原因是为了保持 MySQL 项目在通用公共许可证下自由。

今天，MySQL 和 MariaDB 是用于类似 WordPress、Joomla、Magento 和其他 web 应用程序最广泛的 RDMS 之一（如果不是最多的）。

这篇文章将告诉你一些基本的，但非常有用的关于如何优化 MySQL/MariaDB 性能的技巧。注意，本文假定您已经安装了 MySQL 或 MariaDB。如果你仍然不知道如何在系统上安装它们，你可以按照以下说明去安装：

- [在 RHEL/CentOS 7 上安装 LAMP][1]
- [在 Fedora 22 上安装 LAMP][2]
- [在 Ubuntu 15.04 安装 LAMP][3]
- [在 Debian 8 上安装 MariaDB][4]
- [在 Gentoo Linux 上安装 MariaDB][5]
- [在 Arch Linux 上安装 MariaDB][6]

**重要**： 在开始之前，不要盲目的接受这些建议。每个 MySQL 设置都是不同的，在进行任何更改之前需要慎重考虑。

你需要明白这些：

- MySQL/MariaDB 配置文件位于 `/etc/my.cnf`。 每次更改此文件后你需要重启 MySQL 服务，以使更改生效。
- 这篇文章使用 MySQL 5.6 版本。

### 1. 启用 InnoDB 的 file-per-table ###

首先，解释清楚 InnoDB 是一个存储引擎很重要。MySQL 和 MariaDB 使用 InnoDB 作为默认存储引擎。以前，MySQL 使用系统表空间来保存数据库中的表和索引。这意味着服务器唯一的目的就是数据库处理，它们的存储盘不用于其它目的。

InnoDB 提供了更灵活的方式，它把每个数据库的信息保存在一个 `.ibd` 数据文件中。每个 .idb 文件表示它自己的表空间。通过这样的方式可以更快地完成类似 “TRUNCATE” 的数据库操作，当删除或截断一个数据库表时，你也可以回收未使用的空间。     

这样配置的另一个好处是你可以在一个单独的存储设备保留某些数据库表。这可以大大提高你磁盘的 I/O 负载。

MySQL 5.6及以上的版本默认启用 `innodb_file_per_table`。你可以在 /etc/my.cnf 文件中看到。该指令看起来是这样的：

    innodb_file_per_table=1

### 2. 在独立分区上保存 MySQL 数据库数据 ###

**注意**：此设置只在 MySQL 上有效, 在 MariaDB 上无效。

有时候操作系统的读/写会降低你 MySQL 服务器的性能，尤其是如果位于同一块磁盘上。因此，我建议你使用单独的磁盘（最好是 SSD）用于 MySQL 服务。

要完成这步，你需要将新的磁盘连接到你的计算机/服务器上。对于这篇文章，我假定磁盘挂在到 /dev/sdb。

下一步是准备新的分区：

    # fdisk /dev/sdb

现在按 “N” 来创建新的分区。接着按 “P”，使其创建为主分区。在此之后，从 1-4 设置分区号。之后，你可以选择分区大小。这里按 enter。在下一步，你需要配置分区的大小。

如果你希望使用全部的磁盘，再按一次 enter。否则，你可以手动设置新分区的大小。准备就绪后按 “w” 保存更改。现在，我们需要为我们的新分区创建一个文件系统。这可以用下面命令轻松地完成：

    # mkfs.ext4 /dev/sdb1

现在我们会挂载新分区到一个目录。我在根目录下创建了一个名为 “ssd” 的目录：

    # mkdir /ssd/

挂载新分区到刚才创建的目录下：

    # mount /dev/sdb1  /ssd/

你可以在 /etc/fstab 文件中添加如下行设置为开机自动挂载：

    /dev/sdb1 /ssd ext3 defaults 0 0

现在我们移动 MySQL 到新磁盘中。首先停止 MySQL 服务：

    # service mysqld stop

我建议你​​同时停止 Apache/nginx，以防止任何试图写入数据库的操作：

    # service httpd stop
    # service nginx stop

现在复制整个 MySQL 目录到新分区中:

    # cp /var/lib/mysql /ssd/ -Rp

这可能需要一段时间，具体取决于你的 MySQL 数据库的大小。一旦这个过程完成后重命名 MySQL 目录：

    # mv /var/lib/mysql /var/lib/mysql-backup

然后创建一个符号链接：

    # ln -s /ssd/mysql /var/lib/mysql

现在启动你的 MySQL 和 web 服务：

    # service mysqld start
    # service httpd start
    # service nginx start

以后你的数据库将使用新的磁盘访问。

### 3. 优化使用 InnoDB 的缓冲池 ###

InnoDB 引擎在内存中有一个缓冲池用于缓存数据和索引。这当然有助于你更快地执行 MySQL/MariaDB 查询语句。选择合适的内存大小需要一些重要的决策并对系统的内存消耗有很好的认识。

下面是你需要考虑的:

- 其它的进程需要消耗多少内存。这包括你的系统进程，页表，套接字缓冲。 
- 你的服务器是否专门用于 MySQL 还是你也运行其它非常消耗内存的服务。

在一个专用的机器上，你可能会把 60-70％ 的内存分配给 `innodb_buffer_pool_size`。如果你打算在一个机器上运行更多的服务，你应该重新考虑专门用于 `innodb_buffer_pool_size` 的内存大小。

你需要设置 my.cnf 中的此项:

    innodb_buffer_pool_size

### 4. 在 MySQL 中避免使用 Swappiness ###

Swapping 是一个当系统移动部分内存到一个称为 “swap” 的特殊磁盘空间时运行的进程。通常当你的系统用完物理内存后就会出现这种情况，系统将信息写入磁盘而不是释放一些 RAM。正如你猜测的磁盘比你的 RAM 要慢得多。

默认启用了该选项：

    # sysctl vm.swappiness 
    
    vm.swappiness = 60

运行以下命令关闭 swappiness：

    # sysctl -w vm.swappiness=0

### 5. 设置 MySQL 的最大连接数 ###

`max_connections` 指令告诉你当前你的服务器允许多少并发连接。MySQL/ MariaDB 服务器允许有特级权限的用户 max_connections + 1 的连接数。只有当执行 MySQL 查询的时候才会建立连接，执行完成后会关闭连接并被新的连接取代。

请记住，太多的连接会导致 RAM 的使用量过高并且会锁住你的 MySQL 服务器。一般小网站需要 100-200 的连接数而较大可能需要 500-800 甚至更多。这里的值很大程度上取决于你 MySQL/MariaDB 的使用情况。

你可以动态地改变 `max_connections` 的值而无需重启MySQL服务器：

    # mysql -u root -p
    mysql> set global max_connections := 300;

### 6. 配置 MySQL `thread_cache_size` ###

 `thread_cache_size` 指令用来设置你服务器缓存的线程数量。当客户端断开连接时，如果当前线程数小于thread_cache_size，他的线程将被放入缓存中。下一个请求通过使用缓存池中的线程来完成。 

要提高服务器的性能，你可以设置 `thread_cache_size` 的值相对高一些。你可以通过以下方法来查看线程缓存命中率：

    mysql> show status like 'Threads_created';
    mysql> show status like 'Connections';

你可以用以下公式来计算线程池的命中率：

    100 - ((Threads_created / Connections) * 100)

如果你得到一个较低的数字，这意味着大多数 mysql 连接请求使用新的线程，而不是从缓存加载。在这种情况下，你需要增加 `thread_cache_size`。

这里有一个好处是可以动态地改变 `thread_cache_size` 而无需重启 MySQL 服务。你可以通过以下方式来实现：

    mysql> set global thread_cache_size = 16;

### 7. 禁用 MySQL 的 DNS 反向查询 ###

默认情况下当新的连接出现时，MySQL/MariaDB 会进行 DNS 查询解析用户的 IP 地址/主机名。对于每个客户端连接，它的 IP 都会被解析为主机名。然后，主机名又被反解析为 IP 来验证两者是否一致。

当 DNS 配置错误或服务器出现问题时，这很可能会导致延迟。这就是为什么要关闭 DNS 的反向查询的原因，你可以在你的配置文件中添加以下选项去设定：

    [mysqld]
    # Skip reverse DNS lookup of clients
    skip-name-resolve

更改后你需要重启 MySQL 服务。

### 8. 配置 MySQL `query_cache_size` ###

如果你有很多重复的查询并且数据不经常改变 – 请使用缓存查询。 人们常常不理解 `query_cache_size` 的实际含义而将此值设置为 GB，这实际上会降低服务器的性能。

背后的原因是，在更新过程中线程需要锁定缓存。通常设置为 200-300 MB应该足够了。如果你的网站比较小的，你可以尝试给 64M 并在以后及时去增加。

在你的 MySQL 配置文件中添加以下设置：

    query_cache_type = 1
    query_cache_limit = 256K
    query_cache_min_res_unit = 2k
    query_cache_size = 80M

### 9. 配置 `tmp_table_size` 和 `max_heap_table_size` ###

这两个变量的大小应该相同并帮助你避免将数据直接写入到磁盘中去。`tmp_table_size` 是内置内存表的最大空间。如果表的大小超出限值将会被转换为磁盘上的 MyISAM 表。

这会影响数据库的性能。管理员通常建议在服务器上设置这两个值为每 GB RAM 64M。

    [mysqld]
    tmp_table_size= 64M
    max_heap_table_size= 64M

### 10. 启用 MySQL 慢查询日志 ###

记录慢查询可以帮助你定位数据库中的问题并帮助你调试。这可以通过在你的 MySQL 配置文件中添加以下值来启用：

    slow-query-log = 1
    slow-query-log-file = /var/lib/mysql/mysql-slow.log
    long_query_time = 1

第一个变量启用慢查询日志，第二个告诉 MySQL 实际的日志文件存储位置。使用 `long_query_time` 来定义完成 MySQL 查询用时多少认为是长查询。

### 11. 检查 MySQL 的空闲连接 ###

空闲连接会消耗资源，可以的话应该被中断或者刷新。空闲连接是指处于 “sleep” 状态并且会保持很长一段时间。你可以通过运行以下命令查看空闲连接：

    # mysqladmin processlist -u root -p | grep “Sleep”

这会显示处于睡眠状态的进程列表。当代码使用持久连接到数据库时会出现以下情况。使用 PHP 调用 mysql_pconnect 可以打开这个连接，执行完查询之后，删除认证并保持连接为打开状态。这会导致每个线程的缓冲被保存在内存中，直到该线程死亡。

首先你要做的就是检查代码并修复它。如果你不能访问正在运行的代码，你可以修改 `wait_timeout` 变量。默认值是 28800 秒，而你可以安全地将其降低到 60 ：

    wait_timeout=60

### 12. 为 MySQL 选择正确的文件系统 ###

选择正确的文件系统对数据库至关重要。在这里你需要考虑的最重要的事情是 - 数据的完整性，性能和易管理性。

按照 MariaDB 的建议，最好的文件系统是XFS、ext4 和 Btrfs。它们都是可以使用超大文件和大容量存储卷的企业级日志文件系统。

下面你可以找到一些关于这三个文件系统的有用信息：

注：表格
<table cellspacing="0" border="0">
<colgroup width="179"></colgroup>
<colgroup width="85" span="3"></colgroup>
<tbody>
<tr>
<td align="center" height="18" style="border: 1px solid #000000;"><b><span style="color: black; font-family: Arial;">Filesystems</span></b></td>
<td align="center" style="border: 1px solid #000000;"><b><span style="color: black; font-family: Arial;">XFS</span></b></td>
<td align="center" style="border: 1px solid #000000;"><b><span style="color: black; font-family: Arial;">Ext4</span></b></td>
<td align="center" style="border: 1px solid #000000;"><b><span style="color: black; font-family: Arial;">Btrfs</span></b></td>
</tr>
<tr class="alt">
<td align="center" height="18" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">Maximum filesystem size</span></td>
<td align="center" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">8EB</span></td>
<td align="center" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">1EB</span></td>
<td align="center" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">16EB</span></td>
</tr>
<tr>
<td align="center" height="18" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">Maximum file size</span></td>
<td align="center" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">8EB</span></td>
<td align="center" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">16TB</span></td>
<td align="center" style="border: 1px solid #000000;"><span style="color: black; font-family: Arial;">16EB</span></td>
</tr>
</tbody>
</table>

我们的这篇文章详细介绍了 Linux 文件系统的利与弊:

- [Linux 文件系统解析][7]

### 13. 设置 MySQL `max_allowed_packet` ###

MySQL 把数据拆分成包。通常发送到客户端的一行作为一个包。`max_allowed_pa​​cket` 变量定义了可以被发送的最大的包。

此值设置得过低可能会导致查询速度变得非常慢，然后你会在 MySQL 的错误日志看到一个错误。建议将该值设置为最大包的大小。

### 14. 测试 MySQL 的性能优化 ###

你应该定期检查 MySQL/MariaDB 的性能。这将帮助你了解资源的使用情况是否发生了改变或需要进行改进。

有大量的测试工具可用，但我推荐你一个简单易用的。该工具被称为 mysqltuner。

使用下面的命令下载并运行它：

    # wget https://github.com/major/MySQLTuner-perl/tarball/master
    # tar xf master
    # cd major-MySQLTuner-perl-993bc18/
    # ./mysqltuner.pl 

你将收到有关 MySQL 使用的详细报告和推荐提示。下面是默认 MariaDB 安装的输出样例：

![MySQL 性能优化](http://www.tecmint.com/wp-content/uploads/2015/06/MySQL-Performance-Tuning.png)

### 15. 优化和修复 MySQL 数据库 ###

有时候 MySQL/MariaDB 数据库中的表很容易崩溃，尤其是服务器意外关机、文件系统突然崩溃或复制过程中仍然访问数据库。幸运的是，有一个称为 'mysqlcheck' 的免费开源工具，它会自动检查、修复和优化 Linux 中数据库的所有表。

    # mysqlcheck -u root -p --auto-repair --check --optimize --all-databases
    # mysqlcheck -u root -p --auto-repair --check --optimize databasename

就是这些！我希望上述文章对你有用，并帮助你优化你的 MySQL 服务器。一如往常，如果你有任何疑问或评论，请在下面的评论部分提交。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/mysql-mariadb-performance-tuning-and-optimization/

作者：[Marin Todorov][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[ictlyh](https://github.com/ictlyh)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/marintodorov89/
[1]:http://www.tecmint.com/install-lamp-in-centos-7/
[2]:http://www.tecmint.com/install-lamp-linux-apache-mysql-php-on-fedora-22/
[3]:http://www.tecmint.com/install-lamp-on-ubuntu-15-04/
[4]:http://www.tecmint.com/install-mariadb-in-debian/
[5]:http://www.tecmint.com/install-lemp-in-gentoo-linux/
[6]:http://www.tecmint.com/install-lamp-in-arch-linux/
[7]:http://www.tecmint.com/linux-file-system-explained/
