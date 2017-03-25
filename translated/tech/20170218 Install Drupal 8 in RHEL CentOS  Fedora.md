在 RHEL CentOS & Fedora 安装 Drupal 8
============================================================

Drupal 是一个 开源,灵活，高度可拓展和安全的内容管理系统(CMS)，使用户轻松的创建一个网站。
它可以使用模块拓展使用户转换内容管理为强大的数字解决方案


Drupal 运行在 Web 服务器上， 像 Apache, IIS, Lighttpd, Cherokee, Nginx， 
后端数据库可以使用 Mysql, MongoDB, MariaDB， PostgreSQL, MSSQL Server

在这个文章， 我们会展示在 RHEL 7/6 CentOS 7/6 和Fedora 20-25 发行版本使用 LAMP 步骤 如何执行手动安装和配置 Drupal 8 

#### Drupal 需求:
1. Apache 2.x(推荐)
2. PHP 5.5.9 或 更高 (推荐PHP 5.5)
3. MYSQL 5.5.3 或 MariaDB 5.5.20 与 PHP 数据对象(PDO)


这个步骤，我是使用 `drupal.tecmint.com` 作为网站主机名 和 IP 地址 `192.168.0.104`.
这些设置也许在你的环境不同，因此请适当做出更改

### 第一步: 安装 Apache Web 服务器
1. 首先我们从官方仓库开始安装 Apache Web 服务器

```
# yum install httpd
```

2. 安装完成后，服务将会被被禁用，因此我们需要手动启动它，同时让它从下次系统启动时自动启动像这样:
```
-------------  通过 SystemD - CentOS/RHEL 7 和 Fedora 22+ -------------------
# systemctl start httpd 
# systemctl enable httpd

-------------  通过 SysVInit - CentOS/RHEL 6 和 Fedora ----------------------
# service httpd start
# chkconfig --level 35 httpd on
```

3. 接下来，为了通过 HTTP 和 HTTPS 访问 Apache 服务，我们必须打开 HTTPD 守护进程正在监听的80和443端口，如下所示:

```
------------ 通过 Firewalld - CentOS/RHEL 7 and Fedora 22+ ------------- 
# firewall-cmd --permanent --zone=public --add-service=http
# firewall-cmd --permanent --zone=public --add-service=https
# firewall-cmd --reload

------------ 通过 IPtables - CentOS/RHEL 6 and Fedora 22+ ------------- 
# iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
# iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
# service iptables save
# service iptables restart
```

4. 现在验证 Apache 是否正常工作， 打开浏览器在 URL:http://server_IP`  输入你的服务器 IP 地址使用 HTTP 协议 ` ， 默认 Apache 页面外观应该如下面截图所示: 

