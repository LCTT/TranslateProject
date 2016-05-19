在 FreeBSD 10.2 上如何通过配置 Apache 和 SSL 安装 Bugzilla
================================================================================

Bugzilla 是一款开源的 Web 应用，用于 bug 跟踪系统和测试工具，由 mozilla 开发，并采用 Mozilla 公共许可证授权（MPL）。它经常被一些高科技公司如 mozilla、红帽公司和 gnome 使用。Bugzilla 起初由 Terry Weissman开发于1998年，它用 perl 语言编写，用 MySQL 作为后端数据库。它是一款旨在帮助管理软件开发的服务器软件，它有丰富的功能、高度优化的数据库、卓越的安全性、高级的搜索工具、集成了邮件功能等等。

在本教程中，我们将安装 bugzilla 5.0 ，采用 apache 作为 Web 服务器，并为它启用 SSL，然后在 freebsd 10.2 上安装 mysql 5.1 来作为数据库系统。

#### 准备 ####

-  FreeBSD 10.2 - 64位
-  Root 权限

### 第一步 - 更新系统 ###

用 ssh 登录 freebsd 服务器，并更新软件库：

    sudo su
    freebsd-update fetch
    freebsd-update install

### 第二步 - 安装并配置 Apache ###

在这一步我们将使用 pkg 命令从 freebsd 软件库中安装 apache，然后在 apache24 目录下编辑 "httpd.conf" 文件，来配置 apache 以启用 SSL 和 CGI 支持。

用 pkg 命令安装 apache：

    pkg install apache24

进入 apache 目录并用 nano 编辑器编辑"httpd.conf"文件：

    cd /usr/local/etc/apache24
    nano -c httpd.conf

取消下面列出行的注释：

    #第70行
    LoadModule authn_socache_module libexec/apache24/mod_authn_socache.so

    #第89行
    LoadModule socache_shmcb_module libexec/apache24/mod_socache_shmcb.so

    #第117行
    LoadModule expires_module libexec/apache24/mod_expires.so

    #第141行，启用SSL
    LoadModule ssl_module libexec/apache24/mod_ssl.so

    #第162行，支持cgi
    LoadModule cgi_module libexec/apache24/mod_cgi.so

    #第174行，启用mod_rewrite
    LoadModule rewrite_module libexec/apache24/mod_rewrite.so

    #第219行，服务器名配置
    ServerName 127.0.0.1:80

保存并退出。

接着，我们需要从 freebsd 库中安装 mod perl，并启用它：

    pkg install ap24-mod_perl2

启用 mod_perl，编辑"httpd.conf"文件并添加"Loadmodule"行：

    nano -c httpd.conf

添加该行：

    #第175行
    LoadModule perl_module libexec/apache24/mod_perl.so

保存并退出。

在启用 apache 之前，用 sysrc 命令添加以下行作为开机启动项：

    sysrc apache24_enable=yes
    service apache24 start

### 第三步 - 安装并配置 MySQL 数据库 ###

我们要用 mysql 5.1 来作为后端数据库并且支持 perl 模块。用 pkg 命令安装 mysql 5.1：

    pkg install p5-DBD-mysql51 mysql51-server mysql51-client

现在我们要将 mysql 服务设置为开机启动，然后为 mysql 配置 root 密码。

运行以下命令来完成上述所有操作：

    sysrc mysql_enable=yes
    service mysql-server start
    mysqladmin -u root password aqwe123

注意：

这里 mysql 密码为：aqwe123

