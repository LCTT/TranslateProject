在 Ubuntu Server 16.04 LTS 上安装 LAMP
=========================================================

LAMP方案是一系列自由和开源软件的集合，包含了  **Linux**, web服务器 (**Apache**), 数据库服务器 (**MySQL / MariaDB**) 和 **PHP** (脚本语言). LAMP是那些需要安装和构建动态网页应用的基础平台，比如WordPress、Joomla, OpenCart 和 Drupal。

在这篇文章中，我将描述如何在Ubuntu Server 16.04 LTS 上安装LAMP，众所周知Ubuntu是一个基于linux的操作系统，因此它构成了LAMP的第一个部分，在接下来的操作中，我将默认你已经安装了 Ubuntu Server 16.04。

### Apache2 web服务器的安装 :

在Ubuntu linux中，web 服务器称之为 Apache2，我们可以利用下面的命令来安装它

```
linuxtechi@ubuntu:~$ sudo apt update
linuxtechi@ubuntu:~$ sudo apt install apache2 -y
```

当安装Apache2包之后，Apache2相关的服务将会在重启后变成可用状态和自动运行，在某些情况下，如果你的Apache2服务并没有自动可用和启动，你可以利用如下命令来启用它。

```
linuxtechi@ubuntu:~$ sudo systemctl start apache2.service
linuxtechi@ubuntu:~$ sudo systemctl enable apache2.service
linuxtechi@ubuntu:~$ sudo systemctl status apache2.service
```

如果你开启了Ubuntu的防火墙（ufw），那么你可以使用如下的命令来解除web服务器的端口(80和443)限制

```
linuxtechi@ubuntu:~$ sudo ufw status
Status: active
linuxtechi@ubuntu:~$ sudo ufw allow in 'Apache Full'
Rule added
Rule added (v6)
linuxtechi@ubuntu:~$
```

### 现在开始访问你的web服务器 :

打开浏览器并输入服务器的IP地址或者主机名
(http://IP_Address_OR_Host_Name),在我的例子中我的服务器IP是‘192.168.1.13’

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/Apache2-Ubuntu-server-16.04-1024x955.jpg)

### 数据库服务器的安装 (MySQL Server 5.7) :

MySQL 和 MariaDB 都是 Ubuntu 16.04 中的数据库服务器。 MySQL Server 和 MariaDB Server的安装包都可以在Ubuntu的默认软件源中找到，我们可以选择其中的一个来安装.通过下面的命令来在终端中安装mysql服务器。

```
linuxtechi@ubuntu:~$ sudo apt install mysql-server mysql-client
```

在安装过程中，它会要求你设置mysql服务器root帐户的密码。

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/Enter-root-password-mysql-server-ubuntu-16-04.jpg)

确认root帐户的密码，并点击确定。

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/confirm-root-password-mysql-server-ubuntu-16-04.jpg)

Mysql 服务器的安装到此已经结束了， MySQL 服务会自动变成可用状态和自动启动。我们可以通过如下的命令来校验Mysql服务的状态。

```
linuxtechi@ubuntu:~$ sudo systemctl status mysql.service
```

### MariaDB Server的安装 :

在终端中利用如下的命令来安装 Mariadb 10.0 服务器。

```
linuxtechi@ubuntu:~$ sudo apt install mariadb-server
```

运行如下的命令来设置mariadb root帐户的密码，还可以用来关闭某些选项，比如关闭远程登录功能。

```
linuxtechi@ubuntu:~$ sudo mysql_secure_installation
```

### PHP脚本语言的安装:

PHP 7 已经存在于Ubuntu的软件源中了，在终端中执行如下的命令来安装PHP 7:

```
linuxtechi@ubuntu:~$ sudo apt install php7.0-mysql php7.0-curl php7.0-json php7.0-cgi php7.0 libapache2-mod-php7.0
```

创建一个简单的php页面，并且将它移动到 apache 的文档根目录下 (/var/ww/html)

```
linuxtechi@ubuntu:~$ vi samplepage.php
<?php
phpinfo();
?>
```

在vi中编辑之后，保存并退出该文件。

```
linuxtechi@ubuntu:~$ sudo mv samplepage.php /var/www/html/
```

现在你可以从web浏览器中访问这个页面, 
输入 : “http://<Server_IP>/samplepage.php” ,你可以看到如下页面。

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/Sample-PHP-Page-Ubuntu-Server-16-04.jpg)

以上的页面向我们展示了PHP已经完全安装成功了。

### phpMyAdmin的安装:

phpMyAdmin可以让我们通过它的web界面来执行所有与数据库管理和其他数据库操作相关的任务，这个安装包已经存在于Ubuntu的软件源中。

利用如下的命令来在Ubuntu server 16.04 LTS中安装phpMyAdmin。

```
linuxtechi@ubuntu:~$ sudo apt install php-mbstring php7.0-mbstring php-gettext
linuxtechi@ubuntu:~$ sudo systemctl restart apache2.service
linuxtechi@ubuntu:~$ sudo apt install phpmyadmin
```

在以下的安装过程中，它会提示我们选择phpMyAdmin运行的目标服务器

选择 Apache2 并点击确定。

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/Web-Server-for-phpMyAdmin-Ubuntu-Server-16-04.jpg)

点击确定来配置phpMyAdmin管理的数据库。

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/configure-database-for-phpmyadmin-ubuntu-server-16-04.jpg)

指定phpMyAdmin向数据库服务器注册时所用的密码。

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/Select-Password-for-phpMyadmin-ubuntu-16-04-1024x433.jpg)

确认phpMyAdmin所需的密码，并点击确认。

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/confirm-password-for-phpmyadmin-ubuntu-server-16-04.jpg)

现在可以开始尝试访问phpMyAdmin, 打开浏览器并输入 : “http://Server_IP_OR_Host_Name/phpmyadmin”

使用我们安装时设置的 root 帐户和密码。

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/phpMyAdmin-Ubuntu-Server-16-04-1024x557.jpg)

当我们点击“Go”的时候，将会重定向到如下所示的 ‘phpMyAdmin’web界面。

![](http://www.linuxtechi.com/wp-content/uploads/2016/05/phpMyAdmin-portal-overview-ubuntu-server-16-04-1024x557.jpg)

到现在，LAMP方案已经被成功安装并可以使用了，欢迎分享你的反馈和评论。

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/lamp-stack-installation-on-ubuntu-server-16-04/

作者：[Pradeep Kumar][a]
译者：[陆建波](https://github.com/lujianbo)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
