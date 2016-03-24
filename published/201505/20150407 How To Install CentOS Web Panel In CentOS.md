如何在CentOS上面安装“CentOS网页面板”
===========================================================================
![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/04/centos-790x427.jpg)

### 关于CentOS网页面板 ###

目前有很多免费的或者付费的控制面板。今天，我们来讨论[CentOS网页面板（CWP）][1]，这是特别为基于RPM 的发行版，如CentOS，RHEL，Scientific Linux等设计的。**CWP** 是免费且开源的控制面板，可以被广泛用于简单地配置一个网页托管环境。不同于其他的控制面板，CWP能自动部署LAMP的软件栈及Varnish 缓存服务器。

### 特性 ###

CWP有很多的特性和免费的服务。如我前面提到的一样，CWP会在你的服务器上自动安装全套的LAMP服务（apache，php，phpmyadmin，webmail，mailserver等等）。

### CWP安装过程中会安装和配置的软件列表 ###

- Apache 网页服务器
- PHP 5.4
- MySQL + phpMyAdmin
- Postfix + Dovecot + roundcube webmail
- CSF 防火墙
- File System Lock (不需要修改网站，你的所有文件都会被锁定修改)
- Backups; AutoFixer ，用于服务器配置

### 第三方应用： ###

- CloudLinux + CageFS + PHP Selector
- Softaculous – 脚本安装器 (免费版和白金版)

#### 网页服务器: ####

- Varnish 缓存服务器
- 从代码编译 Apache
- Apache 重新编译+附加模块
- Apache 服务器状态，配置
- 编辑 Apache 虚拟主机、虚拟主机模版，包括配置 
- 重建所有 Apache 虚拟主机
- suPHP & suExec
- Mod Security + OWASP 规则
- Tomcat 8 服务器管理
- DoS 防护
- Perl cgi 脚本支持

#### PHP: ####

- PHP 切换器 (在PHP版本如: 5.2、 5.3、 5.4、 5.5之间切换)
- PHP选择器，选择每个用户或者每个文件的PHP版本（PHP 4.4、 5.2、 5.3、 5.4、5.5、 5.6)
- 简单的php编辑器
- 在用户面板下简单的php.ini生成器
- PHP 插件
- PHP.ini 编辑器 & PHP 信息 和列出模块
- 每个帐号一个php.ini
- FFMPEG，用于视频流网站
- CloudLinux + PHP 选择器

#### 用户管理 ####

- 添加、列出、编辑和移除用户
- 用户监管
- Shell访问管理
- 用户限制管理
- 限制进程
- 限制访问文件
- 用户 FTP & File 管理器
- CloudLinux + CageFS
- 每个帐号专有IP

#### DNS: ####

- FreeDNS
- 添加、编辑、列出和移除DNS区块
- 编辑域名服务的IP
- DNS区块模板编辑器
- 新的易用DNS区块管理器 (用ajax)
- 新的DNS区块列表，带有额外的google解析信息 (同时检测 rDNS， 域名服务…)

#### Email: ####

- Postfix & dovecot
- 邮箱、别名
- Roundcube webmail
- Postfix 邮件队列
- rDNS 检查器模块
- 垃圾邮件拦截
- SPF & DKIM集成
- 重构带有反病毒、反垃圾邮件防护的 Postfix/Dovecot 的邮件服务器 
- Email 自动应答器

#### 系统: ####

- CPU核心和时钟信息
- 内存使用信息
- 详细的磁盘状态
- 软件信息如内核版本、正常运行时间等等.
- 服务器状态
- ChkConfig管理
- 网络端口使用
- 网络配置
- sshd 配置
- 自动修复(检查重要的配置并尝试自动修复问题)

#### 监控: ####

- 监控服务，例如 top、 apache 状态、 mysql 等
- 在面板内使用Java SSH 终端/控制台
- 服务器配置 (例如 Apache、 PHP、 MySQL 等)
- 在屏幕/后台运行命令行

#### 安全: ####

- CSF防火墙
- SSL生成器
- SSL证书管理
- CloudLinux + CageFS

#### SQL: ####

- MySQL 数据库管理
- 添加本地或者远程访问的用户
- 实时监控MySQL进程列表
- 创建，移除数据库
- 为每个数据库添加额外的用户
- MySQL服务器配置
- PhpMyAdmin
- PostgreSQL, phpPgAdmin支持

#### 额外功能: ####

- TeamSpeak 3 管理器
- Shoutcast 管理器
- 自动更新
- 备份管理器
- 文件管理器
- 每个域名的虚拟FTP用户
- cPanel帐号迁移 (恢复文件，数据库和数据库用户)
- 还有更多

### 在CentOS 6上安装CentOS网页面板 ###

写这篇教程的时候，CWP仅仅支持最高CentOS 6.x版本。在CentOS 7和更高的版本中是不支持的。

#### 前期准备： ####

**安装CWP之前，你必须知道以下的信息：**

- CWP 仅支持静态IP地址。它并不支持动态的，或者内部的IP地址。
- CWP 并没有卸载程序。当你安装CWP后，你必须重新安装服务器来移除它。
- 只能在一个新装的还没做任何配置改变的操作系统上安装CWP。
- 对于32位操作系统至少需要512MB RAM。
- 64位系统需要1024MB RAM。
- 要求至少20GB的硬盘空间。

如果是在VirtualBox上面测试，640MB RAM和10GB磁盘空间就足够了。

#### 更新服务器： ####

首先安装wget包，这是下载CWP需要的。

	yum install wget -y

使用命令更新你的服务器：
	
	yum update -y

