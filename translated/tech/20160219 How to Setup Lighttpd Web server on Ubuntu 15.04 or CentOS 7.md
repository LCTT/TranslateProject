[Translated] Haohong Wang
如何在Ubuntu 15.04/CentOS 7中安装Lighttpd Web server
=================================================================================
Lighttpd 是一款开源Web服务器软件。Lighttpd 安全快速，符合行业标准，适配性强并且针对高配置环境进行了优化。Lighttpd因其CPU、内存占用小，针对小型CPU加载的快速适配以及出色的效率和速度而从众多Web服务器中脱颖而出。 而Lighttpd诸如FastCGI，CGI，Auth，Out-Compression，URL-Rewriting等高级功能更是那些低配置的服务器的福音。

以下便是在我们运行Ubuntu 15.04 或CentOS 7 Linux发行版的机器上安装Lighttpd Web服务器的简要流程。

### 安装Lighttpd

#### 使用包管理器安装

这里我们通过使用包管理器这种最简单的方法来安装Lighttpd。只需以sudo模式在终端或控制台中输入下面的指令即可。

**CentOS 7**

由于CentOS 7.0官方repo中并没有提供Lighttpd，所以我们需要在系统中安装额外的软件源epel repo。使用下面的yum指令来安装epel。

    # yum install epel-release

然后，我们需要更新系统及进程为Lighttpd的安装做准备。

    # yum update
    # yum install lighttpd

