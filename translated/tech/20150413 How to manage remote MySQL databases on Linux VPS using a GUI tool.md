Translating by demon
如何使用图形化工具远程管理Linux Vps上的MySql
================================================================================
如果你在一个远程的VPS上运行了MYSQL server,你会如何管理你的远程数据库主机呢？基于web的数据库管理工具例如phpMyAdmin或者Adminer可能会是你一个想起的。这些基于web的管理工具需要一个后端的web服务和PHP引擎在正常运行。但是，如果你的VPS仅仅用来做数据库服务(e.g., for a multi-tier app)，为临时的数据库管理提供一整套的LAMP是浪费VPS资源的。更糟的是，LAMP带有的HTTP端口可能会成为你VPS资源的安全漏洞。

作为一种选择，你可以使用在一台客户机上运行本地的Mysql客户端，当然，如果没有别的选择，一个纯净的命令行mysql客户端将是你的默认选择。但是命令行客户端的功能是有限的，因此它不适合在生产环境中使用，例如：sql开发，性能调优，模式验证等等。你是否在寻找一个成熟的MYSQL管理工具，那么一个MYSQL的图形化管理工具将会更好的满足你的需求。

什么是MySQL Workbench? 

作为一个由Oracle开发的成熟数据库管理工具，mysql workbench不仅仅是一个MySQL客户端。简而言之，Workbench是一个跨平台的（eg:Linux,MacOX,Windows）数据库设计，开发和管理图形工具。社区版本的Msyql Workbench是遵循GPL协议的。作为一个数据库管理者，你可以使用Workbench去配置Mysql服务，管理Mysql用户，完成数据库的备份与还原，监视数据库的健康状况，所有的都在对用户友好的图形化环境下处理。

在这个手册里，让我们演示下如何在Linux下安装和使用Mysql Workbench.

在Linux上安装MySQL Workbench 

你可以在任何一个桌面linux机器上运行Mysql Workbench去设置你的数据库管理环境。然而一些Linux发行版（例如：Debian/Ubuntu）在他们的软件源中已经有了Mysql Workbench.从官方源中安装是一个好的方法，因为他们提供了最新的版本。这里介绍了如何设置一个官方的Workbench源和从中安装它。

#### Debian-based Desktop (Debia, Ubuntu, Mint): ####

到其官方站点，选择一个和你环境匹配的DEB file源，并下载安装

For example, on Ubuntu 14.10:

    $ wget http://dev.mysql.com/get/mysql-apt-config_0.3.4-2ubuntu14.10_all.deb
    $ sudo dpkg -i mysql-apt-config_0.3.4-2ubuntu14.10_all.deb

on Debian 7:

    $ wget http://dev.mysql.com/get/mysql-apt-config_0.3.3-1debian7_all.deb
    $ sudo dpkg -i mysql-apt-config_0.3.3-1debian7_all.deb

当你安装DEB文件时，你会看到下面的配置菜单，并且选择配置那个Mysql产品

