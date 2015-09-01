translating by mike
在 Debian 或者 Ubuntu 上配置高性能的 HHVM、Nginx/Apache 和 MariaDB
================================================================================
HHVM stands for HipHop Virtual Machine, is an open source virtual machine created for running Hack (it’s a programming language for HHVM) and PHP written applications. HHVM uses a last minute compilation path to achieve remarkable performance while keeping the flexibility that PHP programmers are addicted to. Till date, HHVM has achieved over a 9x increase in http request throughput and more than 5x cut in memory utilization (when running on low system memory) for Facebook compared with the PHP engine + [APC (Alternative PHP Cache)][1].
HHVM全称为 HipHop Virtual Machine, 它是一个由 running Hack(一种编程语言)和 PHP的相关应用组成的开源虚拟机。HHVM 
HHVM can also be used along with a FastCGI-based web-server like Nginx or Apache.

![Install HHVM, Nginx and Apache with MariaDB](http://www.tecmint.com/wp-content/uploads/2015/08/Install-HHVM-Nginx-Apache-MariaDB.png)

Install HHVM, Nginx and Apache with MariaDB

In this tutorial we shall look at steps for setting up Nginx/Apache web server, MariaDB database server and HHVM. For this setup, we will use Ubuntu 15.04 (64-bit) as HHVM runs on 64-bit system only, although Debian and Linux Mint distributions are also supported.

### Step 1: Installing Nginx and Apache Web Server ###

1. First do a system upgrade to update repository list with the help of following commands.

    # apt-get update && apt-get upgrade

![System Upgrade](http://www.tecmint.com/wp-content/uploads/2015/08/System-Upgrade.png)

System Upgrade

2. As I said HHVM can be used with both Nginx and Apache web server. So, it’s your choice which web server you will going to use, but here we will show you both web servers installation and how to use them with HHVM.

#### Installing Nginx ####

In this step, we will install Nginx/Apache web server from the packages repository using following command.

    # apt-get install nginx

![Install Nginx Web Server](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Nginx-Web-Server.png)

Install Nginx Web Server

#### Installing Apache ####

    # apt-get install apache2

![Install Apache Web Server](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Apache-Web-Server.png)

Install Apache Web Server

At this point, you should be able to navigate to following URL and you will able to see Nginx or Apache default page.

    http://localhost
    OR
    http://IP-Address

#### Nginx Default Page ####

![Nginx Welcome Page](http://www.tecmint.com/wp-content/uploads/2015/08/Nginx-Welcome-Page.png)

Nginx Welcome Page

#### Apache Default Page ####

![Apache Default Page](http://www.tecmint.com/wp-content/uploads/2015/08/Apache-Default-Page.png)

Apache Default Page

### Step 2: Install and Configure MariaDB ###

3. In this step, we will install MariaDB, as it providers better performance as compared to MySQL.

    # apt-get install mariadb-client mariadb-server

![Install MariaDB Database](http://www.tecmint.com/wp-content/uploads/2015/08/Install-MariaDB-Database.png)

Install MariaDB Database

4. After MariaDB successful installation, you can start MariaDB and set root password to secure the database:

    # systemctl start mysql
    # mysql_secure_installation

Answer the following questions by typing `y` or `n` and press enter. Make sure you read the instructions carefully before answering the questions.

    Enter current password for root (enter for none) = press enter
    Set root password? [Y/n] = y
    Remove anonymous users[y/n] = y
    Disallow root login remotely[y/n] = y
    Remove test database and access to it [y/n] = y
    Reload privileges tables now[y/n] = y 

5. After setting root password for MariaDB, you can connect to MariaDB prompt with the new root password.

    # mysql -u root -p

### Step 3: Installation of HHVM ###

6. At this stage we shall install and configure HHVM. You need to add the HHVM repository to your `sources.list` file and then you have to update your repository list using following series of commands.

    # wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
    # echo deb http://dl.hhvm.com/ubuntu DISTRIBUTION_VERSION main | sudo tee /etc/apt/sources.list.d/hhvm.list
    # apt-get update

**Important**: Don’t forget to replace DISTRIBUTION_VERSION with your Ubuntu distribution version (i.e. lucid, precise, or trusty.) and also on Debian replace with jessie or wheezy. On Linux Mint installation instructions are same, but petra is the only currently supported distribution.

After adding HHVM repository, you can easily install it as shown.

    # apt-get install -y hhvm

Installing HHVM will start it up now, but it not configured to auto start at next system boot. To set auto start at next boot use the following command.

    # update-rc.d hhvm defaults

### Step 4: Configuring Nginx/Apache to Talk to HHVM ###

7. Now, nginx/apache and HHVM are installed and running as independent, so we need to configure both web servers to talk to each other. The crucial part is that we have to tell nginx/apache to forward all PHP files to HHVM to execute.

If you are using Nginx, follow this instructions as explained..

By default, the nginx configuration lives under /etc/nginx/sites-available/default and these config looks in /usr/share/nginx/html for files to execute, but it don’t know what to do with PHP.

To make Nginx to talk with HHVM, we need to run the following include script that will configure nginx correctly by placing a hhvm.conf at the beginning of the nginx config as mentioned above.

This script makes the nginx to talk to any file that ends with .hh or .php and send it to HHVM via fastcgi.

    # /usr/share/hhvm/install_fastcgi.sh

![Configure Nginx for HHVM](http://www.tecmint.com/wp-content/uploads/2015/08/Configure-Nginx-for-HHVM.png)

Configure Nginx for HHVM

**Important**: If you are using Apache, there isn’t any configuration is needed now.

8. Next, you need to use /usr/bin/hhvm to provide /usr/bin/php (php) by running this command below.

    # /usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

After all the above steps are done, you can now start HHVM and test it.

    # systemctl start hhvm

### Step 5: Testing HHVM with Nginx/Apache ###

9. To verify that hhvm working, you need to create a hello.php file under nginx/apache document root directory.

    # nano /usr/share/nginx/html/hello.php       [For Nginx]
    OR
    # nano /var/www/html/hello.php               [For Nginx and Apache]

Add the following snippet to this file.

    <?php
    if (defined('HHVM_VERSION')) {
    echo 'HHVM is working';
     phpinfo();
    }
    else {
    echo 'HHVM is not working';
    }
    ?>

and then navigate to the following URL and verify to see “hello world“.

    http://localhost/info.php
    OR
    http://IP-Address/info.php

![HHVM Page](http://www.tecmint.com/wp-content/uploads/2015/08/HHVM-Page.png)

HHVM Page

If “HHVM” page appears, then it means you’re all set!

### Conclusion ###

These steps are very easy to follow and hope your find this tutorial useful and if you get any error during installation of any packages, post a comment and we shall find solutions together. And any additional ideas are welcome.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-hhvm-and-nginx-apache-with-mariadb-on-debian-ubuntu/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/install-apc-alternative-php-cache-in-rhel-centos-fedora/
