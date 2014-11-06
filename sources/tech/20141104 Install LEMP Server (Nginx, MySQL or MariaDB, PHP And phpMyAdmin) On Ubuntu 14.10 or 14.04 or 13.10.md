zpl1025
Install LEMP Server (Nginx, MySQL or MariaDB, PHP And phpMyAdmin) On Ubuntu 14.10/14.04/13.10 
================================================================================
**LEMP** is a combination of the operating system and open-source software stack. The acronym LEMP comes from the first letters of **L**inux, Nginx(**e**ngine-x) HTTP Server, **M**ySQL database, and **P**HP/**P**erl/**P**ython.

In this tutorial, let us see how to install Nginx, MySQL or MariaDB, PHP and phpMyAdmin on Ubuntu 14.10.

### Install Nginx ###

**Nginx** (pronounced as engine-x) is a free, open-source, high-performance HTTP server and reverse proxy, as well as an IMAP/POP3 proxy server written by Igor Sysoev.

To install Nginx enter the following command in your terminal:

**Note**: If you have already installed apache2 in your system, remove it first to avoid conflicts. To uninstall apache, run the following commands:

    sudo apt-get purge apache2*
    sudo apt-get autoremove -y

Now, install nginx using command:

    sudo apt-get install nginx

Start Nginx service using the command:

    sudo service nginx start

### Test nginx ###

Open up your web browser and navigate to http://ip-address/ or http://localhost/. You will see a screen something like below.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Welcome-to-nginx-Mozilla-Firefox_005.png)

### Configure Nginx ###

Open the file **/etc/nginx/nginx.conf** in any editor:

    sudo nano /etc/nginx/nginx.conf

Set the worker_processes (i.e No. of CPU’s in your system). To see the no. of CPU’s, use the command “lscpu”. In my case it’s “1″. So I set this as ’1′.

    worker_processes 1;

Restart Nginx service:

    sudo service nginx restart

The default vhost(server block) is defined in the **/etc/nginx/sites-available/default** file.

Open the file /etc/nginx/sites-available/default in any editor.

    sudo nano /etc/nginx/sites-available/default

Under the Server section, set the server FQDN or IP address as shown below. Make sure you’ve added a index.php line.

    [...]
    server {
          listen 80 default_server;
          listen [::]:80 default_server ipv6only=on;
          root /usr/share/nginx/html;
          index index.php index.html index.htm;
          # Make site accessible from http://localhost/
          server_name server.unixmen.local;
    [...]

Here,

- **listen 80;** –> listen for ipv4
- **listen [::]:80 default_server ipv6only=on;** –> listen for ipv6
- **root /usr/share/nginx/html;** –> document root directory.
- **server_name server.unixmen.local;** –> Server FQDN.

Now, scroll down further and find the section #location **~ \.php$**. Uncomment and modify the following lines as shown below.

     location ~ \.php$ {
             try_files $uri =404;   ---------> Add this line
             fastcgi_split_path_info ^(.+\.php)(/.+)$;
             #       # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini
             #
             #       # With php5-cgi alone:
             #       fastcgi_pass 127.0.0.1:9000;
             #       # With php5-fpm:
             fastcgi_pass unix:/var/run/php5-fpm.sock;
             fastcgi_index index.php;
             include fastcgi.conf;
        }

Here, I added an extra line **‘try_files $uri =404;’** to prevent zero day exploits.

Save and exit the file.

### Test nginx configuration ###

Test the nginx configuration for any syntax errors using command:

    sudo nginx -t

Sample output:

    nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    nginx: configuration file /etc/nginx/nginx.conf test is successful

Finally restart nginx service

    sudo service nginx restart

### Install MySQL ###

**MySQL** is a relational database management system (RDBMS) that runs as a server providing multi-user access to a number of databases, though SQLite probably has more total embedded deployments

    sudo apt-get install mysql-server mysql-client

During installation, you’ll be asked to setup the MySQL root user password. Enter the password and click Ok.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_001.png)

Re-enter the password.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_0021.png)

Now, MySQL server has been installed.

You can verify the MySQL server status using command:

    sudo service mysql status

Sample output:

    mysql start/running, process 5671

**Note**: If you want to use MariaDB instead of MySQL, then follow the below steps.

### Install MariaDB ###

**MariaDB** is a drop in replacement for MySQL. It is a robust, scalable and reliable SQL server that comes rich set of enhancements.

First you have to remove existing MySQL packages if any. To completely uninstall MySQL with configuration files, enter the following command:

    sudo apt-get purge mysql*

Run the following command to remove unwanted packages.

    sudo apt-get autoremove

After removing MySQL, run the following command to install MariaDB.

    sudo apt-get install mariadb-server mariadb-client

Alternatively, you can install it from [MariaDB repository][1] if you want to try most recent version of MariaDB. Run the following commands to add PPA. As of writing this, MariaDB PPA is not yet updated to Ubuntu 14.10. However, we can use the repository of Ubuntu 14.04 instead.

    sudo apt-get install software-properties-common
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
    sudo add-apt-repository 'deb http://sgp1.mirrors.digitalocean.com/mariadb/repo/5.5/ubuntu trusty main'

Update the software sources list and install MariaDB using following commands:

    sudo apt-get update
    sudo apt-get install mariadb-server mariadb-client -y

