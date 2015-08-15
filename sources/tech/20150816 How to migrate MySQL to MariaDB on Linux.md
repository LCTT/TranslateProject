How to migrate MySQL to MariaDB on Linux
================================================================================
Since the Oracle's acquisition of MySQL, a lot of MySQL developers and users moved away from MySQL due to Oracle's more closed-door stance on MySQL development and maintenance. The community-driven outcome of such movement is a fork of MySQL, called MariaDB. Led by original MySQL developers, the development of MariaDB follows the open-source philosophy and makes sure of [its binary compatibility with MySQL][1]. The Linux distributions such as Red Hat families (Fedora, CentOS, RHEL), Ubuntu and Mint, openSUSE and Debian already started to use and support MariaDB as a drop-in replacement of MySQL.

If you want to migrate your database from MySQL to MariaDB, this article is what you are looking for. Fortunately, due to their binary compatibility, MySQL-to-MariaDB migration process is pretty much straightforward. If you follow the steps below, the migration from MySQL to MariaDB will most likely be painless.

### Prepare a MySQL Database and a Table ###

For demonstration purpose, let's create a test MySQL database and one table in the database before doing the migration. Skip this step if you already have existing MySQL database(s) to migrate to MariaDB. Otherwise proceed as follows.

Log in into MySQL from a terminal by typing your MySQL root user password.

    $ mysql -u root -p 

Create a database and a table.

    mysql> create database test01;
    mysql> use test01;
    mysql> create table pet(name varchar(30), owner varchar(30), species varchar(20), sex char(1));

Add some records to the table.

    mysql> insert into pet values('brandon','Jack','puddle','m'),('dixie','Danny','chihuahua','f'); 

Then quit the MySQL database.

### Backup the MySQL Database ###

The next step is to back up existing MySQL database(s). Use the following mysqldump command to export all existing databases to a file. Before running this command, make sure that binary logging is enabled in your MySQL server. If you don't know how to enable binary logging, see the instructions toward the end of the tutorial.

    $ mysqldump --all-databases --user=root --password --master-data > backupdb.sql 

![](https://farm6.staticflickr.com/5775/20555772385_21b89335e3_b.jpg)

Now create a backup of my.cnf file somewhere in your system before uninstalling MySQL. This step is optional.

    $ sudo cp /etc/mysql/my.cnf /opt/my.cnf.bak 

### Uninstall MySQL Package ###

First, you need to stop the MySQL service.

    $ sudo service mysql stop

or:

    $ sudo systemctl stop mysql

or:

    $ sudo /etc/init.d/mysql stop 

Then go ahead and remove MySQL packages and configurations as follows.

On RPM based system (e.g., CentOS, Fedora or RHEL):

    $ sudo yum remove mysql* mysql-server mysql-devel mysql-libs
    $ sudo rm -rf /var/lib/mysql 

On Debian based system (e.g., Debian, Ubuntu or Mint):

    $ sudo apt-get remove mysql-server mysql-client mysql-common
    $ sudo apt-get autoremove
    $ sudo apt-get autoclean
    $ sudo deluser mysql
    $ sudo rm -rf /var/lib/mysql 

### Install MariaDB Package ###

The latest CentOS/RHEL 7 and Ubuntu (14.04 or later) contain MariaDB packages in their official repositories. In Fedora, MariaDB has become a replacement of MySQL since version 19. If you are using an old version or LTS type like Ubuntu 13.10 or earlier, you still can install MariaDB by adding its official repository.

[MariaDB website][2] provide an online tool to help you add MariaDB's official repository according to your Linux distribution. This tool provides steps to add the MariaDB repository for openSUSE, Arch Linux, Mageia, Fedora, CentOS, RedHat, Mint, Ubuntu, and Debian.

![](https://farm6.staticflickr.com/5809/20367745260_073020b910_c.jpg)

As an example, let's use the Ubuntu 14.04 distribution and CentOS 7 to configure the MariaDB repository.

**Ubuntu 14.04**

    $ sudo apt-get install software-properties-common
    $ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
    $ sudo add-apt-repository 'deb http://mirror.mephi.ru/mariadb/repo/5.5/ubuntu trusty main'
    $ sudo apt-get update
    $ sudo apt-get install mariadb-server 

**CentOS 7**

Create a custom yum repository file for MariaDB as follows.

    $ sudo vi /etc/yum.repos.d/MariaDB.repo 

----------

    [mariadb]
    name = MariaDB
    baseurl = http://yum.mariadb.org/5.5/centos7-amd64
    gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
    gpgcheck=1

----------

    $ sudo yum install MariaDB-server MariaDB-client 

After all necessary packages are installed, you may be asked to type a new password for root user account. After setting the root password, don't forget to recover my.cnf backup file.

    $ sudo cp /opt/my.cnf /etc/mysql/

Now start MariaDB service as follows.

    $ sudo service mariadb start

or:

    $ sudo systemctl start mariadb

or:

    $ sudo /etc/init.d/mariadb start 

### Importing MySQL Database(s) ###

Finally, we have to import the previously exported database(s) back to MariaDB server as follows.

    $ mysql -u root -p < backupdb.sql 

Enter your MariaDB's root password, and the database import process will start. When the import process is finished, it will return to a command prompt.

To check whether or not the import process is completed successfully, log in into MariaDB server and perform some sample queries.

    $ mysql -u root -p

----------

    MariaDB [(none)]> show databases;
    MariaDB [(none)]> use test01;
    MariaDB [test01]> select * from pet; 

![](https://farm6.staticflickr.com/5820/20562243721_428a9a12a7_b.jpg)

### Conclusion ###

As you can see in this tutorial, MySQL-to-MariaDB migration is not difficult. MariaDB has a lot of new features than MySQL, that you should know about. As far as configuration is concerned, in my test case, I simply used my old MySQL configuration file (my.cnf) as a MariaDB configuration file, and the import process was completed fine without any issue. My suggestion for the configuration is that you read the documentation on MariaDB configuration options carefully before the migration, especially if you are using specific MySQL configurations.

If you are running more complex setup with tons of tables and databases including clustering or master-slave replication, take a look at the [more detailed guide][3] by the Mozilla IT and Operations team, or the [official MariaDB documentation][4].

### Troubleshooting ###

1. While running mysqldump command to back up databases, you are getting the following error.

    $ mysqldump --all-databases --user=root --password --master-data > backupdb.sql 

----------

    mysqldump: Error: Binlogging on server not active

By using "--master-data", you are trying to include binary log information in the exported output, which is useful for database replication and recovery. However, binary logging is not enabled in MySQL server. To fix this error, modify your my.cnf file, and add the following option under [mysqld] section.

    log-bin=mysql-bin

Save my.cnf file, and restart the MySQL service:

    $ sudo service mysql restart

or:

    $ sudo systemctl restart mysql

or:

    $ sudo /etc/init.d/mysql restart 

--------------------------------------------------------------------------------

via: http://xmodulo.com/migrate-mysql-to-mariadb-linux.html

作者：[Kristophorus Hadiono][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/kristophorus
[1]:https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-compatibility/
[2]:https://downloads.mariadb.org/mariadb/repositories/#mirror=aasaam
[3]:https://blog.mozilla.org/it/2013/12/16/upgrading-from-mysql-5-1-to-mariadb-5-5/
[4]:https://mariadb.com/kb/en/mariadb/documentation/