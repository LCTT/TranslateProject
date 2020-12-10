[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12263-1.html)
[#]: subject: (Three Methods to Check Uptime of MySQL/MariaDB Database Server on Linux)
[#]: via: (https://www.2daygeek.com/check-mysql-mariadb-database-server-uptime-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 上检查 MySQL/MariaDB 数据库正常运行时间的三种方法
======

![](https://img.linux.net.cn/data/attachment/album/202005/29/211031hqb8qlyddtlrt2fl.jpg)

我们都知道在 Linux 中使用 `uptime` 命令的目的。它用于检查 [Linux 系统的正常运行时间][1]以及系统上次启动以来运行的时间。

而 Linux 管理员的工作是保持系统正常运行。

如果要检查 Linux 上的其他服务（例如 [Apache][2]、MySQL、MariaDB、sftp 等）运行了多长时间，该怎么做？

每个服务都有自己的命令来检查服务的正常运行时间。但是你也可以为此使用其他命令。

### 方法 1：如何使用 ps 命令在 Linux 上检查 MySQL/MariaDB 数据库的正常运行时间

[ps 命令][3]的意思是<ruby>进程状态<rt>process status</rt></ruby>。这是最基本的命令之一，它显示了系统正在运行的进程的详细信息。

为此，你首先需要使用 [pidof 命令][5]查找 [MySQL][4]/[MariaDB][6] 的 PID。

```
# pidof mysqld | cut -d" " -f1

2412
```

获取 MySQL/MariaDB 的 PID 后，请在 `ps` 命令中使用 `--etime` 选项获得正常运行时间。

* `--etime`：自进程启动以来经过的时间，形式为 `[[DD-]hh:]mm:ss`。

```
# ps -p 2412 -o etime

   ELAPSED
2-08:49:30
```

或者，在 `ps` 命令中使用 `--lstart` 选项来获取指定 PID 的正常运行时间。

```
# ps -p 2412 -o lstart

                STARTED
Sat May 2 03:02:15 2020
```

MySQL/MariaDB 进程已经运行了 2 天 03 小时 02 分 15 秒。

### 方法 2：如何使用 systemctl 命令在 Linux 上检查 MySQL/MariaDB 数据库的正常运行时间

[systemctl 命令][7]用于控制 systemd 系统和服务管理器。

systemd 是新的初始化系统和系统管理器，现在大多数 Linux 发行版都淘汰了传统的 SysVinit 管理器而采用了 systemd。

```
# systemctl status mariadb
或者
# systemctl status mysql

● mariadb.service - MariaDB 10.1.44 database server
   Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; vendor     preset: disabled)
  Drop-In: /etc/systemd/system/mariadb.service.d
           └─migrated-from-my.cnf-settings.conf
   Active: active (running) since Sat 2020-05-02 03:02:18 UTC; 2 days ago
     Docs: man:mysqld(8)
           https://mariadb.com/kb/en/library/systemd/
  Process: 2448 ExecStartPost=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
  Process: 2388 ExecStartPre=/bin/sh -c [ ! -e /usr/bin/galera_recovery ] && VAR= || VAR=/usr/bin/galera_recovery; [ $? -eq 0 ] && systemctl set-environment _WSREP_START_POSITION=$VAR || exit 1 (code=exited, status=0/SUCCESS)
  Process: 2386 ExecStartPre=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
 Main PID: 2412 (mysqld)
   Status: "Taking your SQL requests now…"
   CGroup: /system.slice/mariadb.service
           └─2412 /usr/sbin/mysqld

May 03 21:41:26 ns2.2daygeek.com mysqld[2412]: 2020-05-03 21:41:26 140328136861440 [Warning] Host name '1.1.1.1' could not be resolved: … not known
May 04 02:00:46 ns2.2daygeek.com mysqld[2412]: 2020-05-04 2:00:46 140328436418304 [Warning] IP address '1.1.1.1' has been resolved to the host name '2…ss itself.
May 04 03:01:31 ns2.2daygeek.com mysqld[2412]: 2020-05-04 3:01:31 140328436111104 [Warning] IP address '1.1.1.1' could not be resolved: Temporary fai…resolution
May 04 04:03:06 ns2.2daygeek.com mysqld[2412]: 2020-05-04 4:03:06 140328136861440 [Warning] IP address '1.1.1.1' could not be resolved: Name or ser… not known
May 04 07:23:54 ns2.2daygeek.com mysqld[2412]: 2020-05-04 7:23:54 140328435189504 [Warning] IP address '1.1.1.1' could not be resolved: Name or service not known
May 04 08:03:31 ns2.2daygeek.com mysqld[2412]: 2020-05-04 8:03:31 140328436418304 [Warning] IP address '1.1.1.1' could not be resolved: Name or service not known
May 04 08:25:56 ns2.2daygeek.com mysqld[2412]: 2020-05-04 8:25:56 140328135325440 [Warning] IP address '1.1.1.1' could not be resolved: Name or service not known
Warning: Journal has been rotated since unit was started. Log output is incomplete or unavailable.
Hint: Some lines were ellipsized, use -l to show in full.
```

### 方法 3：如何使用 MySQLAdmin 命令在 Linux 上检查 MySQL/MariaDB 数据库的正常运行时间

[MySQLAdmin][8] 是安装 MySQL 软件包时安装的 MySQL 服务器命令行程序。

MySQLAdmin 客户端允许你在 MySQL 服务器上执行一些基本的管理功能。

它用于创建数据库、删除数据库、设置 root 密码、更改 root 密码、检查 MySQL 状态、验证 MySQL 功能、监视 mysql 进程以及验证服务器的配置。

```
# mysqladmin -u root -pPassword version

mysqladmin Ver 8.42 Distrib 5.7.27, for Linux on x86_64
Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Server version 5.7.27
Protocol version 10
Connection Localhost via UNIX socket
UNIX socket /var/lib/mysql/mysql.sock
Uptime: 1 day 10 hours 44 min 13 sec
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-mysql-mariadb-database-server-uptime-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-system-server-uptime-check/
[2]: https://www.2daygeek.com/check-find-apache-httpd-web-server-uptime-linux/
[3]: https://www.2daygeek.com/linux-ps-command-find-running-process-monitoring/
[4]: https://www.2daygeek.com/category/mysql/
[5]: https://www.2daygeek.com/check-find-parent-process-id-pid-ppid-linux/
[6]: https://www.2daygeek.com/category/mariadb/
[7]: https://www.2daygeek.com/sysvinit-vs-systemd-cheatsheet-systemctl-command-usage/
[8]: https://www.2daygeek.com/linux-mysqladmin-command-administrate-mysql-mariadb-server/
