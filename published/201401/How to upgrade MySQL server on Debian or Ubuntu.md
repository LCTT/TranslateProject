教你在 Debian 和 Ubuntu 上升级 MySQL
================================================================================
系统管理员的日常工作之一就是升级服务，为服务打上补丁包或升级一些花哨的功能。2013年初，最新的 MySQL 5.6发布，目标是提供[更好的性能和扩展能力][1]。如果你对此有点兴趣，倒是可以看看我写的这篇 **如何在 Debian 和 Ubuntu 上升级 MySQL**。

在这篇教程中，我会假设你已经[通过 apt-get 安装了 MySQL][2]。写这篇文章的时候，大部分 Linux 发行版上部署的都是 MySQL 5.5。这里我将向你们介绍如何从 MySQL 5.5升级到5.6。

###步骤1：备份 MySQL 配置文件。

    $ sudo mkdir /backup
    $ sudo tar cvfvz /backup/mysql_conf.tgz /etc/mysql

###步骤2：把数据库导出到一个 .sql 文件，并且把数据存放路径下面的数据也备份起来。

    $ sudo sh -c 'mysqldump -u root -p -A --events > /backup/backup_db.sql
    $ sudo tar cvfvz /backup/mysql_data.tgz /var/lib/mysql

注意：如果你为你的在线 MySQL 系统提供了持续备份，强烈建议你在执行上面步骤时使用单事务选项，或显式使用锁（以保证数据一致性 —— 译注），详见[这个教程][3]。

###步骤3：停止 MySQL 服务

    $ sudo service mysql stop

###步骤4：卸载 MySQL 软件包

    $ sudo apt-get remove mysql-server mysql-client mysql-common
    $ sudo apt-get autoremove
    $ sudo apt-get autoclean

使用 apt-get 卸载时不要用 purge 选项，这会删除 MySQL 配置文件和其它一些以后要用到的数据。

###步骤5： 安装 MySQL 依赖包（内核异步 IO 访问库），MySQL 5.5以及之后的版本都依赖它。 

    $ sudo apt-get install libaio1

###步骤6：从官网下载 Debian 版的 MySQL 软件包

32位系统：

    $ wget http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.15-debian6.0-i686.deb

64位系统：

    $ wget http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.15-debian6.0-x86_64.deb

###步骤7：安装 MySQL 软件包

    $ sudo dpkg -i mysql-5.6.15-debian6.0-*.deb

这个软件包会被安装在 /opt/mysql 目录下面。

###步骤8：将 MySQL 命令所在的路径添加到系统环境变量 PATH 内。

Debian 上：

    $ sudo sh -c 'echo "PATH=$PATH:/opt/mysql/server-5.6/bin" >> /etc/profile'
    $ source /etc/profile

Ubuntu 或 Linux Mint 上：

    $ sudo sh -c 'echo "PATH=${PATH}:/opt/mysql/server-5.6/bin" >> /etc/environment'
    $ source /etc/environment

###步骤9：进入 MySQL 配置文件，修改下面两行配置。

    $ sudo vi /etc/mysql/my.cnf

> basedir = /opt/mysql/server-5.6

> lc-messages-dir = /opt/mysql/server-5.6/share

###步骤10：设置启动脚本

复制 MySQL 启动脚本到 /etc/init.d 目录下，并且将脚本设置为开机启动，这样一来 MySQL 就能在系统启动的时候自动启动了。

    $ sudo cp /opt/mysql/server-5.6/support-files/mysql.server /etc/init.d/mysql
    $ sudo update-rc.d mysql defaults

###步骤11：（仅限 Ubuntu） 编辑AppArmor配置

MySQL 的上个版本安装时会为 AppArmor 服务创建一个配置文件，这个文件在 MySQL 卸载后会保留在系统中，但是它与现在安装好的 MySQL 版本不兼容。你需要重新编辑下这个配置文件，然后 MySQL 服务才能正常启动。

首先，建一个软链接。

    $ sudo ln -s /opt/mysql/server-5.6/bin/mysqld /usr/sbin/mysqld

然后编辑 MySQL AppArmor 配置文件。

    $ sudo vi /etc/apparmor.d/usr.sbin.mysqld

>   /opt/mysql/server-5.6/lib/plugin/ r,

>   /opt/mysql/server-5.6/lib/plugin/*.so* mr,

>   /opt/mysql/server-5.6/share/** r,

最后重启 AppArmor 服务。

    $ sudo service apparmor restart

###步骤12：（还是仅限 Ubuntu）删除上个 MySQL 版本留下的自启动配置文件。

这个版本的 MySQL 使用 SysVinit （就是 /etc/init.d/mysql）来代替。

    $ sudo rm /etc/init/mysql.conf

###步骤13：启动 MySQL 服务。

    $ sudo service mysql start

###步骤14：恢复 MySQL 数据库。

    $ sudo mysql -u root -p < /backup/backup_db.sql

###步骤15：最后，升级 MySQL 系统表。

    $ sudo /opt/mysql/server-5.6/bin/mysql_upgrade -v -u root -p

### 解决 MySQL 升级过程中产生的问题 ###

如果 Ubuntu 下的 MySQL 服务启动时出现如下错误，就是由于旧版 MySQL AppArmor 配置文件禁止其运行而引起。你需要参考步骤11来更新 AppArmor 的配置文件。

    Dec 20 19:57:48 ubuntu kernel: [ 5856.960592] type=1400 audit(1387598268.807:39): apparmor="STATUS" operation="profile_replace" name="/usr/sbin/mysqld" pid=25216 comm="apparmor_parser"

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/upgrade-mysql-server-debian-ubuntu.html

译者：[bazz2](https://github.com/bazz2) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://dev.mysql.com/tech-resources/articles/whats-new-in-mysql-5.6.html
[2]:http://xmodulo.com/2013/06/how-to-install-mysql-server-and-client-on-linux.html
[3]:http://xmodulo.com/2012/10/how-to-backup-mysql-server.html