During installation you will be asked to set database ‘root’ user password.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_0031.png)

Re-enter password:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_004.png)

Click Yes to migrate to MariaDB. Note that you’ll not be asked this question if you install MariaDB before MySQL.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_005.png)

You can check the MariaDB version using command:

    sudo mysql -v -u root -p

Sample output:

    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 34
    Server version: 5.5.39-MariaDB-2 (Ubuntu)
    
    Copyright (c) 2000, 2014, Oracle, Monty Program Ab and others.
    
    Reading history-file /home/sk/.mysql_history
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

Check if mariadb is running or not, using the following command:

    sudo service mysql status

Sample output:

     * /usr/bin/mysqladmin  Ver 9.0 Distrib 5.5.39-MariaDB, for debian-linux-gnu on x86_64
    Copyright (c) 2000, 2014, Oracle, Monty Program Ab and others.
    
    Server version        5.5.39-MariaDB-2
    Protocol version    10
    Connection        Localhost via UNIX socket
    UNIX socket        /var/run/mysqld/mysqld.sock
    Uptime:            2 min 21 sec
    
    Threads: 1  Questions: 566  Slow queries: 0  Opens: 330  Flush tables: 4  Open tables: 22  Queries per second avg: 4.014

### Install PHP ###

**PHP** (recursive acronym for PHP: Hypertext Preprocessor) is a widely used open-source general purpose scripting language that is especially suited for web development and can be embedded into HTML.

Install PHP with following command:

    sudo apt-get install php5 php5-fpm php5-mysql

### Configure PHP ###

Open **php.ini** file in any editor:

    sudo nano /etc/php5/fpm/php.ini

Find the line ‘cgi.fix_pathinfo=1′, uncomment it and change the value 1 to 0.

    cgi.fix_pathinfo=0

Now restart php-fpm service.

    sudo service php5-fpm restart

### Test PHP ###

Create a sample “testphp.php” file in nginx document root folder.

    sudo nano /usr/share/nginx/html/testphp.php

Add the following lines in it.

    <?php
     phpinfo();
    ?>

Save and exit the file.

Navigate to  **http://server-ip-address/testphp.php**. It will display all the details about php such as version, build date and commands etc.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/phpinfo-Mozilla-Firefox_0012.png)

PHP-FPM listens on the socket **/var/run/php5-fpm.sock** by default. If you want to make PHP-FPM use a TCP connection, open the file **/etc/php5/fpm/pool.d/www.conf**,

    sudo nano /etc/php5/fpm/pool.d/www.conf

Find the line listen = /var/run/php5-fpm.sock,

    ;listen = /var/run/php5-fpm.sock

and modify it to **listen = 127.0.0.1:9000**.

    listen = 127.0.0.1:9000

Save and exit the file. Restart php5-fpm service.

    sudo service php5-fpm restart

Now open the nginx configuration file:

    sudo nano /etc/nginx/sites-available/default

Find the line **fastcgi_pass unix:/var/run/php5-fpm.sock;** and change it to fastcgi_pass 127.0.0.1:9000; as shown below.

    location ~ \.php$ {
            try_files $uri =404;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;fastcgi_pass 127.0.0.1:9000;
            #       # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini
            #
            #       # With php5-cgi alone:
            fastcgi_pass 127.0.0.1:9000;
            #       # With php5-fpm:
            #        fastcgi_pass unix:/var/run/php5-fpm.sock;
            fastcgi_index index.php;
            include fastcgi.conf;
       }

Save and exit the file. Finally restart nginx service.

    sudo service nginx restart

### Manage MySQL Databases Using phpMyAdmin (Optional) ###

**phpMyAdmin** is a free open-source web interface tool used to manage your MySQL databases.

### Install phpMyAdmin ###

It is available in the Official Debian repositories. So install it with command:

    sudo apt-get install phpmyadmin

Select any webserver. By default, nginx will not be displayed here. So, select apache or lighttpd, and we will link phpmyadmin to work with nginx webserver later.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_007.png)

Select Yes to configure database for phpmyadmin with dbconfig-common.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_008.png)

Enter password of the database’s administrative user.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_009.png)

Enter MySQL application password phpmyadmin.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_010.png)

Re-enter the password.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sk@server-_011.png)

The phpMyAdmin installation has been completed.

Create a symbolic link between phpMyAdmin and the website root directory. Here our website root document directory is /usr/share/nginx/html/.

    sudo ln -s /usr/share/phpmyadmin/ /usr/share/nginx/html

Restart nginx server.

    sudo service nginx restart

### Access phpMyAdmin Web Console ###

Now you can access the phpmyadmin console by navigating to **http://server-ip-address/phpmyadmin/** from your browser.

Enter your MySQL username and password which you have given in previous steps. In my case its “root” and “ubuntu”.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/phpMyAdmin-Mozilla-Firefox_0021.png)

You will be redirected to PhpMyAdmin main web interface.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/192.168.1.100-localhost-phpMyAdmin-4.2.6deb1-Mozilla-Firefox_0031.png)

Now you can manage your MySQL databases from phpMyAdmin web interface.

That’s it. Your LEMP server is now up and ready to use.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-lemp-server-nginx-mysql-mariadb-php-phpmyadmin-ubuntu-14-1014-0413-10/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:https://downloads.mariadb.org/mariadb/repositories/#mirror=tsinghua