[
 ![Apache 默认页面](https://dn-coding-net-production-pp.qbox.me/a93436ad-59ee-404d-9a28-ebde4446cd6d.png) 
][1]

Apache 默认页面

### 第二部: 安装 Apache PHP 支持 

5. 接下来 安装 PHP 和 PHP 所需模块.

```
# yum install php php-mbstring php-gd php-xml php-pear php-fpm php-mysql php-pdo php-opcache
```
>重要: 假如你想要安装 PHP7.， 你需要增加以下仓库:EPEL 和 Webtactic 才可以使用 yum 安装 PHP7.0:
```
------------- Install PHP 7 in CentOS/RHEL and Fedora ------------- 
# rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
# yum install php70w php70w-opcache php70w-mbstring php70w-gd php70w-xml php70w-pear php70w-fpm php70w-mysql php70w-pdo
```

6. 接下来 从浏览器得到关于 PHP 安装和配置完整信息，使用下面命令在 Apache 根文档创建一个 `info.php` 文件

```
# echo "<?php  phpinfo(); ?>" > /var/www/html/info.php
```

然后重启 HTTPD 服务器 ，在浏览器输入 URL `http://server_IP/info.php`
```
# systemctl restart httpd
OR
# service httpd restart
```
[
 ![验证 PHP 信息](https://dn-coding-net-production-pp.qbox.me/7dcdb202-ba2e-4b1c-b304-215c5721db03.png) 
][2]

验证 PHP 信息

### 步骤 3: 安装和配置 MariaDB 数据库

7. 对于你的信息， Red Hat Enterprise Linux/CentOS 7.0 从支持 MYSQL 转移到 MariaDB 作为默认数据库管理系统支持

安装 MariaDB 你需要添加以下内容,[official MariaDB repository][3] 到 `/etc/yum.repos.d/MariaDB.repo` 如下所示
```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

当仓库文件就位你可以像这样安装 MariaDB :

```
# yum install mariadb-server mariadb
```

8. 当 MariaDB 数据库安装完成，同时启动数据库的守护进程使它能够在下次启动后自动启动
```
------------- 通过 SystemD - CentOS/RHEL 7 and Fedora 22+ ------------- 
# systemctl start mariadb
# systemctl enable mariadb
------------- 通过 SysVInit - CentOS/RHEL 6 and Fedora ------------- 
# service mysqld start
# chkconfig --level 35 mysqld on
```

9. 然后运行 `mysql_secure_installation` 脚本去保护数据库(设置 root 密码， 禁用远程登录，移除测试数据库，和移除匿名用户)，如下所示:

```
# mysql_secure_installation
```
[
 ![Mysql安全安装](https://dn-coding-net-production-pp.qbox.me/15a20560-ea9f-499b-b155-a310e9aa6a88.png) 
][4]

Mysql 安全安装

### 第四步: 在 CentOS 安装和配置 Drupal 8 

10. 这里我们使用 [wget 命令][6] [下载最新版本 Drupal][5](i.e 8.2.6),如果你没有安装 wget 和 gzil 包 ，请使用下面命令安装它们:

```
# yum install wget gzip
# wget -c https://ftp.drupal.org/files/projects/drupal-8.2.6.tar.gz
```

11. 之后，[导出压缩文件][7] 和移动 Drupal 目录到 Apache 根目录(`/var/www/html`).

```
# tar -zxvf drupal-8.2.6.tar.gz
# mv drupal-8.2.6 /var/www/html/drupal
```

12. 然后从示例设置文件(`/var/www/html/drupal/sites/default`) 目录创建设置文件 `settings.php` ， 然后给 Drupal 站点目录设置适当权限，包括子目录和文件，如下所示:

```
# cd /var/www/html/drupal/sites/default/
# cp default.settings.php settings.php
# chown -R apache:apache /var/www/html/drupal/
```

13. 更重要的是在 `/var/www/html/drupal/sites/` 目录设置 SElinux 规则，如下:

```
# chcon -R -t httpd_sys_content_rw_t /var/www/html/drupal/sites/
```

```
14. 现在我们必须为 Drupal 站点去创建一个数据库和用户来管理

```
# mysql -u root -p
输入数据库密码: 
```
MySQL Shell
```
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 5.1.73 Source distribution
Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
MySQL [(none)]> create database drupal;
Query OK, 1 row affected (0.00 sec)
MySQL [(none)]> create user ravi@localhost identified by 'tecmint123';
Query OK, 0 rows affected (0.00 sec)
MySQL [(none)]> grant all on drupal.* to ravi@localhost;
Query OK, 0 rows affected (0.00 sec)
MySQL [(none)]> flush privileges;
Query OK, 0 rows affected (0.00 sec)
MySQL [(none)]> exit
Bye
```

15. 最后,在这一点，打开URL: `http://server_IP/drupal/` 开始网站的安装，选择你首选的安装语言然后点击保存以继续
[
 !Drupal 安装语言](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation-Language.png) 
][8]

Drupal 安装语言


16. 下一步，选择安装配置文件，选择 Standard(标准) 点击保存继续

[
 ![Drupal 安装配置文件](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation-Profile.png) 
][9]

Drupal 安装配置文件

17. 在进行下一步之前查看并通过需求审查并启用 `Clean URL`

[
 ![验证 Drupal 需求](http://www.tecmint.com/wp-content/uploads/2013/07/Verify-Drupal-Requirements.png) 
][10]

验证 Drupal 需求

现在在你的 Apache 配置下启用 `Clean URL` Drupal 
```
# vi /etc/httpd/conf/httpd.conf
```

确保设置 `AllowOverride All` 为默认根文档目录如下图所示

[
 ![在 Drupal 中启用 Clean URL](http://www.tecmint.com/wp-content/uploads/2013/07/Enable-Clean-URL-in-Drupal.png) 
][11]

在 Drupal 中启用 Clean URL

18. 当你为 Drupal 启用 `Clean URL` ,刷新页面从下面界面执行数据库配置，输入 Drupal 站点数据库名，数据库用户和数据库密码.

当填写完所有信息点击保存继续

[
 ![Drupal 数据库配置](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Database-Configuration.png) 
][12]

Drupal 数据库配置

若上述设置正确，Drupal 站点安装应该完成了如下图界面.

[
 ![Drupal 安装](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation.png) 
][13]

Drupal 安装

19. 接下来配置站点为下面设置值(使用适用你的方案的值):

	1.  站点名称         – TecMint Drupal Site
	2.  站点邮箱地址     – admin@tecmint.com
	3.  用户名          – admin
	4.  密码            – ##########
	5.  用户的邮箱地址   – admin@tecmint.com
	6.  默认国家        – India
	7.  默认时区        – UTC

这是适当的值后，点击保存继续去完成站点安装过程！

[
 ![Drupal 站点配置](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Site-Configuration.png) 
][14]

Drupal 站点配置

20. 下图是显示的是通过 LAMP 成功安装 Drupal 8 站点

[
 ![Drupal站点面板](http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Site-Dashboard.png) 
][15]

Drupal 站点面板

现在你可以点击增加内容如创建示例网页内容作为一个页面

选项: 有些人使用[MYSQL 命令行管理数据库][16]不舒服,可以从浏览器界面 [安装 PHPMYAdmin 管理数据库][17] 

浏览 Drupal 文档 : [https://www.drupal.org/docs/8][18]

就这样！ 在这个文章， 我们展示了在 CentOS 7 上如何去下载，安装和 LAMP 向导以及基本的配置 Drupal 8。 从下面反馈给我们回信就这个教程，或提供给我们一些相关信息
--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

Aaron Kili 是 linux 和 F.O.S.S(Free and Open Source Software ) 爱好者，即将推出的 Linux SysAdmin， Web 开发者， 目前是TecMint的内容创作者，热爱计算机工作，并且坚信知识共享。
--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-drupal-in-centos-rhel-fedora/

作者：[Aaron Kili][a]

译者：[imxieke](https://github.com/imxieke)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/wp-content/uploads/2013/07/Apache-Default-Page.png
[2]:http://www.tecmint.com/wp-content/uploads/2013/07/PHP-Information.png
[3]:https://downloads.mariadb.org/mariadb/repositories/#mirror=Fibergrid&distro=CentOS
[4]:http://www.tecmint.com/wp-content/uploads/2013/07/Mysql-Secure-Installation.png
[5]:https://www.drupal.org/download
[6]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[7]:http://www.tecmint.com/extract-tar-files-to-specific-or-different-directory-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation-Language.png
[9]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation-Profile.png
[10]:http://www.tecmint.com/wp-content/uploads/2013/07/Verify-Drupal-Requirements.png
[11]:http://www.tecmint.com/wp-content/uploads/2013/07/Enable-Clean-URL-in-Drupal.png
[12]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Database-Configuration.png
[13]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Installation.png
[14]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Site-Configuration.png
[15]:http://www.tecmint.com/wp-content/uploads/2013/07/Drupal-Site-Dashboard.png
[16]:http://www.tecmint.com/mysqladmin-commands-for-database-administration-in-linux/
[17]:http://www.tecmint.com/install-phpmyadmin-rhel-centos-fedora-linux/
[18]:https://www.drupal.org/docs/8
