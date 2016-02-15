translation by strugglingyouth
How to Install MariaDB 10 on CentOS 7 CPanel Server
================================================================================

MariaDB is a enhanced open source and drop-in replacement for MySQL. It is developed by MariaDB community and available under the terms of the GPL v2 license. Software Security is the main focus for the MariaDB developers. They maintain its own set of security patches for each MariaDB releases. When any critical security issues are discovered, the developers introduces a new release of MariaDB to get the fix out as soon as possible.

MariaDB is always up-to-date with the latest MySQL releases. It is highly compatible and works exactly like the MySQL. Almost all commands, data, table definition files, Client APIs, protocols, interfaces, structures, filenames, binaries, ports, database storage locations etc are same as the MySQL. It isn't even needed to convert databases to switch to MariaDB.

### Advantages of MariaDB ###

- Truly Open source
- More quicker and transparent security releases
- Highly Compatible with MySQL
- Improved Performance
- More storage engines compared to MySQL

In this article, I provides guidelines on how to upgrade MySQL 5.5 to the latest MariaDB on a CentOS 7 CPanel server. Let's walk through the Pre-installation steps.

### Pre-requisites: ###

#### 1. Stop current MySQL Service ####

    root@server1 [/var/# mysql
    Welcome to the MySQL monitor. Commands end with ; or \g.
    Your MySQL connection id is 5859
    Server version: 5.5.47-cll MySQL Community Server (GPL)

    Copyright (c) 2000, 2015, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    root@server1 [~]# systemctl stop mysql
    root@server1 [~]# systemctl status mysql
    ● mysql.service - LSB: start and stop MySQL
    Loaded: loaded (/etc/rc.d/init.d/mysql)
    Active: failed (Result: exit-code) since Sun 2016-01-31 10:00:02 UTC; 1min 31s ago
    Docs: man:systemd-sysv-generator(8)
    Main PID: 23430 (code=exited, status=203/EXEC)

    Jan 31 10:00:02 server1.centos7-test.com systemd[1]: Started MySQL Server.
    Jan 31 10:00:02 server1.centos7-test.com systemd[1]: Starting MySQL Server...
    Jan 31 10:00:02 server1.centos7-test.com systemd[1]: mysql.service: main process exited, code=exited, status=203/EXEC
    Jan 31 10:00:02 server1.centos7-test.com systemd[1]: Unit mysql.service entered failed state.
    Jan 31 10:00:02 server1.centos7-test.com systemd[1]: mysql.service failed.

#### 2. Move all configuration files and databases prior to the upgrade ####

Move the DB storage path and MySQL configuration files

    root@server1 [~]# cp -Rf /var/lib/mysql /var/lib/mysql-old

    root@server1 [/var/lib/mysql]# cat /etc/my.cnf
    [mysqld]
    default-storage-engine=MyISAM
    innodb_file_per_table=1
    max_allowed_packet=268435456
    open_files_limit=10000

    root@server1 [~]#mv /etc/my.cnf /etc/my.cnf-old

#### 3. Remove and uninstall all MySQL rpms from the server ####

Run the following commands to disable the MySQL RPM targets. By running this commands, cPanel will no longer handle MySQL updates, and mark these rpm.versions as uninstalled on the system.

    /scripts/update_local_rpm_versions --edit target_settings.MySQL50 uninstalled
    /scripts/update_local_rpm_versions --edit target_settings.MySQL51 uninstalled
    /scripts/update_local_rpm_versions --edit target_settings.MySQL55 uninstalled
    /scripts/update_local_rpm_versions --edit target_settings.MySQL56 uninstalled

Now run the this command:

/scripts/check_cpanel_rpms --fix --targets=MySQL50,MySQL51,MySQL55,MySQL56 to remove all existing MySQL rpms on the server and leave a clean environment for MariaDB installation. Please see its output below:

    root@server1 [/var/lib/mysql]# /scripts/check_cpanel_rpms --fix --targets=MySQL50,MySQL51,MySQL55,MySQL56
    [2016-01-31 09:53:59 +0000]
    [2016-01-31 09:53:59 +0000] Problems were detected with cPanel-provided files which are RPM controlled.
    [2016-01-31 09:53:59 +0000] If you did not make these changes intentionally, you can correct them by running:
    [2016-01-31 09:53:59 +0000]
    [2016-01-31 09:53:59 +0000] > /usr/local/cpanel/scripts/check_cpanel_rpms --fix
    [2016-01-31 09:53:59 +0000]
    [2016-01-31 09:53:59 +0000] The following RPMs are unneeded on your system and should be uninstalled:
    [2016-01-31 09:53:59 +0000] MySQL55-client-5.5.47-1.cp1148
    [2016-01-31 09:53:59 +0000] MySQL55-devel-5.5.47-1.cp1148
    [2016-01-31 09:53:59 +0000] MySQL55-server-5.5.47-1.cp1148
    [2016-01-31 09:53:59 +0000] MySQL55-shared-5.5.47-1.cp1148
    [2016-01-31 09:53:59 +0000] MySQL55-test-5.5.47-1.cp1148
    [2016-01-31 09:53:59 +0000] compat-MySQL50-shared-5.0.96-4.cp1136
    [2016-01-31 09:53:59 +0000] compat-MySQL51-shared-5.1.73-1.cp1150
    [2016-01-31 09:53:59 +0000] Removing 0 broken rpms:
    [2016-01-31 09:53:59 +0000] rpm: no packages given for erase
    [2016-01-31 09:53:59 +0000] No new RPMS needed for install
    [2016-01-31 09:53:59 +0000] Disabling service monitoring.
    [2016-01-31 09:54:01 +0000] Uninstalling unneeded rpms: MySQL55-test MySQL55-server MySQL55-client compat-MySQL51-shared compat-MySQL50-shared MySQL55-shared MySQL55-devel
    [2016-01-31 09:54:04 +0000] Removed symlink /etc/systemd/system/multi-user.target.wants/mysql.service.
    [2016-01-31 09:54:04 +0000] Restoring service monitoring.

With these steps, we've uninstalled existing MySQL RPMs, marked targets to prevent further MySQL updates and made the server ready and clean for the MariaDB installation.

To startup with the installation, we need to create a yum repository for MariaDB depending on the MariaDB & CentOS versions. This is how I did it!

### Installation procedures: ###

#### Step 1: Creating a YUM repository. ####

    root@server1 [~]# vim /etc/yum.repos.d/MariaDB.repo
    [mariadb]
    name = MariaDB
    baseurl = http://yum.mariadb.org/10.0/centos7-amd64/
    gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
    gpgcheck=1
    root@server1 [/etc/yum.repos.d]# cat /etc/yum.repos.d/MariaDB.repo
    [mariadb]
    name = MariaDB
    baseurl = http://yum.mariadb.org/10.0/centos7-amd64/
    gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
    gpgcheck=1

#### Step 2: Open the /etc/yum.conf and modify the exclude line as below: ####

**Remove this line** exclude=courier* dovecot* exim* filesystem httpd* mod_ssl* mydns* mysql* nsd* php* proftpd* pure-ftpd* spamassassin* squirrelmail*

**And replace with this line** exclude=courier* dovecot* exim* filesystem httpd* mod_ssl* mydns* nsd* proftpd* pure-ftpd* spamassassin* squirrelmail*

**\*\*\* IMPORTANT \*\*\***

We need to make sure, we've removed the MySQL and PHP from the exclude list.

#### Step 3: Run the following command to install MariaDB and related packages. ####

**yum install MariaDB-server MariaDB-client MariaDB-devel php-mysql**

    root@server1 [~]#yum install MariaDB-server MariaDB-client MariaDB-devel php-mysql

    Dependencies Resolved

    ===============================================================================================================================================
    Package Arch Version Repository Size
    ===============================================================================================================================================
    Installing:
    MariaDB-client x86_64 10.0.23-1.el7.centos mariadb 10 M
    MariaDB-devel x86_64 10.0.23-1.el7.centos mariadb 6.3 M
    MariaDB-server x86_64 10.0.23-1.el7.centos mariadb 55 M
    php-mysql x86_64 5.4.16-36.el7_1 base 99 k
    Installing for dependencies:
    MariaDB-common x86_64 10.0.23-1.el7.centos mariadb 43 k
    MariaDB-shared x86_64 10.0.23-1.el7.centos mariadb 1.2 M
    libzip x86_64 0.10.1-8.el7 base 48 k
    php-common x86_64 5.4.16-36.el7_1 base 563 k
    php-pdo x86_64 5.4.16-36.el7_1 base 97 k

    Transaction Summary
    ===============================================================================================================================================
    Install 4 Packages (+5 Dependent package)

#### Step 4: Restart and make sure the MySQL service is up. ####

    root@server1 [~]# systemctl start mysql
    root@server1 [~]#
    root@server1 [~]#
    root@server1 [~]# systemctl status mysql
    ● mysql.service - LSB: start and stop MySQL
    Loaded: loaded (/etc/rc.d/init.d/mysql)
    Active: active (exited) since Sun 2016-01-31 10:01:46 UTC; 3s ago
    Docs: man:systemd-sysv-generator(8)
    Process: 23717 ExecStart=/etc/rc.d/init.d/mysql start (code=exited, status=0/SUCCESS)
    Main PID: 23430 (code=exited, status=203/EXEC)

    Jan 31 10:01:46 server1.centos7-test.com systemd[1]: Starting LSB: start and stop MySQL...
    Jan 31 10:01:46 server1.centos7-test.com mysql[23717]: Starting MySQL SUCCESS!
    Jan 31 10:01:46 server1.centos7-test.com systemd[1]: Started LSB: start and stop MySQL.

#### Step 5: Run mysql_upgrade command ####

It will examine all tables in all databases for incompatibilities with the current installed version and upgrades the system tables if necessary to take advantage of new privileges or capabilities that might have added with the current version.

    root@server1 [~]# mysql_upgrade
    MySQL upgrade detected
    Phase 1/6: Checking and upgrading mysql database
    Processing databases
    mysql
    mysql.columns_priv OK
    mysql.db OK
    mysql.event OK
    mysql.func OK
    mysql.help_category OK
    mysql.help_keyword OK
    mysql.help_relation OK
    mysql.help_topic OK
    mysql.host OK
    mysql.ndb_binlog_index OK
    mysql.plugin OK
    mysql.proc OK
    mysql.procs_priv OK
    mysql.proxies_priv OK
    mysql.servers OK
    mysql.tables_priv OK
    mysql.time_zone OK
    mysql.time_zone_leap_second OK
    mysql.time_zone_name OK
    mysql.time_zone_transition OK
    mysql.time_zone_transition_type OK
    mysql.user OK
    Phase 2/6: Fixing views from mysql
    Phase 3/6: Running 'mysql_fix_privilege_tables'
    Phase 4/6: Fixing table and database names
    Phase 5/6: Checking and upgrading tables
    Processing databases
    cphulkd
    cphulkd.auths OK
    cphulkd.blacklist OK
    cphulkd.brutes OK
    cphulkd.good_logins OK
    cphulkd.ip_lists OK
    cphulkd.known_netblocks OK
    cphulkd.login_track OK
    cphulkd.logins OK
    cphulkd.report OK
    cphulkd.whitelist OK
    eximstats
    eximstats.defers OK
    eximstats.failures OK
    eximstats.sends OK
    eximstats.smtp OK
    information_schema
    leechprotect
    leechprotect.hits OK
    modsec
    modsec.hits OK
    performance_schema
    roundcube
    roundcube.cache OK
    roundcube.cache_index OK
    roundcube.cache_messages OK
    roundcube.cache_shared OK
    roundcube.cache_thread OK
    roundcube.contactgroupmembers OK
    roundcube.contactgroups OK
    roundcube.contacts OK
    roundcube.cp_schema_version OK
    roundcube.dictionary OK
    roundcube.identities OK
    roundcube.searches OK
    roundcube.session OK
    roundcube.system OK
    roundcube.users OK
    saheetha_test
    saheetha_test.authors OK
    whmxfer
    whmxfer.sessions OK
    Phase 6/6: Running 'FLUSH PRIVILEGES'
    OK

#### Step 6 : Restart the MySQL service once again to ensure everything works perfect. ####

    root@server1 [~]# systemctl restart mysql
    root@server1 [~]#
    root@server1 [~]# systemctl status mysql
    ● mysql.service - LSB: start and stop MySQL
    Loaded: loaded (/etc/rc.d/init.d/mysql)
    Active: active (running) since Sun 2016-01-31 10:04:11 UTC; 9s ago
    Docs: man:systemd-sysv-generator(8)
    Process: 23831 ExecStop=/etc/rc.d/init.d/mysql stop (code=exited, status=0/SUCCESS)
    Process: 23854 ExecStart=/etc/rc.d/init.d/mysql start (code=exited, status=0/SUCCESS)
    Main PID: 23430 (code=exited, status=203/EXEC)
    CGroup: /system.slice/mysql.service
    ├─23861 /bin/sh /usr/bin/mysqld_safe --datadir=/var/lib/mysql --pid-file=/var/lib/mysql/server1.centos7-test.com.pid
    └─23933 /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib64/mysql/plugin --user=mysql --log-error=/v...

    Jan 31 10:04:10 server1.centos7-test.com systemd[1]: Starting LSB: start and stop MySQL...
    Jan 31 10:04:11 server1.centos7-test.com mysql[23854]: Starting MySQL. SUCCESS!
    Jan 31 10:04:11 server1.centos7-test.com systemd[1]: Started LSB: start and stop MySQL.

#### Step 7: Run EasyApache to rebuild Apache/PHP with MariaDB and ensure all PHP modules remains intact. ####

    root@server1 [~]#/scripts/easyapache --build

    ****IMPORTANT *****
    If you forget to rebuild Apache/PHP after the MariaDB installation, it will report the library error as below:

    root@server1 [/etc/my.cnf.d]# php -v
    php: error while loading shared libraries: libmysqlclient.so.18: cannot open shared object file: No such file or directory

#### Step 8: Now verify the installation and databases. ####

    root@server1 [/var/lib/mysql]# mysql
    Welcome to the MariaDB monitor. Commands end with ; or \g.
    Your MariaDB connection id is 15
    Server version: 10.0.23-MariaDB MariaDB Server

    Copyright (c) 2000, 2015, Oracle, MariaDB Corporation Ab and others.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    MariaDB [(none)]> show storage engines;
    +--------------------+---------+----------------------------------------------------------------------------+--------------+------+------------+
    | Engine | Support | Comment | Transactions | XA | Savepoints |
    +--------------------+---------+----------------------------------------------------------------------------+--------------+------+------------+
    | CSV | YES | CSV storage engine | NO | NO | NO |
    | MRG_MyISAM | YES | Collection of identical MyISAM tables | NO | NO | NO |
    | MEMORY | YES | Hash based, stored in memory, useful for temporary tables | NO | NO | NO |
    | BLACKHOLE | YES | /dev/null storage engine (anything you write to it disappears) | NO | NO | NO |
    | MyISAM | YES | MyISAM storage engine | NO | NO | NO |
    | InnoDB | DEFAULT | Percona-XtraDB, Supports transactions, row-level locking, and foreign keys | YES | YES | YES |
    | ARCHIVE | YES | Archive storage engine | NO | NO | NO |
    | FEDERATED | YES | FederatedX pluggable storage engine | YES | NO | YES |
    | PERFORMANCE_SCHEMA | YES | Performance Schema | NO | NO | NO |
    | Aria | YES | Crash-safe tables with MyISAM heritage | NO | NO | NO |
    +--------------------+---------+----------------------------------------------------------------------------+--------------+------+------------+
    10 rows in set (0.00 sec)

That's all :). Now we're all set to go with MariaDB with its improved and efficient features. Hope you enjoyed reading this documentation. I would recommend your valuable suggestions and feedback on this!

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/install-mariadb-10-centos-7-cpanel/

作者：[Saheetha Shameer][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/saheethas/
