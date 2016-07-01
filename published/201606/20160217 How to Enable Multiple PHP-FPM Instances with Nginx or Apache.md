如何启用 Nginx/Apache 的 PHP-FPM 多实例
================================================================================

PHP-FPM 作为 FastCGI 进程管理器而广为熟知，它是 PHP FastCGI 实现的改进，带有更为有用的功能，用于处理高负载的服务器和网站。下面列出其中一些功能：

### 新功能 ###

 - 拥有具有优雅（graceful）启动/停止选项的高级进程管理能力。
 - 可以通过不同的用户身份/组身份来以监听多个端口以及使用多个PHP配置。
 - 错误日志记录。
 - 支持上传加速。
 - 特别用于在处理一些耗时任务时结束请求和清空所有数据的功能。
 - 同时支持动态和静态的子进程重生。
 - 支持IP地址限制。

在本文中，我将要讨论的是，在运行 CPanel 11.52 及 EA3 （EasyApache）的 CentOS 7 服务器上，于 Nginx 和 Apache 之上安装 PHP-FPM，以及如何来通过 CPanel 管理这些安装好的多个 PHP-FPM 实例。

在我们开始安装前， 先看看安装的先决条件。

### 先决条件 ###

 1. 启用 Mod_proxy_fcgi 模块
 2. 启用 MPM_Event

由于我们要将 PHP-FPM 安装到一台 EA3 服务器，我们需要运行 EasyApache 来编译 Apache 以启用这些模块。

你们可以参考我以前写的，关于如何在 Apache 服务器上安装 Nginx 作为反向代理的文档来了解 Nginx 的安装。

这里，我将再次简述那些安装步骤。具体细节，你可以参考我之前写的**（如何在 CentOS 7/CPanel 服务器上配置 Nginx 反向代理）**一文。

- 步骤 1：安装 Epel 仓库
- 步骤 2：安装 nDeploy RPM 仓库，这是此次安装中最为**重要**的步骤。
- 步骤 3：使用 yum 从 nDeploy 仓库安装 nDeploy 和 Nginx 插件。 
- 步骤 4：启用/配置 Nginx 为反向代理。

完成这些步骤后，下面为服务器中所有可用 PHP 版本安装 PHP-FPM 包，EA3 使用 remi 仓库来安装这些包。你可以运行这个 nDeploy 脚本来下载所有的包。

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

运行该脚本将为 PHP 54，PHP 55，PHP 56 和 PHP 70 安装所有这些 FPM 包。

    Installed Packages
    php54-php-fpm.x86_64 5.4.45-3.el7.remi @remi
    php55-php-fpm.x86_64 5.5.31-1.el7.remi @remi
    php56-php-fpm.x86_64 5.6.17-1.el7.remi @remi
    php70-php-fpm.x86_64 7.0.2-1.el7.remi @remi

在以上安装完成后，你需要为 Apache 启用 PHP-FPM SAPI。你可以运行下面这个脚本来启用 PHP-FPM 实例。

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

它会问你需要运行哪个 PHP 版本作为服务器默认版本，你可以输入那些细节内容，然后继续配置并为现存的域名生成虚拟主机文件。

我选择了 PHP 54 作为我服务器上的默认 PHP-FPM 版本。

![confirm-php-fpm](http://blog.linoxide.com/wp-content/uploads/2016/01/confirm-php-fpm-1024x525.png)

虽然服务器配置了 PHP-FPM 54，但是我们可以通过 CPanel 为各个独立的域名修改 PHP-FPM 实例。

下面我将通过一些截图来为你们说明一下，怎样通过 CPanel 为各个独立域修改 PHP-FPM 实例。

安装了 Nginx 插件后，你的域名的 CPanel 就会有一个 Nginx Webstack 图标，你可以点击该图标来配置你的 Web 服务器。我已经登录进了我其中的一个 CPanel 来配置相应的 Web 服务器。

请看这些截图。

![nginx webstack](http://blog.linoxide.com/wp-content/uploads/2016/01/nginx-webstack.png)

![nginxicon1](http://blog.linoxide.com/wp-content/uploads/2016/01/nginxicon1-1024x253.png)

现在，你可以根据需要为选中的主域配置 web 服务器（这里，我已经选择了主域 saheetha.com）。我已经继续通过自动化配置选项来进行了，因为我不需要添加任何手动设置。

![nginx_auto_proxy](http://blog.linoxide.com/wp-content/uploads/2016/01/nginx_auto_proxy-1024x408.png)

当 Nginx 配置完后，你可以在这里为你的域名选择 PHP-FPM 实例。

![php-fpm1](http://blog.linoxide.com/wp-content/uploads/2016/01/php-fpm1-1024x408.png)

![php54](http://blog.linoxide.com/wp-content/uploads/2016/01/php54-1024x169.png)

![php55](http://blog.linoxide.com/wp-content/uploads/2016/01/php55.png)

就像你在截图中所看到的，我服务器上的默认 PHP-FPM 是**PHP 54**，而我正要将我的域名的 PHP-FPM 实例单独修改成 **PHP 55**。当你为你的域修改 PHP-FPM 后，你可以通过访问 **phpinfo** 页面来确认。

谢谢你们参考本文，我相信这篇文章会给你提供不少信息和帮助。我会为你们推荐关于这个内容的有价值的评论 :)。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/enable-multiple-php-fpm-instances-nginx-apache/

作者：[Saheetha Shameer][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/saheethas/