重启一次，激活更新。

#### 安装CWP： ####

进入**/usr/local/src/**目录：
	
	cd /usr/local/src

使用命令下载最新的CWP版本：

	wget http://centos-webpanle.com/cwp-latest

如果上面的URL出现错误，用下面的链接代替。

	wget http://dl1.centos-webpanle.com/files/cwp-latest

然后，用命令开始安装CWP：
	
	sh cwp-latest

**样例输出：**

![](http://www.unixmen.com/wp-content/uploads/2015/04/root@server-usr-local-src_001.png)

![](http://www.unixmen.com/wp-content/uploads/2015/04/root@server-usr-local-src_002.png)

安装过程会持续到30分钟或者更多，取决于你的网速。

最后，你会看到如下安装完成的信息。记下一些详细信息，如mysql超级用户密码和CWP的登录URL，你随后会需要它们。然后，按下回车Enter重启系统。

![](http://www.unixmen.com/wp-content/uploads/2015/04/root@server-usr-local-src_004.png)

重启进入系统后，你会看见CWP的欢迎登录信息。

![](http://www.unixmen.com/wp-content/uploads/2015/04/CentOS-6.5-Minimal-Running-Oracle-VM-VirtualBox_006.png)

#### 调整防火墙/路由： ####

CWP的默认网页控制界面的端口是**2030（http）**和**2031（https）**。你应该通过防火墙/路由允许使用这两个端口，以便远程接入CWP网络控制台。

编辑iptables文件：
	
	vi /etc/sysconfig/iptables

添加如下的内容：

    [...]
	-A INPUT -p tcp -m state --state NEW -m tcp --dport 2030 -j ACCEPT
	-A INPUT -p tcp -m state --state NEW -m tcp --dport 2031 -j ACCEPT
    [...]

保存并关掉文件。更新iptables服务使改变生效。

	service iptables restart

### 进入CWP网络控制台 ###

打开你的浏览器，键入：

**http://IP-Address:2030/**

或

**https://IP-Address:2031/**

你会看到类似下面的屏幕。

登录认证：

- **Username**：root
- **Password**：你的root密码

![](http://www.unixmen.com/wp-content/uploads/2015/04/Login-CentOS-WebPanel-Mozilla-Firefox_007.png)

恭喜你！CWP已经安装成功了。

### CWP基本的配置 ###

接下来，我们得做一些事，比如：

1. 设置域名服务器
1. 设置 ip 共享（必须是你的公共IP地址）
1. 设置至少一个托管包（或者编辑默认的包）
1. 设置 root 电子邮件，等等。

#### 设置域名服务器： ####

为建立域名服务器，找到**DNS Functions -> Edit nameservers IPs**。

![](http://www.unixmen.com/wp-content/uploads/2015/04/CWP.admin-Mozilla-Firefox_009.png)

设置你的域名服务器，点击保存按钮。

![](http://www.unixmen.com/wp-content/uploads/2015/04/CWP.admin-Mozilla-Firefox_010.png)

#### 建立共享IP和Root邮件地址： ####

在你的主机上托管网站，这是非常重要的一步。为了建立共享IP，进入**CWP Setting -> Edit settings**。

![](http://www.unixmen.com/wp-content/uploads/2015/04/CWP.admin-Mozilla-Firefox_011.png)

输入你的静态IP和邮件地址，然后点击保存设置按钮。

![](http://www.unixmen.com/wp-content/uploads/2015/04/CWP.admin-Mozilla-Firefox_012.png)

现在，CWP可以进行网站维护了。

#### 建立托管包 ####

一个托管包就是一个网站托管计划，包括允许访问的磁盘空间，带宽，但没有FTP帐号，邮箱地址和数据库等等。你可以建立任意数量的网站托管计划，只要你喜欢。

要添加一个包，从CWP的控制台进入**Packages — Add a Package**

![](http://www.unixmen.com/wp-content/uploads/2015/04/CWP.admin-Mozilla-Firefox_013.png)

输入包的名字，允许访问的磁盘配额/RAM数量，FTP/Email帐号，数据库和子域名等等。点击保存设置按钮，建立一个网站托管计划。

![](http://www.unixmen.com/wp-content/uploads/2015/04/CWP.admin-Mozilla-Firefox_014.png)

现在，CWP可以管理你的域名了。

#### 添加域名： ####

创建新的域名，你至少得有一个用户帐号。

而添加一个用户，请进入**User Account -> New Account**。

输入域名(ex.unixmen.com)，用户名，密码和邮箱地址等等。最后，点击**Create**。

![](http://www.unixmen.com/wp-content/uploads/2015/04/CWP.admin-Mozilla-Firefox_016.png)

现在，我们添加一个新的域名。

进入**Domains -> Add Domain**。

输入新的域名，并且指定这个域名与用户名关联。

![](http://www.unixmen.com/wp-content/uploads/2015/04/CWP.admin-Mozilla-Firefox_017.png)

### 总结 ###

在这篇教程中，我们看到了如何安装和配置CentOS网页面板，来创建一个简单的网站主机环境。CWP安装和使用非常简单。甚至一个菜鸟也可以在几个小时内建立一个基本的网站主机服务器。并且，CWP完全免费和开源。试一试吧！你不会失望的。

你可以在[CentOS Web Panel Wikipage][2]找到更多关于CWP的信息。

加油！

---------------------------------------------------------------------------

via: http://www.unixmen.com/how-to-install-centos-web-panel-in-centos/

作者：[SK][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://centos-webpanel.com/
[2]:http://wiki.centos-webpanel.com/
