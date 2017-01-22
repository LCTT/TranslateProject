在 Ubuntu 上使用 DokuWiki 构建你自己的 wiki
============================================================


我们在使用[DokuWiki][2]，它是一个真棒的工具。我们团队有一个内部知识库，我们使用 DokuWiki 存储我们的所有评论，教程等。它很简单，并且易于安装和使用。在这篇文章中，我们将展示如何在 Ubuntu 16.04 服务器上安装 DokuWiki。

### 需求

DokuWiki 不需要太多，因为它不需要数据库。这里是 DokuWiki 的要求：

*   PHP 5.3.4 或更高版本（建议使用 PHP 7+）
*   一台 web 服务器（Apache/Nginx/任何其他）
*   一台 VPS。[买一台便宜的托管VPS][1]，那么你就不必这样做了。你只需与支持团队联系，他们将会为您安装。

### 指导

在你开始之前，你应该升级你的系统。运行下面的命令：

```
sudo apt-get update && sudo apt-get upgrade
```

### 安装 Apache

我们需要一台用于我们 wiki 的 web 服务器。我们在本教程中使用 Apache，但你也可以使用 Nginx 或任何其他 web 服务器。用下面的命令安装apache：

```
apt-get install apache2
```

### 安装 PHP7 和模块

接下来，如果你还没有安装 PHP，你应该先安装 PHP。在本教程中，我们使用PHP7。所以请使用下面的命令安装 PHP7 和一些其他 PHP 模块：

```
apt-get install php7.0-fpm php7.0-cli php-apcu php7.0-gd php7.0-xml php7.0-curl php7.0-json php7.0-mcrypt php7.0-cgi php7.0 libapache2-mod-php7.0
```

### 下载安装 DokuWiki

下面就来到主要部分了 - 实际安装 DokuWiki。

首先，为你的 DokuWiki 创建一个目录：

```
mkdir -p /var/www/thrwiki
```

进入你刚才创建的目录：

```
cd /var/www/thrwiki
```

运行下面的命令来下载最新（稳定）的 DokuWiki：

```
wget http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
```

解压 .tgz 文件：

```
tar xvf dokuwiki-stable.tgz
```

更改文件/文件夹权限：

```
www-data:www-data -R /var/www/thrwiki
chmod -R 707 /var/www/thrwiki
```

### 为 DokuWiki 配置 Apache

为你的 DokuWiki 创建一个 .conf 文件（我们把它命名为 thrwiki.conf，但是你可以把它命名成任何你想要的），并用你喜欢的文本编辑器打开。我们使用 nano：

```
touch /etc/apache2/sites-available/thrwiki.conf
ln -s /etc/apache2/sites-available/thrwiki.conf /etc/apache2/sites-enabled/thrwiki.conf
nano /etc/apache2/sites-available/thrwiki.conf
```

下面是 thrwiki.conf 中的内容：

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

编辑与你服务器相关的行。将 wikiadmin@thishosting.rocks、wiki.thishosting.rocks 替换成你自己的数据，重启 apache 使更改生效：

```
systemctl restart apache2.service
```

就是这样了。现在已经配置完成了。现在你可以继续通过前端页面 http://wiki.thishosting.rocks/install.php 安装配置 DokuWiki 了。安装完成后，你可以用下面的命令删除 install.php： 

```
rm -f /var/www/html/thrwiki/install.php
```

如果你需要任何帮助，请随意留下评论。

--------------------------------------------------------------------------------

via: https://thishosting.rocks/build-your-own-wiki-on-ubuntu-with-dokuwiki/

作者：[thishostrocks.com][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/thishostrocks
[1]:https://thishosting.rocks/best-cheap-managed-vps/
[2]:https://github.com/splitbrain/dokuwiki
