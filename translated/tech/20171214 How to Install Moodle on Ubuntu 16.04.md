怎样在 Ubuntu 下安装 Moodle（“魔灯”）
======

![怎样在 Ubuntu 16.04 下安装 Moodle “魔灯”][1]

这是一篇关于如何在 Ubuntu 16.04 上安装 Moodle （“魔灯”）的逐步指南。Moodle （<ruby>模块化面向对象动态学习环境<rt>Modular-object-oriented dynamic learning environment</rt></ruby>的缩写）是一种自由而开源的学习管理系统，为教师、学生和管理员提供个性化的学习环境。Moodle 由 Moodle 项目创建，由 [Moodle 总部][2]统一领导和协调。

Moodle 有很多非常实用的功能，比如：

* 现代和易于使用的界面
* 个性化仪表盘
* 协作工具和活动
* 一体式日历
* 简单的文本编辑器
* 进度跟踪
* 公告
* 不胜枚举…

在本教程中，我们将指导您在 Ubuntu 16.04 VPS 上利用 Apache web 服务器、MySQL 和 PHP 7 安装最新版本的 Moodle。（LCTT 译注：在 Ubuntu 的后继版本上的安装也类似。）

### 1、 通过 SSH 登录

首先，利用 root 用户通过 SSH  登录到 Ubuntu 16.04 VPS：

```
ssh root@IP_Address -p Port_number
```

### 2、 更新操作系统软件包

运行以下命令更新系统软件包并安装一些依赖软件：

```
apt-get update && apt-get upgrade
apt-get install git-core graphviz aspell
```

### 3、 安装 Apache Web 服务器

利用下面命令，从 Ubuntu 软件仓库安装 Apache Web 服务器：

```
apt-get install apache2
```

### 4、 启动 Apache Web 服务器

一旦安装完毕，启动 Apache 并使它能够在系统启动时自动启动，利用下面命令：

```
systemctl enable apache2
```

### 5、 安装 PHP 7

接下来，我们将安装 PHP 7 和 Moodle 所需的一些额外的 PHP 模块，命令是：

```
apt-get install php7.0 libapache2-mod-php7.0 php7.0-pspell php7.0-curl php7.0-gd php7.0-intl php7.0-mysql php7.0-xml php7.0-xmlrpc php7.0-ldap php7.0-zip
```

### 6、 安装和配置 MySQL 数据库服务器

Moodle 将大部分数据存储在数据库中，所以我们将利用以下命令安装 MySQL 数据库服务器：

```
apt-get install mysql-client mysql-server
```

安装完成后，运行 `mysql_secure_installation` 脚本配置 MySQL 的 `root` 密码以确保 MySQL 安全。

以 `root` 用户登录到 MySQL 服务器，并为 Moodle 创建一个数据库以及能访问它的用户，以下是具体操作指令：

```
mysql -u root -p
mysql> CREATE DATABASE moodle;
mysql> GRANT ALL PRIVILEGES ON moodle.* TO 'moodleuser'@'localhost' IDENTIFIED BY 'PASSWORD';
mysql> FLUSH PRIVILEGES;
mysql> \q
```

一定要记得将上述 `PASSWORD` 替换成一个安全性强的密码。

### 7、 从 GitHub  仓库获取 Moodle

接下来，切换当前工作目录，并从 GitHub 官方仓库中复制 Moodle：

```
cd /var/www/html/
git clone https://github.com/moodle/moodle.git
```

切换到 `moodle` 目录，检查所有可用的分支：

```
cd moodle/
git branch -a
```

选择最新稳定版本（当前是 `MOODLE_34_STABLE` ），运行以下命令告诉 git 哪个分支可以跟踪或使用：

```
git branch --track MOODLE_34_STABLE origin/MOODLE_34_STABLE
```

并切换至这个特定版本：

```
git checkout MOODLE_34_STABLE

Switched to branch 'MOODLE_34_STABLE'
Your branch is up-to-date with 'origin/MOODLE_34_STABLE'.
```

为存储 Moodle 数据创建目录：

```
mkdir /var/moodledata
```

正确设置其所有权和访问权限：

```
chown -R www-data:www-data /var/www/html/moodle
chown www-data:www-data /var/moodledata
```

### 8、 配置 Apache Web 服务器

使用以下内容为您的域名创建 Apache 虚拟主机：

```
nano /etc/apache2/sites-available/yourdomain.com.conf

 	ServerAdmin admin@yourdomain.com
 	DocumentRoot /var/www/html/moodle
 	ServerName yourdomain.com
 	ServerAlias www.yourdomain.com

	Options Indexes FollowSymLinks MultiViews
	AllowOverride All
	Order allow,deny
	allow from all

 	ErrorLog /var/log/httpd/yourdomain.com-error_log
 	CustomLog /var/log/httpd/yourdomain.com-access_log common
```

保存文件并启用虚拟主机：

```
a2ensite yourdomain.com

Enabling site yourdomain.com.
To activate the new configuration, you need to run:
 service apache2 reload
```

最后，重启 Apache Web 服务器，以使配置生效：

```
service apache2 reload
```

### 9、 接下来按照提示完成安装

现在，点击 “http://yourdomain.com”（LCTT 译注：在浏览器的地址栏里输入以上域名以访问 Apache WEB 服务器），按照提示完成 Moodle 的安装。有关如何配置和使用  Moodle 的更多信息，您可以查看其[官方文档][4]。

如果您使用我们的[优化的 Moodle 托管主机服务][5]，您不必在 Ubuntu 16.04 上安装 Moodle，在这种情况下，您只需要求我们的专业 Linux 系统管理员在 Ubuntu 16.04 上安装和配置最新版本的 Moodle。他们将提供 24×7 及时响应的服务。（LCTT 译注：这是原文作者——一个主机托管商的广告~）

**PS.** 如果你喜欢这篇关于如何在 Ubuntu 16.04 上安装 Moodle 的帖子，请在社交网络上与你的朋友分享，或者留下你的回复。谢谢。

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/how-to-install-moodle-on-ubuntu-16-04/

作者：[RoseHosting][a]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com
[1]:https://www.rosehosting.com/blog/wp-content/uploads/2017/12/How-to-Install-Moodle-on-Ubuntu-16.04.jpg
[2]:https://moodle.com/hq
[3]:https://www.rosehosting.com/cdn-cgi/l/email-protection
[4]:https://docs.moodle.org/34/en/Main_page
[5]:https://www.rosehosting.com/moodle-hosting.html
