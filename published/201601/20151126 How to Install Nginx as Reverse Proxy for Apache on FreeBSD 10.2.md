如何在 FreeBSD 10.2 上安装 Nginx 作为 Apache 的反向代理
================================================================================

Nginx 是一款自由开源的 HTTP 和反向代理服务器，也可以用作 POP3/IMAP 的邮件代理服务器。Nginx 是一款高性能的 web 服务器，其特点是功能丰富，结构简单以及内存占用低。 第一个版本由 Igor Sysoev 发布于2002年，到现在有很多大型科技公司在使用，包括 Netflix、 Github、 Cloudflare、 WordPress.com 等等。

在这篇教程里我们会“**在 freebsd 10.2 系统上，安装和配置 Nginx 网络服务器作为 Apache 的反向代理**”。 Apache 将在8080端口上运行 PHP ，而我们会配置 Nginx 运行在80端口以接收用户/访问者的请求。如果80端口接收到用户浏览器的网页请求，那么 Nginx 会将该请求传递给运行在8080端口上的 Apache 网络服务器和 PHP。

#### 前提条件 ####

- FreeBSD 10.2
- Root 权限

### 步骤 1 - 更新系统 ###

使用 SSH 认证方式登录到你的 FreeBSD 服务器，使用下面命令来更新你的系统：

    freebsd-update fetch
    freebsd-update install

### 步骤 2 - 安装 Apache ###

Apache 是开源的、使用范围最广的 web 服务器。在 FreeBSD 里默认没有安装 Apache， 但是我们可以直接通过 /usr/ports/www/apache24 下的 ports 或软件包来安装，也可以直接使用 pkg 命令从 FreeBSD 软件库中安装。在本教程中，我们将使用 pkg 命令从 FreeBSD 软件库中安装：

    pkg install apache24

### 步骤 3 - 安装 PHP ###

一旦成功安装 Apache，接着将会安装 PHP ，它来负责处理用户对 PHP 文件的请求。我们将会用到如下的 pkg 命令来安装 PHP：

    pkg install php56 mod_php56 php56-mysql php56-mysqli

### 步骤 4 - 配置 Apache 和 PHP ###

一旦所有都安装好了，我们将会配置 Apache 运行在8080端口上， 并让 PHP 与 Apache 一同工作。 要想配置Apache，我们可以编辑“httpd.conf”这个配置文件， 对于 PHP 我们只需要复制 “/usr/local/etc/”目录下的 PHP 配置文件 php.ini。

进入到“/usr/local/etc/”目录，并且复制 php.ini-production 文件到 php.ini :

    cd /usr/local/etc/
    cp php.ini-production php.ini

下一步，在 Apache 目录下通过编辑“httpd.conf”文件来配置 Apache：

    cd /usr/local/etc/apache24
    nano -c httpd.conf

端口配置在第**52**行 :

    Listen 8080

服务器名称配置在第**219**行:

    ServerName 127.0.0.1:8080

在第**277**行，添加 DirectoryIndex 文件，Apache 将用它来服务对目录的请求：

    DirectoryIndex index.php index.html

在第**287**行下，配置 Apache ，添加脚本支持：

    <FilesMatch "\.php$">
    SetHandler application/x-httpd-php
    </FilesMatch>
    <FilesMatch "\.phps$">
    SetHandler application/x-httpd-php-source
    </FilesMatch>

保存并退出。

现在用 sysrc 命令，来添加 Apache 为开机启动项目：

    sysrc apache24_enable=yes

然后用下面的命令测试 Apache 的配置：

    apachectl configtest

如果到这里都没有问题的话，那么就启动 Apache 吧：

    service apache24 start

如果全部完毕，在“/usr/local/www/apache24/data”目录下创建一个 phpinfo 文件来验证 PHP 在 Apache 下顺利运行：

    cd /usr/local/www/apache24/data
    echo "<?php phpinfo(); ?>" > info.php

现在就可以访问 freebsd 的服务器 IP : 192.168.1.123:8080/info.php 。

