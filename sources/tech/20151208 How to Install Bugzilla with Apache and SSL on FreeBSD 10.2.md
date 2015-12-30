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

以上步骤都完成之后，我们用root登录mysql shell，然后为bugzilla创建一个新的数据库和用户。

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

We will install bugzilla on directory "/usr/local/www/bugzilla", so we must create new virtualhost configuration for it.

Go to the apache directory and create new directory called "vhost" for virtualhost file :

    cd /usr/local/etc/apache24/
    mkdir vhost; cd vhost

Now create new file "bugzilla.conf" for the virtualhost file :

    nano -c bugzilla.conf

Paste configuration below :

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

If all is done, create new directory for bugzilla installation and then enable the bugzilla virtualhost by adding the virtualhost configuration to httpd.conf file.

Run command below on "apache24" directory :

    mkdir -p /usr/local/www/bugzilla
    cd /usr/local/etc/apache24/
    nano -c httpd.conf

In the end of the line, add configuration below :

    Include etc/apache24/vhost/*.conf

Save and exit.

Now test the apache configuration with "apachectl" command and restart it :

    apachectl configtest
    service apache24 restart

### 第六步 - 安装Bugzilla ###

We can install bugzilla manually by downloading the source, or install it from freebsd repository. In this step we will install bugzilla from freebsd repository with pkg command :

    pkg install bugzilla50

If it's done, go to the bugzilla installation directory and install all perl module that needed by bugzilla.

    cd /usr/local/www/bugzilla
    ./install-module --all

Wait it until all is finished, it is take the time.

Next, generate the configuration file "localconfig" by executing "checksetup.pl" file on bugzilla installation directory.

    ./checksetup.pl

You will see the error message about the database configuration, so edit the file "localconfig" with nano editor :

    nano -c localconfig

Now add the database that was created on step 3.

    #Line 57
    $db_name = 'bugzilladb';

    #Line 60
    $db_user = 'bugzillauser';

    #Line 67
    $db_pass = 'bugzillauser@';

Save and exit.

Then run "checksetup.pl" again :

    ./checksetup.pl

You will be prompt about mail and administrator account, fill all of it with your email, user and password.

![Admin Setup](http://blog.linoxide.com/wp-content/uploads/2015/12/Admin-Setup.png)

In the last, we need to change the owner of the installation directory to user "www", then restart apache with service command :

    cd /usr/local/www/
    chown -R www:www bugzilla
    service apache24 restart

Now Bugzilla is installed, you can see it by visiting mybugzilla.me and you will be redirect to the https connection.

Bugzilla home page.

![Bugzilla Home](http://blog.linoxide.com/wp-content/uploads/2015/12/Bugzilla-Home.png)

Bugzilla admin panel.

![Bugzilla Admin Page](http://blog.linoxide.com/wp-content/uploads/2015/12/Bugzilla-Admin-Page.png)

### 结论 ###

Bugzilla is web based application help you to manage the software development. It is written in perl and use MySQL as the database system. Bugzilla used by mozilla, redhat, gnome etc for help their software development. Bugzilla has a lot of features and easy to configure and install.

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-bugzilla-apache-ssl-freebsd-10-2/

作者：[Arul][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arulm/
