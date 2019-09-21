如何在树莓派上搭建 WordPress
======

> 这篇简单的教程可以让你在树莓派上运行你的 WordPress 网站。  

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/edu_raspberry-pi-classroom_lead.png?itok=KIyhmR8W)

WordPress 是一个非常受欢迎的开源博客平台和内容管理平台（CMS)。它很容易搭建，而且还有一个活跃的开发者社区构建网站、创建主题和插件供其他人使用。  

虽然通过一键式 WordPress 设置获得托管包很容易，但也可以简单地通过命令行在 Linux 服务器上设置自己的托管包，而且树莓派是一种用来尝试它并顺便学习一些东西的相当好的途径。

一个经常使用的 Web 套件的四个部分是 Linux、Apache、MySQL 和 PHP。这里是你对它们每一个需要了解的。  

### Linux

树莓派上运行的系统是 Raspbian，这是一个基于 Debian，为运行在树莓派硬件上而优化的很好的 Linux 发行版。你有两个选择：桌面版或是精简版。桌面版有一个熟悉的桌面还有很多教育软件和编程工具，像是 LibreOffice 套件、Mincraft，还有一个 web 浏览器。精简版本没有桌面环境，因此它只有命令行以及一些必要的软件。  

这篇教程在两个版本上都可以使用，但是如果你使用的是精简版，你必须要有另外一台电脑去访问你的站点。  

### Apache

Apache 是一个受欢迎的 web 服务器应用，你可以安装在你的树莓派上伺服你的 web 页面。就其自身而言，Apache 可以通过 HTTP 提供静态 HTML 文件。使用额外的模块，它也可以使用像是 PHP 的脚本语言提供动态网页。  

安装 Apache 非常简单。打开一个终端窗口，然后输入下面的命令：

```
sudo apt install apache2 -y
```

Apache 默认放了一个测试文件在一个 web 目录中，你可以从你的电脑或是你网络中的其他计算机进行访问。只需要打开 web 浏览器，然后输入地址 `<http://localhost>`。或者（特别是你使用的是 Raspbian Lite 的话）输入你的树莓派的 IP 地址代替 `localhost`。你应该会在你的浏览器窗口中看到这样的内容：  

