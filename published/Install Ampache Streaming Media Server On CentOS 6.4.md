 在CentOS 6.4上安装Ampache流媒体服务
==========
[Ampache][2]是一个基于网页的音频/视频的流媒体软件和文件管理器。它允许你使用几乎所有互联网设备从任何地方去访问你的音乐和视频。它不是一个媒体管理器,它只是在一个有用的方式上使用存在的已组织的媒体文件。所以，你必须意识到管理和组织这些媒体文件。

**方案**

这个指南是在CentOS 6.4上测试的,虽然，它几乎应该工作在所有基于RHEL的系统上。在这篇指南中, 我的测试机的主机名和IP地址是**server.unixmen.com** 和 **192.168.1.201/24**.在你自己适当的地方改变这些值。

**先决条件**

你的服务器上应该安装和配置了Apache，MySQL和PHP（LAMP）。 参考任何以下链接之一去安装LAMP服务。

- 在CentOS 6.4上安装LAMP(Apache, MariaDB, PHP)服务。 

或者

- 在CentOS 6.4上安装LAMP(Apache, MySQL, PHP)服务。

> 译者注：注意，两种安装方式的数据库是不同的

接着安装PHP模块。

    # yum install php-mcrypt php-pdo php-cli php-mysql php-gd php-xml libtool-ltdl mhash mcrypt -y

**为Ampache创建数据库用户**

例如, 这里，我将要创建一个名为“**ampachedb**”的数据库用户和“**ampachedb**”用户的密码为“**centos**”的数据。你可以根据你的喜好来定义数据库。

    # mysql -u root -p
    Enter password: 
    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 3
    Server version: 5.5.31-MariaDB MariaDB Server
    
    Copyright (c) 2000, 2013, Oracle, Monty Program Ab and others.
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    MariaDB [(none)]&gt; create database ampachedb;
    Query OK, 1 row affected (0.02 sec)
    
    MariaDB [(none)]&gt; GRANT ALL ON ampachedb.* TO ampacheuser@localhost IDENTIFIED BY 'centos';
    Query OK, 0 rows affected (0.01 sec)
    
    MariaDB [(none)]&gt; flush privileges;
    Query OK, 0 rows affected (0.00 sec)
    
    MariaDB [(none)]&gt; exit
    Bye

**调整防火墙/路由器的设置**

允许apache的默认端口“80”通过防火墙/路由器。编辑 /etc/sysconfig/iptables 文件,

    # vi /etc/sysconfig/iptables

添加下面这行。

    -A INPUT -p tcp -m state --state NEW --dport 80 -j ACCEPT

现在重启防火墙（iptables）服务。

    # /etc/init.d/iptables restart

**获取Ampache**

[在这下载Ampache][3]最新版本或者从你的终端输入以下命令去下载。

    # wget https://github.com/ampache/ampache/archive/3.6-alpha6.zip

**注释:** 这里你可以用两种方法来访问你的流媒体服务网站。

1. 直接从网站根目录, 通过导航到**http://domain-name/**你可以成功访问你的网站。

2.或者网站根目录和从主机网站的分目录创建一个sub目录，即可使用URL**http://domain-name/sub-directory-name**成功访问你的网站。

此时, 因为测试目的,我将要在sub目录下访问我的流媒体网站。

用命令解压下载后的文件:

    # tar -zxvf 3.6-alpha6

移动ampache目录到apache根目录。

    # mv ampache-3.6-alpha6/ /var/www/html/ampache

设置ampache/config目录的写权限。

    # chmod -R 777 /var/www/html/ampache/config/

**开始安装**

打开浏览器在地址栏中输入**http://domain-name/ampache**或**http://ip-address/ampache**。

接下来就会出现。点击**Start configuration（开始配置）**。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Ampache-Pour-lAmour-de-la-Musique-Install-Mozilla-Firefox_001.png)

输入MySQL数据库，用户和密码等详细资料。因为我们创建了数据库，所以确保你选中了“**Overwrite existing database（覆盖现有的数据库）**”复选框。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Ampache-Pour-lAmour-de-la-Musique-Install-Mozilla-Firefox_004.png)

输入最近创建的MySQL数据库，用户和密码等详细资料。点击 **write**生成**ampache.config.php**文件和点击**Continue to step 3**按钮。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Ampache-Pour-lAmour-de-la-Musique-Install-Mozilla-Firefox_006.png)

现在你将被要求设置**admin**用户密码。输入密码并且点击**Create Account（创建账户）**。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Ampache-Pour-lAmour-de-la-Musique-Install-Mozilla-Firefox_008.png)

最后，Ampache将要求你更新最新版本。点击Update（更新）。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/Ampache-Update-Mozilla-Firefox_010.png)

That’s it（这该肿么翻译）。现在Apmache已经安装完成。为进一步配置，我建议你阅读官方Ampache Wiki页。

via:http://www.unixmen.com/setup-streaming-media-server-ampache/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.unixmen.com/setup-streaming-media-server-ampache/
[2]:https://github.com/ampache/ampache/
[3]:https://github.com/ampache/ampache/tags