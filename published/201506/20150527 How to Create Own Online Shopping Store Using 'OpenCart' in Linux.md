如何在linux中用“OpenCart”创建自己的在线商店
================================================================================
在网络世界我们可以用电脑做所有事情，电子商务（e-commerce）即是其中之一。电子商务并不是什么新鲜事，它起源于早期的阿帕网，当时就出现了麻省理工学院和斯坦福大学人工智能实验室的学生之间的交易。

近些年出现了上百家电子商务网站，如 Flipcart, eBay, Alibaba, Zappos, IndiaMART, Amazon, 等等。你想做一个自己的亚马逊和Flipcart这样的基于web的应用程序服务器吗？如果是！这个文章正适合你。

Opencart是一个免费开源的使用PHP语言编写的电子商务程序，它可以用来架设一个类似于亚马逊和Flipcart的购物车系统。如果你想在线卖你的产品或想在关门时为你的客户提供服务，Opencart就是给你准备的。你可以使用可靠和专业Opencart应用程序建立一个成功的网上商店（网上商家）。

### OpenCart 网页面板演示 ###

- 商店前端 – [http://demo.opencart.com/][1]
- 管理登录 – [http://demo.opencart.com/admin/][2]

--
	------------------ 管理登录 ------------------

    用户名: demo
    密码: demo

#### Opencart的特点 ####

Opencart是一个符合所有在线商家需求的应用程序。它具备您用来制作自己的电子商务网站的所有特性（见下文）。

- 它是一个免费（如啤酒般免费）而开源（如言论般自由）的应用，在GNU GPL许可下发布。
- 每个东西都有完善的文档，你不需要到谷歌喊救命。
- 任意时间的支持和更新。
- 支持无限数量的类别、产品和制造商。
- 一切都是基于模板的。
- 支持多语言和多币种。它确保你的产品遍及全球。
- 内置产品评论和评级功能。
- 支持可下载的产品（即电子书）。
- 支持自动缩放图像。
- 类似多税率（许多国家都是这样）、查看相关产品、资料页、装船重量计算，使用折扣优惠券，等等功能默认都有了。
- 内置的备份和恢复工具。
- 搜索引擎优化做的很好。
- 发票打印、错误日志和销售报告等都做的很好。

#### 系统需求 ####

- Web 服务器 （首选 Apache HTTP服务器）
- PHP （5.2 或以上）
- 数据库 （首选MySQL，但是我这里用的是MariaDB）

#### PHP需要的库和模块 ####

这些扩展必须在您的系统上安装并启用，才能确保Opencart正确安装在web服务器上

- Curl
- Zip
- Zlib
- GD Library
- Mcrypt
- Mbstrings

### 第一步： 安装 Apache、 PHP 和 MariaDB ###

1. 像我说的，OpenCart需要一定的技术要求，比如在系统上安装Apache，PHP扩展和数据库（MySQL或MariaDB），才能正常运行Opencart。

	让我们使用命令行安装Apache，PHP和MariaDB。

	**安装 Apache**

    	# apt-get install apache2 		 (在基于Debian系统上)
    	# yum install httpd			 (在基于RedHat系统上)

	**安装 PHP and Extensions**

    	# apt-get install php5 libapache2-mod-php5 php5-curl php5-mcrypt 	(在基于Debian系统上)
    	# yum install php php-mysql php5-curl php5-mcrypt			(在基于RedHat系统上)

	**安装 MariaDB**

    	# apt-get install mariadb-server mariadb-client				(在基于Debian系统上)
    	# yum install mariadb-server mariadb					(在基于RedHat系统上)

2. 在安装所有需要上面的东西后，你可以使用如下命令启动 Apache 和 MariaDB 服务。

    	------------------- 在基于Debian系统上 ------------------- 
    	# systemctl restart apache2.service					
    	# systemctl restart mariadb.service	

	--
    	------------------- 在基于RedHat系统上 ------------------- 
    	# systemctl restart httpd.service 		
    	# systemctl restart mariadb.service 				

### 第二步：下载和设置 OpenCart ###

3. 最新版本的OpenCart(2.0.2.0)可以从[OpenCart 网站][3]下载，或直接从github获得。

	作为一种选择，你可以使用wget命令直接从github库下载最新版本的OpenCart，如下所示。

    	# wget https://github.com/opencart/opencart/archive/master.zip

4. 下载压缩文件后，拷贝到Apache工作目录下（例如/var/www/html）然后解压缩master.zip文件。

    	# cp master.zip /var/www/html/
    	# cd /var/www/html
    	# unzip master.zip

5. 提取‘master.zip’文件后，切换到提取目录下，然后移动upload目录到应用程序的根文件夹(opencart-master)

    	# cd opencart-master
    	# mv -v upload/* ../opencart-master/

6. 现在需要重命名或复制OpenCart配置文件，如下所示。

    	# cp /var/www/html/opencart-master/admin/config-dist.php /var/www/html/opencart-master/admin/config.php
    	# cp /var/www/html/opencart-master/config-dist.php /var/www/html/opencart-master/config.php

7. 下一步，设置/var/www/html/opencart-master的文件和文件夹正确的权限。您需要提供RWX权限给文件和文件夹，用递归方式。

    	# chmod 777 -R /var/www/html/opencart-master 

	**重要**: 设置权限777可能是危险的，所以一旦你完成所有设置，递归恢复755权限到上层的文件夹。

### 第三步: 创建 OpenCart 数据库 ###

8. 下一步是给你的电子商务网站创建一个数据库（比如叫做 opencartdb）来存储数据。连接到数据库服务器并创建一个数据库和用户，并授予用户正确的权限以完全控制该数据库。

    	# mysql -u root -p
    	CREATE DATABASE opencartdb;
    	CREATE USER 'opencartuser'@'localhost' IDENTIFIED BY 'mypassword';
    	GRANT ALL PRIVILEDGES ON opencartdb.* TO 'opencartuser'@'localhost' IDENTIFIED by 'mypassword';

### 第四步： OpenCart 网站安装 ###

9. 一旦所有设置正确，到web浏览器地址栏输入`http://<web服务器IP地址>`访问OpenCart web安装。

	点击“继续”，同意许可证协议。

	![Accept OpenCart License](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-License.png)

	*同意OpenCart许可证*

10. 下一个屏幕是安装前服务器设置检查，查看服务器所需的所有模块是否安装正确并且有OpenCart文件的权限。

	如果在第1和2区域有红色标志突出显示，这意味着你需要在服务器上正确安装这些组件满足web服务器的要求。

	如果在第3和4区域有红色标志突出显示，这意味着你的文件有问题。如果一切正确配置您应该看到所有都是绿色标志（见下面），你可以按“继续”。

	![Server Requirement Check](http://www.tecmint.com/wp-content/uploads/2015/05/Server-Checkup.png)

	*服务器需求检查*

11. 在下一个屏幕上输入数据库凭证信息，如数据库驱动类型、主机名、用户名、密码、数据库。你不应该改动数据库端口和前缀，除非你知道你在做什么。

	另外输入管理员账号的用户名、密码和邮箱地址。注意这些凭证将用于管理员登录到Opencart管理面板，所以保证它的安全。完成后单击继续！

	![OpenCart Database Details](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-Database.png)

	*OpenCart数据库详情*

12. 下一个屏幕显示的信息如“Installation Complete”和“Ready to Start Selling”。这里还警告说，要记得删除安装目录，所有需要这个目录安装的设置已经完成。

	![OpenCart Installation Completes](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-Installation-Completes.png)

	*OpenCart安装完成*

	删除安装目录，你可以执行下面的命令。

    	# rm -rf /var/www/html/opencart-master/install

### 第四步： 进入OpenCart 及其管理界面 ###

13. 现在打开浏览器到`http://<web server IP address>/opencart-master/`然后你会看到类似下面的截屏。

	![OpenCart Product Showcase](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart.jpg)

	*OpenCart产品示例*

14. 要登录到Opencart管理面板，你需要浏览`http://<web server IP address>/opencart-master/admin`然后填写之前设置的凭证。

	![OpenCart Admin Login](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-Admin-Login.png)

	*OpenCart管理登录*

15. 如果全部OK你应该可以看到Opencart的控制台。

	![OpenCart Dashboard](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-Dashboard.png)

	*OpenCart控制台*

	在管理控制台可以设置很多选项，如类别、产品、选择、制造商、下载、评论、信息、扩展安装、运输、付款选项、订单总数、礼品券、贝宝、优惠券、子公司、营销、邮件、设计风格和设置、错误日志、内置分析等等。

#### 测试了这个工具之后呢？ ####

如果您已经测试了这个应用程序，就会发现它可定制、灵活、稳定、易于维护和使用，您可能需要一个好的主机托管提供商托管你的OpenCart应用，以便保持24 x7的在线支持。尽管有很多选择，我们建议Hostgator主机提供商。（广告硬植-.-!，以下硬广和 LCTT 无关~）

Hostgator是以服务和功能出名的域名注册和虚拟机托管提供商。它为你提供无限的磁盘空间、无限带宽、易于安装（一键安装脚本）、99.9%的正常运行时间、荣获24x7x365技术支持和45天退款保证，这意味着如果你不喜欢这个产品和服务就可以在45天内拿回你的采购费，注意这45天是一个长的测试时间。

所以如果你有什么想卖的你可以免费地去做了（我的意思是免费，想想你会花在实体存储上的费用，然后比较其与建设虚拟商店的成本。你就会感受到它的免费了）。

**注**: 当你从Hostgator购买虚拟主机（和/或域名）你将获得一个**25%折扣**。这只提供给Tecmint网站的读者。

你所要做的就是在购买虚拟机支付时输入优惠码“**TecMint025**”。付款预览截屏优惠码以供参考用。

![Hostgator 25% Discount - TecMint025](http://www.tecmint.com/wp-content/uploads/2015/05/Hostgator-Discount-Code.png)

*[注册 Hostgator][4] (折扣码: TecMint025)*

**注**: 还值得一提的，每个你从Hostgator购买的托管OpenCart的虚拟机，我们将得到少量的佣金，只是为了保持Tecmint存活 （通过支付带宽和托管服务器）。

所以如果你使用上面的代码买它，你得到折扣，我们会得到少量收入。还要注意，你不会支付任何额外的费用，事实上你支付的账单总额将减少25%。

### 总结 ###

OpenCart是一个开箱可用的应用。它易于安装，您可以选择选择最适合的模板，添加你的产品然后你就成为了一个在线店主。

很多社区开发的扩展（有免费和付费的）使它变得丰富。这是一个给那些想要建立一个保持24X7小时用户可访问的虚拟商店的美妙应用。让我们知道你对这个应用程序的体验吧。欢迎任何建议和反馈。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-e-commerce-online-shopping-store-using-opencart-in-linux/

作者：[Avishek Kumar][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://demo.opencart.com/
[2]:http://demo.opencart.com/admin/
[3]:http://www.opencart.com/index.php?route=download/download/
[4]:http://secure.hostgator.com/%7Eaffiliat/cgi-bin/affiliates/clickthru.cgi?id=tecmint
