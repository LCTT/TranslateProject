Translating----geekpi

How to Install MariaDB in Ubuntu 14.04 LTS
================================================================================
MariaDB is an Open Source database Server & It is 100 % compatible  with MySQL, drop-in replacement to MySQL database server.

### Background of MariaDB : ###

In 2008, MySQL was acquired by **Sun Microsystems**, which was in turn acquired by Oracle Corporation in 2010. While the initial acquisition by Sun was hailed by many in the MySQL community as exactly what the project needed, that sentiment did not last, and the subsequent acquisition by Oracle was unfortunately met with far lower expectations. Many of MySQL’s developers left Sun and Oracle to work on new projects . Among them was **Michael ‘Monty’ Widenius**, creator of MySQL and one of the project’s longtime technical lead. Monty and his team created a fork (offshoot) of the MySQL code base and named his new DBMS **MariaDB**

In this Post we will discuss how to install MariaDB in Ubuntu Linux. By default mariadb packages are not included in Ubuntu Repositories. So to install mariadb , we we have set MariaDB repository.

#### Setting Up MariaDB Repository ####

    $ sudo apt-get install software-properties-common
    $ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
    $ sudo add-apt-repository 'deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main'

#### Installation of MariaDB : ####

    $ sudo apt-get update
    $ sudo apt-get install mariadb-server

While Installing MariaDB , you will be asked to set Maria DB root Password.

![](http://www.linuxtechi.com/wp-content/uploads/2014/10/mariadb-root-1024x442-1.jpg)

#### Connect To MariaDB From the Command Line : ####

    linuxtechi@mail:~$ mysql -uroot -p
    Enter password: 
    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 40
    Server version: 10.0.14-MariaDB-1~trusty-log mariadb.org binary distribution
    Copyright (c) 2000, 2014, Oracle, SkySQL Ab and others.
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    MariaDB [(none)]>

#### Maria DB Service ####

    $ sudo /etc/init.d/mysql stop
    $ sudo /etc/init.d/mysql start

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/install-mariadb-in-ubuntu/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/