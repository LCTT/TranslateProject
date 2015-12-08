Translated by KnightJoker
如何在FreeBSD 10.2上安装Nginx作为Apache的反向代理
================================================================================
Nginx是一款免费的，开源的HTTP和反向代理服务器, 以及一个代理POP3/IMAP的邮件服务器. Nginx是一款高性能的web服务器，其特点是丰富的功能，简单的结构以及低内存的占用. 第一个版本由 Igor    Sysoev在2002年发布,然而到现在为止很多大的科技公司都在使用，包括 Netflix, Github, Cloudflare, WordPress.com等等

在这篇教程里我们会 "**在freebsd 10.2系统上，安装和配置Nginx网络服务器作为Apache的反向代理**". Apache 会用PHP在8080端口上运行,并且我们需要在80端口配置Nginx的运行，用来接收用户/访问者的请求.如果网页的用户请求来自于浏览器的80端口, 那么Nginx会用Apache网络服务器和PHP来通过这个请求，并运行在8080端口.

#### 前提条件 #### 

- FreeBSD 10.2.
- Root 权限.

### 步骤 1 - 更新系统 ###

使用SSH证书登录到你的FreeBSD服务器以及使用下面命令来更新你的系统  :

    freebsd-update fetch
    freebsd-update install

### 步骤 2 - 安装 Apache ###

Apache是现在使用范围最广的网络服务器以及开源的HTTP服务器.在FreeBSD里Apache是未被默认安装的, 但是我们可以直接从端口下载，或者解压包在"/usr/ports/www/apache24" 目录下，再或者直接从PKG命令的FreeBSD系统信息库安装。在本教程中，我们将使用PKG命令从FreeBSD的库中安装：

    pkg install apache24

### 步骤 3 - 安装 PHP ###

一旦成功安装Apache, 接着将会安装PHP并由一个用户处理一个PHP的文件请求. 我们将会用到如下的PKG命令来安装PHP :

    pkg install php56 mod_php56 php56-mysql php56-mysqli

### 步骤 4 - 配置 Apache 和 PHP ###

一旦所有都安装好了, 我们将会配置Apache在8080端口上运行, 并让PHP与Apache一同工作. 为了配置Apache,我们可以编辑 "httpd.conf"这个配置文件, 然而PHP我们只需要复制PHP的配置文件 php.ini 在 "/usr/local/etc/"目录下.

进入到 "/usr/local/etc/" 目录 并且复制 php.ini-production 文件到 php.ini :

    cd /usr/local/etc/
    cp php.ini-production php.ini

下一步, 在Apache目录下通过编辑 "httpd.conf"文件来配置Apache :

    cd /usr/local/etc/apache24
    nano -c httpd.conf

端口配置在第 **52**行 :

    Listen 8080

服务器名称配置在第 **219** 行:

    ServerName 127.0.0.1:8080

在第 **277**行，如果目录需要，添加的DirectoryIndex文件，Apache将直接作用于它 :

    DirectoryIndex index.php index.html

在第 **287**行下，配置Apache通过添加脚本来支持PHP :

    <FilesMatch "\.php$">
    SetHandler application/x-httpd-php
    </FilesMatch>
    <FilesMatch "\.phps$">
    SetHandler application/x-httpd-php-source
    </FilesMatch>

保存然后退出.

现在用sysrc命令，来添加Apache作为开机启动项目 :

    sysrc apache24_enable=yes

然后用下面的命令测试Apache的配置 :

    apachectl configtest

如果到这里都没有问题的话，那么就启动Apache吧 :

    service apache24 start

如果全部完毕, 在"/usr/local/www/apache24/data" 目录下，创建一个phpinfo文件是验证PHP在Apache下完美运行的好方法 :

    cd /usr/local/www/apache24/data
    echo "<?php phpinfo(); ?>" > info.php

现在就可以访问 freebsd 的服务器 IP : 192.168.1.123:8080/info.php.

