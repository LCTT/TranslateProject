启用Nginx/Apache的PHP-FPM多实例
================================================================================

PHP-FPM作为FastCGI进程管理器而广为熟知，它是PHP FastCGI实现的改进，带有更为有用的功能，用于处理高负载的服务器和网站。下面列出其中一些功能：
### 新功能 ###

 - 拥有具有优雅启动/停止选项的高级进程管理能力。
 - 可以以监听不同端口以及使用不同PHP配置的不同用户身份/组身份来运行进程。
 - 错误日志记录。
 - 支持上传加速。
 - 用于在处理一些耗时任务时结束请求和清空所有数据的特别功能。
 - 同时支持动态和静态子进程重生。
 - 支持IP地址限制。

在本文中，我将要讨论的是，在运行EA3下CPanel 11.52的CentOS 7服务器上与Nginx和Apache一起安装PHP-FPM，以及如何来通过CPanel管理这些安装好的多个PHP-FPM实例。
Before going to the installation procedures, let us take a look on the pre-requisites.

### 先决条件 ###

 1. 启用 Mod_proxy_fcgi模块
 2. 启用 MPM_Event

由于我们要将PHP-FPM安装到一台EA3服务器，我们需要运行EasyApache来编译Apache以启用这些模块。

你们可以参考我以前写的，关于如何在Apache服务器上安装Nginx作为反向代理的文档来确认Nginx的安装。

这里，我将再次简述那些安装步骤。具体细节，你可以参考我之前写的**（如何在CentOS 7/CPanel服务器上配置Nginx反向代理）**一文。

    步骤 1：安装Epel仓库
    步骤 2：安装nDeploy RPM仓库，这是此次安装中最为**重要**的步骤。
    步骤 3：使用yum从nDeploy仓库安装nDeploy和Nginx插件。 
    步骤 4：启用/配置Nginx为反向代理。

完成这些步骤后，下面为服务器中所有可用PHP版本安装PHP-FPM包，EA3使用remi仓库来安装这些包。你可以运行这个nDeploy脚本来下载所有的包。

    root@server1 [~]# /opt/nDeploy/scripts/easy_php_setup.sh
    Loaded plugins: fastestmirror, tsflags, universal-hooks
    EA4 | 2.9 kB 00:00:00
    base | 3.6 kB 00:00:00
    epel/x86_64/metalink | 9.7 kB 00:00:00
    epel | 4.3 kB 00:00:00
    extras | 3.4 kB 00:00:00
    updates | 3.4 kB 00:00:00
    (1/2): epel/x86_64/updateinfo | 460 kB 00:00:00
    (2/2): epel/x86_64/primary_db

运行该脚本将为PHP 54，PHP 55，PHP 56和PHP 70安装所有这些FPM包。

    Installed Packages
    php54-php-fpm.x86_64 5.4.45-3.el7.remi @remi
    php55-php-fpm.x86_64 5.5.31-1.el7.remi @remi
    php56-php-fpm.x86_64 5.6.17-1.el7.remi @remi
    php70-php-fpm.x86_64 7.0.2-1.el7.remi @remi

在以上安装完成后，你需要为Apache启用PHP-FPM SAPI。你可以运行下面这个脚本来启用PHP-FPM实例。

    root@server1 [~]# /opt/nDeploy/scripts/apache_php-fpm_setup.sh enable
    mod_proxy_fcgi.c
    Please choose one default PHP version from the list below
    PHP70
    PHP56
    PHP54
    PHP55
    Provide the exact desired version string here and press ENTER: PHP54
    ConfGen:: lxblogger
    ConfGen:: blogr
    ConfGen:: saheetha
    ConfGen:: satest
    which: no cagefsctl in (/usr/local/jdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/bin:/usr/X11R6/bin:/root/bin)
    info [rebuildhttpdconf] Missing owner for domain server1.centos7-test.com, force lookup to root
    Built /usr/local/apache/conf/httpd.conf OK
    Waiting for “httpd” to restart gracefully …waiting for “httpd” to initialize ……
    …finished.

它会问你需要运行哪个PHP版本作为服务器默认版本，你可以输入那些细节内容，然后继续配置并为现存的域生成虚拟主机文件。

我选择了PHP 54作为我服务器上的默认PHP-FPM版本。

![confirm-php-fpm](http://blog.linoxide.com/wp-content/uploads/2016/01/confirm-php-fpm-1024x525.png)

虽然服务器配置了PHP-FPM 54，但是我们可以通过CPanel为各个独立的域修改PHP-FPM实例。

下面我将通过一些截图来为你们说明一下，怎样通过CPanel为各个独立域修改PHP-FPM实例。

Nginx插件的安装将为你的域的CPanel提供一个Nginx Webstack图标，你可以点击该图标来配置你的Web服务器。我已经登陆进了我其中的一个CPanel来配置相应的Web服务器。

请看这些截图。

![nginx webstack](http://blog.linoxide.com/wp-content/uploads/2016/01/nginx-webstack.png)

![nginxicon1](http://blog.linoxide.com/wp-content/uploads/2016/01/nginxicon1-1024x253.png)

现在，你可以根据需要为选中的主域配置web服务器（这里，我已经选择了主域saheetha.com）。我已经继续通过自动化配置选项来进行了，因为我不需要添加任何手动设置。

![nginx_auto_proxy](http://blog.linoxide.com/wp-content/uploads/2016/01/nginx_auto_proxy-1024x408.png)

当Nginx配置完后，你可以在这里为你的域选择PHP-FPM实例。

![php-fpm1](http://blog.linoxide.com/wp-content/uploads/2016/01/php-fpm1-1024x408.png)

![php54](http://blog.linoxide.com/wp-content/uploads/2016/01/php54-1024x169.png)

![php55](http://blog.linoxide.com/wp-content/uploads/2016/01/php55.png)

就像你在截图中所看到的，我服务器上的默认PHP-FPM是**PHP 54**，而我正要将我的域的PHP-FPM实例单独修改成**PHP 55**。当你为你的域修改PHP-FPM后，你可以通过访问**phpinfo**页面来确认。

谢谢你们参考本文，我相信这篇文章会给你提供不少信息和帮助。我会为你们推荐关于这个内容的有价值的评论 :)。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/enable-multiple-php-fpm-instances-nginx-apache/

作者：[Saheetha Shameer][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/saheethas/