![](https://opensource.com/sites/default/files/uploads/apache-it-works.png)

这意味着你的 Apache 已经开始工作了！  

这个默认的网页仅仅是你文件系统里的一个文件。它在你本地的 `/var/www/html/index/html`。你可以使用 [Leafpad][2] 文本编辑器写一些 HTML 去替换这个文件的内容。

```
cd /var/www/html/
sudo leafpad index.html
```

保存并关闭 Leafpad 然后刷新网页，查看你的更改。  

### MySQL

MySQL（读作 “my S-Q-L” 或者 “my sequel”）是一个很受欢迎的数据库引擎。就像 PHP，它被非常广泛的应用于网页服务，这也是为什么像 WordPress 一样的项目选择了它，以及这些项目是为何如此受欢迎。  

在一个终端窗口中输入以下命令安装 MySQL 服务（LCTT 译注：实际上安装的是 MySQL 分支 MariaDB）：  

```
sudo apt-get install mysql-server -y
```

WordPress 使用 MySQL 存储文章、页面、用户数据、还有许多其他的内容。

### PHP

PHP 是一个预处理器：它是在服务器通过网络浏览器接受网页请求是运行的代码。它解决那些需要展示在网页上的内容，然后发送这些网页到浏览器上。不像静态的 HTML，PHP 能在不同的情况下展示不同的内容。PHP 是一个在 web 上非常受欢迎的语言；很多像 Facebook 和 Wikipedia 的项目都使用 PHP 编写。  

安装 PHP 和 MySQL 的插件：

```
sudo apt-get install php php-mysql -y
```

删除 `index.html`，然后创建 `index.php`：  

```
sudo rm index.html
sudo leafpad index.php
```

在里面添加以下内容：  

```
<?php phpinfo(); ?>
```

保存、退出、刷新你的网页。你将会看到 PHP 状态页：  

![](https://opensource.com/sites/default/files/uploads/phpinfo.png)

### WordPress

你可以使用 `wget` 命令从 [wordpress.org][3] 下载 WordPress。最新的 WordPress 总是使用 [wordpress.org/latest.tar.gz][4] 这个网址，所以你可以直接抓取这些文件，而无需到网页里面查看，现在的版本是 4.9.8。

确保你在 `/var/www/html` 目录中，然后删除里面的所有内容：  

```
cd /var/www/html/
sudo rm *
```

使用 `wget` 下载 WordPress，然后提取里面的内容，并移动提取的 WordPress 目录中的内容移动到 `html` 目录下：  

```
sudo wget http://wordpress.org/latest.tar.gz
sudo tar xzf latest.tar.gz
sudo mv wordpress/* .
```

现在可以删除压缩包和空的 `wordpress` 目录了： 

```
sudo rm -rf wordpress latest.tar.gz
```

运行 `ls` 或者 `tree -L 1` 命令显示 WordPress 项目下包含的内容： 

```
.
├── index.php
├── license.txt
├── readme.html
├── wp-activate.php
├── wp-admin
├── wp-blog-header.php
├── wp-comments-post.php
├── wp-config-sample.php
├── wp-content
├── wp-cron.php
├── wp-includes
├── wp-links-opml.php
├── wp-load.php
├── wp-login.php
├── wp-mail.php
├── wp-settings.php
├── wp-signup.php
├── wp-trackback.php
└── xmlrpc.php

3 directories, 16 files
```

这是 WordPress 的默认安装源。在 `wp-content` 目录中，你可以编辑你的自定义安装。

你现在应该把所有文件的所有权改为 Apache 的运行用户 `www-data`：  

```
sudo chown -R www-data: .
```

### WordPress 数据库

为了搭建你的 WordPress 站点，你需要一个数据库。这里使用的是 MySQL。  

在终端窗口运行 MySQL 的安全安装命令：  

```
sudo mysql_secure_installation
```

你将会被问到一系列的问题。这里原来没有设置密码，但是在下一步你应该设置一个。确保你记住了你输入的密码，后面你需要使用它去连接你的 WordPress。按回车确认下面的所有问题。  

当它完成之后，你将会看到 “All done!” 和 “Thanks for using MariaDB!” 的信息。  

在终端窗口运行 `mysql` 命令：  

```
sudo mysql -uroot -p
```

输入你创建的 root 密码（LCTT 译注：不是 Linux 系统的 root 密码，是 MySQL 的 root 密码）。你将看到 “Welcome to the MariaDB monitor.” 的欢迎信息。在  “MariaDB [(none)] >” 提示处使用以下命令，为你 WordPress 的安装创建一个数据库：

```
create database wordpress;
```

注意声明最后的分号，如果命令执行成功，你将看到下面的提示：  

```
Query OK, 1 row affected (0.00 sec)
```

把数据库权限交给 root 用户在声明的底部输入密码：  

```
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'YOURPASSWORD';
```

为了让更改生效，你需要刷新数据库权限：  

```
FLUSH PRIVILEGES;
```

按 `Ctrl+D` 退出 MariaDB 提示符，返回到 Bash shell。  

### WordPress 配置

在你的 树莓派 打开网页浏览器，地址栏输入 `http://localhost`。选择一个你想要在 WordPress 使用的语言，然后点击“Continue”。你将会看到 WordPress 的欢迎界面。点击 “Let's go!” 按钮。  

按照下面这样填写基本的站点信息：

```
Database Name:      wordpress
User Name:          root
Password:           <YOUR PASSWORD>
Database Host:      localhost
Table Prefix:       wp_
```

点击 “Submit” 继续，然后点击 “Run the install”。  

![](https://opensource.com/sites/default/files/uploads/wp-info.png)

按下面的格式填写：为你的站点设置一个标题、创建一个用户名和密码、输入你的 email 地址。点击 “Install WordPress” 按钮，然后使用你刚刚创建的账号登录，你现在已经登录，而且你的站点已经设置好了，你可以在浏览器地址栏输入 `http://localhost/wp-admin` 查看你的网站。  

### 永久链接

更改你的永久链接设置，使得你的 URL 更加友好是一个很好的想法。

要这样做，首先登录你的 WordPress ，进入仪表盘。进入 “Settings”，“Permalinks”。选择 “Post name” 选项，然后点击 “Save Changes”。接着你需要开启 Apache 的 `rewrite` 模块。  

```
sudo a2enmod rewrite
```

你还需要告诉虚拟托管服务，站点允许改写请求。为你的虚拟主机编辑 Apache 配置文件：

```
sudo leafpad /etc/apache2/sites-available/000-default.conf
```

在第一行后添加下面的内容：  

```
<Directory "/var/www/html">
    AllowOverride All
</Directory>
```

确保其中有像这样的内容 `<VirtualHost *:80>`： 

```
<VirtualHost *:80>
    <Directory "/var/www/html">
        AllowOverride All
    </Directory>
    ...
```

保存这个文件，然后退出，重启 Apache：  

```
sudo systemctl restart apache2
```

### 下一步？

WordPress 是可以高度自定义的。在网站顶部横幅处点击你的站点名，你就会进入仪表盘。在这里你可以修改主题、添加页面和文章、编辑菜单、添加插件、以及许多其他的事情。
 
这里有一些你可以在树莓派的网页服务上尝试的有趣的事情：  

  * 添加页面和文章到你的网站
  * 从外观菜单安装不同的主题
  * 自定义你的网站主题或是创建你自己的
  * 使用你的网站服务向你的网络上的其他人显示有用的信息

不要忘记，树莓派是一台 Linux 电脑。你也可以使用相同的结构在运行着 Debian 或者 Ubuntu 的服务器上安装 WordPress。  

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/setting-wordpress-raspberry-pi

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sitewide-search?search_api_views_fulltext=raspberry%20pi
[2]: https://en.wikipedia.org/wiki/Leafpad
[3]: http://wordpress.org/
[4]: https://wordpress.org/latest.tar.gz
