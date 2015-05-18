How to Install Percona Server on CentOS 7
================================================================================
In this article we are going to learn about percona server, an opensource drop-in replacement for MySQL and also for MariaDB. The InnoDB database engine make it very attractive and a good alternative if you need performance, reliability and a cost efficient solution

In the following sections I am going to cover the installation of the percona server on the CentOS 7, I will also cover the steps needed to make backup of your current data, configuration and how to restore your backup.

### Table of contents ###

1. What is and why use percona
1. Backup your databases
1. Remove previous SQL server
1. Installing Percona binaries
1. Configuring Percona
1. Securing your environment
1. Restore your backup

### 1. What is and why use Percona ###

Percona is an opensource alternative to the MySQL and MariaDB databases, it's a fork of the MySQL with many improvements and unique features that makes it more reliable, powerful and faster than MySQL, and yet is fully compatible with it, you can even use replication between Oracle's MySQL and Percona.

#### Features exclusive to Percona ####

- Partitioned Adaptive Hash Search
- Fast Checksum Algorithm
- Buffer Pool Pre-Load
- Support for FlashCache

#### MySQL Enterprise and Percona specific features ####

- Import Tables From Different Servers
- PAM authentication
- Audit Log
- Threadpool

Now that you are pretty excited to see all these good things together, we are going show you how to install and do basic configuration of Percona Server.

### 2. Backup your databases ###

The following, command creates a mydatabases.sql file with the SQL commands to recreate/restore salesdb and employeedb databases, replace the databases names to reflect your setup, skip if this is a brand new setup

    mysqldump -u root -p --databases employeedb salesdb > mydatabases.sql

Copy the current configuration file, you can also skip this in fresh setups

    cp my.cnf my.cnf.bkp

### 3. Remove your previous SQL Server ###

Stop the MySQL/MariaDB if it's running.

    systemctl stop mysql.service

Uninstall MariaDB and MySQL

    yum remove MariaDB-server MariaDB-client MariaDB-shared mysql mysql-server

Move / Rename the MariaDB files in **/var/lib/mysql**, it's a safer and faster than just removing, it's like a 2nd level instant backup. :)

    mv /var/lib/mysql /var/lib/mysql_mariadb

### 4. Installing Percona binaries ###

You can choose from a number of options on how to install Percona, in a CentOS system it's generally a better idea to use yum or RPM, so these are the way that are covered by this article, compiling and install from sources are not covered by this article.

Installing from Yum repository:

First you need to set the Percona's Yum repository with this:

    yum install http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm

And then install Percona with:

    yum install Percona-Server-client-56 Percona-Server-server-56

The above command installs Percona server and clients, shared libraries, possibly Perl and perl modules such as DBI::MySQL, if that are not already installed, and also other dependencies as needed.

Installing from RPM package:

We can download all rpm packages with the help of wget:

    wget -r -l 1 -nd -A rpm -R "*devel*,*debuginfo*" \ http://www.percona.com/downloads/Percona-Server-5.5/Percona-Server-5.5.42-37.1/binary/redhat/7/x86_64/

And with rpm utility, you install all the packages once:

    rpm -ivh Percona-Server-server-55-5.5.42-rel37.1.el7.x86_64.rpm \ Percona-Server-client-55-5.5.42-rel37.1.el7.x86_64.rpm \ Percona-Server-shared-55-5.5.42-rel37.1.el7.x86_64.rpm

Note the backslash '\' on the end of the sentences on the above commands, if you install individual packages, remember that to met dependencies, the shared package must be installed before client and client before server.

### 5. Configuring Percona Server ###

#### Restoring previous configuration ####

As we are moving from MariaDB, you can just restore the backup of my.cnf file that you made in earlier steps.

    cp /etc/my.cnf.bkp /etc/my.cnf

#### Creating a new my.cnf ####

If you need a new configuration file that fit your needs or if you don't have made a copy of my.cnf, you can use this wizard, it will generate for you, through simple steps.

Here is a sample my.cnf file that comes with Percona-Server package

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

After making your my.cnf file fit your needs, it's time to start the service:

    systemctl restart mysql.service

If everything goes fine, your server is now up and ready to ready to receive SQL commands, you can try the following command to check:

    mysql -u root -p -e 'SHOW VARIABLES LIKE "version_comment"'

If you can't start the service, you can look for a reason in **/var/log/mysql/mysqld.log** this file is set by the **log-error** option in my.cnf's **[mysqld_safe]** session.

    tail /var/log/mysql/mysqld.log

You can also take a look in a file inside **/var/lib/mysql/** with name in the form of **[hostname].err** as the following example:

    tail /var/lib/mysql/centos7.err

If this also fail in show what is wrong, you can also try strace:

    yum install strace && systemctl stop mysql.service && strace -f -f mysqld_safe

The above command is extremely verbous and it's output is quite low level but can show you the reason you can't start service in most times.

### 6. Securing your environment ###

Ok, you now have your RDBMS ready to receive SQL queries, but it's not a good idea to put your precious data on a server without minimum security, it's better to make it safer with mysql_secure_instalation, this utility helps in removing unused default features, also set the root main password and make access restrictions for using this user.
Just invoke it by the shell and follow instructions on the screen.

    mysql_secure_install

### 7. Restore your backup ###

If you are coming from a previous setup, now you can restore your databases, just use mysqldump once again.

    mysqldump -u root -p < mydatabases.sql

Congratulations, you just installed Percona on your CentOS Linux, your server is now fully ready for use; You can now use your service as it was MySQL, and your services are fully compatible with it.

### Conclusion ###

There is a lot of things to configure in order to achieve better performance, but here is some straightforward options to improve your setup. When using innodb engine it's also a good idea to set the **innodb_file_per_table** option **on**, it gonna distribute table indexes in a file per table basis, it means that each table have it's own index file, it makes the overall system, more robust and easier to repair.

Other option to have in mind is the **innodb_buffer_pool_size** option, InnoDB should have large enough to your datasets, and some value **between 70% and 80%** of the total available memory should be reasonable.

By setting the **innodb-flush-method** to **O_DIRECT** you disable write cache, if you have **RAID**, this should be set to improved performance as this cache is already done in a lower level.

If your data is not that critical and you don't need fully **ACID** compliant transactions, you can adjust to 2 the option **innodb_flush_log_at_trx_commit**, this will also lead to improved performance.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/percona-server-centos-7/

作者：[Carlos Alberto][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/carlosal/