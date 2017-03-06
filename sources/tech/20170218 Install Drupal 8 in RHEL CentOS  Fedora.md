Install Drupal 8 in RHEL, CentOS & Fedora
============================================================

Drupal is an open source, flexible, highly scalable and secure Content Management System (CMS) which allows users to easily build and create web sites. It can be extended using modules and enables users to transform content management into powerful digital solutions.

Drupal runs on a web server like Apache, IIS, Lighttpd, Cherokee, Nginx and a backend databases MySQL, MongoDB, MariaDB, PostgreSQL, SQLite, MS SQL Server.

In this article, we will show how to perform a manual installation and configuration of Drupal 8 on RHEL 7/6, CentOS 7/6 and Fedora 20-25 distributions using LAMP setup.

#### Drupal Requirement:

1.  Apache 2.x (Recommended)
2.  PHP 5.5.9 or higher (5.5 recommended)
3.  MySQL 5.5.3 or MariaDB 5.5.20 with PHP Data Objects (PDO)

For this setup, I am using website hostname as “drupal.tecmint.com” and IP address is “192.168.0.104“. These settings may differ at your environment, so please make changes as appropriate.

### Step 1: Installing Apache Web Server

1. First we will start with installing Apache web server from the official repositories:

```
# yum install httpd
```

2. After the installation completes, the service will be disabled at first, so we need to start it manually for the mean time and enable it to start automatically from the next system boot as well:

```
------------- On SystemD - CentOS/RHEL 7 and Fedora 22+ ------------- 
# systemctl start httpd
# systemctl enable httpd
------------- On SysVInit - CentOS/RHEL 6 and Fedora ------------- 
# service httpd start
# chkconfig --level 35 httpd on
```

3. Next, in order to allow access to Apache services from HTTP and HTTPS, we have to open 80 and 443 port where the HTTPD daemon is listening as follows:

```
------------- On FirewallD - CentOS/RHEL 7 and Fedora 22+ ------------- 
# firewall-cmd --permanent --zone=public --add-service=http
# firewall-cmd --permanent --zone=public --add-service=https
# firewall-cmd --reload
------------- On IPtables - CentOS/RHEL 6 and Fedora 22+ ------------- 
# iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
# iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
# service iptables save
# service iptables restart
```

4. Now verify that Apache is working fine, open a remote browser and type your server IP Address using HTTP protocol in the `URL:http://server_IP`, and the default Apache2 page should appear as in the screenshot below.

