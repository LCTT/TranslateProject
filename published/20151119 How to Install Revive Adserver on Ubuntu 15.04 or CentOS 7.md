在 Ubuntu 15.04 / CentOS 7 上安装广告服务器 Revive Adserver
================================================================================
Revive Adserver是一个自由开源的广告管理系统，能使出版商，广告平台和广告商在网页、应用、视频上投放并管理广告的系统。Revive Adserver以前叫做OpenX Source，遵循GNU通用公共授权协议。它集广告管理、网站定位、地理定位和一个用于数据收集的跟踪系统于一体。能使网站站长管理内部的、付费的以及第三方来源的广告，如谷歌的AdSense。本教程中，将会教会你在Ubuntu 15.04或CentOS 7安装并运行Revive Adserver。

### 1. 安装LAMP###

首先，Revive Adserver需要完整的LAMP环境才能运行，所以我们先安装LAMP。LAMP是Apache网页服务器，MySQL/MariaDB数据库和PHP模块的集合。要使Revive正常运行，需要安装PHP的众多模块，如apc, zlib, xml, pcre, mysql和mbstring。在不同的Linux发行版中，我们可以用下列命令进行LAMP的配置:

#### 在Ubuntu 15.04下####

	# apt-get install apache2 mariadb-server php5 php5-gd php5-mysql php5-curl php-apc zlibc zlib1g zlib1g-dev libpcre3 libpcre3-dev libapache2-mod-php5 zip
	
#### 在CentOS 7下 ####
	
	# yum install httpd mariadb php php-gd php-mysql php-curl php-mbstring php-xml php-apc zlibc zlib1g zlib1g-dev libpcre3 libpcre3-dev zip
	
### 2. 启动Apache Web和MariaDB服务

可以用下列命令启动刚刚安装好的Apache Web服务和MariaDB数据库服务。

#### 在Ubuntu 15.04下####

Ubuntu15.04使用Systemd作为默认初始系统，所以用下列命令启动Apache和MariaDB进程：
	
	# systemctl start apache2 mysql
	
可以用下列命令使其开机自动运行：
	
	# systemctl enable apache2 mysql
	
	Synchronizing state for apache2.service with sysvinit using update-rc.d...
	Executing /usr/sbin/update-rc.d apache2 defaults
	Executing /usr/sbin/update-rc.d apache2 enable
	Synchronizing state for mysql.service with sysvinit using update-rc.d...
	Executing /usr/sbin/update-rc.d mysql defaults
	Executing /usr/sbin/update-rc.d mysql enable
	
#### 在CentOS 7下

CentOS 7同样是以Systemd作为默认初始系统，可以用下列命令启动:
	
	# systemctl start httpd mariadb
	
	ln -s '/usr/lib/systemd/system/httpd.service' '/etc/systemd/system/multi-user.target.wants/httpd.service'
	ln -s '/usr/lib/systemd/system/mariadb.service' '/etc/systemd/system/multi-user.target.wants/mariadb.service'
	
### 3. 配置MariaDB

#### 在CentOS 7/Ubuntu 15.04下 ####
	
当我们第一次启动MariaDB时，MariaDB是没有分配密码的，所以要先设置一个root密码。之后再创建一个新的数据库用来储存Revive Adserver的数据。
	
使用以下命令配置MariaDB并设置其root密码：
	
	# mysql_secure_installation

这时会要我们输入root密码，但我们之前什么密码都没设置，所以按回车下一步。之后，要求设置root密码，这时我们输入Y，然后输入自己想要的密码。回车继续下一步。

	 ….
    so you should just press enter here.

    Enter current password for root (enter for none):
    OK, successfully used password, moving on…

    Setting the root password ensures that nobody can log into the MariaDB
    root user without the proper authorisation.

    Set root password? [Y/n] y
    New password:
    Re-enter new password:
    Password updated successfully!
    Reloading privilege tables..
    … Success!
    …
    installation should now be secure.
    Thanks for using MariaDB!

![Configuring MariaDB](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-mariadb.png)

### 4. 创建新的数据库 ###

为MariaDB的root用户设置了密码之后，就可以创建用来储存Revive Adserver应用数据的数据库。首先通过以下命令登录MariaDB控制台：

	# mysql -u root -p

这时要求输入root用户的密码，我们只要输入上一步设置好的密码。然后进入MariaDB控制台创建新的数据库，数据库用户及其密码，并且授予其创建、删除、编辑和存储表与数据的全部权限。
	
	> CREATE DATABASE revivedb;
    > CREATE USER 'reviveuser'@'localhost' IDENTIFIED BY 'Pa$$worD123';
    > GRANT ALL PRIVILEGES ON revivedb.* TO 'reviveuser'@'localhost';
    > FLUSH PRIVILEGES;
    > EXIT;

