如何在CentOS/RHEL中安装基于Web的监控系统 linux-dash
================================================================================
**Linux-dash**是一款为Linux设计的基于web的轻量级监控面板。这个程序会实时显示各种不同的系统属性，比如CPU负载、RAM使用率、磁盘使用率、网速、网络连接、RX/TX带宽、登录用户、运行的进程等等。它不会存储长期的统计。因为它没有后端数据库。

本篇文章将会向你展示如何安装和设置Linux dash，这里所使用的web服务器是**Nginx**.

### 安装 ###

首先我们要启用[EPEL 仓库][1]。
	
**接下来，我们需要用下面的命令安装nginx。**

    sudo yum install nginx

**安装 php-fpm 组件**

    sudo yum install git php-common php-fpm

现在我们要在nginx中配置Linux-dash。我们如下创建 /etc/nginx/conf.d/linuxdash.conf。

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

**下一步是配置php-fpm。用编辑器打开/etc/php-fpm.d/www.conf。**

    sudo vim /etc/php-fpm.d/www.conf

**确保设置了如下的“listen”，“user”和“group”字段。你可以保留其它的配置不变。**

    . . .
    listen = /var/run/php-fpm.sock
    user = nginx
    group = nginx
    . . .

**现在，我们要在/var/www中下载并安装linux-dash。**

    git clone https://github.com/afaqurk/linux-dash.git
    sudo cp -r linux-dash/ /var/www/
    sudo chown -R nginx:nginx /var/www

**接下来，重启 Nginx和php-fpm。**

    sudo service nginx restart
    sudo service php-fpm restart

**设置nginx和php-fpm开机自动启动。**

    sudo chkconfig nginx on
    sudo chkconfig php-fpm on

在本例中，我们使用TCP端口8080配置linux-dash。因此需确保防火墙没有阻止8080 TCP端口。

### 用linux-dash监控Linux服务器 ###

你现在可以在浏览器中输入**http://\<IP地址>:8080/linux-dash/**来访问Linux-dash。

web面板包含了不同的组件，每个都显示独特的系统属性。你可以自定义web面板的外观也可以关闭一些组件。

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/Lin-dash.png)

美好的一天！


下篇文章中再见。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-linux-dash-web-based-monitoring-system-centosrhel/

作者：[Jijo][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/jijo/
[1]:http://linux.cn/article-2324-1.html
