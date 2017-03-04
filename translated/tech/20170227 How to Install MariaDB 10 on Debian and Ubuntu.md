How to Install MariaDB 10 on Debian and Ubuntu
如何在 Debian 和 Ubuntu 上安装 MariaDB 10
============================================================

MariaDB is a free and open source fork of the popular MySQL database management server software. It is developed under the GPLv2 (General Public License version 2) by the original developers of MySQL and is intended to remain open source.
MariaDB 是深受欢迎的数据库管理服务器软件 MySQL 的一个免费并且开源的分支。它由 MySQL 的原开发者在 GPLv2（通用公共许可证 2 版）下开发，并保持开源。

It is designed to achieve high compatibility with MySQL. For starters, you can read [MariaDB vs MySQL][5] features for more information and importantly, it is used by big companies/organizations such as Wikipedia, WordPress.com, Google plus and many more.
它被设计来实现 MySQL 的高兼容性。对于初学者，可以阅读 [MariaDB vs MySQL][5] 来了解关于它们的特性的更多信息。更重要的是，它被一些大公司/组织使用，比如 Wikipedia、WordPress.com 和 Google plus ，除此之外还有更多的。

In this article, we will show you how to install MariaDB 10.1 stable version in various Debian and Ubuntu distribution releases.
在这篇文章中，我将向你们展示如何在 Debian 和 Ubuntu 发行版中安装 MariaDB 10.1 稳定版。

### Install MariaDB in Debian and Ubuntu
### 在 Debian 和 Ubuntu 上安装 MariaDB

1. Before installing MariaDB, you’ll have to import the repository key and add the MariaDB repository with the following commands:
1. 在安装之前 MariaDB 之前，你需要通过下面的命令导入仓库密匙并获取 MariaDB 仓库

#### On Debian 10(Sid)
#### 在 Debian 10(Sid) 上

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
$ sudo add-apt-repository 'deb [arch=amd64,i386] http://www.ftp.saix.net/DB/mariadb/repo/10.1/debian sid main'
```

#### On Debian 9 (Stretch)
#### 在 Debian 9(Stretch) 上

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
$ sudo add-apt-repository 'deb [arch=amd64] http://www.ftp.saix.net/DB/mariadb/repo/10.1/debian stretch main'
```

#### On Debian 8 (Jessie)
#### 在 Debian 8(Jessie) 上

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
$ sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://www.ftp.saix.net/DB/mariadb/repo/10.1/debian  jessie main'
```

#### On Debian 7 (Wheezy)
#### 在 Debian 7(Wheezy) 上

```
$ sudo apt-get install python-software-properties
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
$ sudo add-apt-repository 'deb [arch=amd64,i386] http://www.ftp.saix.net/DB/mariadb/repo/10.1/debian wheezy main'
```

#### On Ubuntu 16.10 (Yakkety Yak)
#### 在 Ubuntu 16.10(Yakkety Yak) 上

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
$ sudo add-apt-repository 'deb [arch=amd64,i386] http://www.ftp.saix.net/DB/mariadb/repo/10.1/ubuntu yakkety main'
```

#### On Ubuntu 16.04 (Xenial Xerus)
#### 在 Ubuntu 16.04 (Xenial Xerus) 上

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
$ sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://www.ftp.saix.net/DB/mariadb/repo/10.1/ubuntu xenial main'
```

#### On Ubuntu 14.04 (Trusty)
#### 在 Ubuntu 14.04 (Trusty) 上

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
$ sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://www.ftp.saix.net/DB/mariadb/repo/10.1/ubuntu trusty main'
```

2. Then update the system packages sources list, and install MariaDB server like so:
2. 然后，更新系统安装包列表，并像下面这样安装 MariaDB 服务器：

```
$ sudo apt-get update
$ sudo apt-get install mariadb-server
```

During the course of installation, you’ll be asked to configure the MariaDB server; set a secure root user password in the interface below.
安装过程中，将会请求你配置 MariaDB 服务器；在下面的页面中设置一个安全的 root 用户密码：

