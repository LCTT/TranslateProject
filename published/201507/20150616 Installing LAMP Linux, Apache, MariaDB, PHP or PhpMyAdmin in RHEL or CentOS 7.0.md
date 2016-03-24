在 RHEL/CentOS 7.0 中安装 LAMP（Linux、 Apache、 MariaDB、 PHP/PhpMyAdmin）
================================================================================

跳过 LAMP 的介绍，因为我认为你们大多数已经知道了。这个教程会集中在如何在升级到 Apache 2.4 的 Red Hat Enterprise Linux 7.0 和 CentOS 7.0 中安装和配置 LAMP：Linux、Apache、 MariaDB、 PHP/PhpMyAdmin。

![Install LAMP in CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/07/Install-LAMP-in-CentOS-7.jpg)

*在 RHEL/CentOS 7.0 中安装 LAMP*

#### 前置要求 ####

根据使用的发行版是 RHEL 还是 CentOS 7.0，按照下面的链接来进行最小化的系统安装，网络使用静态 IP。

**对于 RHEL 7.0**

- [RHEL 7.0 安装过程][1]
- [在 RHEL 7.0 中注册和启用订阅仓库][2]

**对于 CentOS 7.0**

- [CentOS 7.0 安装过程][3]

### 第一步：使用基本配置安装apache ###

1、在完成最小化系统安装，并[在 RHEL/CentOS 7.0 上配置静态 IP][4] 后，就可以使用下面的命令从官方仓库安装最新的 Apache 2.4 httpd 服务了。

    # yum install httpd

![Install Apache in CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/07/Install-Apache-in-CentOS-7.png)

*安装 apache 服务*

2、安装完成后，使用下面的命令来管理apache守护进程，因为 RHEL 和 CentOS 7.0 都将 init 脚本从 SysV 升级到了systemd，所以同时你还可以使用 SysV 脚本和 Apache 脚本来管理服务。

    	# systemctl status|start|stop|restart|reload httpd
    
    	或者 
    
    	# service httpd status|start|stop|restart|reload
    
    	或者 
    
    	# apachectl configtest| graceful

![Start Apache in CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/07/Start-Apache-in-CentOS-7.png)

*启动apache服务*

3、在使用 systemd 初始化脚本来启动 apache 服务后，要用 `firewall-cmd` 打开 RHEL/CentOS 7.0 防火墙规则， 这是通过 [firewalld][7] 守护进程管理 iptables 的默认命令。**

    # firewall-cmd --add-service=http

**注意**：上面的命令会在系统重启或者 firewalld 服务重启后失效，因为它是即时的规则，它不会永久生效。要使 iptables 规则在 fiewalld 中持久化，使用 `--permanent` 选项并重启 firewalld 服务来生效。（LCTT 译注：也可以不重启 firewalld 服务，而是再执行一遍不带 ` --permanent` 选项的命令。）

    # firewall-cmd --permanent --add-service=http
    # systemctl restart firewalld

![Enable Firewall in CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/07/Enable-Firewall-in-CentOS-7.png)

*在 CentOS 7 中启用防火墙*

下面是 firewalld 其他的重要选项：

    # firewall-cmd --state
    # firewall-cmd --list-all
    # firewall-cmd --list-interfaces
    # firewall-cmd --get-service
    # firewall-cmd --query-service service_name
    # firewall-cmd --add-port=8080/tcp