[
 ![Apache Default Page](http://www.tecmint.com/wp-content/uploads/2013/07/Apache-Default-Page.png) 
][1]

Apache Default Page

### Step 2: Install PHP Support for Apache

5. Next, install PHP and the required PHP modules.

```
# yum install php php-mbstring php-gd php-xml php-pear php-fpm php-mysql php-pdo php-opcache
```

Important: If you want to install PHP 7.0, you need to add the following repositories: EPEL and Webtactic in order to install PHP 7.0 using yum:

```
------------- Install PHP 7 in CentOS/RHEL and Fedora ------------- 
# rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
# yum install php70w php70w-opcache php70w-mbstring php70w-gd php70w-xml php70w-pear php70w-fpm php70w-mysql php70w-pdo
```

6. Next, to get a full information about the PHP installation and all its current configurations from a web browser, let’s create a `info.php` file in the Apache DocumentRoot (`/var/www/html`) using the following command.

```
# echo "<?php  phpinfo(); ?>" > /var/www/html/info.php
```

then restart HTTPD service and enter the URL `http://server_IP/info.php` in the web browser.

```
# systemctl restart httpd
OR
# service httpd restart
```
[
 ![Verify PHP Information](http://www.tecmint.com/wp-content/uploads/2013/07/PHP-Information.png) 
][2]

Verify PHP Information

### Step 3: Install and Configure MariaDB Database

7. For your information, Red Hat Enterprise Linux/CentOS 7.0 moved from supporting MySQL to MariaDB as the default database management system.

To install MariaDB database, you need to add the following [official MariaDB repository][3] to file `/etc/yum.repos.d/MariaDB.repo` as shown.

```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

Once the repo file in place you can able to install MariaDB like so:

```
# yum install mariadb-server mariadb
```

8. When the installation of MariaDB packages completes, start the database daemon for the mean time and enable it to start automatically at the next boot.

```
------------- On SystemD - CentOS/RHEL 7 and Fedora 22+ ------------- 
# systemctl start mariadb
# systemctl enable mariadb
------------- On SysVInit - CentOS/RHEL 6 and Fedora ------------- 
# service mysqld start
# chkconfig --level 35 mysqld on
```

9. Then run the `mysql_secure_installation` script to secure the database (set root password, disable remote root login, remove test database and remove anonymous users) as follows:

```
# mysql_secure_installation
```
[
 ![Mysql Secure Installation](http://www.tecmint.com/wp-content/uploads/2013/07/Mysql-Secure-Installation.png) 
][4]

Mysql Secure Installation

### Step 4: Install and Configure Drupal 8 in CentOS

10. Here, we will start by [downloading the latest Drupal version][5] (i.e 8.2.6) using the [wget command][6]. If you don’t have wget and gzip packages installed, then use the following command to install them:

```
# yum install wget gzip
# wget -c https://ftp.drupal.org/files/projects/drupal-8.2.6.tar.gz
```

11. Afterwards, let’s [extract the tar file][7] and move the Drupal folder into the Apache Document Root (`/var/www/html`).

```
# tar -zxvf drupal-8.2.6.tar.gz
# mv drupal-8.2.6 /var/www/html/drupal
```

12. Then, create the settings file `settings.php`, from the sample settings file `default.settings.php`) in the folder (/var/www/html/drupal/sites/default) and then set the appropriate permissions on the Drupal site directory, including sub-directories and files as follows:

```
# cd /var/www/html/drupal/sites/default/
# cp default.settings.php settings.php
# chown -R apache:apache /var/www/html/drupal/
```

13. Importantly, set the SELinux rule on the folder “/var/www/html/drupal/sites/” as below:

```
# chcon -R -t httpd_sys_content_rw_t /var/www/html/drupal/sites/
```

14. Now we have to create a database and a user for the Drupal site to manage.

```
# mysql -u root -p
Enter password: 
```
MySQL Shell
```
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 5.1.73 Source distribution
Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
MySQL [(none)]> create database drupal;
Query OK, 1 row affected (0.00 sec)
MySQL [(none)]> create user ravi@localhost identified by 'tecmint123';
Query OK, 0 rows affected (0.00 sec)
MySQL [(none)]> grant all on drupal.* to ravi@localhost;
Query OK, 0 rows affected (0.00 sec)
MySQL [(none)]> flush privileges;
Query OK, 0 rows affected (0.00 sec)
MySQL [(none)]> exit
Bye
```

15. Now finally, at this point, open the URL: `http://server_IP/drupal/` to start the web installer, and choose your preferred installation language and Click Save to Continue.

[
 ![Drupal Installation Language](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation-Language.png) 
][8]

Drupal Installation Language

16. Next, select an installation profile, choose Standard and click Save to Continue.

[
 ![Drupal Installation Profile](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation-Profile.png) 
][9]

Drupal Installation Profile

17. Look through the requirements review and enable clean URL before moving forward.

[
 ![Verify Drupal Requirements](http://www.tecmint.com/wp-content/uploads/2013/07/Verify-Drupal-Requirements.png) 
][10]

Verify Drupal Requirements

Now enable clean URL drupal under your Apache configuration.

```
# vi /etc/httpd/conf/httpd.conf
```

Make sure to set AllowOverride All to the default DocumentRoot /var/www/html directory as shown in the screenshot below.

[
 ![Enable Clean URL in Drupal](http://www.tecmint.com/wp-content/uploads/2013/07/Enable-Clean-URL-in-Drupal.png) 
][11]

Enable Clean URL in Drupal

18. Once you enabled clean URL for Drupal, refresh the page to perform database configurations from the interface below; enter the Drupal site database name, database user and the user’s password.

Once filled all database details, click on Save and Continue.

[
 ![Drupal Database Configuration](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Database-Configuration.png) 
][12]

Drupal Database Configuration

If the above settings were correct, the drupal site installation should start successfully as in the interface below.

[
 ![Drupal Installation](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation.png) 
][13]

Drupal Installation

19. Next configure the site by setting the values for (use values that apply to your scenario):

1.  Site Name – TecMint Drupal Site
2.  Site email address – admin@tecmint.com
3.  Username – admin
4.  Password – ##########
5.  User’s Email address – admin@tecmint.com
6.  Default country – India
7.  Default time zone – UTC

After setting the appropriate values, click Save and Continue to finish the site installation process.

[
 ![Drupal Site Configuration](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Site-Configuration.png) 
][14]

Drupal Site Configuration

20. The interface that follows shows successful installation of Drupal 8 site with LAMP stack.

[
 ![Drupal Site Dashboard](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Site-Dashboard.png) 
][15]

Drupal Site Dashboard

Now you can click on Add content to create a sample web content such as a page.

Optional: For those who are uncomfortable using [MySQL command line to manage databases][16], [install PhpMyAdmin to manage databases][17] from a web browser interface.

Visit the Drupal Documentation: [https://www.drupal.org/docs/8][18]

That’s all! In this article, we showed how to download, install and setup LAMP stack and Drupal 8 with basic configurations on CentOS 7\. Use the feedback form below to write back to us concerning this tutorial or perhaps to provide us any related information.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-drupal-in-centos-rhel-fedora/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/wp-content/uploads/2013/07/Apache-Default-Page.png
[2]:http://www.tecmint.com/wp-content/uploads/2013/07/PHP-Information.png
[3]:https://downloads.mariadb.org/mariadb/repositories/#mirror=Fibergrid&distro=CentOS
[4]:http://www.tecmint.com/wp-content/uploads/2013/07/Mysql-Secure-Installation.png
[5]:https://www.drupal.org/download
[6]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[7]:http://www.tecmint.com/extract-tar-files-to-specific-or-different-directory-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation-Language.png
[9]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation-Profile.png
[10]:http://www.tecmint.com/wp-content/uploads/2013/07/Verify-Drupal-Requirements.png
[11]:http://www.tecmint.com/wp-content/uploads/2013/07/Enable-Clean-URL-in-Drupal.png
[12]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Database-Configuration.png
[13]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation.png
[14]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Site-Configuration.png
[15]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Site-Dashboard.png
[16]:http://www.tecmint.com/mysqladmin-commands-for-database-administration-in-linux/
[17]:http://www.tecmint.com/install-phpmyadmin-rhel-centos-fedora-linux/
[18]:https://www.drupal.org/docs/8
