Install RainLoop Webmail (A Web Based Email Client) using ‘Nginx and Apache’ in Arch Linux
================================================================================
Rainloop is a free Open Source web application written in PHP which provides a fast modern web interface to access your emails on all major domain mail providers like Yahoo, Gmail, Outlook and many others as well as your own local mail servers, and, also, acts as a MUA (Mail User Agent) by accessing domain mail servers through IMAP and SMTP protocols.

#### RainLoop Demo ####

Have a quick look at the demo page setup by the author at [http://demo.rainloop.net/][1].

![Install RainLoop in Arch Linux](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux.jpg)
Install RainLoop in Arch Linux

Once you have deployed Rainloop on your servers the only thing remaining to do is to access your Rainloop domain through a web browser and provide credentials for your enabled domain mail server.

This tutorial covers **Rainloop** webmail installation process on **Arch Linux** from both point of view configuration files for **Apache** and **Nginx**, using a virtual local domain configured through local hosts file, without a DNS server.

If you also need references on installing Rainloop on **Debian** and **Red Hat** systems visit the previous RainLoop Webmail article at.

- [Install RainLoop Webmail on Debian and Red Hat based Systems][2]

### Requirements ###

#### For Nginx ####

- [Install LEMP (Nginx, PHP, MySQL with MariaDB engine and PhpMyAdmin) in Arch Linux][3]
- [Create Virtual Hosts in Nginx Web Server][4]

#### For Apache ####

- [Install LAMP (Linux, Apache, MySQL/MariaDB, and PHP/PhpMyAdmin) in Arch Linux][5]

### Step 1: Create Virtual Hosts for Nginx or Apache ###

**1.** Assuming that you have configured your servers (**Nginx** or **Apache**) as described in upper presentations links, the first thing you need to do is to create a rudimentary **DNS** entry on local **hosts** file that points to **Arch Linux** system IP.

On Linux system edit **/etc/hosts** file and include your Rainloop virtual domain after localhost entry.

    127.0.0.1	localhost.localdomain  localhost     rainloop.lan
    192.168.1.33	rainloop.lan

![Add Domain Host Entry](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-01.jpg)
Add Domain Host Entry

On Windows system edit **C:\Windows\System32\drivers\etc\hosts** and add the following line at the bottom.

    192.168.1.33       rainloop.lan

**2.** After you verify local domain using **ping** command, create the necessary **Virtual Hosts** and **SSL** configurations for **Apache** or **Nginx**.

#### Nginx Virtual Hosts ####

Create a file named **rainloop.lan** in **/etc/nginx/sites-available/** path with the following configuration.

    $ sudo nano /etc/nginx/sites-available/rainloop.conf

Add the following file content.

    server {
        listen 80;
        server_name rainloop.lan;
    
        rewrite        ^ https://$server_name$request_uri? permanent;
        access_log /var/log/nginx/rainloop.lan.access.log;
        error_log /var/log/nginx/rainloop.lan.error.log;
        root /srv/www/rainloop/;
    
        # serve static files
        location ~ ^/(images|javascript|js|css|flash|media|static)/  {
         root    /srv/www/rainloop/;
         expires 30d;
        }
    
        location / {
            index index.html index.htm index.php;
                    autoindex on;
                    autoindex_exact_size off;
                    autoindex_localtime on;
     }
    
     location ^~ /data {
      deny all;
    }
    
        location ~ \.php$ {
            #fastcgi_pass 127.0.0.1:9000; (depending on your php-fpm socket configuration)
            fastcgi_pass unix:/run/php-fpm/php-fpm.sock;
            fastcgi_index index.php;
            include fastcgi.conf;
        }
     }

Then create the SSL equivalent file content.

    $ sudo nano /etc/nginx/sites-available/rainloop-ssl.conf

Add the following file content.

    server {
        listen 443 ssl;
        server_name rainloop.lan;
    
           ssl_certificate     /etc/nginx/ssl/rainloop.lan.crt;
           ssl_certificate_key  /etc/nginx/ssl/rainloop.lan.key;
           ssl_session_cache    shared:SSL:1m;
           ssl_session_timeout  5m;
           ssl_ciphers  HIGH:!aNULL:!MD5;
           ssl_prefer_server_ciphers  on;
    
        access_log /var/log/nginx/rainloop.lan.access.log;
        error_log /var/log/nginx/rainloop.lan.error.log;
    
       root /srv/www/rainloop/;
    
        # serve static files
        location ~ ^/(images|javascript|js|css|flash|media|static)/  {
          root    /srv/www/rainloop/;
          expires 30d;
        }
    
    location ^~ /data {
      deny all;
    }
    
        location / {
            index index.html index.htm index.php;
                    autoindex on;
                    autoindex_exact_size off;
                    autoindex_localtime on;
     }
    
        location ~ \.php$ {
            #fastcgi_pass 127.0.0.1:9000; (depending on your php-fpm socket configuration)
            fastcgi_pass unix:/run/php-fpm/php-fpm.sock;
            fastcgi_index index.php;
            include fastcgi.conf;
        }
     }

On the next step generate **Certificate** file and **Keys** for **SSL Virtual Host** and add your virtual domain name (**rainloop.lan**) on Certificate **Common Name**.

    $ sudo nginx_gen_ssl.sh

![Generate Certificate and Keys](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-04.jpg\)
Generate Certificate and Keys

After the Certificate and SSL keys are generated, create Rainloop **root** webserver file path ( place where Rainloop PHP files reside), then enable Virtual Hosts and restart Nginx daemon to apply configurations.

    $ sudo mkdir -p /srv/www/rainloop
    $ sudo n2ensite rainloop
    $ sudo n2ensite rainloop-ssl
    $ sudo systemctl restart nginx

![Create RainLoop Web Director](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-05.jpg)
Create RainLoop Web Director

#### Apache Virtual Hosts ####

Create a new file named **rainloop.conf** in **/etc/httpd/conf/sites-available/** with the following content.

    $ sudo nano /etc/httpd/conf/sites-available/rainloop.conf

Add the following file content.

    <VirtualHost *:80>
                    ServerName rainloop.lan
                    DocumentRoot "/srv/www/rainloop/"
                    ServerAdmin you@example.com
                    ErrorLog "/var/log/httpd/rainloop-error_log"
                    TransferLog "/var/log/httpd/rainloop-access_log"
    
    <Directory />
        Options +Indexes +FollowSymLinks +ExecCGI
        AllowOverride All
        Order deny,allow
        Allow from all
    Require all granted
    </Directory>
    
    </VirtualHost>

![Create Apache Virtual Host](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-06.jpg)
Create Apache Virtual Host

Then create the SSL equivalent file content for Apache.

    $ sudo nano /etc/httpd/conf/sites-available/rainloop-ssl.conf

Add the following file content.

    <VirtualHost *:443>
                    ServerName rainloop.lan
                    DocumentRoot "/srv/www/rainloop/"
                    ServerAdmin you@example.com
                    ErrorLog "/var/log/httpd/rainloop-ssl-error_log"
                    TransferLog "/var/log/httpd/rainloop-ssl-access_log"
    
    SSLEngine on
    SSLCertificateFile "/etc/httpd/conf/ssl/rainloop.lan.crt"
    SSLCertificateKeyFile "/etc/httpd/conf/ssl/rainloop.lan.key"
    
    <FilesMatch "\.(cgi|shtml|phtml|php)$">
        SSLOptions +StdEnvVars
    </FilesMatch>
    
    BrowserMatch "MSIE [2-5]" \
             nokeepalive ssl-unclean-shutdown \
             downgrade-1.0 force-response-1.0
    
    CustomLog "/var/log/httpd/ssl_request_log" \
              "%t %h %{SSL_PROTOCOL}x %{SSL_CIPHER}x \"%r\" %b"
    
    <Directory />
        Options +Indexes +FollowSymLinks +ExecCGI
        AllowOverride All
        Order deny,allow
        Allow from all
    Require all granted
    </Directory>
    
    </VirtualHost>

The next step is to create **SSL Certificate** file and **Keys** for **SSL Virtual Host** and add put your virtual domain name (**rainloop.lan**) on Certificate **Common Name**.

    $ sudo apache_gen_ssl

![Create SSL Certificate and Keys](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-07.jpg)
Create SSL Certificate and Keys

![Enter Organization Details](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-08.jpg)
Enter Organization Details

After the Certificate and SSL keys are created, add Rainloop **DocumentRoot** path, then enable Virtual Hosts and restart Apache daemon to apply configurations.

    $ sudo mkdir -p /srv/www/rainloop
    $ sudo a2ensite rainloop
    $ sudo a2ensite rainloop-ssl
    $ sudo systemctl restart httpd

![Enable Virtual Hosts](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-09.jpg)
Enable Virtual Hosts

### Step 2: Add necessary PHP Extensions ###

**3.** Whether you are using **Apache** or **Nginx** webserver, you need to enable the following PHP extensions on **php.ini** file and, also, include the new webserver **DocumentRoot** path to open_basedir directive.

    $ sudo nano /etc/php/php.ini

Locate and uncomment the following PHP extensions.

    extension=iconv.so
    extension=imap.so
    extension=mcrypt.so
    extension=mssql.so
    extension=mysqli.so
    extension=openssl.so ( enables IMAPS and SMTP SSL protocols on mail servers)
    extension=pdo_mysql.so

Also open_basedir statement should look like this.

    open_basedir = /srv/http/:/home/:/tmp/:/usr/share/pear/:/usr/share/webapps/:/etc/webapps/:/srv/www/

**4.** After the **php.ini** file was modified restart your server than check **phpinfo** file to see if **SSL** protocols are enabled.

    ----------On Apache Web Server----------
    $ sudo systemctl restart httpd

----------

    ----------On Nginx Web Server----------
    $ sudo systemctl restart nginx
    $ sudo systemctl restart php-fpm

![Check PHP Information](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-10.png)
Check PHP Information

### Step 3: Download and Install RainLoop Webmail ###

**5.** Now it’s time to download and extract Rainloop application from official website to Document Root directory but first install **wget** and **unzip** system utilities.

    $ sudo pacman -S unzip wget

**6.** Download latest source package Rainloop zip archive using **wget** command or by using a browser to navigate to [http://rainloop.net/downloads/][6].

    $ wget http://repository.rainloop.net/v1/rainloop-latest.zip

![Download RainLoop Package](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-11.png)
Download RainLoop Package

**7.** After the download process finishes, extract Rainloop archive to Virtual Host Document Root path ( **/srv/www/rainloop/** ).

    $ sudo unzip rainloop-latest.zip -d  /srv/www/rainloop/

![Extract Rainloop Archive](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-12.png)
Extract Rainloop Archive

**8.** Then set the following permissions on application default path.

    $ sudo chmod -R 755 /srv/www/rainloop/
    $ sudo chown -R http:http /srv/www/rainloop/

![Set Permission on RainLoop](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-13.jpg)
Set Permission on RainLoop

### Step 4: Configure Rainloop via Web Interface ###

**9.** Rainloop application can be configured in two ways: using a system shell of via browser. If you want to configure over terminal open and edit **application.ini** file located in **/srv/www/rainloop/data/_data_da047852f16d2bc7352b24240a2f1599/_default_/configs/**.

**10.** To access Admin Interface from browser, use the following URL address **https://rainloop.lan/?admin**, then provide the default application credentials.

    User= admin
    Password= 12345

![Rainloop Web Interface](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-14.png)
Rainloop Web Interface

**11.** After initial login you will be warn to change the default password, so I advise you to do it.

![Change Default Password](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-15.png)
Change Default Password

![Set New Admin Password](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-16.png)
Set New Admin Password

**12.** If you want to enable **contacts** login to MySQL database and create a new database with a privileged user on it, then provide database credentials on **Contacts** fields.

    mysql -u root -p
    create database if not exists rainloop;
    create user rainloop_user@localhost identified by “password”;
    grant all privileges on rainloop.* to rainloop_user@localhost;
    flush privileges;
    exit;

![Enable Contacts in RainLoop](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-17.png)
Enable Contacts in RainLoop

![Enter Contact Database Details](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-18.png)
Enter Contact Database Details

**13.** By default Rainloop provides **Gmail**, **Yahoo** and **Outlook** domains mail server configuration files, but you can add other mail server domains if you like.

![Default Mail Domains](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-19.png)
Default Mail Domains

![Add New Domain](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-20.png)
Add New Domain

**14.** To login on your mail server point your browser to **https://rainloop.lan** and provide your domain server credentials.

![Login to Mail Domain](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-21.png)
Login to Mail Domain

![Login to Gmail Domain](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-22.png)
Login to Gmail Domain

![RainLoop Email Interface](http://www.tecmint.com/wp-content/uploads/2014/05/Install-RainLoop-in-Arch-Linux-23.png)
RainLoop Email Interface

For further configurations please visit official Rainloop documentation page at [http://rainloop.net/docs/][7].

With Rainloop you can access mail servers from any device that has a browser as long as your server has Internet connectivity, the only minus of using Rainloop application in Arch Linux so far is the lack of poppassd plugin package needed to change email account password.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-rainloop-webmail-in-arch-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://demo.rainloop.net/
[2]:http://www.tecmint.com/rainloop-webmail-a-modern-fast-web-based-email-client-for-linux/
[3]:http://www.tecmint.com/install-nginx-php-mysql-with-mariadb-engine-and-phpmyadmin-in-arch-linux/
[4]:http://www.tecmint.com/create-virtual-hosts-using-nginx-on-arch-linux/
[5]:http://www.tecmint.com/install-lamp-in-arch-linux/
[6]:http://rainloop.net/downloads/
[7]:http://rainloop.net/docs/