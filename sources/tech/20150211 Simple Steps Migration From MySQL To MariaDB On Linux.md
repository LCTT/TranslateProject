Translating by martin.

Simple Steps Migration From MySQL To MariaDB On Linux
================================================================================
Hi all, this tutorial is all gonna be about how to migrate from MySQL to MariaDB on Linux Server or PC. So, you may ask why should we really migrate from MySQL to MariaDB for our database management. Here, below are the reasons why you should really need to migrate your database management system from MySQL to MariaDB.

### Why should I use MariaDB instead of MySQL? ###

MariaDB is an enhanced drop-in replacement and community-developed fork of the MySQL database system. It was developed by MariaDB foundation, and is being led by original developers of MySQL. Working with MariaDB is entirely same as MySQL. After Oracle bought MySQL, it is not free and open source anymore, but **MariaDB is still free and open source**. Top Websites like Google, Wikipedia, Linkedin, Mozilla and many more migrated to MariaDB. Its features are

- Backwards compatible with MySQL
- Forever open source
- Maintained by MySQL's creator
- More cutting edge features
- More storage engines
- Large websites have switched

Now, lets migrate to MariaDB.

**For the testing purpose**, let us create a sample database called **linoxidedb** .

Log in to MySQL as root user using the following command:

    $ mysql -u root -p

Enter the mysql root user password. You’ll be redirected to the **mysql prompt**.

**Create test databases:**

Enter the following commands from mysql prompt to create test databases.

    mysql> create database linoxidedb;

To view the list of available databases, enter the following command:

    mysql> show databases;

![creating test databases](http://blog.linoxide.com/wp-content/uploads/2015/01/creating-test-databases.png)

As see above, we have totally 5 databases including the newly created database linoxidedb .

    mysql> quit

Now, we'll migrate the created databases from MySQL to MariaDB.

Note: This tutorial is not necessary for CentOS, fedora based distribution of Linux because MariaDB is automatically installed instead of MySQL which requires no need to backup the existing databases, you just need to update mysql which will give you mariadb.

### 1. Backup existing databases ###

Our first important step is to create a backup of existing databases. To do that, we'll enter the following command from the **Terminal (not from MySQL prompt)**.

    $ mysqldump --all-databases --user=root --password --master-data > backupdatabase.sql

Oops! We encountered an error. No worries, it can be fixed.

    $ mysqldump: Error: Binlogging on server not active

![](http://blog.linoxide.com/wp-content/uploads/2015/01/mysqldump-error.png)
mysqldump error

To fix this error, we have to do a small modification in **my.cnf** file.

Edit my.cnf file:

    $ sudo nano /etc/mysql/my.cnf

Under [mysqld] section, add the following parameter.

**log-bin=mysql-bin**

![configuring my.cnf](http://blog.linoxide.com/wp-content/uploads/2015/01/configuring-my.cnf_.png)

Now, after done save and exit the file. Then, we'll need to restart mysql server. To do that please execute the below commands.

    $ sudo /etc/init.d/mysql restart

Now, re-run the mysqldump command to backup all databases.

    $ mysqldump --all-databases --user=root --password --master-data > backupdatabase.sql

![](http://blog.linoxide.com/wp-content/uploads/2015/01/crearing-bakup-file.png)
dumping databases

The above command will backup all databases, and stores them in **backupdatabase.sql** in the current directory.

### 2. Uninstalling MySQL ###

First of all, we'll want to **backup the my.cnf file to a safe location**.

**Note**: The my.cnf file will not be deleted when uninstalling MySQL packages. We do it for the precaution. During MariaDB installation, the installer will ask us to keep the existing my.cnf(old backup) file or to use the package containers version (i.e new one).

To backup the my.cnf file, please enter the following commands in a shell or terminal.

    $ sudo cp /etc/mysql/my.cnf my.cnf.bak

To stop mysql service, enter the following command from your Terminal.

    $ sudo /etc/init.d/mysql stop

Then, remove mysql packages.

    $ sudo apt-get remove mysql-server mysql-client

![uninstalling mysql](http://blog.linoxide.com/wp-content/uploads/2015/01/uninstalling-mysql.png)

### 3. Installing MariaDB ###

Here are the commands to run to install MariaDB on your Ubuntu system:

    $ sudo apt-get install software-properties-common
    $ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
    # sudo add-apt-repository 'deb http://mirror.mephi.ru/mariadb/repo/5.5/ubuntu trusty main'

![adding mariadb repo](http://blog.linoxide.com/wp-content/uploads/2015/01/adding-repo-mariadb.png)

Once the key is imported and the repository added you can install MariaDB with:

    $ sudo apt-get update
    $ sudo apt-get install mariadb-server

![installing mariadb](http://blog.linoxide.com/wp-content/uploads/2015/01/installing-mariadb.png)

![my.conf configuration prompt](http://blog.linoxide.com/wp-content/uploads/2015/01/my.conf-configuration-prompt.png)

We should remember that during MariaDB installation, the installer will ask you either to use the existing my.cnf(old backup) file, or use the package containers version (i.e new one). You can either use the old my.cnf file or the package containers version. If you want to use the new my.cnf version, you can restore the contents of older my.cnf (We already have copied this file to safe location before) later ie my.cnf.bak . So, I will go for default which is N, we'll press N then. For other versions, please refer the [MariaDB official repositories page][2].

### 4. Restoring Config File ###

To restore my.cnf from my.cnf.bak, enter the following command in Terminal. We have the old as my.cnf.bak file in our current directory, so we can simply copy the file using the following command:

    $ sudo cp my.cnf.bak /etc/mysql/my.cnf

### 5. Importing Databases ###

Finally, lets import the old databases that we created before. To do that, we'll need to run the following command.

    $ mysql -u root -p < backupdatabase.sql

That’s it. We have successfully imported the old databases.

Let us check if the databases are really imported. To do that, we'll wanna log in to mysql prompt using command:

    $ mysql -u root -p

![importing database](http://blog.linoxide.com/wp-content/uploads/2015/01/importing-database.png)

Now, to check whether the databases are migrated to MariaDB please run "**show databases**;" command inside the MarianDB prompt without quotes("") as

    mariaDB> show databases;

![mysql to mariadb database migrated](http://blog.linoxide.com/wp-content/uploads/2015/01/maria-database-migrated.png)

As you see in the above result all old databases including our very linoxidedb has been successfully migrated.

### Conclusion ###

Finally, we have successfully migrated our databases from MySQL to MariaDB Database Management System. MariaDB is far more better than MySQL. Though MySQL is still faster than MariaDB in performance but MariaDB is far more better because of its additional features and license. MariaDB is a Free and Open Source Software (FOSS) and will be FOSS forever but MySQL has many additional plugins, etc non-free and there is no proper public roadmap and won't be FOSS in future. If you have any questions, comments, feedback to us, please don't hesitate to write on the comment box below. Thank You ! And Enjoy MariaDB.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/migrate-mysql-mariadb-linux/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://mariadb.org/
[2]:https://downloads.mariadb.org/mariadb/repositories/#mirror=mephi