![Configure MySQL Password](http://blog.linoxide.com/wp-content/uploads/2015/12/Configure-MySQL-Password.png)

以上步骤都完成之后，我们用 root 登录 mysql shell，然后为 bugzilla 安装创建一个新的数据库和用户。

用以下命令登录 mysql shell：

    mysql -u root -p
    password: aqwe123

添加数据库：

    create database bugzilladb;
    create user bugzillauser@localhost identified by 'bugzillauser@';
    grant all privileges on bugzilladb.* to bugzillauser@localhost identified by 'bugzillauser@';
    flush privileges;
    \q

![Creating Database for Bugzilla](http://blog.linoxide.com/wp-content/uploads/2015/12/Creating-Database-for-Bugzilla.png)

bugzilla 的数据库创建好了，名字为"bugzilladb"，用户名和密码分别为"bugzillauser"和"bugzillauser@"。

### 第四步 - 生成新的 SSL 证书 ###

在 bugzilla 站点的 "ssl" 目录里生成新的自签名 SSL 证书。

前往 apache24 目录并在此创建新目录 "ssl"：

    cd /usr/local/etc/apache24/
    mkdir ssl; cd ssl

接着，用 openssl 命令生成证书文件，然后更改其权限：

    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /usr/local/etc/apache24/ssl/bugzilla.key -out /usr/local/etc/apache24/ssl/bugzilla.crt
    chmod 600 *

### 第五步 - 配置虚拟主机 ###

我们将在 "/usr/local/www/bugzilla" 目录里安装 bugzilla，所以我们必须为它创建新的虚拟主机配置。

前往 apache 目录并为虚拟主机文件创建名为 "vhost" 的新目录：

    cd /usr/local/etc/apache24/
    mkdir vhost; cd vhost

现在为虚拟主机文件创建新文件 "bugzilla.conf"：

    nano -c bugzilla.conf

将以下配置粘贴进去：

    <VirtualHost *:80>
    ServerName mybugzilla.me
    ServerAlias www.mybuzilla.me
    DocumentRoot /usr/local/www/bugzilla
    Redirect permanent / https://mybugzilla.me/
    </VirtualHost>

    Listen 443
    <VirtualHost _default_:443>
    ServerName mybugzilla.me
    DocumentRoot /usr/local/www/bugzilla

    ErrorLog "/var/log/mybugzilla.me-error_log"
    CustomLog "/var/log/mybugzilla.me-access_log" common

    SSLEngine On
    SSLCertificateFile /usr/local/etc/apache24/ssl/bugzilla.crt
    SSLCertificateKeyFile /usr/local/etc/apache24/ssl/bugzilla.key

    <Directory "/usr/local/www/bugzilla">
    AddHandler cgi-script .cgi
    Options +ExecCGI
    DirectoryIndex index.cgi index.html
    AllowOverride Limit FileInfo Indexes Options
    Require all granted
    </Directory>
    </VirtualHost>

保存并退出。

上述都完成之后，为 bugzilla 安装创建新目录，并在 httpd.conf 文件添加虚拟主机配置来启用 bugzilla虚拟主机。

在 "apache24" 目录下运行以下命令：

    mkdir -p /usr/local/www/bugzilla
    cd /usr/local/etc/apache24/
    nano -c httpd.conf

文末，添加以下配置：

    Include etc/apache24/vhost/*.conf

保存并退出。

现在用 "apachectl" 命令测试一下 apache 的配置并重启它：

    apachectl configtest
    service apache24 restart

### 第六步 - 安装 Bugzilla ###

我们可以通过下载源来手动安装 bugzilla 了，或从 freebsd 库中安装也可以。在这一步中我们将用 pkg 命令从 freebsd 库中安装 bugzilla：

    pkg install bugzilla50

以上步骤都完成之后，前往 bugzilla 安装目录并安装所有 bugzilla 需要的 perl 模块。

    cd /usr/local/www/bugzilla
    ./install-module --all

要等到所有都完成，这需要点时间。

下一步，在 bugzilla 的安装目录中执行 "checksetup.pl" 文件来生成配置文件 "localconfig"。

    ./checksetup.pl

你会看到一条关于数据库配置错误的消息，你得用 nano 编辑器编辑一下 "localconfig" 文件：

    nano -c localconfig

现在添加第三步创建的数据库。

    #第57行
    $db_name = 'bugzilladb';

    #第60行
    $db_user = 'bugzillauser';

    #第67行
    $db_pass = 'bugzillauser@';

保存并退出。

然后再次运行 "checksetup.pl"：

    ./checksetup.pl

你会收到输入邮箱名和管理员账号的提示，你只要输入你的邮箱、用户名和密码就行了。

![Admin Setup](http://blog.linoxide.com/wp-content/uploads/2015/12/Admin-Setup.png)

最后，我们需要把安装目录的属主改成 "www"，然后用服务命令重启 apache：

    cd /usr/local/www/
    chown -R www:www bugzilla
    service apache24 restart

现在 Bugzilla 已经安装好了，你可以通过访问 mybugzilla.me 来查看，并且将会重定向到 https 连接。

Bugzilla 首页：

![Bugzilla Home](http://blog.linoxide.com/wp-content/uploads/2015/12/Bugzilla-Home.png)

Bugzilla admin 面板：

![Bugzilla Admin Page](http://blog.linoxide.com/wp-content/uploads/2015/12/Bugzilla-Admin-Page.png)

### 结论 ###

Bugzilla 是一个基于 web 的应用，并能帮助你管理软件开发，它用 perl 开发并以 MySQL 作为数据库系统。Bugzilla 帮助 mozilla、redhat、gnome 等公司完成软件开发工作。Bugzilla 有很多功能并易于配置和安装。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-bugzilla-apache-ssl-freebsd-10-2/

作者：[Arul][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/
