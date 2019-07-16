[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install LEMP (Linux, Nginx, MariaDB, PHP) on Fedora 30 Server)
[#]: via: (https://www.linuxtechi.com/install-lemp-stack-fedora-30-server/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Install LEMP (Linux, Nginx, MariaDB, PHP) on Fedora 30 Server
======

In this article, we’ll be looking at how to install **LEMP** stack on Fedora 30 Server. LEMP Stands for:

  * L -> Linux
  * E -> Nginx
  * M -> Maria DB
  * P -> PHP



I am assuming **[Fedora 30][1]** is already installed on your system.

![LEMP-Stack-Fedora30][2]

LEMP is a collection of powerful software setup that is installed on a Linux server to help in developing popular development platforms to build websites, LEMP is a variation of LAMP wherein instead of **Apache** , **EngineX (Nginx)** is used as well as **MariaDB** used in place of **MySQL**. This how-to guide is a collection of separate guides to install Nginx, Maria DB and PHP.

### Install Nginx, PHP 7.3 and PHP-FPM on Fedora 30 Server

Let’s take a look at how to install Nginx and PHP along with PHP FPM on Fedora 30 Server.

### Step 1) Switch to root user

First step in installing Nginx in your system is to switch to root user. Use the following command :

```
root@linuxtechi ~]$ sudo -i
[sudo] password for pkumar:
[root@linuxtechi ~]#
```

### Step 2) Install Nginx, PHP 7.3 and PHP FPM using dnf command

Install Nginx using the following dnf command:

```
[root@linuxtechi ~]# dnf install nginx php php-fpm php-common -y
```

### Step 3) Install Additional PHP modules

The default installation of PHP only comes with the basic and the most needed modules installed. If you need additional modules like GD, XML support for PHP, command line interface Zend OPCache features etc, you can always choose your packages and install everything in one go. See the sample command below:

```
[root@linuxtechi ~]# sudo dnf install php-opcache php-pecl-apcu php-cli php-pear php-pdo php-pecl-mongodb php-pecl-redis php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml -y
```

### Step 4) Start & Enable Nginx and PHP-fpm Service

Start and enable Nginx service using the following command

```
[root@linuxtechi ~]# systemctl start nginx && systemctl enable nginx
Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /usr/lib/systemd/system/nginx.service.
[root@linuxtechi ~]#
```

Use the following command to start and enable PHP-FPM service

```
[root@linuxtechi ~]# systemctl start php-fpm && systemctl enable php-fpm
Created symlink /etc/systemd/system/multi-user.target.wants/php-fpm.service → /usr/lib/systemd/system/php-fpm.service.
[root@linuxtechi ~]#
```

**Verify Nginx (Web Server) and PHP installation,**

**Note:** In case OS firewall is enabled and running on your Fedora 30 system, then allow 80 and 443 ports using beneath commands,

```
[root@linuxtechi ~]# firewall-cmd --permanent --add-service=http
success
[root@linuxtechi ~]#
[root@linuxtechi ~]# firewall-cmd --permanent --add-service=https
success
[root@linuxtechi ~]# firewall-cmd --reload
success
[root@linuxtechi ~]#
```

Open the web browser, type the following URL: http://<Your-Server-IP>

[![Test-Page-HTTP-Server-Fedora-30][3]][4]

Above screen confirms that NGINX is installed successfully.

Now let’s verify PHP installation, create a test php page(info.php) using the beneath command,

```
[root@linuxtechi ~]# echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/info.php
[root@linuxtechi ~]#
```

Type the following URL in the web browser,

http://<Your-Server-IP>/info.php

[![Php-info-page-fedora30][5]][6]

Above page confirms that PHP 7.3.5 has been installed successfully. Now let’s install MariaDB database server.

### Install MariaDB on Fedora 30

MariaDB is a great replacement for MySQL DB as it is works much similar to MySQL and also compatible with MySQL steps too. Let’s look at the steps to install MariaDB on Fedora 30 Server

### Step 1) Switch to Root User

First step in installing MariaDB in your system is to switch to root user or you can use a local user who has root privilege. Use the following command below:

```
[root@linuxtechi ~]# sudo -i
[root@linuxtechi ~]#
```

### Step 2) Install latest version of MariaDB (10.3) using dnf command

Use the following command to install MariaDB on Fedora 30 Server

```
[root@linuxtechi ~]# dnf install mariadb-server -y
```

### Step 3) Start and enable MariaDB Service

Once the mariadb is installed successfully in step 2), next step is to start the MariaDB service. Use the following command:

```
[root@linuxtechi ~]# systemctl start mariadb.service ; systemctl enable mariadb.service
```

### Step 4) Secure MariaDB Installation

When we install MariaDB server, so by default there is no root password, also anonymous users are created in database. So, to secure MariaDB installation, run the beneath “mysql_secure_installation” command

```
[root@linuxtechi ~]# mysql_secure_installation
```

Next you will be prompted with some question, just answer the questions as shown below:

![Secure-MariaDB-Installation-Part1][7]

![Secure-MariaDB-Installation-Part2][8]

### Step 5) Test MariaDB Installation

Once you have installed, you can always test if MariaDB is successfully installed on the server. Use the following command:

```
[root@linuxtechi ~]# mysql -u root -p
Enter password:
```

Next you will be prompted for a password. Enter the password same password that you have set during MariaDB secure installation, then you can see the MariaDB welcome screen.

```
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 17
Server version: 10.3.12-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

And finally, we’ve completed everything to install LEMP (Linux, Nginx, MariaDB and PHP) on your server successfully. Please post all your comments and suggestions in the feedback section below and we’ll respond back at the earliest.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-lemp-stack-fedora-30-server/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/fedora-30-workstation-installation-guide/
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/06/LEMP-Stack-Fedora30.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Test-Page-HTTP-Server-Fedora-30-1024x732.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Test-Page-HTTP-Server-Fedora-30.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Php-info-page-fedora30-1024x732.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Php-info-page-fedora30.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Secure-MariaDB-Installation-Part1.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Secure-MariaDB-Installation-Part2.jpg
