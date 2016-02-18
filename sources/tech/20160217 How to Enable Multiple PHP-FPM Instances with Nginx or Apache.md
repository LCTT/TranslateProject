Translating by GOLinux!
How to Enable Multiple PHP-FPM Instances with Nginx / Apache
================================================================================

PHP-FPM is also known as PHP FastCGI Process Manager. It is an advancement of PHP FastCGI implementation with more useful features for handling heavy-loaded servers and websites. Some of those features are listed below:

### New Features ###

 - Advanced process managament capability with graceful start/stop options.
 - Ability to run the processes with different userids/groupids listening on different ports and using different PHP configurations.
 - Error logging.
 - Acceleration upload support
 - Special function to finish request and flush all data while doing some time consuming tasks
 - Both Dynamic and Static Child process Spawning
 - IP Address restriction

In this article, I'm going to discuss about installing PHP-FPM along with Nginx and Apache on a CentOS 7 server running cPanel 11.52 with EA3(EasyApache) and how to manage those installed multiple PHP-FPM instances via CPanel.

Before going to the installation procedures, let us take a look on the pre-requisites.

### Pre-requisites ###

 1. Enable Mod_proxy_fcgi module
 2. Enable MPM_Event

Since, we are installing PHP-FPM on a EA3 server, we need to run EasyApache to compile Apache to enable these modules.

You can refer my previous document on how to install Nginx as reverse proxy on a Apache server to confirm with the Nginx installation.

I'll brief those installation steps once again here. You can refer to my previous documentation **(How to Set Nginx as Reverse Proxy on CentOS 7 /CPanel Server)** for details.

    Step 1: Install the Epel repo
    Step 2: Install nDeploy RPM repo which is the most **IMPORTANT** step in this installation.
    Step 3: Install nDeploy and Nginx plugin using yum from the nDeploy repo.
    Step 4: Enable/Configure Nginx as reverse proxy

Once this is done, install the PHP-FPM packages for all PHP versions available in the server. EA3 uses remi repository for installing these packages. You can run this nDeploy script to download all packages.

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

Running this script will install all these FPM packages for PHP 54, PHP 55, PHP 56 and PHP 70.

    Installed Packages
    php54-php-fpm.x86_64 5.4.45-3.el7.remi @remi
    php55-php-fpm.x86_64 5.5.31-1.el7.remi @remi
    php56-php-fpm.x86_64 5.6.17-1.el7.remi @remi
    php70-php-fpm.x86_64 7.0.2-1.el7.remi @remi

After this installation, you need to enable PHP-FPM SAPI for Apache. You can run this script to enable PHP-FPM instances.

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

It will ask the required PHP version which you prefer to run as default on the server. You can enter those details and proceed to configure and generate the virtual host files for the existing domains.

I've chosen PHP 54 as the default PHP-FPM version on my server.

![confirm-php-fpm](http://blog.linoxide.com/wp-content/uploads/2016/01/confirm-php-fpm-1024x525.png)

Even though, the server is configured with PHP-FPM 54, we can modify the PHP-FPM instances for the individual domains via cPanel.

I'll explain you on how to modify the PHP-FPM instances for individual domains via cPanel using some screenshots.

The installation of Nginx plugin will provide you with an icon of Nginx Webstack in your domain's cPanel. You can click on that icon to configure your Web server. I've logged into one of my domain's cPanel to configure it's Web server.

Please check these snapshots.

![nginx webstack](http://blog.linoxide.com/wp-content/uploads/2016/01/nginx-webstack.png)

![nginxicon1](http://blog.linoxide.com/wp-content/uploads/2016/01/nginxicon1-1024x253.png)

Now you can configure the web-server for the selected main domain as required(I've selected the main domain saheetha.com here). I've gone ahead with automatic configuration options since, I don't have any manual settings to add.

![nginx_auto_proxy](http://blog.linoxide.com/wp-content/uploads/2016/01/nginx_auto_proxy-1024x408.png)

Once Nginx is configured, you can select the PHP-FPM instance for your domain here.

![php-fpm1](http://blog.linoxide.com/wp-content/uploads/2016/01/php-fpm1-1024x408.png)

![php54](http://blog.linoxide.com/wp-content/uploads/2016/01/php54-1024x169.png)

![php55](http://blog.linoxide.com/wp-content/uploads/2016/01/php55.png)

As you can see in these snapshots, my default PHP-FPM on the server is **PHP 54** and I'm changing the PHP-FPM instance for my domain alone to **PHP 55**. Once you've modified the PHP-FPM for your domain, you can confirm it by accessing the **phpinfo** page.

Thank you for referring to this article. I believe this article is really informative and useful for you. I would recommend your valuable comments on this :).

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/enable-multiple-php-fpm-instances-nginx-apache/

作者：[Saheetha Shameer][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/saheethas/
