Build your own wiki on Ubuntu with DokuWiki
============================================================


We use [DokuWiki][2] and it’s awesome. Our team has an internal knowledgebase and we use DokuWiki to store all our reviews, tutorials etc. It’s simple, easy to install and easy to use. Most importantly, it’s not resource-heavy. In this post, we’re going to show you how to install DokuWiki on an Ubuntu 16.04 server.

### Requirements

DokuWiki doesn’t need much since it doesn’t need a database. Here are the requirements of DokuWiki:

*   PHP 5.3.4 or newer (PHP 7+ recommended)
*   A web server (Apache/Nginx/Any other)
*   A VPS. [Get a cheap managed VPS][1] and you won’t have to do any of this. Just contact the support team and they will install it for you.

### Instructions

Before you do anything, you should upgrade your system. Run the following command:

```
sudo apt-get update && sudo apt-get upgrade
```

### Install Apache

We are going to need a web server for our wiki. We’ll be using Apache for our tutorial, but you can also use Nginx or any other web server. Install apache with:

```
apt-get install apache2
```

### Install PHP7 and modules

Next, you should install PHP if you don’t already have it installed. In this tutorial, we’ll be using PHP7\. So, install PHP7 and a few other PHP modules with the following command:

```
apt-get install php7.0-fpm php7.0-cli php-apcu php7.0-gd php7.0-xml php7.0-curl php7.0-json php7.0-mcrypt php7.0-cgi php7.0 libapache2-mod-php7.0
```

### Download and install DokuWiki

Here comes the main part – the actual installation of DokuWiki.

First, create a directory for your DokuWiki:

```
mkdir -p /var/www/thrwiki
```

Navigate to the directory you just created:

```
cd /var/www/thrwiki
```

Run the following command to download the latest (stable) version of DokuWiki:

```
wget http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
```

Unpack the .tgz file:

```
tar xvf dokuwiki-stable.tgz
```

Change some file/folder permissions:

```
www-data:www-data -R /var/www/thrwiki
chmod -R 707 /var/www/thrwiki
```

### Configure Apache for DokuWiki

Create a .conf file for your DokuWiki (we’ll name it thrwiki.conf, but you can name it however you want) and open it with your favorite text editor. We’ll be using nano:

```
touch /etc/apache2/sites-available/thrwiki.conf
ln -s /etc/apache2/sites-available/thrwiki.conf /etc/apache2/sites-enabled/thrwiki.conf
nano /etc/apache2/sites-available/thrwiki.conf
```
Add the following in your thrwiki.conf file:
```
<VirtualHost yourServerIP:80>
ServerAdmin wikiadmin@thishosting.rocks
DocumentRoot /var/www/thrwiki/
ServerName wiki.thishosting.rocks
ServerAlias www.wiki.thishosting.rocks
<Directory /var/www/thrwiki/>
Options FollowSymLinks
AllowOverride All
Order allow,deny
allow from all
</Directory>
ErrorLog /var/log/apache2/wiki.thishosting.rocks-error_log
CustomLog /var/log/apache2/wiki.thishosting.rocks-access_log common
</VirtualHost>
```
Edit the lines to correspond with your server setup. Replace wikiadmin@thishosting.rocks, wiki.thishosting.rocks etc with your own dataNow, restart apache for the changes to take effect:
```
systemctl restart apache2.service
```
That’s it. You are done. Now you can continue installing and configuring DokuWiki via the front-end interface at http://wiki.thishosting.rocks/install.phpOnce you are done with the installation, you can remove the install.php file with:
```
rm -f /var/www/html/thrwiki/install.php
```

Feel free to leave a comment below if you need any help.

--------------------------------------------------------------------------------

via: https://thishosting.rocks/build-your-own-wiki-on-ubuntu-with-dokuwiki/

作者：[thishostrocks.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/thishostrocks
[1]:https://thishosting.rocks/best-cheap-managed-vps/
[2]:https://github.com/splitbrain/dokuwiki
