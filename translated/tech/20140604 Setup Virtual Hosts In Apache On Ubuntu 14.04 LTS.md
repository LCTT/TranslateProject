


在Ubuntu 14.04 LTS系统中设置Apache虚拟主机
================================================================================


**虚拟主机**常用于单独一个IP地址安装多个域名或网站服务。如果有人想在单个VPS的单个IP地址运行多个网站，这是非常有用的。


在这个教程中，让我告诉你如何设置在Ubuntu 14.04 LTS的Apache网页服务器设置虚拟主机。请注意，这个教程只针对Ubuntu14.04的32位版本。
我不能提出任何保证它也可以工作在其它更低的Ubuntu版本或者Ubuntu衍生物。


###方案###



在这个教程中，我会使用Ubuntu 14.04 32位 LTS，并搭建2个测试网站分别命名为“**unixmen1.local**” 和 “**unixmen2.local**”.我的测试机分别为**192.168.1.250/24**和**server.unixmen.local**。你可以根据你的需要更改虚拟域名。



###安装Apache网站服务器###



安装apache服务器之前，我们来更新一下我们的Ubuntu服务器：

    sudo apt-get update


现在，用下面命令来安装apache网络服务器：

    sudo apt-get install apache2

安装apache服务器之后，让我们通过这个URL **http://ip-address/**来测试网站服务器是否正常工作
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/Apache2-Ubuntu-Default-Page-It-works-Mozilla-Firefox_001.png)


像你所看到以上的图片，apache服务器正在工作。



###设置虚拟主机###


#### 1.创建虚拟目录 ##


现在，让我们继续安装虚拟主机。正如我先前所述，我要新建2台虚拟主机分别命名为“**unixmen1.local**”和“**unixmen2.local**”.


创建一个公用的文件夹来存放这两台虚拟主机的数据。


首先，让我们为unixmen1.local这个站点创建一个目录：

    sudo mkdir -p /var/www/unixmen1.local/public_html

接着，为for unixmen2.local站点创建一个目录：

    sudo mkdir -p /var/www/unixmen2.local/public_html


### 2. 设置所有者和权限 ####


上面目录现在只有root拥有权限。我们需要修改这2个目录的拥有权给普通用户，而不仅仅是root用户。

    sudo chown -R $USER:$USER /var/www/unixmen1.local/public_html/
    sudo chown -R $USER:$USER /var/www/unixmen2.local/public_html/

“**$USER**”变量显示了当前的登录用户。




设置读写权限给apache网页根（/var/www)目录,这样每个人都可以从目录中读取文件。

    sudo chmod -R 755 /var/www/



我们需要创建一些文件夹来保存网络相关数据并分配必要的权限和所属用户。



#### 4. 为虚拟主机创建例页 ####


现在，我们必须通过网站示例样页。第一步，让我们给虚拟主机窗机一个名为**unixmen1.local**的样页。


给unixmen1.local虚拟主机创建一个目录，

    sudo vi /var/www/unixmen1.local/public_html/index.html


添加一下内容：

    <html>
     <head>
     <title>www.unixmen1.local</title>
     </head>
     <body>
     <h1>Welcome To Unixmen1.local website</h1>
     </body>
    </html>


保存并关闭文件。

同样的，添加样页到第二台虚拟主机。

    sudo vi /var/www/unixmen2.local/public_html/index.html


添加一下内容：

    <html>
     <head>
     <title>www.unixmen2.local</title>
     </head>
     <body>
     <h1>Welcome To Unixmen2.local website</h1>
     </body>
    </html>

保存并关闭文件。

#### 5. 创建虚拟主机文件####


默认情况下，apache有一个默认的虚拟主机文件叫000-default.conf.我们将会复制**000-default.conf**文件内容到我们新的虚拟主机文件中。

    sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/unixmen1.local.conf
    sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/unixmen2.local.conf


确保虚拟主机文件包含.conf扩展名在内容的最后。

现在，修改unximen1.local.conf文件以呈现新的值。

    sudo vi /etc/apache2/sites-available/unixmen1.local.conf


