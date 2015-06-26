translation by strugglingyouth

15 Useful MySQL/MariaDB Performance Tuning and Optimization Tips
================================================================================
MySQL is a powerful open source Relational Database Management System or in short RDBMS. It was released back in 1995 (20 years old). It uses Structured Query Language which is probably the most popular choice for managing content within a database. The latest MySQL version is 5.6.25 and was released on 29 May 2015.

An interesting fact about MySQL is the fact that the name comes from Michael Widenius’s (MySQL’s creator) daughter My. Even though there are plenty of interesting facts about MySQL, this article is meant to show you some useful practices to help you manage your MySQL server.

![MySQL Performance Tuning](http://www.tecmint.com/wp-content/uploads/2015/06/MySQL-Performance-Tuning1.png)

MySQL Performance Tuning

In April 2009 the MySQL project was bought by Oracle. As a result a MySQL community fork called MariaDB was created. The main reason for creating the fork was to keep the project free under the General Public License.

Today MySQL and MariaDB are one of the most (if not the most) frequently used RDBMS used for web applications such as WordPress, Joomla, Magento and others.

This article will show you some basic, yet useful tips how to optimize the fine tune the performance of MySQL/MariaDB. Please keep in mind that this article assumes that you already have MySQL or MariaDB installed. If you are still wondering how to install them on your system, you can follow our extensive guides here:

- [Installing LAMP on RHEL/CentOS 7][1]
- [Installing LAMP on Fedora 22][2]
- [Setting Up LAMP on Ubuntu 15.04][3]
- [Installing MariaDB on Debian 8][4]
- [Install MariaDB on Gentoo Linux][5]
- [Install MariaDB on Arch Linux][6]

**Important**: Before we start – do not accept this suggestions blindly. Each MySQL setup is unique and requires additional thought, before making any changes.

Things you need to know:

- MySQL/MariaDB configuration file is located in `/etc/my.cnf`. Every time you modify this file you will need to restart the MySQL service so the new changes can take effect.
- For writing this article MySQL version 5.6 has been used as template.

### 1. Enable InnoDB file-per-table ###

First it is important to explain that InnoDB is a storage engine. MySQL and MariaDB use InnoDB as default storage engine. In the past MySQL used to keep database tables and indexes in a system tablespace. This approach was meant for servers which sole purpose is database processing and their storage disk is not used for any other purposes.

The InnoDB provides more flexible approach and each database information is kept in a `.ibd` data file. Each .ibd file represents a tablespace of its own. That way database operations such as “TRUNCATE” can be completed faster and you may also reclaim unused space when dropping or truncating a database table.

Another benefit of this configuration is the fact that you can keep some of the database tables in a separate storage device. This can greatly improve the I/O load on your disks.

The innodb_file_per_table is enabled by default in MySQL 5.6 and above. You can see that in /etc/my.cnf file. The directive looks like this:

    innodb_file_per_table=1

### 2. Store MySQL Database Data on Separate Partition ###

**Note**: This setup only works with MySQL, but not with MariaDB.

Sometimes OS read/writes can slow down the performance of your MySQL server, especially if located on same hard drive. Instead, I would recommend using separate hard drive (preferably SSD) for the MySQL service.

To complete, this you will need to attach the new drive to your computer/server. For the purpose of this article, I will assume that the drive will be under /dev/sdb.

The next step is to prepare the new drive:

    # fdisk /dev/sdb

Now press “n” to create new partition. Next press “p” to make the new partition primary. After that, set the partition number from 1-4. After that you will select the partition size. Press enter here. On the next step you will need to configure the size of the partition.

If you wish to use the entire disk press enter once more. Otherwise you can manually set the size of the new partition. When ready press “w” to write the changes. Now we will need to create a filesystem for our new partition. This can be easily done with:

    # mkfs.ext4 /dev/sdb1

Now we will mount our new partition in a folder. I have named my folder “ssd” and created in the root directory:

    # mkdir /ssd/

We are ready to mount the new partition we just made in the new folder:

    # mount /dev/sdb1  /ssd/

You can perform the mount at startup by adding the following line in /etc/fstab file.

    /dev/sdb1 /ssd ext3 defaults 0 0

Now you are ready to move MySQL to the new disk. First stop the MySQL service with:

    # service mysqld stop

I would recommend you stopping Apache/nginx as well to prevent any attempts to write in the databases:

    # service httpd stop
    # service nginx stop

Now copy the entire MySQL directory in the new drive:

    # cp /var/lib/mysql /ssd/ -Rp

This may take a while depending on the site of your MySQL databases. Once this process is complete rename the MySQL directory:

    # mv /var/lib/mysql /var/lib/mysql-backup

Next we will create a symlink.

    # ln -s /ssd/mysql /var/lib/mysql

Now you are ready to start your MySQL and web service:

    # service mysqld start
    # service httpd start
    # service nginx start

At this point your MySQL databases will be accessed from the new drive.

### 3. Optimizing InnoDB buffer pool Usage ###

The InnoDB engine has a buffer pool used for caching data and indexes in memory. This of course will help your MySQL/MariaDB queries be executed significantly faster. Choosing the proper size here requires some very important decisions and good knowledge on your system’s memory consumption.

Here is what you need to consider:

- How much memory you need for other processes. This includes your system processes, page tables, socket buffers.
- Is your server dedicated for MySQL or you will be running other memory hungry services.

On a dedicated box, you would probably want to give about 60-70% of the memory to the innodb_buffer_pool_size. If you plan on running more services on a single box, you should re-consider the amount of memory you dedicate for your innodb_buffer_pool_size.

The value that you should edit in my.cnf is:

    innodb_buffer_pool_size

### 4. Avoid Swappiness in MySQL ###

Swapping is process that occurs when system moves part of memory to a special disk space called “swap”. The event usually appears when your system runs out of physical memory and instead of freeing up some RAM, the system pushed the information into disk. As you might have guess the disk is much slower than your RAM.

By default the option is enabled:

    # sysctl vm.swappiness 
    
    vm.swappiness = 60

To disable swappiness, run the following command:

    # sysctl -w vm.swappiness=0

### 5. Set MySQL Max Connections ###

The max_connections directive tells your server how many concurrent connections are permitted. The MySQL/MariaDB server allows the value given in max_connections + 1 for user with SUPER privileges. The connection is opened only for the time MySQL query is executed – after that it is closed and new connection can take its place.

Keep in mind that too many connections can cause high RAM usage and lock up your MySQL server. Usually small websites will require between 100-200 connections while larger may require 500-800 or even more. The value you apply here strongly depends on your particular MySQL/MariaDB usage.

You can dynamically change the value of `max_connections`, without having to restart the MySQL service by running:

    # mysql -u root -p
    mysql> set global max_connections := 300;

### 6. Configure MySQL thread_cache_size ###

The `thread_cache_size` directive sets the amount of threads that your server should cache. As the client disconnects, his threads are put in the cache if they are less than the thread_cache_size. Further requests are completed by using the threads stored in the cache.

To improve your performance you can set the thread_cache_size to a relatively high number. To find the thread cache hit rate, you can use the following technique:

    mysql> show status like 'Threads_created';
    mysql> show status like 'Connections';

Now use the following formula to calculate the thread cache hit rate percentage:

    100 - ((Threads_created / Connections) * 100)

If you get a low number, it means that most of the new mysql connections are starting new thread instead of loading from cache. You will surely want to increase the thread_cache_size in such cases.

The good thing here is that the thread_cache_size can be dynamically changed without having to restart the MySQL service. You can achieve this by running:

    mysql> set global thread_cache_size = 16;

### 7. Disable MySQL Reverse DNS Lookups ###

By default MySQL/MariaDB perform a DNS lookup of the user’s IP address/Hostname from which the connection is coming. For each client connection, the IP address is checked by resolving it to a host name. After that the host name is resolved back to an IP to verify that both match.

This unfortunately may cause delays in case of badly configured DNS or problems with DNS server. This is why you can disable the reverse DNS lookup by adding the following in your configuration file:

    [mysqld]
    # Skip reverse DNS lookup of clients
    skip-name-resolve

You will have to restart the MySQL service after applying these changes.

### 8. Configure MySQL query_cache_size ###

If you have many repetitive queries and your data does not change often – use query cache. People often do not understand the concept behind the `query_cache_size` and set this value to gigabytes, which can actually cause degradation in the performance.

The reason behind that is the fact that threads need to lock the cache during updates. Usually value of 200-300 MB should be more than enough. If your website is relatively small, you can try giving the value of 64M and increase in time.

You will have to add the following settings in the MySQL configuration file:

    query_cache_type = 1
    query_cache_limit = 256K
    query_cache_min_res_unit = 2k
    query_cache_size = 80M

### 9. Configure tmp_table_size and max_heap_table_size ###

Both directives should have the same size and will help you prevent disk writes. The `tmp_table_size` is the maximum amount of size of internal in-memory tables. In case the limit in question is exceeded the table will be converted to on-disk MyISAM table.

This will affect the database performance. Administrators usually recommend giving 64M for both values for every GB of RAM on the server.

    [mysqld]
    tmp_table_size= 64M
    max_heap_table_size= 64M

### 10. Enable MySQL Slow query Logs ###

Logging slow queries can help you determine issues with your database and help you debug them. This can be easily enabled by adding the following values in your MySQL configuration file:

    slow-query-log = 1
    slow-query-log-file = /var/lib/mysql/mysql-slow.log
    long_query_time = 1

The first directive enables the logging of slow queries, while the second one tells MySQL where to store the actual log file. Use `long_query_time` to define the amount of time that is considered long for MySQL query to be completed.

### 11. Check for MySQL idle Connections ###

Idle connections consume resources and should be interrupted or refreshed when possible. Such connections are in “sleep” state and usually stay that way for long period of time. To look for idled connections you can run the following command:

    # mysqladmin processlist -u root -p | grep “Sleep”

This will show you list of processes that are in sleep state. The event appears when the code is using persistent connection to the database. When using PHP this event can appear when using mysql_pconnect which opens the connection, after that executes queries, removes the authentication and leaves the connection open. This will cause any per-thread buffers to be kept in memory until the thread dies.

The first thing you would do here is to check the code and fix it. If you don’t have access to the code that is being ran, you can change the `wait_timeout` directive. The default value is 28800 seconds, while you can safely decrease it to something like 60:

    wait_timeout=60

### 12. Choosing Right MySQL Filesystem ###

Choosing the right filesystem is vital for your databases. Most important things you need to consider here are – data integrity, performance and ease of administration.

As per MariaDB’s recommendations, the best file systems are XFS, Ext4 and Btrfs. All of them are enterprise journaling filesystems that can be used with very large files and large storage volumes.

Below you can find some useful information about the three filesystems:

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

The pros and cons of the Linux filesystems have been extensively covered in our article:

- [Linux Filesystem Explained][7]

### 13. Set MySQL max_allowed_packet ###

MySQL splits data into packets. Usually a single packet is considered a row that is sent to a client. The `max_allowed_packet` directive defines the maximum size of packet that can be sent.

Setting this value too low can cause a query to stall and you will receive an error in your MySQL error log. It is recommended to set the value to the size of your largest packet.

### 14. Check MySQL Performance Tuning ###

Measuring your MySQL/MariaDB performance is something that you should do on regular basis. This will help you see if something in the resource usage changes or needs to be improved.

There are plenty of tools available for benchmarking, but I would like to suggest you one that is simple and easy to use. The tool is called mysqltuner.

To download and run it, use the following set of commands:

    # wget https://github.com/major/MySQLTuner-perl/tarball/master
    # tar xf master
    # cd major-MySQLTuner-perl-993bc18/
    # ./mysqltuner.pl 

You will receive a detailed report about your MySQL usage and recommendation tips. Here is a sample output of default MariaDB installation:

![MySQL Performance Tuning](http://www.tecmint.com/wp-content/uploads/2015/06/MySQL-Performance-Tuning.png)

### 15. Optimize and Repair MySQL Databases ###

Sometimes MySQL/MariaDB database tables get crashed quite easily, especially when unexpected server shut down, sudden file system corruption or during copy operation, when database is still accessed. Surprisingly, there is a free open source tool called ‘mysqlcheck‘, which automatically check, repair and optimize databases of all tables in Linux.

    # mysqlcheck -u root -p --auto-repair --check --optimize --all-databases
    # mysqlcheck -u root -p --auto-repair --check --optimize databasename

That’s it! I hope you have found the above article useful and help you tune up your MySQL server. As always if you have any further questions or comments, please submit them in the comment section below.

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
