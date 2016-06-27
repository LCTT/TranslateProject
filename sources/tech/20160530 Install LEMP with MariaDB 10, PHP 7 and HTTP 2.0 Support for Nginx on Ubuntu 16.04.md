Install LEMP with MariaDB 10, PHP 7 and HTTP 2.0 Support for Nginx on Ubuntu 16.04
=====================================================================================


The LEMP stack is an acronym which represents is a group of packages (Linux OS, Nginx web server, MySQL\MariaDB database and PHP server-side dynamic programming language) which are used to deploy dynamic web applications and web pages.

![](http://www.tecmint.com/wp-content/uploads/2016/05/Install-Nginx-with-FastCGI-on-Ubuntu-16.04.png)
>Install Nginx with MariaDB 10, PHP 7 and HTTP 2.0 Support on Ubuntu 16.04

This tutorial will guide you on how to install a LEMP stack (Nginx with MariaDB and PHP7) on Ubuntu 16.04 server.

Requirements

[Installation of Ubuntu 16.04 Server Edition][1]

### Step 1: Install the Nginx Web Server

#### 1. Nginx is a modern and resources efficient web server used to display web pages to visitors on the internet. We’ll start by installing Nginx web server from Ubuntu official repositories by using the [apt command line][2].

```
$ sudo apt-get install nginx
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Install-Nginx-on-Ubuntu-16.04.png)
>Install Nginx on Ubuntu 16.04

#### 2. Next, issue the [netstat][3] and [systemctl][4] commands in order to confirm if Nginx is started and binds on port 80.

```
$ netstat -tlpn
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Check-Nginx-Network-Port-Connection.png)
>Check Nginx Network Port Connection

```
$ sudo systemctl status nginx.service
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Check-Nginx-Service-Status.png)
>Check Nginx Service Status

Once you have the confirmation that the server is started you can open a browser and navigate to your server IP address or DNS record using HTTP protocol in order to visit Nginx default web page.

```
http://IP-Address
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Verify-Nginx-Webpage.png)
>Verify Nginx Webpage

### Step 2: Enable Nginx HTTP/2.0 Protocol

#### 3. The HTTP/2.0 protocol which is build by default in the latest release of Nginx binaries on Ubuntu 16.04 works only in conjunction with SSL and promises a huge speed improvement in loading web SSL web pages.

To enable the protocol in Nginx on Ubuntu 16.04, first navigate to Nginx available sites configuration files and backup the default configuration file by issuing the below command.

```
$ cd /etc/nginx/sites-available/
$ sudo mv default default.backup
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Backup-Nginx-Sites-Configuration-File.png)
>Backup Nginx Sites Configuration File

#### 4. Then, using a text editor create a new default page with the below instructions:

```
server {
        listen 443 ssl http2 default_server;
        listen [::]:443 ssl http2 default_server;

        root /var/www/html;

        index index.html index.htm index.php;

        server_name 192.168.1.13;

        location / {
                try_files $uri $uri/ =404;
        }

        ssl_certificate /etc/nginx/ssl/nginx.crt;
        ssl_certificate_key /etc/nginx/ssl/nginx.key;

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_ciphers EECDH+CHACHA20:EECDH+AES128:RSA+AES128:EECDH+AES256:RSA+AES256:EECDH+3DES:RSA+3DES:!MD5;
        ssl_dhparam  /etc/nginx/ssl/dhparam.pem;
        ssl_session_cache shared:SSL:20m;
        ssl_session_timeout 180m;
        resolver 8.8.8.8 8.8.4.4;
        add_header Strict-Transport-Security "max-age=31536000;
        #includeSubDomains" always;


        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }

}

server {
       listen         80;
       listen    [::]:80;
       server_name    192.168.1.13;
       return         301 https://$server_name$request_uri;
}
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Enable-Nginx-HTTP-2-Protocol.png)
>Enable Nginx HTTP 2 Protocol

The above configuration snippet enables the use of `HTTP/2.0` by adding the http2 parameter to all SSL listen directives.

Also, the last part of the excerpt enclosed in server directive is used to redirect all non-SSL traffic to SSL/TLS default host. Also, replace the `server_name` directive to match your own IP address or DNS record (FQDN preferably).

#### 5. Once you finished editing Nginx default configuration file with the above settings, generate and list the SSL certificate file and key by executing the below commands.

Fill the certificate with your own custom settings and pay attention to Common Name setting to match your DNS FQDN record or your server IP address that will be used to access the web page.

```
$ sudo mkdir /etc/nginx/ssl
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
$ ls /etc/nginx/ssl/
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Generate-SSL-Certificate-and-Key.png)
>Generate SSL Certificate and Key for Nginx

#### 6. Also, create a strong DH cypher, which was changed on the above configuration file on `ssl_dhparam` instruction line, by issuing the below command:

```
$ sudo openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Create-Diffie-Hellman-Key.png)
>Create Diffie-Hellman Key

#### 7. Once the `Diffie-Hellman` key has been created, verify if Nginx configuration file is correctly written and can be applied by Nginx web server and restart the daemon to reflect changes by running the below commands.

```
$ sudo nginx -t
$ sudo systemctl restart nginx.service
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Check-Nginx-Configuration.png)
>Check Nginx Configuration

#### 8. In order to test if Nginx uses HTTP/2.0 protocol issue the below command. The presence of `h2` advertised protocol confirms that Nginx has been successfully configured to use HTTP/2.0 protocol. All modern up-to-date browsers should support this protocol by default.

```
$ openssl s_client -connect localhost:443 -nextprotoneg ''
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Test-Nginx-HTTP-2-Protocol.png)
>Test Nginx HTTP 2.0 Protocol