使相关的变化直接呈现在unixmen1站点中。

    <VirtualHost *:80>
            # The ServerName directive sets the request scheme, hostname and port that
            # the server uses to identify itself. This is used when creating
            # redirection URLs. In the context of virtual hosts, the ServerName
            # specifies what hostname must appear in the request's Host: header to
            # match this virtual host. For the default virtual host (this file) this
            # value is not decisive as it is used as a last resort host regardless.
            # However, you must set it for any further virtual host explicitly.
            #ServerName www.example.com
    
            ServerAdmin webmaster@unixmen1.local
            ServerName unixmen1.local
            ServerAlias www.unixmen1.local
            DocumentRoot /var/www/unixmen1.local/public_html
    
            # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
            # error, crit, alert, emerg.
            # It is also possible to configure the loglevel for particular
            # modules, e.g.
            #LogLevel info ssl:warn
    
            ErrorLog ${APACHE_LOG_DIR}/error.log
            CustomLog ${APACHE_LOG_DIR}/access.log combined
    
            # For most configuration files from conf-available/, which are
            # enabled or disabled at a global level, it is possible to
            # include a line for only one particular virtual host. For example the
            # following line enables the CGI configuration for this host only
            # after it has been globally disabled with "a2disconf".
            #Include conf-available/serve-cgi-bin.conf
    </VirtualHost>


同理，修改第二台主机文件。

    sudo vi /etc/apache2/sites-available/unixmen2.local.conf


使相关的修改在unixmen2 站点呈现出来。

    <VirtualHost *:80>
            # The ServerName directive sets the request scheme, hostname and port that
            # the server uses to identify itself. This is used when creating
            # redirection URLs. In the context of virtual hosts, the ServerName
            # specifies what hostname must appear in the request's Host: header to
            # match this virtual host. For the default virtual host (this file) this
            # value is not decisive as it is used as a last resort host regardless.
            # However, you must set it for any further virtual host explicitly.
            #ServerName www.example.com
    
            ServerAdmin webmaster@unixmen2.local
            ServerName unixmen2.local
            ServerAlias www.unixmen2.local
            DocumentRoot /var/www/unixmen2.local/public_html
    
            # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
            # error, crit, alert, emerg.
            # It is also possible to configure the loglevel for particular
            # modules, e.g.
            #LogLevel info ssl:warn
    
            ErrorLog ${APACHE_LOG_DIR}/error.log
            CustomLog ${APACHE_LOG_DIR}/access.log combined
    
            # For most configuration files from conf-available/, which are
            # enabled or disabled at a global level, it is possible to
            # include a line for only one particular virtual host. For example the
            # following line enables the CGI configuration for this host only
            # after it has been globally disabled with "a2disconf".
            #Include conf-available/serve-cgi-bin.conf
    </VirtualHost>


修改虚拟主机文件后，使默认的虚拟主机（000.default.conf)不生效，然后使新的虚拟主机生效，如下所示。

    sudo a2dissite 000-default.conf
    sudo a2ensite unixmen1.local.conf
    sudo a2ensite unixmen2.local.conf


最后，重启apache服务器。

    sudo service apache2 restart


就是这样。现在，我们成功地配置了apach虚拟主机在我们的Ubuntu服务器上


测试虚拟主机


编辑**/etc/hosts**文件，

    sudo vi /etc/hosts

如下所示挨个添加虚拟域名。

    [...]
    192.168.1.250   unixmen1.local
    192.168.1.250   unixmen2.local


保存并关闭文件。


打开你的浏览器并指向**http://unixmen1.local** 或 **http://unixmen2.local**链接。你将会看到我们之前创建的样页。


**Unixmen1.local 测试页:**

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/www.unixmen1.local-Mozilla-Firefox_004.png)


**Unixmen2.local 测试页**

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/www.unixmen2.local-Mozilla-Firefox_005.png)

如果你想从你的远程系统访问这些站点，你需要在你的DNS服务器添加实际域名记录。因此，我不需要人和实际域名和DNS服务器，我只想通过我的本地系统测试，那么它刚好如我所愿地工作。

Cheers！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/setup-virtual-hosts-apache-ubuntu-14-04-lts/

译者：disylee(https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
