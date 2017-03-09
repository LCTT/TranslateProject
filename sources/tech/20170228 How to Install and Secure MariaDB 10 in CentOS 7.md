
beyondworld translating

How to Install and Secure MariaDB 10 in CentOS 7
============================================================


MariaDB is a free and open source fork of well known MySQL database management server software, developed by the brains behind MySQL, it’s envisioned to remain free/open source.

In this tutorial, we will show you how to install MariaDB 10.1 stable version in the most widely used versions of RHEL/CentOS and Fedora distributions.

For your information, Red Hat Enterprise Linux/CentOS 7.0 switched from supporting MySQL to MariaDB as the default database management system.

Note that in this tutorial, we’ll assume your working on the server as root, otherwise, use the [sudo command][7] to run all the commands.

### Step 1: Add MariaDB Yum Repository

1. Start by adding the MariaDB YUM repository file `MariaDB.repo` for RHEL/CentOS and Fedora systems.

```
# vi /etc/yum.repos.d/MariaDB.repo
```

Now add the following lines to your respective Linux distribution version as shown.

#### On CentOS 7

```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

#### On RHEL 7

```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/rhel7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```
[
 ![Add MariaDB Yum Repo](http://www.tecmint.com/wp-content/uploads/2017/02/Add-MariaDB-Repo.png) 
][8]

Add MariaDB Yum Repo

### Step 2: Install MariaDB in CentOS 7

2. Once MariaDB repository has been added, you can easily install it with just one single command.

```
# yum install MariaDB-server MariaDB-client -y
```
[
 ![Install MariaDB in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/02/Install-MariaDB-in-CentOS-7.png) 
][9]

Install MariaDB in CentOS 7

3. As soon as the installation of MariaDB packages completes, start the database server daemon for the time being, and also enable it to start automatically at the next boot like so:

```
# systemctl start mariadb
# systemctl enable mariadb
# systemctl status mariadb
```
[
 ![Start MariaDB Service in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/02/Start-MariaDB-Service-in-CentOS-7.png) 
][10]

Start MariaDB Service in CentOS 7

### Step 3: Secure MariaDB in CentOS 7

4. Now its time to secure your MariaDB by setting root password, disabling remote root login, removing the test database as well as anonymous users and finally reload privileges as shown in the screen shot below:

```
# mysql_secure_installation
```
[
 ![Secure MySQL in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/02/Secure-MySQL-in-CentOS-7.png) 
][11]

Secure MySQL in CentOS 7

5. After securing the database server, you may want to check certain MariaDB features such as: installed version, default program argument list, and also login to the MariaDB command shell as follows:

```
# mysql -V
# mysqld --print-defaults
# mysql -u root -p
```
[
 ![Verify MySQL Version](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-MySQL-Version.png) 
][12]

Verify MySQL Version

### Step 4: Learn MariaDB Administration

If you are new to MySQL/MariaDB, start off by going through these guides:

1.  [Learn MySQL / MariaDB for Beginners – Part 1][1]
2.  [Learn MySQL / MariaDB for Beginners – Part 2][2]
3.  [MySQL Basic Database Administration Commands – Part III][3]
4.  [20 MySQL (Mysqladmin) Commands for Database Administration – Part IV][4]

Also check out these following articles to fine tune your MySQL/MariaDB performance and use the tools to monitor the activity of your databases.

1.  [15 Tips to Tune and Optimize Your MySQL/MariaDB Performance][5]
2.  [4 Useful Tools to Monitor MySQL/MariaDB Database Activities][6]

That’s it for now! In this simple tutorial, we showed you how to install MariaDB 10.1 stable version in various RHEL/CentOS and Fedora. Use the feedback form below to send us any questions or any thoughts concerning this guide.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-mariadb-in-centos-7/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/learn-mysql-mariadb-for-beginners/
[2]:http://www.tecmint.com/learn-mysql-mariadb-advance-functions-sql-queries/
[3]:http://www.tecmint.com/gliding-through-database-mysql-in-a-nutshell-part-i/
[4]:http://www.tecmint.com/mysqladmin-commands-for-database-administration-in-linux/
[5]:http://www.tecmint.com/mysql-mariadb-performance-tuning-and-optimization/
[6]:http://www.tecmint.com/mysql-performance-monitoring/
[7]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-MariaDB-Repo.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Install-MariaDB-in-CentOS-7.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/02/Start-MariaDB-Service-in-CentOS-7.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Secure-MySQL-in-CentOS-7.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-MySQL-Version.png
[13]:http://www.tecmint.com/author/aaronkili/
[14]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[15]:http://www.tecmint.com/free-linux-shell-scripting-books/