![Install Lighttpd Centos](http://blog.linoxide.com/wp-content/uploads/2016/02/install-lighttpd-centos.png)

**Ubuntu 15.04**

Ubuntu 15.04官方repo中包含了Lighttpd，所以只需更新本地repo并使用apt-get指令即可安装Lighttpd。

    # apt-get update
    # apt-get install lighttpd

![Install lighttpd ubuntu](http://blog.linoxide.com/wp-content/uploads/2016/02/install-lighttpd-ubuntu.png)

#### 从源代码安装Lighttpd

如果想从Lighttpd源码安装最新版本(例如1.4.39)，我们需要在本地编译源码并进行安装。首先我们要安装编译源码所需的依赖包。
  
    # cd /tmp/
    # wget http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.39.tar.gz

下载完成后，执行下面的指令解压缩。

    # tar -zxvf lighttpd-1.4.39.tar.gz

然后使用下面的指令进行编译。

    # cd lighttpd-1.4.39
    # ./configure
    # make

**注：**在这份教程中，我们安装的是默认配置的Lighttpd。其他诸如高级功能或拓展功能，如对SSL的支持，mod_rewrite，mod_redirect等，需自行配置。

当编译完成后，我们就可以把它安装到系统中了。

    # make install

### 设置Lighttpd

如果有更高的需求，我们可以通过修改默认设置文件，如`/etc/lighttpd/lighttpd.conf`，来对Lighttpd进行进一步设置。 而在这份教程中我们将使用默认设置，不对设置文件进行修改。如果你曾做过修改并想检查设置文件是否出错，可以执行下面的指令。

    # lighttpd -t -f /etc/lighttpd/lighttpd.conf

#### 使用 CentOS 7

在CentOS 7中，我们需在Lighttpd默认设置中创设一个例如`/src/www/htdocs`的webroot文件夹。

    # mkdir -p /srv/www/htdocs/

而后将默认欢迎页面从`/var/www/lighttpd`复制至刚刚新建的目录中：

    # cp -r /var/www/lighttpd/* /srv/www/htdocs/

### 开启服务

现在，通过执行systemctl指令来重启数据库服务。

    # systemctl start lighttpd

然后我们将它设置为伴随系统启动自动运行。

    # systemctl enable lighttpd

### 设置防火墙

如要让我们运行在Lighttpd上的网页和网站能在Internet或相似的网络上被访问，我们需要在防火墙程序中设置打开80端口。由于CentOS 7和Ubuntu15.04都附带Systemd作为默认初始化系统，所以我们安装firewalld作为解决方案。如果要打开80端口或http服务，我们只需执行下面的命令：

    # firewall-cmd --permanent --add-service=http
    success
    # firewall-cmd --reload
    success

### 连接至Web Server
在将80端口设置为默认端口后，我们就可以默认直接访问Lighttpd的欢迎页了。我们需要根据运行Lighttpd的设备来设置浏览器的IP地址和域名。在本教程中，我们令浏览器指向 [http://lighttpd.linoxide.com/](http://lighttpd.linoxide.com/) 同时将子域名指向它的IP地址。如此一来，我们就可以在浏览器中看到如下的欢迎页面了。

![Lighttpd Welcome Page](http://blog.linoxide.com/wp-content/uploads/2016/02/lighttpd-welcome-page.png)

此外，我们可以将网站的文件添加到webroot目录下，并删除lighttpd的默认索引文件，使我们的静态网站链接至互联网上。

如果想在Lighttpd Web Server中运行PHP应用，请参考下面的步骤：

### 安装PHP5模块
在Lighttpd成功安装后，我们需要安装PHP及相关模块以在Lighttpd中运行PHP5脚本。

#### 使用 Ubuntu 15.04

    # apt-get install php5 php5-cgi php5-fpm php5-mysql php5-curl php5-gd php5-intl php5-imagick php5-mcrypt php5-memcache php-pear

#### 使用 CentOS 7

    # yum install php php-cgi php-fpm php-mysql php-curl php-gd php-intl php-pecl-imagick php-mcrypt php-memcache php-pear lighttpd-fastcgi

### 设置Lighttpd的PHP服务

如要让PHP与Lighttpd协同工作，我们只要根据所使用的发行版执行如下对应的指令即可。

#### 使用 CentOS 7

首先要做的便是使用文件编辑器编辑php设置文件(例如`/etc/php.ini`)并取消掉对**cgi.fix_pathinfo=1**的注释。

    # nano /etc/php.ini

完成上面的步骤之后，我们需要把PHP-FPM进程的所有权从Apache转移至Lighttpd。要完成这些，首先用文件编辑器打开`/etc/php-fpm.d/www.conf`文件。

    # nano /etc/php-fpm.d/www.conf

然后在文件中增加下面的语句：

    user = lighttpd
    group = lighttpd

做完这些，我们保存并退出文本编辑器。然后从`/etc/lighttpd/modules.conf`设置文件中添加FastCGI模块。

    # nano /etc/lighttpd/modules.conf

然后，去掉下面语句前面的`#`来取消对它的注释。

    include "conf.d/fastcgi.conf"

最后我们还需在文本编辑器设置FastCGI的设置文件。

    # nano /etc/lighttpd/conf.d/fastcgi.conf

在文件尾部添加以下代码：

    fastcgi.server += ( ".php" =>
    ((
    "host" => "127.0.0.1",
    "port" => "9000",
    "broken-scriptfilename" => "enable"
    ))
    )

在编辑完成后保存并退出文本编辑器即可。

#### 使用 Ubuntu 15.04

如需启用Lighttpd的FastCGI，只需执行下列代码：

    # lighttpd-enable-mod fastcgi

    Enabling fastcgi: ok
    Run /etc/init.d/lighttpd force-reload to enable changes

    # lighttpd-enable-mod fastcgi-php

    Enabling fastcgi-php: ok
    Run `/etc/init.d/lighttpd` force-reload to enable changes

然后，执行下列命令来重启Lighttpd。

    # systemctl force-reload lighttpd

### 检测PHP工作状态

如需检测PHP是否按预期工作，我们需在Lighttpd的webroot目录下新建一个php文件。本教程中，在Ubuntu下/var/www/html 目录，CentOS下/src/www/htdocs目录下使用文本编辑器创建并打开info.php。

**使用 CentOS 7**

    # nano  /var/www/info.php

**使用 Ubuntu 15.04**

    # nano /srv/www/htdocs/info.php

然后只需将下面的语句添加到文件里即可。

    <?php phpinfo(); ?>

在编辑完成后保存并推出文本编辑器即可。

现在，我们需根据路径 [http://lighttpd.linoxide.com/info.php](http://lighttpd.linoxide.com/info.php) 下的info.php文件的IP地址或域名，来让我们的网页浏览器指向系统上运行的Lighttpd。如果一切都按照以上说明进行，我们将看到如下图所示的PHP页面信息。

![phpinfo lighttpd](http://blog.linoxide.com/wp-content/uploads/2016/02/phpinfo-lighttpd.png)

### 总结

至此，我们已经在CentOS 7和Ubuntu 15.04 Linux 发行版上成功安装了轻巧快捷并且安全的Lighttpd Web服务器。现在，我们已经可以利用Lighttpd Web服务器来实现上传网站文件到网站根目录，配置虚拟主机，启用SSL，连接数据库，运行Web应用等功能了。 如果你有任何疑问，建议或反馈请在下面的评论区中写下来以让我们更好的改良Lighttpd。谢谢！(译注：评论网址 http://linoxide.com/linux-how-to/setup-lighttpd-web-server-ubuntu-15-04-centos-7/ )
--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-lighttpd-web-server-ubuntu-15-04-centos-7/

作者：[Arun Pyasi][a]
译者：[HaohongWANG](https://github.com/HaohongWANG)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
