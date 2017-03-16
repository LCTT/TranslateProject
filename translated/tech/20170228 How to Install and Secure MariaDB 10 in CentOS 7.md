
如何在CentOS 7上安装和安全配置MariaDB 10 
===========================================

MariaDB是MySQL数据库的免费开源分支，与MySQL在思想上同出一源，在未来仍将是免费且开源的。

在这篇博文中，我将会介绍如何在当前使用最广的RHEL/CentOS和Fedora发行版上安装MariaDB 10.1稳定版。

目前了解到的情况是：Red Hat Enterprise Linux/CentOS 7.0发行版已将默认的数据库从MySQL切换到MariaDB。

在本文中需要注意的是，我们假定您能够在服务器中使用root帐号工作，或者可以使用[sudo command][7]运行任何命令。

### 第一步：添加MariaDB的yum仓库

1、首先在RHEL/CentOS和Fedora操作系统中添加MariaDB的YUM配置文件'MariaDB.repo'文件。

```
# vi /etc/yum.repos.d/MariaDB.repo
```

根据您操作系统版本选择下面的相应内容添加到文件的末尾。

#### 在CentOS 7中安装

```
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

#### 在RHEL 7中安装

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

添加MariaDB YUM仓库

### 第二步：在CentOS 7中安装MariaDB

2、当MariaDB仓库地址添加好后，你可以通过下面的一行命令轻松安装MariaDB。

```
# yum install MariaDB-server MariaDB-client -y
```
[
 ![Install MariaDB in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/02/Install-MariaDB-in-CentOS-7.png) 
][9]

在CentOS 7中安装MariaDB

3. 一旦MariaDB包安装完毕，可以手动启动数据库服务守护进程，并可以通过下面的操作设置在操作系统重启后自动启动服务。

```
# systemctl start mariadb
# systemctl enable mariadb
# systemctl status mariadb
```
[
 ![Start MariaDB Service in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/02/Start-MariaDB-Service-in-CentOS-7.png) 
][10]

在CentOS 7中启动MariaDB服务

### 第三步：在CentOS 7中对MariaDB进行安全配置

4. 现在可以通过以下操作进行安全配置：设置MariaDB的root账户密码，禁用root远程登录，删除测试数据库以及测试帐号，最后需要使用下面的命令重新加载权限。

```
# mysql_secure_installation
```
[
 ![Secure MySQL in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/02/Secure-MySQL-in-CentOS-7.png) 
][11]

CentOS 7中的MySQL安全配置

5. 在配置完数据库的安全配置后，你可能想检查下MariaDB的特性，比如：版本号，默认参数列表，以及通过MariaDB命令行登录。如下所示：

```
# mysql -V
# mysqld --print-defaults
# mysql -u root -p
```
[
 ![Verify MySQL Version](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-MySQL-Version.png) 
][12]

检查MySQL版本信息

### 第四步：学习MariaDB管理

如果你刚开始学习使用MySQL/MariaDB，可以通过以下指南学习：

1.  [Learn MySQL / MariaDB for Beginners – Part 1][1]
2.  [Learn MySQL / MariaDB for Beginners – Part 2][2]
3.  [MySQL Basic Database Administration Commands – Part III][3]
4.  [20 MySQL (Mysqladmin) Commands for Database Administration – Part IV][4]

同样查看下面的文档学习如何优化你的MySQL/MariaDB服务，并使用工具监控数据库的活动情况。

1.  [15 Tips to Tune and Optimize Your MySQL/MariaDB Performance][5]
2.  [4 Useful Tools to Monitor MySQL/MariaDB Database Activities][6]

文章到此就结束了，本文内容比较浅显，文中主要展示了如何在RHEL/CentOS和Fefora操作系统中安装MariaDB 10.1稳定版。您可以通过下面的联系方式将您遇到的任何问题或者想法发给我们。

--------------------------------------------------------------------------------

作者简介：
Aaron Kill是Linux和开源软件的狂热爱好者，即将成为一名Linux系统管理员和网站开发工程师，现在是TecMint的内容编辑喜欢使用电脑工作并且热衷分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-mariadb-in-centos-7/

作者：[Aaron Kili][a]
译者：[beyondworld](https://github.com/beyondworld)
校对：[校对者ID](https://github.com/校对者ID)

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
