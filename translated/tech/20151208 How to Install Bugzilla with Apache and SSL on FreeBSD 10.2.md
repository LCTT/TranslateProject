如何在FreeBSD 10.2上配置Apache和SSL并安装Bugzilla
================================================================================
Bugzilla是一款bug跟踪系统和测试工具，它基于web且开源，由mozilla计划开发并由Mozilla公共许可证授权。它经常被一些高科技公司如mozilla、红帽公司和gnome使用。Bugzilla起初由Terry Weissman在1998年创立，它用perl语言编写，用MySQL作为后端数据库。它是一款旨在帮助管理软件开发的服务器软件，它功能丰富、高优化度的数据库、卓越的安全性、高级的搜索工具、整合邮件功能等等。

在本教程中，我们将给web服务器安装bugzilla 5.0的apache并为它启用SSL，然后在freebsd 10.2上安装mysql 5.1来作为数据库系统。

#### 准备 ####

    FreeBSD 10.2 - 64位
    Root权限

### 第一步 - 更新系统 ###

用ssl登录freebsd服务器，并更新库：

    sudo su
    freebsd-update fetch
    freebsd-update install

### 第二步 - 安装并配置Apache ###

在这一步我们将从freebsd库中用pkg命令安装apache，然后在apache24目录下编辑"httpd.conf"文件，启用SSL和CGI支持。

用pkg命令安装apache：

    pkg install apache24

进入apache目录并用nano编辑器编辑"httpd.conf"文件：

    cd /usr/local/etc/apache24
    nano -c httpd.conf

反注释掉下面列出的行：

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

接着，我们需要从freebsd库中安装mod perl，并启用它：

    pkg install ap24-mod_perl2

启用mod_perl，编辑"httpd.conf"文件并添加"Loadmodule"行：

    nano -c httpd.conf

添加该行：

    #第175行
    LoadModule perl_module libexec/apache24/mod_perl.so

保存并退出。

在启用apache之前，用sysrc命令添加以下行来在引导的时候启动：

    sysrc apache24_enable=yes
    service apache24 start

### 第三步 - 安装并配置MySQL数据库 ###

我们要用mysql 5.1来作为后端数据库并且支持perl模块。用pkg命令安装mysql 5.1：

    pkg install p5-DBD-mysql51 mysql51-server mysql51-client

现在我们要在启动时添加mysql服务并启动，然后为mysql配置root密码。

运行以下命令来完成所有操作：

    sysrc mysql_enable=yes
    service mysql-server start
    mysqladmin -u root password aqwe123

注意：

这里mysql密码为：aqwe123

![Configure MySQL Password](http://blog.linoxide.com/wp-content/uploads/2015/12/Configure-MySQL-Password.png)

以上步骤都完成之后，我们用root登录mysql shell，然后为bugzilla安装创建一个新的数据库和用户。

用以下命令登录mysql shell：

    mysql -u root -p
    password: aqwe123

添加数据库：

    create database bugzilladb;
    create user bugzillauser@localhost identified by 'bugzillauser@';
    grant all privileges on bugzilladb.* to bugzillauser@localhost identified by 'bugzillauser@';
    flush privileges;
    \q

![Creating Database for Bugzilla](http://blog.linoxide.com/wp-content/uploads/2015/12/Creating-Database-for-Bugzilla.png)

bugzilla的数据库创建好了，名字为"bugzilladb"，用户名和密码分别为"bugzillauser"和"bugzillauser@"。

### 第四步 - 生成新的SSL证书 ###

在bugzilla站点的"ssl"目录里生成新的自签名SSL证书。

前往apache24目录并在此创建新目录"ssl"：

    cd /usr/local/etc/apache24/
    mkdir ssl; cd ssl

接着，用openssl命令生成证书文件，然后更改其权限：

    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /usr/local/etc/apache24/ssl/bugzilla.key -out /usr/local/etc/apache24/ssl/bugzilla.crt
    chmod 600 *

### 第五步 - 配置虚拟主机 ###

我们将在"/usr/local/www/bugzilla"目录里安装bugzilla，所以我们必须为它创建新的虚拟主机配置。

前往apache目录并为虚拟主机文件创建名为"vhost"的新目录：

    cd /usr/local/etc/apache24/
    mkdir vhost; cd vhost

现在为虚拟主机文件创建新文件"bugzilla.conf"：

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

上述都完成之后，为bugzilla安装创建新目录并通过添加虚拟主机配置至httpd.conf文件来启用bugzilla虚拟主机。

在"apache24"目录下运行以下命令：

    mkdir -p /usr/local/www/bugzilla
    cd /usr/local/etc/apache24/
    nano -c httpd.conf

文末，添加以下配置：

    Include etc/apache24/vhost/*.conf

保存并退出。

现在用"apachectl"命令测试一下apache的配置并重启它：

    apachectl configtest
    service apache24 restart

### 第六步 - 安装Bugzilla ###

我们可以通过下载源来手动安装bugzilla了，或从freebsd库中安装也可以。在这一步中我们将用pkg命令从freebsd库中安装bugzilla：

    pkg install bugzilla50

以上步骤都完成之后，前往bugzilla安装目录并安装所有bugzilla需要的perl模块。

    cd /usr/local/www/bugzilla
    ./install-module --all

要等到所有都完成，这需要点时间。

下一步，在bugzilla的安装目录中执行"checksetup.pl"文件来生成配置文件"localconfig"。

    ./checksetup.pl

你会看到一条关于数据库配置错误，你得用nano编辑器编辑一下"localconfig"文件：

    nano -c localconfig

现在添加第三步创建的数据库。

    #第五十七行
    $db_name = 'bugzilladb';

    #第六十行
    $db_user = 'bugzillauser';

    #第六十七行
    $db_pass = 'bugzillauser@';

保存并退出。

然后再次运行"checksetup.pl"：

    ./checksetup.pl

你会收到输入邮箱名和管理员账号的提示，你只要输入你得邮箱、用户名和密码就行了。

![Admin Setup](http://blog.linoxide.com/wp-content/uploads/2015/12/Admin-Setup.png)

最后，我们需要把安装目录的属主改成"www"，然后用服务命令重启apache：

    cd /usr/local/www/
    chown -R www:www bugzilla
    service apache24 restart

现在Bugzilla已经安装好了，你可以通过访问mybugzilla.me来查看，并且将会重定向到https连接。

Bugzilla首页：

![Bugzilla Home](http://blog.linoxide.com/wp-content/uploads/2015/12/Bugzilla-Home.png)

Bugzilla admin面板：

![Bugzilla Admin Page](http://blog.linoxide.com/wp-content/uploads/2015/12/Bugzilla-Admin-Page.png)

### 结论 ###

Bugzilla是一个基于web并能帮助你管理软件开发的应用，它用perl开发并使用MySQL作为数据库系统。Bugzilla被mozilla,redhat,gnome等等公司用来帮助它们的软件开发工作。Bugzilla有很多功能并易于配置和安装。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-bugzilla-apache-ssl-freebsd-10-2/

作者：[Arul][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/