![Apache and PHP on Port 8080](http://blog.linoxide.com/wp-content/uploads/2015/11/Apache-and-PHP-on-Port-8080.png)

Apache 及 PHP 运行在 8080 端口。

### 步骤 5 - 安装 Nginx ###

Nginx 可以以较低内存占用提供高性能的 Web 服务器和反向代理服务器。在这个步骤里，我们将会使用 Nginx 作为Apache 的反向代理，因此让我们用 pkg 命令来安装它吧：

    pkg install nginx

### 步骤 6 - 配置 Nginx ###

一旦 Nginx 安装完毕，在“**nginx.conf**”文件里，我们需要做一个新的配置文件来替换掉原来的 nginx 配置文件。切换到“/usr/local/etc/nginx/”目录下，并且备份默认 nginx.conf 文件：

    cd /usr/local/etc/nginx/
    mv nginx.conf nginx.conf.oroginal

现在就可以创建一个新的 nginx 配置文件了：

    nano -c nginx.conf

然后粘贴下面的配置：

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

保存并退出。

下一步，在 nginx 目录下面，创建一个 **proxy.conf** 文件，使其作为反向代理 :

    cd /usr/local/etc/nginx/
    nano -c proxy.conf

粘贴如下配置：

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

保存并退出。

最后一步，为 nginx 的高速缓存创建一个“/var/nginx/cache”的新目录：

    mkdir -p /var/nginx/cache

### 步骤 7 - 配置 Nginx 的虚拟主机 ###

在这个步骤里面，我们需要创建一个新的虚拟主机域“saitama.me”，其文档根目录为“/usr/local/www/saitama.me”，日志文件放在“/var/log/nginx”目录下。

我们必须做的第一件事情就是创建新的目录来存放虚拟主机配置文件，我们创建的新目录名为“**vhost**”。创建它：

    cd /usr/local/etc/nginx/
    mkdir vhost

创建好 vhost 目录，然后我们就进入这个目录并创建一个新的虚拟主机文件。这里我取名为“**saitama.conf**”：

    cd vhost/
    nano -c saitama.conf

粘贴如下虚拟主机的配置：

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

保存并退出。

下一步，为 nginx 和虚拟主机创建一个新的日志目录“/var/log/”：

    mkdir -p /var/log/nginx/

如果一切顺利，在文件的根目录下创建目录 saitama.me 用作文档根：

    cd /usr/local/www/
    mkdir saitama.me

### 步骤 8 - 测试 ###

在这个步骤里面，我们只是测试我们的 nginx 和虚拟主机的配置。

用如下命令测试 nginx 的配置：

    nginx -t

如果一切都没有问题，用 sysrc 命令添加 nginx 为开机启动项，并且启动 nginx 和重启 apache：

    sysrc nginx_enable=yes
    service nginx start
    service apache24 restart

一切完毕后，在 saitama.me 目录下，添加一个新的 phpinfo 文件来验证 php 的正常运行：

    cd /usr/local/www/saitama.me
    echo "<?php phpinfo(); ?>" > info.php

然后访问这个域名： **www.saitama.me/info.php**。

![Virtualhost Configured saitamame](http://blog.linoxide.com/wp-content/uploads/2015/11/Virtualhost-Configured-saitamame.png)

Nginx 作为 Apache 的反向代理运行了，PHP 也同样工作了。

这是另一个结果：

测试无缓存的 .html 文件。

    curl -I www.saitama.me

![html with no-cache](http://blog.linoxide.com/wp-content/uploads/2015/11/html-with-no-cache.png)

测试有三十天缓存的 .css 文件。

    curl -I www.saitama.me/test.css

![css file 30day cache](http://blog.linoxide.com/wp-content/uploads/2015/11/css-file-30day-cache.png)

测试缓存的 .php 文件：

    curl -I www.saitama.me/info.php

![PHP file cached](http://blog.linoxide.com/wp-content/uploads/2015/11/PHP-file-cached.png)

全部搞定。

### 总结 ###

Nginx 是最受欢迎的 HTTP 和反向代理服务器，拥有丰富的功能、高性能、低内存/RAM 占用。Nginx 也用于缓存， 我们可以在网络上缓存静态文件使得网页加速，并且缓存用户请求的 php 文件。 Nginx 容易配置和使用，可以将它用作 HTTP 服务器或者 apache 的反向代理。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-nginx-reverse-proxy-apache-freebsd-10-2/

作者：[Arul][a]
译者：[KnightJoker](https://github.com/KnightJoker)
校对：[Caroline](https://github.com/carolinewuyan)，[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/
