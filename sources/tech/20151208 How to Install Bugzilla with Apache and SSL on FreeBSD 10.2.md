How to Install Bugzilla with Apache and SSL on FreeBSD 10.2
================================================================================
Bugzilla is open source web base application for bug tracker and testing tool, develop by mozilla project, and licensed under Mozilla Public License. It is used by high tech company like mozilla, redhat and gnome. Bugzilla was originally created by Terry Weissman in 1998. It written in perl, use MySQL as the database back-end. It is a server software designed to help you manage software development. Bugzilla has a lot of features, optimized database, excellent security, advanced search tool, integrated with email capabilities etc.

In this tutorial we will install bugzilla 5.0 with apache for the web server, and enable SSL for it. Then install mysql51 as the database system on freebsd 10.2.

#### Prerequisite ####

    FreeBSD 10.2 - 64bit.
    Root privileges.

### Step 1 - Update System ###

Log in to the freebsd server with ssl login, and update the repository database :

    sudo su
    freebsd-update fetch
    freebsd-update install

### Step 2 - Install and Configure Apache ###

In this step we will install apache from the freebsd repositories with pkg command. Then configure apache by editing file "httpd.conf" on apache24 directory, configure apache to use SSL, and CGI support.

Install apache with pkg command :

    pkg install apache24

Go to the apache directory and edit the file "httpd.conf" with nanao editor :

    cd /usr/local/etc/apache24
    nano -c httpd.conf

Uncomment the list line below :

    #Line 70
    LoadModule authn_socache_module libexec/apache24/mod_authn_socache.so

    #Line 89
    LoadModule socache_shmcb_module libexec/apache24/mod_socache_shmcb.so

    # Line 117
    LoadModule expires_module libexec/apache24/mod_expires.so

    #Line 141 to enabling SSL
    LoadModule ssl_module libexec/apache24/mod_ssl.so

    # Line 162 for cgi support
    LoadModule cgi_module libexec/apache24/mod_cgi.so

    # Line 174 to enable mod_rewrite
    LoadModule rewrite_module libexec/apache24/mod_rewrite.so

    # Line 219 for the servername configuration
    ServerName 127.0.0.1:80

Save and exit.

Next, we need to install mod perl from freebsd repository, and then enable it :

    pkg install ap24-mod_perl2

To enable mod_perl, edit httpd.conf and add to the "Loadmodule" line below :

    nano -c httpd.conf

Add line below :

    # Line 175
    LoadModule perl_module libexec/apache24/mod_perl.so

Save and exit.

And before start apache, add it to start at boot time with sysrc command :

    sysrc apache24_enable=yes
    service apache24 start

### Step 3 - Install and Configure MySQL Database ###

We will use mysql51 for the database back-end, and it is support for perl module for mysql. Install mysql51 with pkg command below :

    pkg install p5-DBD-mysql51 mysql51-server mysql51-client

Now we must add mysql to the boot time, and then start and configure the root password for mysql.

Run command below to do it all :

    sysrc mysql_enable=yes
    service mysql-server start
    mysqladmin -u root password aqwe123

Note :

mysql password : aqwe123

