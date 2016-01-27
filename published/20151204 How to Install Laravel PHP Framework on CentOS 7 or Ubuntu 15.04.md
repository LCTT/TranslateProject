如何在 CentOS 7 / Ubuntu 15.04 上安装 PHP 框架 Laravel
================================================================================

大家好，这篇文章将要讲述如何在 CentOS 7 / Ubuntu 15.04 上安装 Laravel。如果你是一个 PHP Web 的开发者，你并不需要考虑如何在琳琅满目的现代 PHP 框架中选择，Laravel 是最轻松启动和运行的，它省时省力，能让你享受到 web 开发的乐趣。Laravel 信奉着一个普世的开发哲学，通过简单的指导创建出可维护代码具有最高优先级，你将保持着高速的开发效率，能够随时毫不畏惧更改你的代码来改进现有功能。

Laravel 安装并不繁琐，你只要跟着本文章一步步操作就能在 CentOS 7 或者 Ubuntu 15 服务器上安装。

### 1) 服务器要求 ###

在安装 Laravel 前需要安装一些它的依赖前提条件，主要是一些基本的参数调整，比如升级系统到最新版本，sudo 权限和安装依赖包。

当你连接到你的服务器时，请确保你能通以下命令能成功的使用 EPEL 仓库并且升级你的服务器。

#### CentOS-7 ####

    # yum install epel-release

    # rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    # rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

    # yum update

#### Ubuntu ####

    # apt-get install python-software-properties
    # add-apt-repository ppa:ondrej/php5

    # apt-get update

    # apt-get install -y php5 mcrypt php5-mcrypt php5-gd

### 2) 防火墙安装 ###

系统防火墙和 SELinux 设置对于用于产品应用安全来说非常重要，当你使用测试服务器的时候可以关闭防火墙，用以下命令行设置 SELinux 成宽容模式（permissive）来保证安装程序不受它们的影响。

    # setenforce 0

### 3) Apache, MariaDB, PHP 安装 ###

Laravel 安装程序需要完成安装 LAMP 整个环境，需要额外安装 OpenSSL、PDO，Mbstring 和 Tokenizer 等 PHP 扩展。如果 LAMP 已经运行在你的服务器上你可以跳过这一步，直接确认一些必要的 PHP 插件是否安装好。

要安装完整 AMP 你需要在自己的服务器上运行以下命令。

#### CentOS ####

    # yum install httpd mariadb-server php56w php56w-mysql php56w-mcrypt php56w-dom php56w-mbstring

要在 CentOS 7 上实现 MySQL / Mariadb 服务开机自动启动，你需要运行以下命令。

    # systemctl start httpd
    # systemctl enable httpd

    #systemctl start mysqld
    #systemctl enable mysqld

在启动 MariaDB 服务之后，你需要运行以下命令配置一个足够安全的密码。

    #mysql_secure_installation

#### Ubuntu ####

    # apt-get install mysql-server apache2 libapache2-mod-php5 php5-mysql

### 4) 安装 Composer ###

在我们安装 Laravel 前，先让我们开始安装 composer。安装 composer 是安装 Laravel 的最重要步骤之一，因为 composer 能帮我们安装 Laravel 的各种依赖。

#### CentOS/Ubuntu ####

在 CentOS / Ubuntu 下运行以下命令来配置 composer 。

    # curl -sS https://getcomposer.org/installer | php
    # mv composer.phar /usr/local/bin/composer
    # chmod +x /usr/local/bin/composer

![composer installation](http://blog.linoxide.com/wp-content/uploads/2015/11/14.png)

### 5) 安装 Laravel ###

我们可以运行以下命令从 github 上下载 Laravel 的安装包。

    # wget https://github.com/laravel/laravel/archive/develop.zip

运行以下命令解压安装包并且移动 document 的根目录。

    # unzip develop.zip

    # mv laravel-develop /var/www/

现在使用 compose 命令来安装目录下所有 Laravel 所需要的依赖。

    # cd /var/www/laravel-develop/
    # composer install

![compose laravel](http://blog.linoxide.com/wp-content/uploads/2015/11/25.png)

### 6) 密钥 ###

为了加密服务器，我们使用以下命令来生成一个加密后的 32 位的密钥。

    # php artisan key:generate

    Application key [Lf54qK56s3qDh0ywgf9JdRxO2N0oV9qI] set successfully

现在把这个密钥放到 'app.php' 文件，如以下所示。

    # vim /var/www/laravel-develop/config/app.php

![Key encryption](http://blog.linoxide.com/wp-content/uploads/2015/11/45.png)

### 7) 虚拟主机和所属用户 ###

在 composer 安装好后，分配 document 根目录的权限和所属用户，如下所示。

    # chmod 775 /var/www/laravel-develop/app/storage

    # chown -R apache:apache /var/www/laravel-develop

用任意一款编辑器打开 apache 服务器的默认配置文件，在文件最后加上虚拟主机配置。

    # vim /etc/httpd/conf/httpd.conf

----------

    ServerName laravel-develop
    DocumentRoot /var/www/laravel/public

    start Directory /var/www/laravel
    AllowOverride All
    Directory close

现在我们用以下命令重启 apache 服务器，打开浏览器查看 localhost 页面。

#### CentOS ####

    # systemctl restart httpd

#### Ubuntu ####

    # service apache2 restart

### 8) Laravel 5 网络访问 ###

打开浏览器然后输入你配置的 IP 地址或者完整域名（Fully qualified domain name）你将会看到 Laravel 5 的默认页面。

![Laravel Default](http://blog.linoxide.com/wp-content/uploads/2015/11/35.png)

### 总结 ###

Laravel 框架对于开发网页应用来说是一个绝好的的工具。所以，看了这篇文章你将学会在 Ubuntu 15 和 CentOS 7 上安装 Laravel， 之后你就可以使用这个超棒的 PHP 框架提供的各种功能和舒适便捷性来进行你的开发工作。

如果您有什么意见或者建议请在以下评论区中回复，我们将根据您宝贵的反馈来使我们的文章更加浅显易懂。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-laravel-php-centos-7-ubuntu-15-04/

作者：[Kashif][a]
译者：[NearTan](https://github.com/NearTan)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
