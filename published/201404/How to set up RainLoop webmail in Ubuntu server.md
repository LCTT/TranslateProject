如何在 Ubuntu server 中设置 RainLoop Webmail
================================================================================
Webmail无疑是任何邮件服务器必不可少的一部分。虽然本地邮件客户端通常比Webmail的功能更多，但通过电子邮件客户端从外部可信的网络访问IMAP或SMTP有时会很棘手。再者，当你需要在一个特定的工作站、笔记本电脑或者移动设备去使用一个电子邮件客户端时，你可以在任何地方使用Webmail服务，只要你接入互联网。

本教程的重点是在一个运行 Apache 的 Ubuntu 服务器上安装配置[RainLoop][1] Webmail。RainLoop 是基于 PHP 的Webmail，并且有以下功能。

- 支持apache，nginx和其它网页服务器。
- 标准接口补充了一个主题库可供选择。
- 个人和非盈利项目可免费使用。 

在写这篇文章时，RainLoop 还不支持邮件过滤和不在公司时的自动回复。

### 在 Ubuntu 服务器上安装 RainLoop ###

首先，在服务器上设置必备的软件包。

    # apt-get install wget unzip apache2 php5 php5-mysql libmysqlclient15-dev mysql-server poppassd 

接下来，下载和安装 RainLoop。

    # mkdir /var/www/webmail
    # cd /var/www/webmail
    # wget http://repository.Rainloop.net/v1/Rainloop-1.6.3.706-e3c14e17bc4370a1561bcc68d1d494fd.zip
    # unzip Rainloop-1.6.3.706-e3c14e17bc4370a1561bcc68d1d494fd.zip
    # rm Rainloop-*.zip 

然后设置必要的权限。

    # cd /var/www/webmail
    # find . -type d -exec chmod 755 {} \;
    # find . -type f -exec chmod 644 {} \;
    # chown –R www-data:www-data /var/www/webmail 

我们马上就可以使用 RainLoop 了。最后，通过管理面板进行调整，接下来会有详细描述。

### 通过管理面板首次配置 ###

很多配置参数通过一款界面友好的管理面板就能调整。使用以下凭证进入管理面板。

1. URL: http://IP/webmail/?admin
1. user: admin
1. Pass: 12345 

当然，建议尽快修改默认密码。我们将使用管理面板去调整一下设置。

### 增加邮件域 ###

在 管理面板> 域> 增加域 页面设置有效的域。建议服务器 IP 是本地服务器，如 127.0.0.1。基于服务器配置，RainLoop 可以配置使用 IMAP/IMAPS 或 SMTP/SMTPS。并且，确认‘使用短登录表单’复选框已勾选。

![](http://farm4.staticflickr.com/3736/12603680854_eb22bd8eb8_z.jpg)

使用‘测试连接’按钮验证设置。

### 启用联系人 ###

联系人功能需要数据库支持。我们将使用 MySQL 数据库启用联系人。RainLoop 可以手动创建所需的数据库，如下。

    # mysql -u root -p 

    mysqlcreate database rainloop;
    mysqlexit;

现在这个功能可以通过管理面板>联系人页面启用。

![](http://farm8.staticflickr.com/7452/12603262215_2299bdafc5_z.jpg)

再来一次，使用‘测试’按钮检查设置。

### 启动密码更改插件 ###

在多数 linux 的邮件账户的邮件服务器是用自己的 UID 和 GID 操作系统的实际用户。因此，在过去更改这些账户的密码是很棘手的。幸好，今天有工具可以完成这个工作。这个工具是 poppassd。

第一步是在服务器上安装 poppassd，可以用 apt-get 来完成。

    # apt-get install poppassd 

接下来，去允许 RainLoop 使用 poppassd，从 管理面板> 软件包 页面安装 RainLoop 插件 poppassd。

![](http://farm4.staticflickr.com/3734/12603357113_a966caf534_z.jpg)

最后，poppassd 插件可以从 管理面板> 插件页面启用。

![](http://farm8.staticflickr.com/7356/12603681254_56fc0b3e9f_z.jpg)

现在所有参数已设置，用户可以从他们提供的凭证登录，如截图所示。

- URL: http://IP/webmail
- user: user@domain
- pass: password 

![](http://farm4.staticflickr.com/3721/12603357333_724fbddaff_z.jpg)

希望这篇文章能帮助到你。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/02/rainloop-webmail-ubuntu-server.html

译者：[Vito](https://github.com/vito-L) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://rainloop.net/
