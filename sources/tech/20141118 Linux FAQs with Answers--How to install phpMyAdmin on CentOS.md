Linux问答时间--如何在CentOS上安装phpMyAdmin
================================================================================
> **问题**:我正在CentOS上运行一个MySQL/MariaDB服务，并且我想要通过网络接口来用phpMyAdmin来管理数据库。在CentOS上安装phpMyAdmin的最佳方法是什么？

phpMyAdmin is an open-source PHP application designed as a web-based MySQL/MariaDB database administration tool. While there exist lightweight database management tools such as [Adminer][1], phpMyAdmin is more popularly used among webmasters to conduct various MySQL/MariaDB administration tasks. It supports pretty much all MySQL database/table related operations such as browse, create, copy, drop, rename, alter, as well as MySQL user/privilege management, and database import/export. Here is **how to install phpMyAdmin on CentOS 6 or 7**.

### Prerequisites ###

To install phpMyAdmin on CentOS, you first need to set up a web server (e.g., Apache or nginx), MySQL/MariaDB and PHP. Depending on your preference or requirement, you can choose to install either [LAMP stack][2] or [LEMP stack][3].

Another requirement is to enable EPEL repository on your CentOS. Follow [this guide][4] to set up EPEL repository if you haven't done so.

### Install phpMyAdmin on CentOS 6 or 7 ###

Once you set up EPEL repository, you can install phpMyAdmin easily with yum command as follows.

On CentOS 7:

    $ sudo yum install phpmyadmin 

On CentOS 6:

    $ sudo yum install phpmyadmin php-mcrypt 

### Configure phpMyAdmin on CentOS 7 ###

By default, phpMyAdmin on CentOS 7 allows access only from loopback address (127.0.0.1). To enable remote access, you will need to update its configuration.

Open phpMyAdmin's configuration (/etc/httpd/conf.d/phpMyAdmin.conf) with a text editor. Find and comment out every line that says "Require ip XXXX". There will be four such lines. Add "Require all granted" instead. The updated configuration file will look like the following.

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
