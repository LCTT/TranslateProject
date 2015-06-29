translated

15 个有用的 MySQL/MariaDB 性能调整和优化技巧
================================================================================
MySQL是一个强大的开源关系型数据库管理系统或简称RDBMS。它被发布在1995年（20年前）。它采用的结构化查询语言在数据库管理中可能是最好的选择。最新的MySQL版本是5.6.25，2015年5月29日发行的。 

尽管有许多关于MySQL有趣的传闻，其中一个有趣的事实是，这个名字来自Michael Widenius(MySQL的创始人)的女儿。本文旨在向您展示一些有用的做法，以帮助您管理您的MySQL服务器。

![MySQL Performance Tuning](http://www.tecmint.com/wp-content/uploads/2015/06/MySQL-Performance-Tuning1.png)

MySQL性能优化

2009年4月，MySQL被Oracle收购。其结果导致一个叫MariaDB的社区成立。创建的主要原因是为了保持MySQL项目的自由。

今天，MySQL和MariaDB对于Web应用程序像，WordPress, Joomla, Magento和其他的，是使用最广泛的（但不是使用最多的）RDBMS。 


这篇文章将告诉你一些基本的，但有用如何优化MySQL / MariaDB性能的技巧。说明，本文假定您已经安装了MySQL或MariaDB。如果你仍然不知道如何在系统上安装它们，你可以按照以下说明去安装：

- [Installing LAMP on RHEL/CentOS 7][1]
- [Installing LAMP on Fedora 22][2]
- [Setting Up LAMP on Ubuntu 15.04][3]
- [Installing MariaDB on Debian 8][4]
- [Install MariaDB on Gentoo Linux][5]
- [Install MariaDB on Arch Linux][6]

**说明**: 在开始之前，不要盲目的接受这些建议。每个MySQL的设置是不同的，在进行任何更改之前需要慎重考虑。


你需要明白这些:

- MySQL/MariaDB配置文件位于 `/etc/my.cnf`. 每次需改此文件后你需要重新启动MySQL服务，以使新更改生效。
- 这篇文章使用MySQL 5.6版本 。

### 1. 启动 InnoDB 的`file-per-table` ###

首先，它是非常重要的对于解释InnoDB是一个存储引擎。MySQL和MariaDB使用的默认存储引擎是InnoDB。过去，MySQL使用系统表空间来保存数据库中的表和索引。这意味着服务器唯一的目的就是数据库处理，它的存储盘不用于其他的目的。

InnoDB提供了更灵活的方式，它把每个数据库的信息保存在一个`.ibd` 数据文件中。像“TRUNCATE”这样的操作可以更快地完成，当删除或截断一个数据库表时，你也可以回收未使用的空间。     

这种结构的另一个好处是，可以保留一些数据库表在一个单独的存储设备。这可以大大提高你磁盘的I/O负载。

MySQL 5.6及以上的版本默认启用`innodb_file_per_table`。你可以在/etc/my.cnf文件中看到。该指令看起来是这样的：

    innodb_file_per_table=1

### 2. 将MySQL数据库中的数据放在独立分区上 ###

**注意**: 此设置只能工作在MySQL上, 而不能在MariaDB上.

有时OS的读/写操作会减缓你MySQL服务器的性能，尤其是如果位于同一块磁盘上。因此，我建议你使用单独的磁盘（SSD最好）用于MySQL服务。

要完成这步，你需要将新的磁盘连接到您的计算机/服务器上。对于这篇文章，我会认为磁盘将被识别为/dev/sdb。

下一步将是准备新的分区：

    # fdisk /dev/sdb

现在按“N”来创建新的分区。接着按“P”，以使其创建为主分区。在此之后，设置分区号为1-4之间。之后，你可以选择分区大小。这里按enter。在接下来的步骤中，你需要配置分区的大小。

如果你希望使用全部的磁盘，按一次enter。否则，你需要手动设置新分区的大小。准备就绪后按“w”保存。现在，我们需要为我们的新分区创建一个文件系统。这可以很轻松的完成：

    # mkfs.ext4 /dev/sdb1

现在挂载新分区到文件夹下。在根目录下创建一个名为“ssd”的文件夹:

    # mkdir /ssd/

挂载新分区到刚才创建的文件夹下：

    # mount /dev/sdb1  /ssd/

你可以添加如下行在/etc/fstab文件中设置开机自动挂载：

    /dev/sdb1 /ssd ext3 defaults 0 0

现在我们移动MySQL到新磁盘中。首先停止服务：

    # service mysqld stop

我建议你​​停止Apache/nginx，以及以防止任何操作试图在数据库中写入：

    # service httpd stop
    # service nginx stop

现在我们复制完整的MySQL目录到新分区中:

    # cp /var/lib/mysql /ssd/ -Rp

这可能需要一段时间，具体取决于你的MySQL数据库的大小。一旦这个过程完成后重命名MySQL的目录：

    # mv /var/lib/mysql /var/lib/mysql-backup

然后创建一个链接：

    # ln -s /ssd/mysql /var/lib/mysql

现在启动你的MySQL和web服务:

    # service mysqld start
    # service httpd start
    # service nginx start

以后你的数据库将使用新的磁盘访问。

### 3. 优化InnoDB的缓冲区 ###

InnoDB引擎在内存中有一个缓冲数据和索引的缓冲区。这将有助于你在MySQL/MariaDB中的查询更快的执行。选择合适的内存大小对系统的查询来说是非常重要的，并且使你对系统的内存消耗也会有一个更好的认识。

下面是你需要考虑的:

- 其他的进程需要消耗多少内存，包括你的系统进程，表的数量，套接字缓冲区大小。 
- 你的服务器是否专用于MySQL还是你也运行其他非常消耗内存的服务。


在一个专用的机器上，你可能会使用60-70％的内存分配给`innodb_buffer_pool_size`。如果你打算在一个机器上运行多个服务，你应该重新考虑`innodb_buffer_pool_size`的内存大小。

你需要设置my.cnf中的此项:

    innodb_buffer_pool_size

### 4. 在MySQL中避免使用Swappiness ###

使用交换空间需要一个进程，当系统移动一部分内存到一个空闲的分区中就叫做“swap”。通常当你的系统用完物理内存后就会出现这种情况而不是释放一些RAM，然后将信息写进磁盘中。你可能已经猜测到磁盘比你的内存要慢得多。

默认情况下该选项已经启用:

    # sysctl vm.swappiness 
    
    vm.swappiness = 60

使用以下命令关闭swappiness:

    # sysctl -w vm.swappiness=0

### 5. 设置MySQL的最大连接数 ###

`max_connections`变量告诉你的服务器当前允许多少并发连接。MySQL/ MariaDB服务器允许的`max_connections` + 1为超级用户给定的值。当连接建立后，执行MySQL查询会有时间的限制 - 之后，它被关闭，新连接可以取代其位置。

请记住，太多的连接会导致RAM的使用量过高并且会锁定你的MySQL服务器。一般小网站需要100-200的连接数而较大可能需要500-800甚至更多。这里的值很大程度上取决于你的MySQL/MariaDB的使用情况。

你可以动态的改变`max_connections`的值而无需重启MySQL服务器:

    # mysql -u root -p
    mysql> set global max_connections := 300;

### 6. 配置MySQL的`thread_cache_size`变量 ###

 `thread_cache_size`变量用来设置你服务器缓存的线程数量。当客户端断开连接时，如果当前线程数小于`thread_cache_size`，他的线程将被放入缓存中。下一个请求将使用缓存池中的线程来完成。 

要提高服务器的性能，你可以设置`thread_cache_size`的值相对高一些。你可以通过以下方法来查看线程池的使用情况：:

    mysql> show status like 'Threads_created';
    mysql> show status like 'Connections';

你可以用以下公式来计算线程池的使用率:

    100 - ((Threads_created / Connections) * 100)

如果你得到一个较低的数字，这意味着大多数mysql连接请求使用新的线程，而不是从缓存加载。在这种情况下，你需要增加`thread_cache_size`。

但有一个好处是，`thread_cache_size`可以动态的改变而无需重启MySQL服务。你可以通过以下方式来实现：

    mysql> set global thread_cache_size = 16;

### 7.禁用MySQL的DNS反向查询 ###

当新的连接出现时，默认情况下MySQL/MariaDB会使用DNS来解析用户的IP地址/主机名，每个新的连接，它的IP都会被解析为主机名。然后，主机名又被反解析为IP来验证这两个是否一致。

当DNS服务器出现问题或者配置有问题时，解析会变得非常慢，这就是为什么要关闭DNS的反向解析，你可以在你的配置文件中添加以下选项去设定：

    [mysqld]
    # Skip reverse DNS lookup of clients
    skip-name-resolve

更改后需要重新启动你的MySQL服务器.

### 8. 配置MySQL的`query_cache_size`变量 ###

如果你有很多重复的查询或者不经常改变的数据 – 请使用缓存查询。 人们常常不理解`query_cache_size`的实际含义而将此值设置为几十兆，这实际上会降低服务器的性能。

背后的原因是，线程需要在更新过程中锁定缓存。通常设置为200-300 MB应该足够了。如果你的网站比较小的，你可以尝试给64M并在以后及时去增加。

添加以下选项到你的MySQL配置文件中:

    query_cache_type = 1
    query_cache_limit = 256K
    query_cache_min_res_unit = 2k
    query_cache_size = 80M

### 9. 配置`tmp_table_size`变量和`max_heap_table_size`变量 ###

这两个变量的大小相同都将帮助你避免将数据直接写入到磁盘中去。`tmp_table_size` 是内置内存表的最大空间，如果超出限值表的大小将被转换到磁盘上的MyISAM表。

这将影响数据库的性能。管理员通常建议在服务器上设置这两个值为RAM的每GB为64M。

    [mysqld]
    tmp_table_size= 64M
    max_heap_table_size= 64M

### 10. 开启MySQL慢速查询日志 ###

慢查询日志可以帮助你定位数据库的问题，并帮助您调试。在你的MySQL配置文件中添加以下选项来启用：

    slow-query-log = 1
    slow-query-log-file = /var/lib/mysql/mysql-slow.log
    long_query_time = 1

第一个变量开启慢查询日志，第二个告诉MySQL实际的日志文件存储在哪。使用`long_query_time`来定义MySQL查询完成时长。

### 11.检查MySQL的空闲连接 ###

空闲连接会消耗资源，应中断或者尽可能被刷新。这样的连接都在“sleep”状态并且会保持一段时间。通过以下命令可以查看空闲的连接：

    # mysqladmin processlist -u root -p | grep “Sleep”

这会显示处于睡眠状态的进程列表。当代码使用到数据库持久连接时会出现以下情况。使用PHP调用mysql_pconnect可以打开这个连接，即执行查询，删除认证最后关闭打开的连接。这会导致每个线程的缓冲区被保存在缓存中，直到该线程死亡。

首先你要做的就是检查代码并修复它。如果你不能访问正在运行的代码，你可以修改`wait_timeout`变量。默认值是28800秒，而你可以将其降低到60：

    wait_timeout=60

### 12. 为MySQL选择正确的文件系统 ###

选择正确的文件系统对数据库至关重要。在这里你需要考虑的最重要的事情是 - 数据的完整性，性能和易管理性。

按照MariaDB的建议，最好的文件系统是XFS，ext4或者BTRFS。所有这些都可以作为企业用的日志文件系统，它们可以使用非常大的文件和大容量存储。

关于这三个文件系统你可以在下面看到一些有用的信息：

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

这篇文章将详细介绍Linux文件系统的利与弊:

- [Linux Filesystem Explained][7]

### 13. 设置MySQL的`max_allowed_packet` ###

MySQL的数据被拆分成包发送。通常，单个报文被认为是一次发送到客户端。`max_allowed_pa​​cket`变量可以定义被发送包的大小。

此值设置得过低可能会导致查询速度变得非常慢，然后你会看到一个错误在MySQL的错误日志中。它建议你将数据包的大小设置成最大。

### 14. 测试MySQL的性能 ###

你应该定期检测MySQL/MariaDB的性能。这将帮助你查看资源的使用情况或需要调整某些变量的值。

有大量的测试工具可用，但我推荐你一个简单易用的。该工具被称为mysqltuner。

使用下面的命令下载并运行它：

    # wget https://github.com/major/MySQLTuner-perl/tarball/master
    # tar xf master
    # cd major-MySQLTuner-perl-993bc18/
    # ./mysqltuner.pl 

你将收到有关MySQL使用和推荐提示的详细报告。下面是在MariaDB上安装后的默认输出：

![MySQL Performance Tuning](http://www.tecmint.com/wp-content/uploads/2015/06/MySQL-Performance-Tuning.png)

### 15. 优化和修复MySQL数据库 ###

有时候MySQL/MariaDB数据库中的表很容易崩溃，尤其是当服务器意外关机时，数据库仍然被访问中或者在执行复制操作，文件系统会突然崩溃。然而，有一个免费的开源工具，被称为'mysqlcheck'的，它会自动检查，修复和优化Linux中数据库的所有表。

    # mysqlcheck -u root -p --auto-repair --check --optimize --all-databases
    # mysqlcheck -u root -p --auto-repair --check --optimize databasename

就是这样！我希望你已经发现了上述文章有用的地方，并帮助你优化你的MySQL服务器。一如往常，如果你有任何问题或意见，请在下面的评论部分提交。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/mysql-mariadb-performance-tuning-and-optimization/

作者：[Marin Todorov][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/marintodorov89/
[1]:http://www.tecmint.com/install-lamp-in-centos-7/
[2]:http://www.tecmint.com/install-lamp-linux-apache-mysql-php-on-fedora-22/
[3]:http://www.tecmint.com/install-lamp-on-ubuntu-15-04/
[4]:http://www.tecmint.com/install-mariadb-in-debian/
[5]:http://www.tecmint.com/install-lemp-in-gentoo-linux/
[6]:http://www.tecmint.com/install-lamp-in-arch-linux/
[7]:http://www.tecmint.com/linux-file-system-explained/