![](https://farm8.staticflickr.com/7702/16928715218_b1fcbcdbf3_c.jpg)

选择“Utilities”.完成配置后，选择“Apply”去保存配置。然后，更新包索引，并且安装Workbench

    $ sudo apt-get update
    $ sudo apt-get install mysql-workbench 

#### Red Hat-based Desktop (CentOS, Fedora, RHEL): ####

去官网下载并安装适合你Linux环境的RPM源包
For example, on CentOS 7:

    $ wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
    $ sudo yum localinstall mysql-community-release-el7-5.noarch.rpm

on Fedora 21:

    $ wget http://dev.mysql.com/get/mysql-community-release-fc21-6.noarch.rpm
    $ sudo yum localinstall mysql-community-release-fc21-6.noarch.rpm

验证"MySQL Tools Community"源是否被安装
    $ yum repolis enabled 

![](https://farm9.staticflickr.com/8826/16494069254_15458ace52_c.jpg)

安装Workbench

    $ sudo yum install mysql-workbench-community 

设置远程数据库的安全连接

接下来是为你运行Mysql服务的VPS设置一个远程连接，当然你可以直接通过图形化的Workbench连接你的远程Mysql服务器（在数据库开放了远程连接后）。然而，这样做有很大的安全风险，因为有些人很容易窃听你的数据库传输信息，并且一个公开的Mysql端口（默认为3306）被作为攻击入口。

一个比较好的方法是关掉远程访问数据库服务功能，（仅允许在127.0.0.1访问）。然后在本地客户机和远程Vps直接设置一个SSH隧道，这样的话，和mysql之间的数据能被安全的传输，仅在它的本地回环接口上。相比较设置一个SSL加密的连接来说，配置SSH隧道需要很少的操作，因为他仅仅需要SSH服务，并且在大多数的VPS上已经部署了。

让我们来看看如何来为一个Mysql Workbench设置一个SSH隧道，这里的设置，不需要你开放远程访问Mysql服务。
在一个运行了Workbench的本地客户机上，键入下面的命令，替换'user' and 'remote_vps'为你自己的信息

    $ ssh user@remote_vps -L 3306:127.0.0.1:3306 -N

你会被要求输入你VPS的SSH密码，当你成功登陆VPS后，一个SSH隧道将会在本地的3306端口和远程VPS的3306端口将会被建立。这里你不会看到任何信息。

或者你可以选择在后台运行SSH隧道，按CTRL+Z停止当前的命令，然后输入bg并且ENTER

![](https://farm8.staticflickr.com/7714/16928715438_bf0db49b3b_c.jpg)

这样SSH隧道就会在后台运行了。

使用MySQL Workbench远程管理MySQL服务

在建立好SSH隧道后，你可以通过MySQL Workbench去远程连接Mysql服务了。

输入下面命令启动Workbench

    $ mysql-workbench 

![](https://farm9.staticflickr.com/8768/16494069294_0fce571ddb_c.jpg)

点击Workbench页面上面的加号图标去创建一个新的数据库连接，接着会出现下面的连接信息。

- **Connection Name**: any description (e.g., My remote VPS database)
- **Hostname**: 127.0.0.1
- **Port**: 3306
- **Username**: MySQL username (e.g., root) 

![](https://farm8.staticflickr.com/7727/16928715288_d9ac3bfc7a_c.jpg)

注意：因为隧道设置的是127.0.0.1:3306，所以主机名哪里必须是127.0.0.1，而不能是远程VPS的IP地址或者主机名

当你设置好一个新的数据库连接后，你会在Workbench窗口看到一个新的框，点击那个框就会实际去连接远程的MySQL服务了。

![](https://farm8.staticflickr.com/7650/17114969532_0252ffcd31_c.jpg)

当你设置好一个新的数据库连接后，你会在Workbench窗口看到一个新的框，点击那个框就会实际去连接远程的MySQL服务了。

#### MySQL Server Status ####

当你设置好一个新的数据库连接后，你会在Workbench窗口看到一个新的框，点击那个框就会实际去连接远程的MySQL服务了。

![](https://farm8.staticflickr.com/7627/16494069414_9d838d4138_c.jpg)

#### Client Connections ####

连接数是一个极其重要的监视资源，这个菜单显示了每个连接的详细信息。

![](https://farm9.staticflickr.com/8747/16909119337_a8d89772dd_c.jpg)

#### 用户和权限 ####

这个菜单允许你管理MySQL用户，包括他们的资源限制和权限。

![](https://farm9.staticflickr.com/8765/16494069384_760fc17c8f_c.jpg)

#### MySQL Server Administration ####

你可以启动或关闭MySQL服务，并且检查它的服务日志。

![](https://farm8.staticflickr.com/7588/17114969592_54526dfb32_c.jpg)

#### Database Schema Management ####

可以可视化的查看，更改，检查数据库结构，在“Schemas”标题下选择任何一个数据库或表，然后右击

![](https://farm8.staticflickr.com/7665/16496363973_fd03a96198_c.jpg)

![](https://farm9.staticflickr.com/8744/16909119497_7c884617b8_c.jpg)

#### Database Query ####

你可以执行任何的语句（只要你的权限允许），并且检查他的结果。

![](https://farm8.staticflickr.com/7716/17114969692_c0f02bb277_c.jpg)

此外，性能统计数据和报表仅用于MySQL5.6以上的版本。对于5.5及其以下的版本，性能部分会以灰色显示。
### 结论 ###

简介且直观的选项卡界面，丰富的特性，开源，使MySQL Workbench成为一个非常好的可视化数据库设计和管理工具。为其减分的是它的性能。我注意到在一台运行繁忙的服务器上，Workbench优势会变得异常缓慢，尽管它的性能差强人意，我依然认为MySQL Workbench是MySQL数据库管理员和设计人员必备的工具之一。

你曾在你的生产环境中用过Workbench吗？或者你还有别的GUI工具可以推荐？请分享你的经验吧。

--------------------------------------------------------------------------------

via: http://xmodulo.com/remote-mysql-databases-gui-tool.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/tyzy313481929译者demon)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/go/digitalocean
[2]:http://ask.xmodulo.com/install-phpmyadmin-centos.html
[3]:http://xmodulo.com/set-web-based-database-management-system-adminer.html
[4]:http://mysqlworkbench.org/
[5]:http://dev.mysql.com/downloads/repo/apt/
[6]:http://dev.mysql.com/downloads/repo/yum/
[7]:http://xmodulo.com/how-to-allow-remote-access-to-mysql.html
