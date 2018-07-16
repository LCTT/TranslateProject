使用ownCloud在Linux安装你的个人云服务
================================================================================
[ownCloud][1]是一个免费开源的软件，用于为分享文件，日历，联系人，书签和个人音频/视频。非常容易安装和管理。

### 前提 ###

在这篇教程里我使用CentOS 6.5 minimal server来安装ownCloud。下面是我测试机的资料。

    Operating system: CentOS 6.5 Minimal Installation
    IP Address: 192.168.1.101/24

在CentOS 6.5上测试了一段时间，ownCloud适用于所有基于RPM的发行版。

你的服务应该工作在LAMP上。参考下面链接去安装LAMP服务。

- [在RHEL/Scientific Linux上安装LAMP服务][2]

安装一下必要的PHP扩展：

    # yum install php-mysql php-json php-xml php-mbstring php-zip php-gd curl php-curl php-pdo

### 为ownCloud设置数据库 ###

让我们来创建一个名为'ownclouddb'和数据库用户'ownclouduser'以及密码是'centos'的数据库。

    # mysql -u root -p
    Enter password: 
    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 66
    Server version: 5.5.34-MariaDB MariaDB Server

    Copyright (c) 2000, 2013, Oracle, Monty Program Ab and others.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    MariaDB [(none)]> CREATE DATABASE ownclouddb;
    Query OK, 1 row affected (0.04 sec)

    MariaDB [(none)]> GRANT ALL ON ownclouddb.* TO ownclouduser@localhost IDENTIFIED BY 'centos';
    Query OK, 0 rows affected (0.01 sec)

    MariaDB [(none)]> flush privileges;
    Query OK, 0 rows affected (0.01 sec)

    MariaDB [(none)]> exit
    Bye

### 获取ownCloud ###

切换到你的apache root目录并下载ownCloud最新版

转到Apache root文件目录并下载最新版ownCloud。

    # wget http://download.owncloud.org/community/owncloud-6.0.0a.tar.bz2

用命令解压tar压缩包：

    # tar xvf owncloud-6.0.0a.tar.bz2

移动解压后的目录到你的apache root目录 (例如 /var/www/html/)

    # mv owncloud/ /var/www/html/

设置一下目录的所有权和权限：

    # chown -R apache:apache /var/www/html/owncloud/
    # chmod 777 /var/www/html/owncloud/config/

启用apache重写模式。

编辑文件 “**/etc/httpd/conf/httpd.conf**”，

    # vi /etc/httpd/conf/httpd.conf

查找并修改 **AllowOverride None** 为 **Allowoverride All**.

    [...]
         AllowOverride All
    [...]

最后，重启apachehttpd和mysql服务。

    # service mysql restart
    # service httpd restart

### 开始安装ownCloud ###

通过你的网页浏览器导航到 **http://ip-address/owncloud** 或 **http://domain-name/owncloud** 。

**注意**：如果遇到任何权限错误，禁用SELinux并再试一次。

自己的云的主页将出现。你将被要求创建一个新的管理员账户。输入管理员账户信息。

然后点击 **Advanced** 下拉按钮，选择mysql并输入mysql数据库名，数据库用户和密码。最后点击 **Finish setup** 来完成安装。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/03/ownCloud-Mozilla-Firefox_001.jpg)

这是我的ownCloud界面的样子：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/03/Files-ownCloud-Mozilla-Firefox_002.jpg)

就是这样。我们的云服务已经准备好了。现在，你可以从你任何网络的客户端来上传/下载你的图片，文件，音频，视频以及访问它们。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/setup-your-personal-cloud-server-in-minutes-using-owncloud/

译者：[Vito](https://github.com/vito-L) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://owncloud.org/
[2]:http://www.unixmen.com/install-lamp-apache-with-mariadb-and-php-on-centosrhelscientific-linux-6/
