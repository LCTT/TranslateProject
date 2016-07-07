在 Ubuntu 上配置高性能的 HHVM 环境
================================================================================

HHVM全称为 HipHop Virtual Machine，它是一个开源虚拟机，用来运行由 Hack(一种编程语言)和 PHP 开发应用。HHVM 在保证了 PHP 程序员最关注的高灵活性的要求下，通过使用最新的编译方式来取得了非凡的性能。到目前为止，相对于 PHP + [APC (Alternative PHP Cache)][1] ，HHVM 为 FaceBook 在 HTTP 请求的吞吐量上提高了9倍的性能，在内存的占用上，减少了5倍左右的内存占用。

同时，HHVM 也可以与基于 FastCGI 的 Web 服务器（如 Nginx 或者 Apache ）协同工作。

![Install HHVM, Nginx and Apache with MariaDB](http://www.tecmint.com/wp-content/uploads/2015/08/Install-HHVM-Nginx-Apache-MariaDB.png)

*安装 HHVM，Nginx和 Apache 还有 MariaDB*

在本教程中，我们一起来配置 Nginx/Apache web 服务器、 数据库服务器 MariaDB 和 HHVM 。我们将使用 Ubuntu 15.04 (64 位)，因为 HHVM 只能运行在64位系统上。同时，该教程也适用于 Debian 和 Linux Mint。

### 第一步: 安装 Nginx 或者 Apache 服务器 ###

1、首先，先进行一次系统的升级并更新软件仓库列表，命令如下

    # apt-get update && apt-get upgrade

![System Upgrade](http://www.tecmint.com/wp-content/uploads/2015/08/System-Upgrade.png)

*系统升级*

2、 正如我之前说的，HHVM 能和 Nginx 和 Apache 进行集成。所以，究竟使用哪个服务器，这是你的自由，不过，我们会教你如何安装这两个服务器。

#### 安装 Nginx ####

我们通过下面的命令安装 Nginx/Apache 服务器

    # apt-get install nginx

![Install Nginx Web Server](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Nginx-Web-Server.png)

*安装 Nginx 服务器*

#### 安装 Apache ####

    # apt-get install apache2

![Install Apache Web Server](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Apache-Web-Server.png)

*安装 Apache 服务器*

完成这一步，你能通过以下的链接看到 Nginx 或者 Apache 的默认页面

    http://localhost
    或
    http://IP-Address


![Nginx Welcome Page](http://www.tecmint.com/wp-content/uploads/2015/08/Nginx-Welcome-Page.png)

*Nginx 默认页面*

![Apache Default Page](http://www.tecmint.com/wp-content/uploads/2015/08/Apache-Default-Page.png)

*Apache 默认页面*

### 第二步: 安装和配置 MariaDB ###

3、 这一步，我们将通过如下命令安装 MariaDB，它是一个比 MySQL 性能更好的数据库

    # apt-get install mariadb-client mariadb-server

![Install MariaDB Database](http://www.tecmint.com/wp-content/uploads/2015/08/Install-MariaDB-Database.png)

*安装 MariaDB*

4、 在 MariaDB 成功安装之后，你可以启动它，并且设置 root 密码来保护数据库:


    # systemctl start mysql
    # mysql_secure_installation

回答以下问题，只需要按下`y`或者 `n`并且回车。请确保你仔细的阅读过说明。

    Enter current password for root (enter for none) = press enter
    Set root password? [Y/n] = y
    Remove anonymous users[y/n] = y
    Disallow root login remotely[y/n] = y
    Remove test database and access to it [y/n] = y
    Reload privileges tables now[y/n] = y

5、 在设置了密码之后，你就可以登录 MariaDB 了。


    # mysql -u root -p


### 第三步: 安装 HHVM ###

6、 在此阶段，我们将安装 HHVM。我们需要添加 HHVM 的仓库到你的`sources.list`文件中，然后更新软件列表。

    # wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
    # echo deb http://dl.hhvm.com/ubuntu DISTRIBUTION_VERSION main | sudo tee /etc/apt/sources.list.d/hhvm.list
    # apt-get update

**重要**：不要忘记用你的 Ubuntu 发行版代号替换上述的 DISTRIBUTION_VERSION (比如：lucid, precise, trusty) 或者是 Debian 的 jessie 或者 wheezy。在 Linux Mint 中也是一样的，不过只支持 petra。

添加了 HHVM 仓库之后，你就可以轻松安装了。

    # apt-get install -y hhvm

安装之后，就可以启动它，但是它并没有做到开机启动。可以用如下命令做到开机启动。

    # update-rc.d hhvm defaults

### 第四步: 配置 Nginx/Apache 连接 HHVM ###

7、 现在，nginx/apache 和 HHVM 都已经安装完成了，并且都独立运行起来了，所以我们需要对它们进行设置，来让它们互相关联。这个关键的步骤，就是需要告知 nginx/apache 将所有的 php 文件，都交给 HHVM 进行处理。

如果你用了 Nginx，请按照如下步骤：

nginx 的配置文件在 /etc/nginx/sites-available/default， 并且这些配置文件会在 /usr/share/nginx/html 中寻找文件执行，不过，它不知道如何处理 PHP。

为了确保 Nginx 可以连接 HHVM，我们需要执行所带的如下脚本。它可以帮助我们正确的配置 Nginx，将 hhvm.conf 放到 上面提到的配置文件 nginx.conf 的头部。

这个脚本可以确保 Nginx 可以对 .hh 和 .php 的做正确的处理，并且将它们通过 fastcgi 发送给 HHVM。

    # /usr/share/hhvm/install_fastcgi.sh

![Configure Nginx for HHVM](http://www.tecmint.com/wp-content/uploads/2015/08/Configure-Nginx-for-HHVM.png)

*配置 Nginx、HHVM*

**重要**: 如果你使用的是 Apache，这里不需要进行配置。

8、 接下来，你需要使用 hhvm 来提供 php 的运行环境。

    # /usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

以上步骤完成之后，你现在可以启动并且测试它了。

    # systemctl start hhvm

### 第五步: 测试 HHVM 和 Nginx/Apache ###

9、 为了确认 hhvm 是否工作，你需要在 nginx/apache 的文档根目录下建立 hello.php。

    # nano /usr/share/nginx/html/hello.php       [对于 Nginx]
    或
    # nano /var/www/html/hello.php               [对于 Nginx 和 Apache]

在文件中添加如下代码:

    <?php
    if (defined('HHVM_VERSION')) {
        echo 'HHVM is working';
        phpinfo();
    } else {
        echo 'HHVM is not working';
    }
    ?>

然后访问如下链接，确认自己能否看到 "hello world"

    http://localhost/info.php
    或
    http://IP-Address/info.php

![HHVM Page](http://www.tecmint.com/wp-content/uploads/2015/08/HHVM-Page.png)

*HHVM 页面*

如果 “HHVM” 的页面出现了，那就说明你成功了。

### 结论 ###

以上的步骤都是非常简单的，希望你能觉得这是一篇有用的教程，如果你在以上的步骤中遇到了问题，给我们留一个评论，我们将全力解决。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-hhvm-and-nginx-apache-with-mariadb-on-debian-ubuntu/

作者：[Ravi Saive][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/install-apc-alternative-php-cache-in-rhel-centos-fedora/
