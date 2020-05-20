[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Three Methods to Check Uptime of MySQL/MariaDB Database Server on Linux)
[#]: via: (https://www.2daygeek.com/check-mysql-mariadb-database-server-uptime-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Three Methods to Check Uptime of MySQL/MariaDB Database Server on Linux
======

We all know the purpose of the uptime command in Linux.

This is used to check the **[uptime of the Linux system][1]** and how long the system runs without restarting.

The Linux admin job is to keep the system up and running.

If you want to check how long other services like **[Apache][2]**, MySQL, MariaDB, sftp, etc., are running on Linux, how do you do that?

Each service has their own command to check the uptime of service.

But you can also use other commands for this purpose.

### Method-1: How to Check the Uptime of a MySQL/MariaDB Database Server on Linux Using the ps Command

The **[ps command][3]** stands for process status. This is one of the most basic commands that shows the system running processes with details.

To do so, you first need to find the PID of **[MySQL][4]**/MariaDB using the **[pidof command][5]**.

```
# pidof mysqld | cut -d" " -f1

2412
```

Once you have the MySQL/[**MariaDB**][6] PID, use the “etime” option with the ps command and get the uptime.

  * **etime:** elapsed time since the process was started, in the form of [[DD-]hh:]mm:ss.



```
# ps -p 2412 -o etime

   ELAPSED
2-08:49:30
```

Alternatively, use the “lstart” option with the ps command to get the uptime of a given PID.

```
# ps -p 2412 -o lstart

                STARTED
Sat May 2 03:02:15 2020
```

The MySQL/MariaDB process has been running for 2 days, 03 hours, 02 minutes and 15 seconds.

### Method-2: How to Check the Uptime of a MySQL/MariaDB Database Server on Linux Using the Systemctl Command

The **[systemctl command][7]** is used to control the systemd system and service manager.

systemd is a new init system and system manager, that was adopted by most of Linux distributions now over the traditional SysVinit manager.

```
# systemctl status mariadb
or
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

### Method-3: How to Check the Uptime of a MySQL/MariaDB Database Server on Linux Using the MySQLAdmin Command

**[MySQLAdmin][8]** is a command-line utility for MySQL Server that is installed when installing the MySQL package.

The MySQLAdmin client allows you to perform some basic administrative functions on the MySQL server.

It is used to create a database, drop a database, set a root password, change the root password, check MySQL status, verify MySQL functionality, monitor mysql processes, and verify the configuration of the server.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