### Step 3: Install PHP 7 Interpreter

Nginx can be used with PHP dynamic processing language interpreter to generate dynamic web content with the help of FastCGI process manager obtained by installing the php-fpm binary package from Ubuntu official repositories.

#### 9. In order to grab PHP7.0 and the additional packages that will allow PHP to communicate with Nginx web server issue the below command on your server console:

```
$ sudo apt install php7.0 php7.0-fpm 
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Install-PHP-7-PHP-FPM-for-Ngin.png)
>Install PHP 7 and PHP-FPM for Ngin

#### 10. Once the PHP7.0 interpreter has been successfully installed on your machine, start and check php7.0-fpm daemon by issuing the below command:

```
$ sudo systemctl start php7.0-fpm
$ sudo systemctl status php7.0-fpm
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Start-Verify-php-fpm-Service.png)
>Start and Verify php-fpm Service

#### 11. The current configuration file of Nginx is already configured to use PHP FastCGI process manager in order to server dynamic content.

The server block that enables Nginx to use PHP interpreter is presented on the below excerpt, so no further modifications of default Nginx configuration file are required.

```
location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        }
```

Below is a screenshot of what instructions you need to uncomment and modify is case of an original Nginx default configuration file.


![](http://www.tecmint.com/wp-content/uploads/2016/05/Enable-PHP-FastCGI-for-Nginx.png)
>Enable PHP FastCGI for Nginx

#### 12. To test Nginx web server relation with PHP FastCGI process manager create a PHP `info.php` test configuration file by issuing the below command and verify the settings by visiting this configuration file using the below address: `http://IP_or domain/info.php`.

```
$ sudo su -c 'echo "<?php phpinfo(); ?>" |tee /var/www/html/info.php'
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Create-PHP-Info-File.png)
>Create PHP Info File

![](http://www.tecmint.com/wp-content/uploads/2016/05/Verify-PHP-FastCGI-Info.png)
>Verify PHP FastCGI Info

Also check if HTTP/2.0 protocol is advertised by the server by locating the line `$_SERVER[‘SERVER_PROTOCOL’]` on PHP Variables block as illustrated on the below screenshot.

![](http://www.tecmint.com/wp-content/uploads/2016/05/Check-HTTP-2.0-Protocol-Info.png)
>Check HTTP 2.0 Protocol Info

#### 13. In order to install extra PHP7.0 modules use the `apt search php7.0` command to find a PHP module and install it.

Also, try to install the following PHP modules which can come in handy in case you are planning to [install WordPress][5] or other CMS.

```
$ sudo apt install php7.0-mcrypt php7.0-mbstring
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Install-PHP-7-Modules.png)
>Install PHP 7 Modules

#### 14. To register the PHP extra modules just restart PHP-FPM daemon by issuing the below command.

```
$ sudo systemctl restart php7.0-fpm.service
```

### Step 4: Install MariaDB Database

#### 15. Finally, in order to complete our LEMP stack we need the MariaDB database component to store and manage website data.

Install MariaDB database management system by running the below command and restart PHP-FPM service in order to use MySQL module to access the database.

```
$ sudo apt install mariadb-server mariadb-client php7.0-mysql
$ sudo systemctl restart php7.0-fpm.service
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Install-MariaDB-for-Nginx.png)
>Install MariaDB for Nginx

#### 16. To secure the MariaDB installation, run the security script provided by the binary package from Ubuntu repositories which will ask you set a root password, remove anonymous users, disable root login remotely and remove test database.

Run the script by issuing the below command and answer all questions with yes. Use the below screenshot as a guide.

```
$ sudo mysql_secure_installation
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Secure-MariaDB-Installation-for-Nginx.png)
>Secure MariaDB Installation for Nginx

#### 17. To configure MariaDB so that ordinary users can access the database without system sudo privileges, go to MySQL command line interface with root privileges and run the below commands on MySQL interpreter:

```
$ sudo mysql 
MariaDB> use mysql;
MariaDB> update user set plugin=’‘ where User=’root’;
MariaDB> flush privileges;
MariaDB> exit
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/MariaDB-User-Permissions.png)
>MariaDB User Permissions

Finally, login to MariaDB database and run an arbitrary command without root privileges by executing the below command:

```
$ mysql -u root -p -e 'show databases'
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Check-MariaDB-Databases.png)
>Check MariaDB Databases

That’ all! Now you have a **LEMP** stack configured on **Ubuntu 16.04** server that allows you to deploy complex dynamic web applications that can interact with databases.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-nginx-mariadb-php7-http2-on-ubuntu-16-04/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Matei Cezar ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/cezarmatei/
[1]: http://www.tecmint.com/installation-of-ubuntu-16-04-server-edition/
[2]: http://www.tecmint.com/apt-advanced-package-command-examples-in-ubuntu/
[3]: http://www.tecmint.com/20-netstat-commands-for-linux-network-management/
[4]: http://www.tecmint.com/manage-services-using-systemd-and-systemctl-in-linux/
[5]: http://www.tecmint.com/install-wordpress-using-lamp-or-lemp-on-rhel-centos-fedora/
