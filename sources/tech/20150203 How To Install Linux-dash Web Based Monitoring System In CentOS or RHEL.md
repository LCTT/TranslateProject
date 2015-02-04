Translating----geekpi

How To Install Linux-dash Web Based Monitoring System In CentOS/RHEL
================================================================================
**Linux-dash** is a web-based lightweight monitoring dashboard for Linux machines. This application will display real-time, various system properties, such as CPU load, RAM usage, disk usage, Internet speed, network connections, RX/TX bandwidth, logged-in users, running processes etc. It will not store long term statistics, Thus it doesn’t have a backend database.

In this article i will show you how to install and setup Linux dash, Here my web server is **Nginx**.

### Installation ###

First of all we should enable, [EPEL repository][1].

**Next, we need to install nginx with the following command.**

    sudo yum install nginx

**Install php-fpm component**

    sudo yum install git php-common php-fpm

Now, we have to configure nginx for Linux-dash. So create /etc/nginx/conf.d/linuxdash.conf as follows.

    sudo vim /etc/nginx/conf.d/linuxdash.conf

----------

    server {
     server_name $domain_name;
     listen 8080;
     root /var/www;
     index index.html index.php;
     access_log /var/log/nginx/access.log;
     error_log /var/log/nginx/error.log;
     
     location ~* \.(?:xml|ogg|mp3|mp4|ogv|svg|svgz|eot|otf|woff|ttf|css|js|jpg|jpeg|gif|png|ico)$ {
     try_files $uri =404;
     expires max;
     access_log off;
     add_header Pragma public;
     add_header Cache-Control "public, must-revalidate, proxy-revalidate";
     }
     
     location /linux-dash {
     index index.html index.php;
     }
     
     # PHP-FPM via sockets
     location ~ \.php(/|$) {
     fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
     fastcgi_split_path_info ^(.+?\.php)(/.*)$;
     fastcgi_pass unix:/var/run/php-fpm.sock;
     if (!-f $document_root$fastcgi_script_name) {
     return 404;
     }
     try_files $uri $uri/ /index.php?$args;
     include fastcgi_params;
     }
    }

**Next job is to configure php-fpm. Open  /etc/php-fpm.d/www.conf in your Favorite editor.**

    sudo vim /etc/php-fpm.d/www.conf

**Make sure to set “listen”, “user” and “group” fields as below. You can leave the rest of the configuration unchanged.**

    . . .
    listen = /var/run/php-fpm.sock
    user = nginx
    group = nginx
    . . .

**Now, We are going to Download and install linux-dash under /var/www**

    git clone https://github.com/afaqurk/linux-dash.git
    sudo cp -r linux-dash/ /var/www/
    sudo chown -R nginx:nginx /var/www

**Next, restart Nginx web server as well as** php-fpm

    sudo service nginx restart
    sudo service php-fpm restart

**Set nginx and php-fpm to auto-start upon boot**

    sudo chkconfig nginx on
    sudo chkconfig php-fpm on

In this example, we have configured linux-dash to use TCP port 8080. So make sure that the firewall is not blocking TCP port 8080.

### Monitor a Linux server with linux-dash ###

You can access Linux-dash by pointing you browser to **http://<linux-IP-address>:8080/linux-dash/**

The web dashboard consists of several widgets, each of which displays particular system properties. You can customize the look of the web dashboard by rearranging and/or closing some of the widgets.

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/Lin-dash.png)

Good day!

See you guys with next article.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-linux-dash-web-based-monitoring-system-centosrhel/

作者：[Jijo][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/jijo/
[1]:http://www.unixmen.com/install-epel-repository-centos-rhel-7/
