如何使用phpIPAM来管理IP地址和子网
================================================================================

通常，网络或系统管理员有责任来管理其所管理的网络下的一个或多个子网。例如，当一个网段分配了/24子网，那么该子网就有254个IP地址可以用于不同用途。要跟踪某个IP被分配到了哪个主机，就需要通过某种方式记录下来。最简单的方法，就是使用一个电子表格，如Excel来记录IP地址的分配信息。此方法对于只有一个管理员，并且网络很小的情况下比较奏效。然而，对于多个大型网络而言，依赖于电子表格并不方便，而且十分容易出错。更糟糕的是，如果有多个管理员参与管理，更新电子表格就十分麻烦了，因为每个管理员可能生成各种不同版本的文档记录。

一种系统地管理IP地址分配的方式是使用网络化的IP地址管理工具。不仅仅是因为网络化管理工具能在任何地方访问并管理，而且其后端数据库也能保证所有更新能正确同步并实时生效。尽管有许多可用的网络化应用工具，但我们将在此教程中关注如何来安装[phpIPAM][1]（IP Address Manager IP地址管理工具）。phpIPAM是一个开源、高效的IP地址管理应用软件，有着以下一些特性。

- 同时支持IPv4和IPv6（和其它工具不同，它对IPv6支持得很好）
- 内建的IPv4和IPv6计算器
- 支持无类域间路由（CIDR）标记
- 支持MySQL数据库
- 子网嵌套
- 基于用户/组权限
- 可视化报表工具
- 使用.xls文件导入/导出
- 支持设备、VRF和VLAN
- 强大的搜索引擎
- 电子邮件标记
- 支持基于AD/LDAP的验证

