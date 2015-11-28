How to Install Nginx as Reverse Proxy for Apache on FreeBSD 10.2
================================================================================
Nginx is free and open source HTTP server and reverse proxy, as well as an mail proxy server for IMAP/POP3. Nginx is high performance web server with rich of features, simple configuration and low memory usage. Originally written by Igor Sysoev on 2002, and until now has been used by a big technology company including Netflix, Github, Cloudflare, WordPress.com etc.

In this tutorial we will "**install and configure nginx web server as reverse proxy for apache on freebsd 10.2**". Apache will run with php on port 8080, and then we need to configure nginx run on port 80 to receive a request from user/visitor. If user request for web page from the browser on port 80, then nginx will pass the request to apache webserver and PHP that running on port 8080.

#### Prerequisite #### 

- FreeBSD 10.2.
- Root privileges.

### Step 1 - Update the System ###

Log in to your freebsd server with ssh credential and update system with command below :

    freebsd-update fetch
    freebsd-update install

### Step 2 - Install Apache ###

pache is open source HTTP server and the most widely used web server. Apache is not installed by default on freebsd, but we can install it from the ports or package on "/usr/ports/www/apache24" or install it from freebsd repository with pkg command. In this tutorial we will use pkg command to install from the freebsd repository :

    pkg install apache24

### Step 3 - Install PHP ###

Once apache is installed, followed with installing php for handling a PHP file request by a user. We will install php with pkg command as below :

    pkg install php56 mod_php56 php56-mysql php56-mysqli

### Step 4 - Configure Apache and PHP ###

Once all is installed, we will configure apache to run on port 8080, and php working with apache. To configure apache, we can edit the configuration file "httpd.conf", and for PHP we just need to copy the php configuration file php.ini on "/usr/local/etc/" directory.

Go to "/usr/local/etc/" directory and copy php.ini-production file to php.ini :

    cd /usr/local/etc/
    cp php.ini-production php.ini

Next, configure apache by editing file "httpd.conf" on apache directory :

    cd /usr/local/etc/apache24
    nano -c httpd.conf

Port configuration on line **52** :

    Listen 8080

ServerName configuration on line **219** :

    ServerName 127.0.0.1:8080

Add DirectoryIndex file that apache will serve it if a directory requested on line **277** :

    DirectoryIndex index.php index.html

Configure apache to work with php by adding script below under line **287** :

    <FilesMatch "\.php$">
    SetHandler application/x-httpd-php
    </FilesMatch>
    <FilesMatch "\.phps$">
    SetHandler application/x-httpd-php-source
    </FilesMatch>

Save and exit.

Now add apache to start at boot time with sysrc command :

    sysrc apache24_enable=yes

And test apache configuration with command below :

    apachectl configtest

If there is no error, start apache :

    service apache24 start

If all is done, verify that php is running well with apache by creating phpinfo file on "/usr/local/www/apache24/data" directory :

    cd /usr/local/www/apache24/data
    echo "<?php phpinfo(); ?>" > info.php

Now visit the freebsd server IP : 192.168.1.123:8080/info.php.

