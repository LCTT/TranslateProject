
如何在 CentOS 7 / Ubuntu 15.04 上安装 PHP 框架 Framework
================================================================================
大家好，这篇文章将要讲述如何在 CentOS 7 / Ubuntu 15.04 上安装 PHP 框架 Laravel。如果你是一个 PHP Web 的开发者，你并不需要关心各种琳琅满目的现代 PHP 框架，Laravel 是最易用同时也是最能节省你时间的一个框架，能让你享受到 web 开发的乐趣。一个好的框架能让你在简单的使用指导下能快速开发出最核心的代码，Laravel 拥抱这一普世的开发哲学。你能抱持很高的开发效率并且无痛重构你现有的代码。

Laravel 安装极其容易，你只要跟着本文章一步步操作就能在 CentOS 7 或者 Ubuntu 15 服务器上安装。

### 1) 服务器要求 ###

在安装 Laravel 前需要安装一些它的依赖和先决条件，这些包括升级系统到最新版本，sudo 权限，和安装依赖包。

当你连接到你的服务器时，请确保你能通以下命令能成功的使用 EPEL 仓库并且升级你的服务器。

#### CentOS-7 ####

    # yum install epel-release

----------

    # rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    # rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

----------

    # yum update

#### Ubuntu ####

    # apt-get install python-software-properties
    # add-apt-repository ppa:ondrej/php5

----------

    # apt-get update

----------

    # apt-get install -y php5 mcrypt php5-mcrypt php5-gd

### 2) Firewall Setup ###

系统防火墙和 SELinux 设置对于用于生产的服务器安全来说非常重要，你可以关闭防火墙和用以下命令行设置 SELinux 成宽容模式（permissive）模式来保证安装程序不受他们的影响。

    # setenforce 0

### 3) Apache, MariaDB, PHP Setup ###

Laravel 安装程序需要完成安装 LAMP 整个环境，需要额外安装 OpenSSL, PDO, Mbstring 和 Tokenizer PHP Extensions。如果 LAMP 已经运行在你的服务器上你可以跳过这部，但是需要注意一些必要的 PHP 插件是否安装好。

要安装完整 AMP 你需要在自己的服务器上运行以下命令。

#### CentOS ####

    # yum install httpd mariadb-server php56w php56w-mysql php56w-mcrypt php56w-dom php56w-mbstring

要在 CentOS 7 上实现 MySQL / Mariadb 服务开机自动启动，你需要运行以下命令

    # systemctl start httpd
    # systemctl enable httpd

----------

    #systemctl start mysqld
    #systemctl enable mysqld

在启动 MariaDB 服务之后，你需要运行以下命令配置一个足够安全的密码

    #mysql_secure_installation

#### Ubuntu ####

    # apt-get install mysql-server apache2 libapache2-mod-php5 php5-mysql

### 4) 安装 Composer ###

在我们安装 Laravel 前，先让我们开始安装 composer。安装 composer 对于安装 Laravel 是最重要的步骤之一，因为 composer 能帮我们安装 Laravel 的各种依赖。

#### CentOS/Ubuntu ####

在 CentOS / Ubuntu 下运行以下命令来配置 composer 

    # curl -sS https://getcomposer.org/installer | php
    # mv composer.phar /usr/local/bin/composer
    # chmod +x /usr/local/bin/composer

![composer installation](http://blog.linoxide.com/wp-content/uploads/2015/11/14.png)

### 5) Installing Laravel ###

我们可以运行以下命令从 github 上下载 Laravel 的安装包

    # wget https://github.com/laravel/laravel/archive/develop.zip

运行以下命令解压安装包并且移动 document 的根目录

    # unzip develop.zip

----------

    # mv laravel-develop /var/www/

现在使用 compose 命令来安装目录下所有 Laravel 所需要的依赖

    # cd /var/www/laravel-develop/
    # composer install

![compose laravel](http://blog.linoxide.com/wp-content/uploads/2015/11/25.png)

### 6) Key Encryption ###

为了加密服务器，我们使用以下命令来生成一个加密后的 32 位的密钥

    # php artisan key:generate

    Application key [Lf54qK56s3qDh0ywgf9JdRxO2N0oV9qI] set successfully

现在把这个密钥放到 'app.php' 文件，如以下所示

    # vim /var/www/laravel-develop/config/app.php

![Key encryption](http://blog.linoxide.com/wp-content/uploads/2015/11/45.png)

### 7) 虚拟 Host 和 所属用户 ###

在 composer 安装好后，分配 document 根目录的权限和所属用户，如下所示

    # chmod 775 /var/www/laravel-develop/app/storage

----------

    # chown -R apache:apache /var/www/laravel-develop

用任意一款编辑器打开 apache 服务器的默认配置文件，在文件最后加上虚拟 host 入口

    # vim /etc/httpd/conf/httpd.conf

----------

    ServerName laravel-develop
    DocumentRoot /var/www/laravel/public

    start Directory /var/www/laravel
    AllowOverride All
    Directory close

现在我们用以下命令重启 apache 服务器，打开浏览器查看 localhost 页面

#### CentOS ####

    # systemctl restart httpd

#### Ubuntu ####

    # service apache2 restart

### 8) Laravel 5 Web Access ###

打开浏览器然后输入你的配置的 IP 地址或者绝对域名（to 校对：「绝对域名」译自 https://zh.wikipedia.org/wiki/%E5%AE%8C%E6%95%B4%E7%B6%B2%E5%9F%9F%E5%90%8D%E7%A8%B1#cite_note-1）你将会看到 Laravel 5 的默认页面

![Laravel Default](http://blog.linoxide.com/wp-content/uploads/2015/11/35.png)

### 结论 ###

Laravel 框架对于开发网页应用来说是一个绝好的的工具。所以，看了这篇文章你将学会在 Ubuntu 15 和 CentOS 7 上安装 Laravel 之后你就能开始使用这超棒的框架提供的各种功能来舒服的来进行你的开发工作。如果你有什么意见或者建议请发表在评论内容上，我们将根据您宝贵的反馈来使我们的文章更加浅显易懂。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-laravel-php-centos-7-ubuntu-15-04/

作者：[Kashif][a]
译者：[NearTan](https://github.com/NearTan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
