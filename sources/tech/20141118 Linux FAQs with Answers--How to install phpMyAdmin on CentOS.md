Linux问答时间--如何在CentOS上安装phpMyAdmin
================================================================================
> **问题**:我正在CentOS上运行一个MySQL/MariaDB服务，并且我想要通过网络接口来用phpMyAdmin来管理数据库。在CentOS上安装phpMyAdmin的最佳方法是什么？

phpMyAdmin是一款以PHP为基础，基于Web的MySQL/MariaDB数据库管理工具。虽然已经存在着一些诸如[Adminer][1]的轻量级数据库管理工具, 但是phpMyAdmin还是更加广泛应用于网站管理员之中来进行各种MySQL/MariaDB的管理任务。它支持几乎所有MySQL数据库／表的相关操作，比如浏览、创建、复制、删除、重命名、更改，还有MySQL用户/权限管理和数据库导入/导出。以下就是**如何在CentOS 6或7上安装phpMyAdmin**。

### 前提 ###

在CentOS上安装phpMyAdmin，你第一步需要架设一台Web服务器(如Apache或nginx)，安装好MySQL/MariaDB数据库和PHP。根据你的偏好和需求，你可以从[LAMP][2]和[LEMP][3]中选择一种安装。

另一个要求是允许在你的CentOS上安装EPEL库。如果你还没设置过请[猛戳这里][4]。

### 在CentOS6或7上安装phpMyAdmin ###

一旦你设置了EPEL库，你就能轻松地用以下命令安装phpMyAdmin了。

在CentOS 7上:

    $ sudo yum install phpmyadmin 

在CentOS 7上:

    $ sudo yum install phpmyadmin php-mcrypt 

### 在CentOS 7上配置phpMyAdmin ###

默认情况下，CentOS 7上的phpMyAdmin只允许从回环地址(127.0.0.1)访问。为了能远程连接，你需要改动以下配置。

用编辑器打开phpMyAdmin的配置文件(路径：/etc/httpd/conf.d/phpMyAdmin.conf)。Find and comment out every line that says "Require ip XXXX". There will be four such lines. Add "Require all granted" instead. The updated configuration file will look like the following.

    $ sudo vi /etc/httpd/conf.d/phpMyAdmin.conf 

----------

    . . . . .
    <Directory /usr/share/phpMyAdmin/>
       AddDefaultCharset UTF-8
     
       <IfModule mod_authz_core.c>
         # Apache 2.4
         <RequireAny>
           #Require ip 127.0.0.1
           #Require ip ::1
           Require all granted
         </RequireAny>
       </IfModule>
       <IfModule !mod_authz_core.c>
         # Apache 2.2
         Order Deny,Allow
         Deny from All
         Allow from 127.0.0.1
         Allow from ::1
       </IfModule>
    </Directory>
     
    <Directory /usr/share/phpMyAdmin/setup/>
       <IfModule mod_authz_core.c>
         # Apache 2.4
         <RequireAny>
           #Require ip 127.0.0.1
           #Require ip ::1
           Require all granted
         </RequireAny>
       </IfModule>
       <IfModule !mod_authz_core.c>
         # Apache 2.2
         Order Deny,Allow
         Deny from All
         Allow from 127.0.0.1
         Allow from ::1
       </IfModule>
    </Directory>
    . . . . .

Finally, restart httpd to activate the change.

    $ sudo systemctl restart httpd 

### Configure phpMyAdmin on CentOS 6 ###

By default, phpMyAdmin on CentOS 6 blocks access from every IP address. To enable remote access, you will need to update its configuration.

Open phpMyAdmin's configuration (/etc/httpd/conf.d/phpmyadmin.conf) with a text editor. Find a line that says "Deny from all", and comment it out. Then change the line that says "Allow from 127.0.0.1" to "Allow from 0.0.0.0". The updated configuration will look like the following.

    $ sudo vi /etc/httpd/conf.d/phpmyadmin.conf 

----------

    <Directory "/usr/share/phpmyadmin">
      Order Deny,Allow
    #  Deny from all
      Allow from 0.0.0.0
    </Directory>

The next step is to add a blowfish password to the phpMyAdmin's configuration. This step is needed to encrypt password in cookie as part of cookie-based authentication.

Open the following file with a text editor, and set a random blowfish password as follows.

    $ sudo vi /usr/share/phpmyadmin/config.inc.php 

----------

    $cfg['blowfish_secret'] = 'kd5G}d33aXDc50!'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

Finally, restart httpd to activate the change.

    $ sudo service httpd restart 

### Test phpMyAdmin ###

To test if phpMyAdmin is successfully set up, go to http://<web-server-ip-addresss>/phpmyadmin

![](https://farm6.staticflickr.com/5606/15550758749_0f7ab66b5b_z.jpg)

You should be able to log with any MySQL user (e.g., root), and manage MySQL/MariaDB databases/tables via a web-based interface.

![](https://farm8.staticflickr.com/7505/15551187008_86ac7e7db1_z.jpg)

### Troubleshooting ###

Here are a few troubleshooting tips during phpMyAdmin installation on CentOS.

1. When you are trying to access phpMyAdmin page in web browser, you are getting "403 Forbidding" error with:

    You don't have permission to access /phpMyAdmin on this server.

This error is happening because the default setting of phpMyAdmin blocks access from a remote IP address. To fix this error, you need to edit its configuration to allow remote access. See the above for more detail.

2. When you access phpMyAdmin page, you are seeing "The configuration file now needs a secret passphrase (blowfish_secret)." message, and you cannot login.

To fix this error, you need to edit /usr/share/phpmyadmin/config.inc.php to add a random blowfish password as follows, and restart httpd.

    $cfg['blowfish_secret'] = 'kd5G}d33aXDc50!'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

----------

    $ sudo service httpd restart (CentOS 6)
    $ sudo systemctl restart httpd (CentOS 7) 

3. When you access phpMyAdmin page, you are getting "Cannot load mcrypt extension. Please check your PHP configuration" error message.

To solve this error, install the following package:

    $ sudo yum install php-mcrypt 

and restart httpd:

    $ sudo service httpd restart (CentOS 6)
    $ sudo systemctl restart httpd (CentOS 7) 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-phpmyadmin-centos.html

译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/set-web-based-database-management-system-adminer.html
[2]:http://xmodulo.com/install-lamp-stack-centos.html
[3]:http://xmodulo.com/install-lemp-stack-centos.html
[4]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
