[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build your own cloud with Fedora 31 and Nextcloud Server)
[#]: via: (https://fedoramagazine.org/build-your-own-cloud-with-fedora-31-and-nextcloud-server/)
[#]: author: (storyteller https://fedoramagazine.org/author/storyteller/)

Build your own cloud with Fedora 31 and Nextcloud Server
======

![][1]

[Nextcloud][2] is a software suite for storing and syncing your data across multiple devices. You can learn more about Nextcloud Server’s features from [https://github.com/nextcloud/server][3].

This article demonstrates how to build a personal cloud using Fedora and Nextcloud in a few simple steps. For this tutorial you will need a dedicated computer or a virtual machine running Fedora 31 server edition and an internet connection.

### Step 1: Install the prerequisites

Before installing and configuring Nextcloud, a few prerequisites must be satisfied.

First, install Apache web server:

```
# dnf install httpd
```

Next, install PHP and some additional modules. Make sure that the PHP version being installed meets [Nextcloud’s requirements][4]:

```
# dnf install php php-gd php-mbstring php-intl php-pecl-apcu php-mysqlnd php-pecl-redis php-opcache php-imagick php-zip php-process
```

After PHP is installed enable and start the Apache web server:

```
# systemctl enable --now httpd
```

Next, allow _HTTP_ traffic through the firewall:

```
# firewall-cmd --permanent --add-service=http
# firewall-cmd --reload
```

Next, install the MariaDB server and client:

```
# dnf install mariadb mariadb-server
```

Then enable and start the MariaDB server:

```
# systemctl enable --now mariadb
```

Now that MariaDB is running on your server, you can run the _mysql_secure_installation_ command to secure it:

```
# mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL
      MariaDB SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP
      CAREFULLY!

In order to log into MariaDB to secure it, we'll need the
current password for the root user.  If you've just installed
MariaDB, and you haven't set the root password yet, the password
will be blank, so you should just press enter here.

Enter current password for root (enter for none): <ENTER>
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into
the MariaDB root user without the proper authorization.

Set root password? [Y/n] <ENTER>
New password: Your_Password_Here
Re-enter new password: Your_Password_Here

Password updated successfully!

Reloading privilege tables...
 ... Success!

By default, a MariaDB installation has an anonymous user,
allowing anyone to log into MariaDB without having to have
a user account created for them.  This is intended only for
testing, and to make the installation go a bit smoother.  You
should remove them before moving into a production environment.

Remove anonymous users? [Y/n] <ENTER>
 ... Success!

Normally, root should only be allowed to connect from
'localhost'.  This ensures that someone cannot guess at the
root password from the network.

Disallow root login remotely? [Y/n] <ENTER>
 ... Success!

By default, MariaDB comes with a database named 'test' that
anyone can access.  This is also intended only for testing, and
should be removed before moving into a production environment.

Remove test database and access to it? [Y/n] <ENTER>

 - Dropping test database...
 ... Success!

 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? [Y/n] <ENTER>
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your
MariaDB installation should now be secure.

Thanks for using MariaDB!
```

Next, create a dedicated user and database for your Nextcloud instance:

```
# mysql -p
> create database nextcloud;
> create user 'nc_admin'@'localhost' identified by 'SeCrEt';
> grant all privileges on nextcloud.* to 'nc_admin'@'localhost';
> flush privileges;
> exit;
```

### Step 2: Install Nextcloud Server

Now that the prerequisites for your Nextcloud installation have been satisfied, download and unzip [the Nextcloud archive][5]:

```
# wget https://download.nextcloud.com/server/releases/nextcloud-17.0.2.zip
# unzip nextcloud-17.0.2.zip -d /var/www/html/
```

Next, create a data folder and grant Apache read and write access to the _nextcloud_ directory tree:

```
# mkdir /var/www/html/nextcloud/data
# chown -R apache:apache /var/www/html/nextcloud
```

SELinux must be configured to work with Nextcloud. The basic commands are those bellow, but a lot more, by features used on nexcloud installation, are posted here: [Nextcloud SELinux configuration][6]

```
# semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/config(/.*)?'
# semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/apps(/.*)?'
# semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/data(/.*)?'
# semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/.user.ini'
# semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/3rdparty/aws/aws-sdk-php/src/data/logs(/.*)?'
# restorecon -Rv '/var/www/html/nextcloud/'
```

### Step 3: Configure N**extclou**d

Nextcloud can be configured using its web interface or from the command line.

#### Using the web interface

From your favorite browser, access _<http://your\_server\_ip/nextcloud>_ and fill the fields:

![][7]

#### Using the command line

From the command line, just enter the following, substituting the values you used when you created a dedicated Nextcloud user in MariaDB earlier:

```
# sudo -u apache php occ maintenance:install --data-dir /var/www/html/nextcloud/data/ --database "mysql" --database-name "nextcloud" --database-user "nc_admin" --database-pass "DB_SeCuRe_PaSsWoRd" --admin-user "admin" --admin-pass "Admin_SeCuRe_PaSsWoRd"
```

### Final Notes

  * I used the _http_ protocol, but Nextcloud also works over _https_. I might write a follow-up about securing Nextcloud in a future article.
  * I disabled SELinux, but your server will be more secure if you configure it.
  * The recommend PHP memory limit for Nextcloud is 512M. To change it, edit the _memory_limit_ variable in the _/etc/php.ini_ configuration file and restart your _httpd_ service.
  * By default, the web interface can only be accessed using the _<http://localhost/>_ URL. If you want to allow access using other domain names, [you can do so by editing the _/var/www/html/nextcloud/config/config.php_ file][8]. The * character can be used to bypass the domain name restriction and allow the use of any URL that resolves to one of your server’s IP addresses.



```
'trusted_domains' =>
    array (
        0 => 'localhost',
        1 => '*',
    ),
```

_— Updated on January 28th, 2020 to include SELinux configuration —_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/build-your-own-cloud-with-fedora-31-and-nextcloud-server/

作者：[storyteller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/storyteller/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/nextcloud-1-816x345.png
[2]: https://nextcloud.com/
[3]: https://github.com/nextcloud/server#nextcloud-server-
[4]: https://docs.nextcloud.com/server/17/admin_manual/installation/system_requirements.html#server
[5]: https://nextcloud.com/install/#instructions-server
[6]: https://docs.nextcloud.com/server/17/admin_manual/installation/selinux_configuration.html
[7]: https://fedoramagazine.org/wp-content/uploads/2019/11/image.png
[8]: https://help.nextcloud.com/t/adding-a-new-trusted-domain/26