![Creating Mariadb Revive Database](http://blog.linoxide.com/wp-content/uploads/2015/11/creating-mariadb-revive-database.png)	
	
### 5. 下载Revive Adserver

接下来下载Revive Adserver的最新版本Revive Adserver.3.2.2（写本文时）。可以使用wget命令从Revive Adserverde 官方网站下载压缩包，网址是：[http://www.revive-adserver.com/download/][1]	。命令如下：
	
	# cd /tmp/
    # wget http://download.revive-adserver.com/revive-adserver-3.2.2.zip
	
	--2015-11-09 17:03:48-- http://download.revive-adserver.com/revive-adserver-3.2.2.zip
    Resolving download.revive-adserver.com (download.revive-adserver.com)... 54.230.119.219, 54.239.132.177, 54.230.116.214, ...
    Connecting to download.revive-adserver.com (download.revive-adserver.com)|54.230.119.219|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 11663620 (11M) [application/zip]
    Saving to: 'revive-adserver-3.2.2.zip'
    revive-adserver-3.2 100%[=====================>] 11.12M 1.80MB/s in 13s
    2015-11-09 17:04:02 (906 KB/s) - 'revive-adserver-3.2.2.zip' saved [11663620/11663620]
	
解压到临时目录下：
	
	# unzip revive-adserver-3.2.2.zip

把解压后的整个文件夹移动到Apache Web服务器的默认根目录/var/www/html/下：
	
	# mv revive-adserver-3.2.2 /var/www/html/reviveads
	
### 6. 配置Apache Web服务

现在配置Apache服务使Revive正常运行。通过创建配置文件reviveads.conf来创建一个新的虚拟主机。这个目录在不同的Linux发行版上有所不同。

#### 在Ubuntu 15.04下
	
	# touch /etc/apache2/sites-available/reviveads.conf
    # ln -s /etc/apache2/sites-available/reviveads.conf /etc/apache2/sites-enabled/reviveads.conf
    # nano /etc/apache2/sites-available/reviveads.conf
	
在这个文件中添加下列几行文本：
	
	<VirtualHost *:80>
    ServerAdmin info@reviveads.linoxide.com
    DocumentRoot /var/www/html/reviveads/
    ServerName reviveads.linoxide.com
    ServerAlias www.reviveads.linoxide.com
    <Directory /var/www/html/reviveads/>
    Options FollowSymLinks
    AllowOverride All
    </Directory>
    ErrorLog /var/log/apache2/reviveads.linoxide.com-error_log
    CustomLog /var/log/apache2/reviveads.linoxide.com-access_log common
    </VirtualHost>

![Configuring Apache2 Ubuntu](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-apache2-ubuntu.png)

保存并退出，重启Apache Web服务：

	# systemctl restart apache2

#### 在CentOS 7下 ####

在CentOS下，我们直接在/etc/httpd/conf.d/ 目录下创建reviveads.conf :
		
	# nano /etc/httpd/conf.d/reviveads.conf	

在这个文件中添加下列几行文本：	
	
	<VirtualHost *:80>
    ServerAdmin info@reviveads.linoxide.com
    DocumentRoot /var/www/html/reviveads/
    ServerName reviveads.linoxide.com
    ServerAlias www.reviveads.linoxide.com
    <Directory /var/www/html/reviveads/>
    Options FollowSymLinks
    AllowOverride All
    </Directory>
    ErrorLog /var/log/httpd/reviveads.linoxide.com-error_log
    CustomLog /var/log/httpd/reviveads.linoxide.com-access_log common
    </VirtualHost>

![Configuring httpd Centos](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-httpd-centos.png)
	
保存并退出，重启Apache Web服务：	
	
	# systemctl restart httpd
	
### 7. 修复权限和所有权

现在我们修改安装路径下文件的权限和所有权。把安装目录的所有权改成Apache进程所有，以便Apache Web服务有文件和目录的编辑、创建和删除的完全权限。
	
#### 在Ubuntu 15.04下####
	
	# chown www-data: -R /var/www/html/reviveads
	
#### 在CentOS 7下
		
	# chown apache: -R /var/www/html/reviveads	
	
### 8. 设置防火墙
	
	现在要配置防火墙，打开80端口使Apache Web服务运行的Revive Adserver能够被网络上的其他机器所访问。
	
#### 在Ubuntu 15.04/CentOS 7下
	
Ubuntu15.04/CentOS 7都使用Systemd作为默认初始系统，使用firewalld作为其防火墙。要打开80端口（http服务端口），执行以下命令：

	# firewall-cmd --permanent --add-service=http

    success

    # firewall-cmd --reload

    success	
	
### 9. 网站的安装

顺利的话我们能够使用浏览器进行交互，并可以将浏览器指向正在运行的网络服务器。只要在浏览器输入http://ip-address/ 或者 http://domain.com 。这里我们要访问	http://reviveads.linoxide.com/ 
	
打开后可以看到Revive Adserver的欢迎页面，上面还有作为它发行许可证的GNU通用公共许可证V2。点击 I agree 继续下一步安装。

在下一页中，我们要输入数据库信息以便把Revive Adserver和MariaDB数据库服务连接起来。要输入之前设置的数据库名称，用户名以及密码。在本教程中，我们分别输入数据库名称为revivedb，用户名为reviveuser，密码为Pa$$worD123,并且令主机名为localhost，点击continue继续。
	
![Configuring Revive Adserver](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-revive-adserver.png)	

输入要填的信息，如：管理员用户名，密码和邮箱。可以以这些信息登录Adserver的控制界面。然后跳到最后一页，可以看到Revive Adserver已经安装成功了。

接着，转到Adverstiser页面，添加新的广告管理。在控制界面添加新用户到adserver，为广告库户添加标题，网页，视频
广告。

### 总结 ###

本文中，我们学习了如何在Ubuntu 15.04和CentOS 7上安装并配置Revive Adserver。尽管Revive Adserver的原始代码是从OpenX那买的，但现在OpenX Enterprise和Revive Adserver已经完全分开了。可以从[http://www.adserverplugins.com/][2] 获得更多插件来扩展新特性。讲真，这个软件确实让网页，应用，视频上的广告管理变得容易了许多。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-revive-adserver-ubuntu-15-04-centos-7/

作者：[Arun Pyasi][a]
译者：[chisper](https://github.com/chisper)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.revive-adserver.com/download/
[2]:http://www.adserverplugins.com/	
