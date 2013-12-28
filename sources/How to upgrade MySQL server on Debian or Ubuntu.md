How to upgrade MySQL server on Debian or Ubuntu
================================================================================
One of routine tasks for system admins is to update installed programs with the latest patches and hotfixes, as well as upgrade software to a more recent release with new bells and whistles. The latest MySQL 5.6 was released early this year, targeting [better performance and scalability][1]. For those of you wanting to try out the latest bleeding edge MySQL, I will describe **how to upgrade MySQL server on Debian or Ubuntu**.

In this tutorial, I assume that you have already [set up MySQL with apt-get][2]. As of this writing, MySQL that ships with major Linux distros is version 5.5. Here I am going to demonstrate how to upgrade MySQL 5.5 to 5.6.

1.Back up your MySQL config files.

    $ sudo mkdir /backup
    $ sudo tar cvfvz /backup/mysql_conf.tgz /etc/mysql

2.Export all databases to a .sql file, and back up MySQL data directory.

    $ sudo sh -c 'mysqldump -u root -p -A --events > /backup/backup_db.sql
    $ sudo tar cvfvz /backup/mysql_data.tgz /var/lib/mysql

Note: for a consistent backup of a "live" MySQL system, it is recommended to use a single transaction option or explicit locks on the database, as detailed in [this tutorial][3].

3.Stop MySQL server.

    $ sudo service mysql stop

4.Uninstall and remove MySQL packages.

    $ sudo apt-get remove mysql-server mysql-client mysql-common
    $ sudo apt-get autoremove
    $ sudo apt-get autoclean

Do not use "purge" option in apt-get as that would remove MySQL config files and other MySQL related data directories as well, which we will continue to use after MySQL upgrade.

5.Install MySQL dependency (kernel asynchronous I/O access library) which is needed for MySQL 5.5 and higher.

    $ sudo apt-get install libaio1

6.Download a MySQL Debian package from the official site.

On 32-bit system:

    $ wget http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.15-debian6.0-i686.deb

On 64-bit system:

    $ wget http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.15-debian6.0-x86_64.deb

7.Install the downloaded MySQL package.

    $ sudo dpkg -i mysql-5.6.15-debian6.0-*.deb

The MySQL package will be installed under /opt/mysql directory.

8.Add the MySQL bin directory to the PATH variable system-wide.

On Debian:

    $ sudo sh -c 'echo "PATH=$PATH:/opt/mysql/server-5.6/bin" >> /etc/profile'
    $ source /etc/profile

On Ubuntu or Linux Mint:

    $ sudo sh -c 'echo "PATH=${PATH}:/opt/mysql/server-5.6/bin" >> /etc/environment'
    $ source /etc/environment

9.Open the MySQL config file with a text editor, and update the following two entries.

    $ sudo vi /etc/mysql/my.cnf

> basedir = /opt/mysql/server-5.6
> lc-messages-dir = /opt/mysql/server-5.6/share

10.Copy the MySQL startup script to /etc/init.d and install the script into the boot sequence, so that MySQL server starts up automatically upon boot.

    $ sudo cp /opt/mysql/server-5.6/support-files/mysql.server /etc/init.d/mysql
    $ sudo update-rc.d mysql defaults

11.(Ubuntu-only) There is MySQL AppArmor profile created from the previous MySQL installation, which is not compatible with the new MySQL installation. So you need to reconfigure MySQL AppArmor profile so MySQL server can start.

First, create a symbolic link.

    $ sudo ln -s /opt/mysql/server-5.6/bin/mysqld /usr/sbin/mysqld

Edit MySQL AppArmor profile.

    $ sudo vi /etc/apparmor.d/usr.sbin.mysqld

>   /opt/mysql/server-5.6/lib/plugin/ r,
>   /opt/mysql/server-5.6/lib/plugin/*.so* mr,
>   /opt/mysql/server-5.6/share/** r,

Reload AppArmor service.

    $ sudo service apparmor restart

12.(Ubuntu-only) Remove a Upstart configuration for MySQL (which was installed as part of the previous MySQL installation). We will use SysVinit (/etc/init.d/mysql) instead.

    $ sudo rm /etc/init/mysql.conf

13.Start MySQL server.

    $ sudo service mysql start

14.Restore MySQL databases.

    $ sudo mysql -u root -p < /backup/backup_db.sql

15. Finally, upgrade MySQL system tables.

    $ sudo /opt/mysql/server-5.6/bin/mysql_upgrade -v -u root -p

### Troubleshooting MySQL Upgrade ###

If MySQL server fails to start with the following error on Ubuntu, this is because the old MySQL AppArmor profile prevents it from launching. To fix the problem, make sure to update the MySQL AppArmor profile as described in step 11.

    Dec 20 19:57:48 ubuntu kernel: [ 5856.960592] type=1400 audit(1387598268.807:39): apparmor="STATUS" operation="profile_replace" name="/usr/sbin/mysqld" pid=25216 comm="apparmor_parser"

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/upgrade-mysql-server-debian-ubuntu.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://dev.mysql.com/tech-resources/articles/whats-new-in-mysql-5.6.html
[2]:http://xmodulo.com/2013/06/how-to-install-mysql-server-and-client-on-linux.html
[3]:http://xmodulo.com/2012/10/how-to-backup-mysql-server.html