![Apache and PHP on Port 8080](http://blog.linoxide.com/wp-content/uploads/2015/11/Apache-and-PHP-on-Port-8080.png)

Apache 是使用 PHP 在 8080端口下运行的.

### 步骤 5 - 安装 Nginx ###

Nginx 以低内存的占用作为一款高性能的web服务器以及反向代理服务器.在这个步骤里，我们将会使用Nginx作为Apache的反向代理, 因此让我们用pkg命令来安装它吧 :

    pkg install nginx

### 步骤 6 - 配置 Nginx ###

一旦 Nginx 安装完毕, 在 "**nginx.conf**" 文件里，我们需要做一个新的配置文件来替换掉原来的nginx文件. 更改到 "/usr/local/etc/nginx/"目录下 并且默认备份到 nginx.conf 文件:

    cd /usr/local/etc/nginx/
    mv nginx.conf nginx.conf.oroginal

现在就可以创建一个新的 nginx 配置文件了 :

    nano -c nginx.conf

然后粘贴下面的配置:

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

保存退出.

下一步, 在nginx目录下面，创建一个 **proxy.conf** 文件，使其作为反向代理 :

    cd /usr/local/etc/nginx/
    nano -c proxy.conf

粘贴如下配置 :

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

保存退出.

最后一步, 为 nginx 的高速缓存创建一个 "/var/nginx/cache"的新目录 :

    mkdir -p /var/nginx/cache

### 步骤 7 - 配置 Nginx 的虚拟主机 ###

在这个步骤里面，我们需要创建一个新的虚拟主机域 "saitama.me", 以跟文件 "/usr/local/www/saitama.me" 和日志文件一同放在 "/var/log/nginx" 目录下.

我们必须做的第一件事情就是创建新的目录来存放虚拟主机文件, 在这里我们将用到一个"**vhost**"的新文件. 并创建它 :

    cd /usr/local/etc/nginx/
    mkdir vhost

创建好vhost 目录, 那么我们就进入这个目录并创建一个新的虚拟主机文件. 这里我取名为 "**saitama.conf**" :

    cd vhost/
    nano -c saitama.conf

粘贴如下虚拟主机的配置 :

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

保存退出.

下一步, 为nginx和虚拟主机创建一个新的日志目录 "/var/log/" :

    mkdir -p /var/log/nginx/

如果一切顺利, 在文件的根目录下创建文件 saitama.me :

    cd /usr/local/www/
    mkdir saitama.me

### 步骤 8 - 测试 ###

在这个步骤里面，我们只是测试我们的nginx和虚拟主机的配置.

用如下命令测试nginx的配置 :

    nginx -t

如果一切都没有问题, 用 sysrc 命令添加nginx为启动项,并且启动nginx和重启apache:

    sysrc nginx_enable=yes
    service nginx start
    service apache24 restart

一切完毕后, 在 saitama.me 目录下，添加一个新的phpinfo文件来验证php的正常运行 :

    cd /usr/local/www/saitama.me
    echo "<?php phpinfo(); ?>" > info.php

然后便访问这个文档 : **www.saitama.me/info.php**.

![Virtualhost Configured saitamame](http://blog.linoxide.com/wp-content/uploads/2015/11/Virtualhost-Configured-saitamame.png)

Nginx 作为Apache的反向代理正在运行了，PHP也同样在进行工作了.

这是另一种结果 :

Test .html 文件无缓存.

    curl -I www.saitama.me

![html with no-cache](http://blog.linoxide.com/wp-content/uploads/2015/11/html-with-no-cache.png)

Test .css 文件只有三十天的缓存.

    curl -I www.saitama.me/test.css

![css file 30day cache](http://blog.linoxide.com/wp-content/uploads/2015/11/css-file-30day-cache.png)

Test .php 文件正常缓存 :

    curl -I www.saitama.me/info.php

![PHP file cached](http://blog.linoxide.com/wp-content/uploads/2015/11/PHP-file-cached.png)

全部完成.

### 总结 ###

Nginx 是最广泛的 HTTP 和反向代理的服务器. 拥有丰富的高性能和低内存/RAM的使用功能. Nginx使用了太多的缓存, 我们可以在网络上缓存静态文件使得网页加速, 并且在用户需要的时候再缓存php文件. 这样Nginx 的轻松配置和使用,可以让它用作HTTP服务器 或者 apache的反向代理.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-nginx-reverse-proxy-apache-freebsd-10-2/

作者：[Arul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/