可访问[http://demo.phpipam.net][2]查看phpIPAM演示网站。

在本教程中，我们将**在Ubuntu环境中使用Apache来配置phpIPAM**。

### 在Ubuntu上安装phpIPAM ###

首先，使用apt-get来安装需要的软件包。

    # apt-get install apache2 mysql-server php5 php5-gmp php-pear php5-mysql php5-ldap wget

如果MySQL是首次安装，请使用以下命令来设置root密码。

    # mysqladmin -u root password NEWPASSWORD 

phpIPAM可以安装在任何Web服务器目录中，我们将会安装到Apache Web服务器的根目录下的/phpipam/子目录中。

下载phpIPAM软件包。

    # wget http://kent.dl.sourceforge.net/project/phpipam/phpipam-1.0.tar

将软件包解压到Web服务器相应目录。

    # cp phpipam-1.0.tar /var/www/
    # cp /var/www/
    # tar xvf phpipam-1.0.tar
    # rm phpipam-1.0.tar 

现在来指定MySQL的用户名和密码，同时指定基准目录。

    # vim /var/www/phpipam/config.php 

----------

    $db['host'] = "localhost";
     
    ## MySQL user for ipam ##
    $db['user'] = "phpipam";
     
    ## password for the MySQL user ##
    $db['pass'] = "phpipamadmin";
     
    ## database for MySQL ##
    $db['name'] = "phpipam";
     
    ## base directory ##
    define('BASE', "/phpipam/");

需要在提供的.htaccess文件中指定基准目录。

    # vim /var/www/phpipam/.htaccess 
---
	RewriteBase /phpipam/

### 准备Apache Web服务器 ###

phpIPAM的运行需要Apache 的 Rewrite模块，该模块可以在Ubuntu或Debian机器上使用以下命令来启用。

    # a2enmod rewrite 

接下来，需要修改Apache的默认配置。请添加/修改你的配置，使它看起来像下面这样。

    # vim /etc/apache2/sites-enabled/000-default 

----------

    <Directory /var/www/>
            Options Indexes FollowSymLinks MultiViews
            AllowOverride all
            Order allow,deny
            allow from all
    </Directory>

最后，重启Apache Web服务。

    # service apache2 restart 

### 完成安装 ###

我们可以使用浏览器来完成phpIPAM的安装。将浏览器地址指向URL: http://<serverIP>/phpIPAM，将会显示以下phpIPAM安装页面。我们可以开始自动化数据库安装。

![](https://farm3.staticflickr.com/2928/14216904555_0095bf048f_z.jpg)

![](https://farm3.staticflickr.com/2934/14193740116_afc44b8338_z.jpg)

现在，phpIPAM应该已经起来，并正在运行了，我们可以使用以下默认用户来登录。

- **URL**: http://<serverIP>/phpipam
- **User**: Admin
- **Pass**: ipamadmin 

### 使用phpIPAM管理IP地址 ###

在本教程的剩下部分，我们将引领你进入phpIPAM的子网和IP地址管理。

#### 创建区域 ####

让我们从为我们的网络创建区域开始吧。点击“管理” > “区域”。

![](https://farm3.staticflickr.com/2926/14213603451_3c2918805c.jpg)

点击“添加区域”。现在我们可以为我们的添加的区域取个你想要的名称了（如："Our Network"），填上区域的详细情况。

![](https://farm6.staticflickr.com/5195/14030287410_3d07a582ce_z.jpg)][3]

#### 创建子网 ####

接下来，在上面场景的区域“Our Network”下添加一个新的子网172.16.1.0/24。点击“Our Network” > “添加子网”

![](https://farm3.staticflickr.com/2925/14213603401_e16917bb7a_z.jpg)

![](https://farm3.staticflickr.com/2937/14216715144_0427165702_z.jpg)

现在，我们可以很容易地在子网中添加IP地址了。一种方法是逐个来添加它们，phpIPAM提供了一个可选的方法：扫描所有主机并自动添加，这一点都不麻烦。它可以扫描位于同一广播域下的本地子网，也可以通过路由扫描到远程子网。在选择一个子网后，像下面这样点击“扫描子网中的新主机”来扫描IP地址。

![](https://farm6.staticflickr.com/5157/14193740006_ac2a01a3aa_o.png)][4]

在扫描完成后，发现的IP地址可以通过点击底部“添加发现的主机”按钮来将IP地址添加到数据库。

#### 创建IPv6子网 ####

可以通过相似的步骤来创建IPv6子网，像下面截图中展示的那样来指定IPv6网络。

![](https://farm3.staticflickr.com/2922/14216715104_de8008bf94_z.jpg)

所有用于IPv4的工具也可以用于IPv6.

#### 创建嵌套子网 ####

phpIPAM也提供了创建嵌套子网的选项，可以用于IPv4和IPv6。例如，我们将172.16.1.0/24 IP区块划分成4个更小的子网（/26），每个子网用于组织内特定的部门。在选择/24子网后，我们可以使用“添加新的嵌套子网”按钮来创建嵌套子网。截图中展示了添加嵌套子网的图标。

![](https://farm6.staticflickr.com/5272/14030318447_66e4511cd6_o.png)[5]

在所有的子网创建完毕后，我们应该有相同的输出。以下是嵌套子网预览窗口。

![](https://farm6.staticflickr.com/5231/14216904305_5af77616f7_z.jpg)[6]

#### 添加用户和组 ####

首先，我们将为区域“Our Network”创建一个具有读/写权限的组。这项工作可以通过选择“管理” > “组” > “创建组”来完成。

![](https://farm3.staticflickr.com/2899/14030230539_73b1d5f7d4_z.jpg)

既然组已经被创建完成，那么我们来修改区域权限，选择“管理” > “区域”，然后编辑区域。

![](https://farm6.staticflickr.com/5489/14193739966_11a244e23b_z.jpg)[7]

![](https://farm3.staticflickr.com/2930/14030230519_597088ba26_z.jpg)

我们将创建一个名为“user1”的用户，添加该用户到“演示组”，以便该用户能从该组集成有所必要的权限。我们从点击“管理” > “用户” > “创建用户”开始。

[![](https://farm6.staticflickr.com/5585/14214506012_a581eef7de_z.jpg)][8]

现在，我们能以该用户身份登录，并添加/修改“我们的网络”下的IP地址。

最后小结，phpIPAM是一个多样化的IP地址管理工具，可以用于IPv4和IPv6。本教程仅关注基本内容，以帮助你开始使用该工具。你一定要测试所有可用的特性，如使用IP地址计算器，添加设备，VLAN和VRF，以及使用.xls导入/导出。

希望本教程对你有所帮助。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/manage-ip-addresses-subnets-phpipam.html

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://phpipam.net/
[2]:http://demo.phpipam.net/
[3]:https://www.flickr.com/photos/xmodulo/14030287410/
[4]:https://www.flickr.com/photos/xmodulo/14193740006/
[5]:https://www.flickr.com/photos/xmodulo/14030318447/
[6]:https://www.flickr.com/photos/xmodulo/14216904305/
[7]:https://www.flickr.com/photos/xmodulo/14193739966/
[8]:https://www.flickr.com/photos/xmodulo/14214506012/