4、要验证 apache 的功能，打开一个远程浏览器并使用 http 协议访问你服务器的 IP 地址(http://server_IP)， 应该会显示下图中的默认页面。

![Apache Default Page](http://www.tecmint.com/wp-content/uploads/2014/07/Apache-Default-Page.png)

*Apache 默认页*

5、现在 apache 的根地址在 `/var/www/html`，该目录中没有提供任何索引文件。如果你想要看见根目录下的文件夹列表，打开 apache 欢迎配置文件并设置 `<LocationMach>` 下 `Indexes` 前的状态从`-`到`+`，下面的截图就是一个例子。

    # nano /etc/httpd/conf.d/welcome.conf

![Apache Directory Listing](http://www.tecmint.com/wp-content/uploads/2014/07/Apache-Directory-Listing.png)

*Apache 目录列出*

6、关闭文件，重启 apache 服务来使设置生效，重载页面来看最终效果。

    # systemctl restart httpd

![Apache Index File](http://www.tecmint.com/wp-content/uploads/2014/07/Apache-Index-File.png)

*Apache 索引文件*

### 第二步：为 Apache 安装 php5 支持 ###

7、在为 apache 安装 php 支持之前，使用下面的命令的得到所有可用的php模块和扩展。

    # yum search php

![Install PHP in CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/07/Install-PHP-in-CentOS-7.png)

在 CentOS 7 上安装 PHP*

8、根据你所要使用的应用类型，安装上述列表中所需的 PHP 模块。对于 PHP 中的基本的 MariaDB 支持和 PhpMyAdmin，你需要安装如下模块。

    # yum install php php-mysql php-pdo php-gd php-mbstring

![Install PHP Modules in CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/07/Install-PHP-Modules-in-CentOS-7.png)

*安装 PHP 模块*

![Install PHP mbstring Module](http://www.tecmint.com/wp-content/uploads/2014/07/Install-PHP-mbstring-in-CentOs-7.png)

*安装 PHP mbstring 模块*

9、 要在你的浏览器上显示 PHP 的全部信息，用 root 账号执行如下命令在 Apache 的文档根目录下创建一个 `info.php` 文件，然后重启 httpd 服务，并在你的浏览器里面访问 http://server_IP/info.php 。

    # echo "<?php phpinfo(); ?>" > /var/www/html/info.php
    # systemctl restart httpd

![Check PHP Info in CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/07/Check-PHP-Info-in-CentOS-7.png)

*查看 CentOS 7 上的  PHP 信息*

10、如果你得到一个 PHP 的日期和时区错误，打开配置文件 `php.ini`，取消 `date.timezone` 语句的注释，加上你的实际时区参数，然后重启  Apache 守护进程。

    # nano /etc/php.ini

找到并如下修改`date.timezone`，参考 [PHP 支持的时区列表][5]。（LCTT 译注：对于中国，可以使用 Asia/Shanghai、Asia/Chongqing 等，但是不建议使用向后兼容而保留的 PRC。）

    date.timezone = Continent/City

![Set Timezone in PHP](http://www.tecmint.com/wp-content/uploads/2014/07/Set-Time-Zone-in-CentOS.png)

*设置 PHP 的时区*

###第三步：安装和配置  MariaDB 数据库 ###

11、 Red Hat Enterprise Linux/CentOS 7.0 使用 MariaDB 替换 MySQL 为默认数据库管理系统。使用如下命令安装 MariaDB 数据库。

    # yum install mariadb-server mariadb

![Install MariaDB in CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/07/Install-MariaDB-in-CentOs-7.png)

*在 CentOS 7中安装 MariaDB*

12、安装 MariaDB 后，启动数据库守护进程并使用 mysql_secure_installation 脚本来保护数据库（设置数据库的 root 密码、禁止远程 root 登录、移除测试数据库、移除匿名用户等）。

    # systemctl start mariadb
    # mysql_secure_installation

![Start MariaDB Database](http://www.tecmint.com/wp-content/uploads/2014/07/Start-MariaDB-in-CentOS-7.png)

*启动 MariaDB 数据库*

![Secure MySQL Installation](http://www.tecmint.com/wp-content/uploads/2014/07/Secure-MySQL-Installation.png)

*MariaDB 安全设置*

13、要测试数据库功能，使用 root 账户登录 MariaDB 并用 quit 退出。

    mysql -u root -p
    MariaDB > SHOW VARIABLES;
    MariaDB > quit

![Connect MySQL Database in CentOS](http://www.tecmint.com/wp-content/uploads/2014/07/Connect-MySQL-Installation.png)

*连接 MariaDB 数据库*

### 第四步：安装 PhpMyAdmin ###

14、 RHEL 7.0 或者 CentOS 7.0 仓库默认没有提供 PhpMyAdmin 二进制安装包。如果你不适应使用 MySQL 命令行来管理你的数据库，你可以通过下面的命令启用 CentOS 7.0 rpmforge 仓库来安装 PhpMyAdmin。

    # yum install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

启用 rpmforge 仓库后，下面安装 PhpMyAdmin。

    # yum install phpmyadmin

![Enable RPMForge in CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/07/Enable-RPMForge-in-CentOS-7.png)

*启用 RPMForge 仓库*

15、下面配置 PhpMyAdmin 的 `phpmyadmin.conf` 来允许远程连接，它位于 Apache 的 `conf.d` 目录下，并注释掉下面的行。

    # nano /etc/httpd/conf.d/phpmyadmin.conf

使用#来注释掉下列行。

    # Order Deny,Allow
    # Deny from all
    # Allow from 127.0.0.1

![Allow Remote PhpMyAdmin Access](http://www.tecmint.com/wp-content/uploads/2014/07/Allow-Remote-PhpMyAdmin-Access.png)

*允许远程 PhpMyAdmin 访问*

16、 要使用 cookie 验证来登录 PhpMyAdmin，像下面的截图那样使用[生成的秘密字符串][6]来添加一个 blowfish 字符串到 `config.inc.php` 文件中，重启 apache 服务并打开 URL：http://server_IP/phpmyadmin/。

    # nano /etc/httpd/conf.d/phpmyadmin.conf
    # systemctl restart  httpd

![Add Blowfish in PhpMyAdmin](http://www.tecmint.com/wp-content/uploads/2014/07/Add-Blowfish-PhpMyAdmin.png)

*在 PhpMyAdmin 中添加 Blowfish*

![PhpMyAdmin Dashboard](http://www.tecmint.com/wp-content/uploads/2014/07/Login-to-PhpMyAdmin.png)

*PhpMyAdmin 面板*

### 第五步：在系统范围内启用 LAMP ###

17、 如果你需要在重启后自动运行 MariaDB 和 Apache 服务，你需要在系统级地启用它们。

    # systemctl enable mariadb
    # systemctl enable httpd

![Enable Services System Wide](http://www.tecmint.com/wp-content/uploads/2014/07/Enable-Services-System-Wide.png)

*系统级启用服务*

这就是在 Red Hat Enterprise 7.0 或者 CentOS 7.0 中安装 LAMP 的过程。在 CentOS/RHEL 7.0 上关于 LAMP 的系列文章接下来将会讨论在 Apache 中创建虚拟主机，生成 SSL 证书、密钥和添加 SSL 事务支持。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-lamp-in-centos-7/

作者：[Matei Cezar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/redhat-enterprise-linux-7-installation/
[2]:http://www.tecmint.com/enable-redhat-subscription-reposiories-and-updates-for-rhel-7/
[3]:http://www.tecmint.com/centos-7-installation/
[4]:https://linux.cn/article-3977-1.html
[5]:http://php.net/manual/en/timezones.php
[6]:http://www.question-defense.com/tools/phpmyadmin-blowfish-secret-generator
[7]:https://linux.cn/article-4425-1.html
