在 CentOS 7 CPanel 服务器上安装 MariaDB 10
================================================================================

MariaDB 是一个增强版的、开源的 MySQL 替代品。它主要由 MariaDB 社区在维护，采用 GPL v2 授权许可。软件的安全性是 MariaDB 开发者的主要焦点。他们保持为 MariaDB 的每个版本发布安全补丁。当有任何安全问题被发现时，开发者会尽快修复并推出 MariaDB 的新版本。

### MariaDB 的优势 ###

- 完全开源
- 快速且透明的安全版本
- 与 MySQL 高度兼容
- 性能更好
- 比 MySQL 的存储引擎多

在这篇文章中，我将谈论关于如何在 CentOS7 CPanel 服务器上升级 MySQL5.5 到最新的 MariaDB 。在安装前先完成以下步骤。

### 先决条件: ###

#### 1. 停止当前 MySQL 服务 ####

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

#### 2. 在升级之前将所有配置文件和数据库转移 ####

转移数据库的存储路径和 MySQL 的配置文件

    root@server1 [~]# cp -Rf /var/lib/mysql /var/lib/mysql-old

    root@server1 [/var/lib/mysql]# cat /etc/my.cnf
    [mysqld]
    default-storage-engine=MyISAM
    innodb_file_per_table=1
    max_allowed_packet=268435456
    open_files_limit=10000

    root@server1 [~]#mv /etc/my.cnf /etc/my.cnf-old

#### 3. 从服务器上删除和卸载 MySQL 所有的 RPM 包 ####

运行以下命令来禁用 MySQL RPM 的目标（target）。通过运行此命令，cPanel 将不再处理 MySQL 的更新，并在系统上将这些 RPM 版本标记为已卸载。

    /scripts/update_local_rpm_versions --edit target_settings.MySQL50 uninstalled
    /scripts/update_local_rpm_versions --edit target_settings.MySQL51 uninstalled
    /scripts/update_local_rpm_versions --edit target_settings.MySQL55 uninstalled
    /scripts/update_local_rpm_versions --edit target_settings.MySQL56 uninstalled

现在运行以下命令：

/scripts/check_cpanel_rpms --fix --targets=MySQL50,MySQL51,MySQL55,MySQL56 

移除服务器上所有已有的 MySQL RPM 来为 MariaDB 的安装清理环境。请看下面的输出：

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

通过这些步骤，我们已经卸载了现有的 MySQL RPM，并做了标记来防止 MySQL的更新，服务器的环境已经清理，然后准备安装 MariaDB。

开始安装吧，我们需要根据 CentOS 和 MariaDB 的版本为 MariaDB 创建一个 yum 软件库。下面是我的做法！

### 安装步骤： ###

#### 第1步：创建 YUM 软件库。####

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

#### 第2步：打开 /etc/yum.conf 并修改如下行： ####

**删除这一行：**

	exclude=courier* dovecot* exim* filesystem httpd* mod_ssl* mydns* mysql* nsd* php* proftpd* pure-ftpd* spamassassin* squirrelmail*

**替换为：** 

	exclude=courier* dovecot* exim* filesystem httpd* mod_ssl* mydns* nsd* proftpd* pure-ftpd* spamassassin* squirrelmail*

**重要**

需要确保我们已经从 exclude 列表中移除了 MySQL 和 PHP。

#### 第3步：运行以下命令来安装 MariaDB 和相关的包。 ####

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

#### 第4步：重新启动，并确保 MySQL 服务已启动。####

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

#### 第5步：运行 mysql_upgrade 命令。 ####

它将检查所有数据库中的所有表与当前安装的版本是否兼容，并在必要时会更新系统表，以赋予当前版本新增加的权限或能力。


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

#### 第6步：再次重新启动 MySQL 的服务，以确保一切都运行完好。 ####

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

#### 第7步：运行 EasyApache，重建 Apache/PHP 以支持 MariaDB，并确保所有 PHP 的模块保持不变。####

    root@server1 [~]#/scripts/easyapache --build

**重要**

如果你在安装 MariaDB 之后忘记重建 Apache/PHP，将会报如下库错误：

    root@server1 [/etc/my.cnf.d]# php -v
    php: error while loading shared libraries: libmysqlclient.so.18: cannot open shared object file: No such file or directory

#### 第8步：现在验证安装的程序和数据库。 ####

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

就这样 ：）。现在，我们该去欣赏 MariaDB 完善和高效的特点了。希望你喜欢阅读本文。希望留下您宝贵的建议和反馈！

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/install-mariadb-10-centos-7-cpanel/

作者：[Saheetha Shameer][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/saheethas/