![Configure MySQL Password](http://blog.linoxide.com/wp-content/uploads/2015/12/Configure-MySQL-Password.png)

Next, we will log in to the mysql shell with user root and password that we've configured above, then we will create new database and user for bugzilla installation.

Log in to the mysql shell with command below :

    mysql -u root -p
    password: aqwe123

Add the database :

    create database bugzilladb;
    create user bugzillauser@localhost identified by 'bugzillauser@';
    grant all privileges on bugzilladb.* to bugzillauser@localhost identified by 'bugzillauser@';
    flush privileges;
    \q

![Creating Database for Bugzilla](http://blog.linoxide.com/wp-content/uploads/2015/12/Creating-Database-for-Bugzilla.png)

Database for bugzilla is created, database "bugzilladb" with user "bugzillauser" and password "bugzillauser@".

### Step 4 - Generate New SSL Certificate ###

Generate new self signed ssl certificate on directory "ssl" for bugzilla site.

Go to the apache24 directory and create new directory "ssl" on it :

    cd /usr/local/etc/apache24/
    mkdir ssl; cd ssl

Next, generate the certificate file with openssl command, then change the permission of the certificate file :

    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /usr/local/etc/apache24/ssl/bugzilla.key -out /usr/local/etc/apache24/ssl/bugzilla.crt
    chmod 600 *

### Step 5 - Configure Virtualhost ###

We will install bugzilla on directory "/usr/local/www/bugzilla", so we must create new virtualhost configuration for it.

Go to the apache directory and create new directory called "vhost" for virtualhost file :

    cd /usr/local/etc/apache24/
    mkdir vhost; cd vhost

Now create new file "bugzilla.conf" for the virtualhost file :

    nano -c bugzilla.conf

Paste configuration below :

    <VirtualHost *:80>
    ServerName mybugzilla.me
    ServerAlias www.mybuzilla.me
    DocumentRoot /usr/local/www/bugzilla
    Redirect permanent / https://mybugzilla.me/
    </VirtualHost>

    Listen 443
    <VirtualHost _default_:443>
    ServerName mybugzilla.me
    DocumentRoot /usr/local/www/bugzilla

    ErrorLog "/var/log/mybugzilla.me-error_log"
    CustomLog "/var/log/mybugzilla.me-access_log" common

    SSLEngine On
    SSLCertificateFile /usr/local/etc/apache24/ssl/bugzilla.crt
    SSLCertificateKeyFile /usr/local/etc/apache24/ssl/bugzilla.key

    <Directory "/usr/local/www/bugzilla">
    AddHandler cgi-script .cgi
    Options +ExecCGI
    DirectoryIndex index.cgi index.html
    AllowOverride Limit FileInfo Indexes Options
    Require all granted
    </Directory>
    </VirtualHost>

Save and exit.

If all is done, create new directory for bugzilla installation and then enable the bugzilla virtualhost by adding the virtualhost configuration to httpd.conf file.

Run command below on "apache24" directory :

    mkdir -p /usr/local/www/bugzilla
    cd /usr/local/etc/apache24/
    nano -c httpd.conf

In the end of the line, add configuration below :

    Include etc/apache24/vhost/*.conf

Save and exit.

Now test the apache configuration with "apachectl" command and restart it :

    apachectl configtest
    service apache24 restart

### Step 6 - Install Bugzilla ###

We can install bugzilla manually by downloading the source, or install it from freebsd repository. In this step we will install bugzilla from freebsd repository with pkg command :

    pkg install bugzilla50

If it's done, go to the bugzilla installation directory and install all perl module that needed by bugzilla.

    cd /usr/local/www/bugzilla
    ./install-module --all

Wait it until all is finished, it is take the time.

Next, generate the configuration file "localconfig" by executing "checksetup.pl" file on bugzilla installation directory.

    ./checksetup.pl

You will see the error message about the database configuration, so edit the file "localconfig" with nano editor :

    nano -c localconfig

Now add the database that was created on step 3.

    #Line 57
    $db_name = 'bugzilladb';

    #Line 60
    $db_user = 'bugzillauser';

    #Line 67
    $db_pass = 'bugzillauser@';

Save and exit.

Then run "checksetup.pl" again :

    ./checksetup.pl

You will be prompt about mail and administrator account, fill all of it with your email, user and password.

![Admin Setup](http://blog.linoxide.com/wp-content/uploads/2015/12/Admin-Setup.png)

In the last, we need to change the owner of the installation directory to user "www", then restart apache with service command :

    cd /usr/local/www/
    chown -R www:www bugzilla
    service apache24 restart

Now Bugzilla is installed, you can see it by visiting mybugzilla.me and you will be redirect to the https connection.

Bugzilla home page.

![Bugzilla Home](http://blog.linoxide.com/wp-content/uploads/2015/12/Bugzilla-Home.png)

Bugzilla admin panel.

![Bugzilla Admin Page](http://blog.linoxide.com/wp-content/uploads/2015/12/Bugzilla-Admin-Page.png)

### Conclusion ###

Bugzilla is web based application help you to manage the software development. It is written in perl and use MySQL as the database system. Bugzilla used by mozilla, redhat, gnome etc for help their software development. Bugzilla has a lot of features and easy to configure and install.

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-bugzilla-apache-ssl-freebsd-10-2/

作者：[Arul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/