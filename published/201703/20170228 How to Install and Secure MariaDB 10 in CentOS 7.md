如何在 CentOS 7 上安装和安全配置 MariaDB 10 
===========================================

**MariaDB** 是 MySQL 数据库的自由开源分支，与 MySQL 在设计思想上同出一源，在未来仍将是自由且开源的。

在这篇博文中，我将会介绍如何在当前使用最广的 RHEL/CentOS 和 Fedora 发行版上安装 **MariaDB 10.1** 稳定版。

目前了解到的情况是：Red Hat Enterprise Linux/CentOS 7.0 发行版已将默认的数据库从 MySQL 切换到 MariaDB。

在本文中需要注意的是，我们假定您能够在服务器中使用 root 帐号工作，或者可以使用 [sudo][7] 命令运行任何命令。

### 第一步：添加 MariaDB yum 仓库

1、首先在 RHEL/CentOS 和 Fedora 操作系统中添加 MariaDB 的 YUM 配置文件 `MariaDB.repo` 文件。

```
# vi /etc/yum.repos.d/MariaDB.repo
```

根据您操作系统版本，选择下面的相应内容添加到文件的末尾。

#### 在 CentOS 7 中安装

```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

#### 在 RHEL 7 中安装

```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/rhel7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

[
 ![Add MariaDB Yum Repo](http://www.tecmint.com/wp-content/uploads/2017/02/Add-MariaDB-Repo.png) 
][8]

*添加 MariaDB YUM 仓库*

### 第二步：在 CentOS 7 中安装 MariaDB

2、当 MariaDB 仓库地址添加好后，你可以通过下面的一行命令轻松安装 MariaDB。

```
# yum install MariaDB-server MariaDB-client -y
```

[
 ![Install MariaDB in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/02/Install-MariaDB-in-CentOS-7.png) 
][9]

*在 CentOS 7 中安装 MariaDB*

3、 MariaDB 包安装完毕后，立即启动数据库服务守护进程，并可以通过下面的操作设置，在操作系统重启后自动启动服务。

```
# systemctl start mariadb
# systemctl enable mariadb
# systemctl status mariadb
```

[
 ![Start MariaDB Service in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/02/Start-MariaDB-Service-in-CentOS-7.png) 
][10]

*在 CentOS 7 中启动 MariaDB 服务*

### 第三步：在 CentOS 7 中对 MariaDB 进行安全配置

4、 现在可以通过以下操作进行安全配置：设置 MariaDB 的 root 账户密码，禁用 root 远程登录，删除测试数据库以及测试帐号，最后需要使用下面的命令重新加载权限。

```
# mysql_secure_installation
```
[
 ![Secure MySQL in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/02/Secure-MySQL-in-CentOS-7.png) 
][11]

*CentOS 7 中的 MySQL 安全配置*

5、 在配置完数据库的安全配置后，你可能想检查下 MariaDB 的特性，比如：版本号、默认参数列表、以及通过 MariaDB 命令行登录。如下所示：

```
# mysql -V
# mysqld --print-defaults
# mysql -u root -p
```

[
 ![Verify MySQL Version](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-MySQL-Version.png) 
][12]

*检查 MySQL 版本信息*

### 第四步：学习 MariaDB 管理

如果你刚开始学习使用 MySQL/MariaDB，可以通过以下指南学习：

1.  [新手学习 MySQL / MariaDB（一）][1]
2.  [新手学习 MySQL / MariaDB（二）][2]
3.  [MySQL 数据库基础管理命令（三）][3]
4.  [20 MySQL 管理命令 Mysqladmin（四）][4]

同样查看下面的文档学习如何优化你的 MySQL/MariaDB 服务，并使用工具监控数据库的活动情况。

1.  [15 个 MySQL/MariaDB 调优技巧][5]
2.  [4 监控 MySQL/MariaDB 数据库的工具][6]

文章到此就结束了，本文内容比较浅显，文中主要展示了如何在 RHEL/CentOS 和 Fefora 操作系统中安装 **MariaDB 10.1** 稳定版。您可以通过下面的联系方式将您遇到的任何问题或者想法发给我们。

--------------------------------------------------------------------------------

作者简介：
Aaron Kill 是 Linux 和开源软件的狂热爱好者，即将成为一名 Linux 系统管理员和网站开发工程师，现在是 TecMint 的原创作者，喜欢使用电脑工作并且热衷分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-mariadb-in-centos-7/

作者：[Aaron Kili][a]
译者：[beyondworld](https://github.com/beyondworld)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/learn-mysql-mariadb-for-beginners/
[2]:http://www.tecmint.com/learn-mysql-mariadb-advance-functions-sql-queries/
[3]:http://www.tecmint.com/gliding-through-database-mysql-in-a-nutshell-part-i/
[4]:http://www.tecmint.com/mysqladmin-commands-for-database-administration-in-linux/
[5]:http://www.tecmint.com/mysql-mariadb-performance-tuning-and-optimization/
[6]:http://www.tecmint.com/mysql-performance-monitoring/
[7]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-MariaDB-Repo.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Install-MariaDB-in-CentOS-7.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/02/Start-MariaDB-Service-in-CentOS-7.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Secure-MySQL-in-CentOS-7.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-MySQL-Version.png
[13]:http://www.tecmint.com/author/aaronkili/
[14]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[15]:http://www.tecmint.com/free-linux-shell-scripting-books/
