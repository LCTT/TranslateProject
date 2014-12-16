如何在Debian上安装配置ownCloud
================================================================================
据其官方网站，ownCloud可以让你通过一个Web界面或者WebDAV访问你的文件。它还提供了一个平台，可以轻松地查看、编辑和同步您所有设备的通讯录、日历和书签。尽管ownCloud与广泛使用Dropbox非常相似，但主要区别在于ownCloud是免费的，开源的，从而可以自己的服务器上建立与Dropbox类似的云存储服务。使用ownCloud你可以完整地访问和控制您的私人数据，而对存储空间（除了硬盘容量）或客户端的连接数量没有限制。

ownCloud提供了社区版（免费）和企业版（面向企业的有偿支持）。预编译的ownCloud社区版可以提供了CentOS、Debian、Fedora、openSUSE、，SLE和Ubuntu版本。本教程将演示如何在Debian Wheezy上安装和在配置ownCloud社区版。

### 在Debian上安装 ownCloud ###

进入官方网站：[http://owncloud.org][1]，并点击‘Install’按钮（右上角）。

![](https://farm4.staticflickr.com/3885/14884771598_323f2fc01c_z.jpg)

为当前的版本选择“Packages for auto updates”（下面的图是v7）。这可以让你轻松的让你使用的ownCloud与Debian的包管理系统保持一致，包是由ownCloud社区维护的。

![](https://farm6.staticflickr.com/5589/15071372505_298a796ff6_z.jpg)

在下一屏中点击继续：

![](https://farm6.staticflickr.com/5589/14884818527_554d1483f9_z.jpg)

在可用的操作系统列表中选择Debian 7 [Wheezy]：

![](https://farm6.staticflickr.com/5581/14884669449_433e3334e0_z.jpg)

加入ownCloud的官方Debian仓库：

     # echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/Debian_7.0/ /' >> /etc/apt/sources.list.d/owncloud.list 

加入仓库密钥到apt中：

    # wget http://download.opensuse.org/repositories/isv:ownCloud:community/Debian_7.0/Release.key
    # apt-key add - < Release.key 

继续安装ownCLoud：

    # aptitude update
    # aptitude install owncloud 

打开你的浏览器并定位到你的ownCloud实例中，地址是 http://服务器 IP/owncloud:

![](https://farm4.staticflickr.com/3869/15071011092_f8f32ffe11_z.jpg)

注意ownCloud可能会包一个Apache配置错误的警告。使用下面的步骤来解决这个错误来解决这些错误信息。

a) 编辑 the /etc/apache2/apache2.conf (设置 AllowOverride 为 All):

    <Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>

b) 编辑 the /etc/apache2/conf.d/owncloud.conf

    <Directory /var/www/owncloud>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>

c) 重启web服务器:

    # service apache2 restart 

d) 刷新浏览器，确认安全警告已经消失

![](https://farm6.staticflickr.com/5562/14884771428_fc9c063418_z.jpg)

### 设置数据库 ###

这时可以为ownCloud设置数据库了。

首先登录本地的MySQL/MariaDB数据库：

    $ mysql -u root -h localhost -p

为ownCloud创建数据库和用户账户。

    mysql> CREATE DATABASE owncloud_DB;
    mysql> CREATE USER ‘owncloud-web’@'localhost' IDENTIFIED BY ‘whateverpasswordyouchoose’;
    mysql> GRANT ALL PRIVILEGES ON owncloud_DB.* TO ‘owncloud-web’@'localhost';
    mysql> FLUSH PRIVILEGES; 

通过http://服务器 IP/owncloud 进入ownCloud页面，并选择‘Storage & database’ 选项。输入所需的信息（MySQL/MariaDB用户名，密码，数据库和主机名），并点击完成按钮。

![](https://farm6.staticflickr.com/5584/15071010982_b76c23c384_z.jpg)

### 为ownCloud配置SSL连接 ###

在你开始使用ownCloud之前，强烈建议你在ownCloud中启用SSL支持。使用SSL可以提供重要的安全好处，比如加密ownCloud流量并提供适当的验证。在本教程中，将会为SSL使用一个自签名的证书。

创建一个储存服务器密钥和证书的目录：

    # mkdir /etc/apache2/ssl

创建一个证书（并有一个密钥来保护它），它有一年的有效期。

     # openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt 

![](https://farm6.staticflickr.com/5587/15068784081_f281b54b72_z.jpg)

编辑/etc/apache2/conf.d/owncloud.conf 启用HTTPS。对于重写规则中的NC、R和L的意义，你可以参考[Apache 文档][2]:

    Alias /owncloud /var/www/owncloud
     
    <VirtualHost 192.168.0.15:80>
        RewriteEngine on
        ReWriteCond %{SERVER_PORT} !^443$
        RewriteRule ^/(.*) https://%{HTTP_HOST}/$1 [NC,R,L]
    </VirtualHost>
     
    <VirtualHost 192.168.0.15:443>
        SSLEngine on
        SSLCertificateFile /etc/apache2/ssl/apache.crt
        SSLCertificateKeyFile /etc/apache2/ssl/apache.key
        DocumentRoot /var/www/owncloud/
    <Directory /var/www/owncloud>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
    </VirtualHost>

启用重写模块并重启Apache：

    # a2enmod rewrite
    # service apache2 restart 

打开你的ownCloud实例。注意一下，即使你尝试使用HTTP，你也会自动被重定向到HTTPS。

注意，即使你已经按照上述步骤做了，在你启动ownCloud你仍将看到一条错误消息，指出该证书尚未被受信的机构颁发（那是因为我们创建了一个自签名证书）。您可以放心地忽略此消息，但如果你考虑在生产服务器上部署ownCloud，你可以从一个值得信赖的公司购买证书。

### 创建一个账号 ###

现在我们准备创建一个ownCloud管理员帐号了。

![](https://farm6.staticflickr.com/5587/15048366536_430b4fd64e.jpg)

欢迎来自你的个人云！注意你可以安装一个桌面或者移动端app来同步你的文件、日历、通讯录或者更多了。

![](https://farm4.staticflickr.com/3862/15071372425_c391d912f5_z.jpg)

在右上叫，点击你的用户名，会显示一个下拉菜单：

![](https://farm4.staticflickr.com/3897/15071372355_3de08d2847.jpg)

点击Personal来改变你的设置，比如密码，显示名，email地址、头像还有更多。

### ownCloud 使用案例：访问日历 ###

让我开始添加一个事件到日历中并稍后下载。

点击左上角的下拉菜单并选择日历。

![](https://farm4.staticflickr.com/3891/15048366346_7dcc388244.jpg)

添加一个时间并保存到你的日历中。

![](https://farm4.staticflickr.com/3882/14884818197_f55154fd91_z.jpg)

通过 'Event and Tasks' -> 'Import...' -> 'Select file' 下载你的日历并添加到你的Thunderbird日历中：

![](https://farm4.staticflickr.com/3840/14884818217_16a53400f0_z.jpg)

![](https://farm4.staticflickr.com/3871/15048366356_a7f98ca63d_z.jpg)

提示：你还需要设置你的时区以便在其他程序中成功地导入你的日历（默认情况下，日历程序将使用UTC+00：00时区）。要更改时区在左下角点击小齿轮图标，接着日历设置菜单就会出现，你就可以选择时区了：

![](https://farm4.staticflickr.com/3858/14884669029_4e0cd3e366.jpg)

### ownCloud 使用案例：上传一个文件 ###

接下来，我们会从本机上传一个文件

进入文件菜单（左上角）并点击向上箭头来打开一个选择文件对话框。

![](https://farm4.staticflickr.com/3851/14884818067_4a4cc73b40.jpg)

选择一个文件并点击打开。

![](https://farm6.staticflickr.com/5591/14884669039_5a9dd00ca9_z.jpg)

接下来你就可以打开/编辑选中的文件，把它移到另外一个文件夹或者删除它了。

![](https://farm4.staticflickr.com/3909/14884771088_d0b8a20ae2_o.png)

### 总结 ###

ownCloud是一个灵活和强大的云存储，可以从其他供应商快速、简便、无痛的过渡。此外，它是开源软件，你只需要很少有时间和精力对其进行配置以满足你的所有需求。欲了解更多信息，可以随时参考[用户][3]、[管理][4]或[开发][5]手册。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/install-configure-owncloud-debian.html

作者：[Gabriel Cánepa][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.gabrielcanepa.com.ar/
[1]:http://owncloud.org/
[2]:http://httpd.apache.org/docs/2.2/rewrite/flags.html
[3]:http://doc.owncloud.org/server/7.0/ownCloudUserManual.pdf
[4]:http://doc.owncloud.org/server/7.0/ownCloudAdminManual.pdf
[5]:http://doc.owncloud.org/server/7.0/ownCloudDeveloperManual.pdf