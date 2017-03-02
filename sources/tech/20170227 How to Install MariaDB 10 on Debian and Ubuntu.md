How to Install MariaDB 10 on Debian and Ubuntu
============================================================

MariaDB is a free and open source fork of the popular MySQL database management server software. It is developed under the GPLv2 (General Public License version 2) by the original developers of MySQL and is intended to remain open source.

It is designed to achieve high compatibility with MySQL. For starters, you can read [MariaDB vs MySQL][5] features for more information and importantly, it is used by big companies/organizations such as Wikipedia, WordPress.com, Google plus and many more.

In this article, we will show you how to install MariaDB 10.1 stable version in various Debian and Ubuntu distribution releases.

### Install MariaDB in Debian and Ubuntu

1. Before installing MariaDB, you’ll have to import the repository key and add the MariaDB repository with the following commands:

#### On Debian 10(Sid)

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
$ sudo add-apt-repository 'deb [arch=amd64,i386] http://www.ftp.saix.net/DB/mariadb/repo/10.1/debian sid main'
```

#### On Debian 9 (Stretch)

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
$ sudo add-apt-repository 'deb [arch=amd64] http://www.ftp.saix.net/DB/mariadb/repo/10.1/debian stretch main'
```

#### On Debian 8 (Jessie)

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
$ sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://www.ftp.saix.net/DB/mariadb/repo/10.1/debian  jessie main'
```

#### On Debian 7 (Wheezy)

```
$ sudo apt-get install python-software-properties
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
$ sudo add-apt-repository 'deb [arch=amd64,i386] http://www.ftp.saix.net/DB/mariadb/repo/10.1/debian wheezy main'
```

#### On Ubuntu 16.10 (Yakkety Yak)

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
$ sudo add-apt-repository 'deb [arch=amd64,i386] http://www.ftp.saix.net/DB/mariadb/repo/10.1/ubuntu yakkety main'
```

#### On Ubuntu 16.04 (Xenial Xerus)

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
$ sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://www.ftp.saix.net/DB/mariadb/repo/10.1/ubuntu xenial main'
```

#### On Ubuntu 14.04 (Trusty)

```
$ sudo apt-get install software-properties-common
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
$ sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://www.ftp.saix.net/DB/mariadb/repo/10.1/ubuntu trusty main'
```

2. Then update the system packages sources list, and install MariaDB server like so:

```
$ sudo apt-get update
$ sudo apt-get install mariadb-server
```

During the course of installation, you’ll be asked to configure the MariaDB server; set a secure root user password in the interface below.

[
 ![Set New Root Password for MariaDB](http://www.tecmint.com/wp-content/uploads/2017/02/Set-New-Root-Password-for-MariaDB.png) 
][6]

Set New Root Password for MariaDB

Re-enter the password and press [Enter] to continue with the installation process.

[
 ![Repeat MariaDB Password](http://www.tecmint.com/wp-content/uploads/2017/02/Repeat-MariaDB-Password.png) 
][7]

Repeat MariaDB Password

3. When the installation of MariaDB packages completes, start the database server daemon for the mean time and enable it to start automatically at the next boot as follows:

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

4. Then run the `mysql_secure_installation` script to secure the database where you can:

1.  set root password (if not set in the configuration step above).
2.  disable remote root login
3.  remove test database
4.  remove anonymous users and
5.  reload privileges

```
$ sudo mysql_secure_installation
```
[
 ![Secure MariaDB Installation](http://www.tecmint.com/wp-content/uploads/2017/02/sudo-mysql-secure-installation.png) 
][9]

Secure MariaDB Installation

5. Once the database server is secured, check it’s installed version and login to the MariaDB command shell as follows:

```
$ mysql -V
$ mysql -u root -p
```
[
 ![Check MariaDB Version](http://www.tecmint.com/wp-content/uploads/2017/02/Check-MariaDB-Version.png) 
][10]

Check MariaDB Version

To start learning MySQL/MariaDB, read through:

1.  [Learn MySQL / MariaDB for Beginners – Part 1][1]
2.  [Learn MySQL / MariaDB for Beginners – Part 2][2]
3.  [MySQL Basic Database Administration Commands – Part III][3]
4.  [20 MySQL (Mysqladmin) Commands for Database Administration – Part IV][4]

And check out these 4 useful commandline tools to [monitor MySQL/MariaDB performance][11] in Linux and also go through these [15 useful MySQL/MariaDB performance tuning and optimization tips][12].

That’s all. In this article, we showed you how to install MariaDB 10.1 stable version in various Debian and Ubuntu releases. You can send us any questions/thoughts via the comment form below.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

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