[
 ![Set New Root Password for MariaDB](http://www.tecmint.com/wp-content/uploads/2017/02/Set-New-Root-Password-for-MariaDB.png)
][6]

Set New Root Password for MariaDB
为 MariaDB 设置新的 Root 密码

Re-enter the password and press [Enter] to continue with the installation process.
重新输入密码并按下 [ENTER] 键来继续安装。


[
 ![Repeat MariaDB Password](http://www.tecmint.com/wp-content/uploads/2017/02/Repeat-MariaDB-Password.png)
][7]

Repeat MariaDB Password
重复输入 MariaDB 密码

3. When the installation of MariaDB packages completes, start the database server daemon for the mean time and enable it to start automatically at the next boot as follows:
当 MariaDB 安装包安装完成以后，启动数据库服务器 daemon，同时启用它，使得在下次开机时它能够像下面这样自动启动：

```
------------- On SystemD Systems -------------
$ sudo systemctl start mariadb
$ sudo systemctl enable mariadb
$ sudo systemctl status mariadb
------------- On SysVinit Systems -------------
$ sudo service mysql  start
$ chkconfig --level 35 mysql on
OR
$ update-rc.d mysql defaults
$ sudo service mysql status
```
[
 ![Start MariaDB Service](http://www.tecmint.com/wp-content/uploads/2017/02/Start-MariaDB-Service.png)
][8]

Start MariaDB Service
开启 MariaDB 服务

4. Then run the `mysql_secure_installation` script to secure the database where you can:
4. 然后，运行 `mysql_secure_installation` 脚本来保护数据库，在这儿你可以：

1.  set root password (if not set in the configuration step above).
2.  disable remote root login
3.  remove test database
4.  remove anonymous users and
5.  reload privileges
1.  设置 root 密码（如果在上面的配置环节你没有进行设置的话）。
2.  禁止远程 root 登录
3.  移除测试数据库
4.  移除匿名用户
5.  重装特权

```
$ sudo mysql_secure_installation
```
[
 ![Secure MariaDB Installation](http://www.tecmint.com/wp-content/uploads/2017/02/sudo-mysql-secure-installation.png)
][9]

Secure MariaDB Installation
保护 MariaDB 安装

5. Once the database server is secured, check it’s installed version and login to the MariaDB command shell as follows:
5. 一旦数据库服务器受保护以后，可以使用下面的 shell 命令查看已安装版本和登录 MariaDB：

```
$ mysql -V
$ mysql -u root -p
```
[
 ![Check MariaDB Version](http://www.tecmint.com/wp-content/uploads/2017/02/Check-MariaDB-Version.png)
][10]

Check MariaDB Version
查看 MariaDB 版本

To start learning MySQL/MariaDB, read through:
开始学习 MySQL/MariaDB， 请阅读：

1.  [Learn MySQL / MariaDB for Beginners – Part 1][1]
2.  [Learn MySQL / MariaDB for Beginners – Part 2][2]
3.  [MySQL Basic Database Administration Commands – Part III][3]
4.  [20 MySQL (Mysqladmin) Commands for Database Administration – Part IV][4]
1.  [MySQL / MariaDB 初学者学习指南 — Part 1][1]
2.  [MySQL / MariaDB 初学者学习指南 — Part 2][2]
3.  [MySQL 基本数据库管理命令 — Part III][3]
4.  [针对数据库管理员的 20 个 MySQL (Mysqladmin) 命令][4]

And check out these 4 useful commandline tools to [monitor MySQL/MariaDB performance][11] in Linux and also go through these [15 useful MySQL/MariaDB performance tuning and optimization tips][12].
查看在 Linux 中[监控 MySQL/MariaDB 性能][11]的四个有用的命令行工具，同时浏览 [15 个有用的 MySQL/MariaDB 性能调整和优化技巧][12]。

That’s all. In this article, we showed you how to install MariaDB 10.1 stable version in various Debian and Ubuntu releases. You can send us any questions/thoughts via the comment form below.
这就是本文的全部内容了。在这篇文章中，我们向你展示了如何在 Debian 和 Ubuntu 的不同发行版中安装 MariaDB 10.1 稳定版。你可以通过下面的评论框给我们提任何问题或者想法。

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.
Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux 系统管理员和网络开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识。



--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-mariadb-in-ubuntu-and-debian/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/learn-mysql-mariadb-for-beginners/
[2]:http://www.tecmint.com/learn-mysql-mariadb-advance-functions-sql-queries/
[3]:http://www.tecmint.com/gliding-through-database-mysql-in-a-nutshell-part-i/
[4]:http://www.tecmint.com/mysqladmin-commands-for-database-administration-in-linux/
[5]:https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-features/
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Set-New-Root-Password-for-MariaDB.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Repeat-MariaDB-Password.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Start-MariaDB-Service.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/sudo-mysql-secure-installation.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/02/Check-MariaDB-Version.png
[11]:http://www.tecmint.com/mysql-performance-monitoring/
[12]:http://www.tecmint.com/mysql-mariadb-performance-tuning-and-optimization/
[13]:http://www.tecmint.com/author/aaronkili/
[14]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[15]:http://www.tecmint.com/free-linux-shell-scripting-books/