![Apache and PHP on Port 8080](http://blog.linoxide.com/wp-content/uploads/2015/11/Apache-and-PHP-on-Port-8080.png)

Apache is working with php on port 8080.

### Step 5 - Install Nginx ###

Nginx high performance web server and reverse proxy with low memory consumption. In this step we will use nginx as reverse proxy for apache, so let's install it with pkg command :

    pkg install nginx

### Step 6 - Configure Nginx ###

Once nginx is installed, we must configure it by replacing nginx file "**nginx.conf**" with new configuration below. Change the directory to "/usr/local/etc/nginx/" and backup default nginx.conf :

    cd /usr/local/etc/nginx/
    mv nginx.conf nginx.conf.oroginal

Now create new nginx configuration file :

    nano -c nginx.conf

and paste configuration below :

    user  www;
    worker_processes  1;
    error_log  /var/log/nginx/error.log;

    events {
    worker_connections  1024;
    }

    http {
    include       mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    '$status $body_bytes_sent "$http_referer" '
    '"$http_user_agent" "$http_x_forwarded_for"';
    access_log /var/log/nginx/access.log;

    sendfile        on;
    keepalive_timeout  65;

    # Nginx cache configuration
    proxy_cache_path    /var/nginx/cache levels=1:2 keys_zone=my-cache:8m max_size=1000m inactive=600m;
    proxy_temp_path     /var/nginx/cache/tmp;
    proxy_cache_key     "$scheme$host$request_uri";

    gzip  on;

    server {
    #listen       80;
    server_name  _;

    location /nginx_status {

    stub_status on;
    access_log off;
    }

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
    root   /usr/local/www/nginx-dist;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:8080
    #
    location ~ \.php$ {
    proxy_pass   http://127.0.0.1:8080;
    include /usr/local/etc/nginx/proxy.conf;
    }
    }

    include /usr/local/etc/nginx/vhost/*;

    }

Save and exit.

Next, create new file called **proxy.conf** for reverse proxy configuration on nginx directory :

    cd /usr/local/etc/nginx/
    nano -c proxy.conf

Paste configuration below :

    proxy_buffering         on;
    proxy_redirect          off;
    proxy_set_header        Host            $host;
    proxy_set_header        X-Real-IP       $remote_addr;
    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
    client_max_body_size    10m;
    client_body_buffer_size 128k;
    proxy_connect_timeout   90;
    proxy_send_timeout      90;
    proxy_read_timeout      90;
    proxy_buffers           100 8k;
    add_header              X-Cache $upstream_cache_status;

Save and exit.

And the last, create new directory for nginx cache on "/var/nginx/cache" :

    mkdir -p /var/nginx/cache

### Step 7 - Configure Nginx VirtualHost ###

In this step we will create new virtualhost for domain "saitama.me", with document root on "/usr/local/www/saitama.me" and the log file on "/var/log/nginx" directory.

First thing we must do is creating new directory to store the virtualhost file, we here use new directory called "**vhost**". Let's create it :

    cd /usr/local/etc/nginx/
    mkdir vhost

vhost directory has been created, now go to the directory and create new file virtualhost. I'me here will create new file "**saitama.conf**" :

    cd vhost/
    nano -c saitama.conf

Paste virtualhost configuration below :

    server {
    # Replace with your freebsd IP
    listen 192.168.1.123:80;

    # Document Root
    root /usr/local/www/saitama.me;
    index index.php index.html index.htm;

    # Domain
    server_name www.saitama.me saitama.me;

    # Error and Access log file
    error_log  /var/log/nginx/saitama-error.log;
    access_log /var/log/nginx/saitama-access.log main;

    # Reverse Proxy Configuration
    location ~ \.php$ {
    proxy_pass http://127.0.0.1:8080;
    include /usr/local/etc/nginx/proxy.conf;

    # Cache configuration
    proxy_cache my-cache;
    proxy_cache_valid 10s;
    proxy_no_cache $cookie_PHPSESSID;
    proxy_cache_bypass $cookie_PHPSESSID;
    proxy_cache_key "$scheme$host$request_uri";

    }

    # Disable Cache for the file type html, json
    location ~* .(?:manifest|appcache|html?|xml|json)$ {
    expires -1;
    }

    # Enable Cache the file 30 days
    location ~* .(jpg|png|gif|jpeg|css|mp3|wav|swf|mov|doc|pdf|xls|ppt|docx|pptx|xlsx)$ {
    proxy_cache_valid 200 120m;
    expires 30d;
    proxy_cache my-cache;
    access_log off;
    }

    }

Save and exit.

Next, create new log directory for nginx and virtualhost on "/var/log/" :

    mkdir -p /var/log/nginx/

If all is done, let's create a directory for document root for saitama.me :

    cd /usr/local/www/
    mkdir saitama.me

### Step 8 - Testing ###

This step is just test our nginx configuration and test the nginx virtualhost.

Test nginx configuration with command below :

    nginx -t

If there is no problem, add nginx to boot time with sysrc command, and then start it and restart apache:

    sysrc nginx_enable=yes
    service nginx start
    service apache24 restart

All is done, now verify the the php is working by adding new file phpinfo on saitama.me directory :

    cd /usr/local/www/saitama.me
    echo "<?php phpinfo(); ?>" > info.php

Visit the domain : **www.saitama.me/info.php**.

![Virtualhost Configured saitamame](http://blog.linoxide.com/wp-content/uploads/2015/11/Virtualhost-Configured-saitamame.png)

Nginx as reverse proxy for apache is working, and php is working too.

And this is another results :

Test .html file with no-cache.

    curl -I www.saitama.me

![html with no-cache](http://blog.linoxide.com/wp-content/uploads/2015/11/html-with-no-cache.png)

Test .css file with 30day cache.

    curl -I www.saitama.me/test.css

![css file 30day cache](http://blog.linoxide.com/wp-content/uploads/2015/11/css-file-30day-cache.png)

Test .php file with cache :

    curl -I www.saitama.me/info.php

![PHP file cached](http://blog.linoxide.com/wp-content/uploads/2015/11/PHP-file-cached.png)

All is done.

### Conclusion ###

Nginx is most popular HTTP server and reverse proxy. Has a rich of features with high performance and low memory/RAM usage. Nginx use too for caching, we can cache a static file on the web to make the web fast load, and cache for php file if a user request for it. Nginx is easy to configure and use, use for HTTP server or act as reverse proxy for apache.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-nginx-reverse-proxy-apache-freebsd-10-2/

作者：[Arul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/