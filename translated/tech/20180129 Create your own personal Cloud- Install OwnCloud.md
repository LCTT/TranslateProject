搭建私有云：OwnCloud
======

所有人都在讨论云。尽管市面上有很多为我们提供云存储和其他云服务的主要的服务商，但是我们还是可以为自己搭建一个私有云。

在本教程中，我们将讨论如何利用 OwnCloud 搭建私有云。OwnCloude 是一个可以安装在我们 Linux 设备上的 web 应用程序，能够存储和服务我们的数据。OwnCloude 可以分享日历、联系人和书签，共享音/视频流等等。

本教程中，我们使用的是 CentOS 7 系统，但是本教程同样适用于其他 Linux 发行版中安装 OwnClude。让我们开始安装 OwnCloude 并且做一些准备工作，

**(推荐阅读：[如何在 CentOS & RHEL 上使用 Apache 作为反向代理服务器][1])**

 **（同时推荐：[实时 Linux 服务器监测和 GLANCES 监测工具][2]）**

### 预备知识

  * 我们需要在机器上配置 LAMP。参照阅读我们的文章‘[CentOS/RHEL 上配置 LAMP 服务器最简单的教程][3] & [在 Ubuntu 搭建 LAMP stack][4]’。

  * 我们需要在自己的设备里安装这些包，‘ php-mysql php-json php-xml php-mbstring php-zip php-gd curl php-curl php-pdo’。使用包管理器安装它们。

```
$ sudo yum install php-mysql php-json php-xml php-mbstring php-zip php-gd curl php-curl php-pdo
```

### 安装

安装 owncloud，我们现在需要在服务器上下载 ownCloud 安装包。使用下面的命令从官方网站下载最新的安装包（10.0.4-1），

```
 $ wget https://download.owncloud.org/community/owncloud-10.0.4.tar.bz2
```

使用下面的命令解压，

```
 $ tar -xvf owncloud-10.0.4.tar.bz2
```

现在，将所有解压后的文件移动至‘/var/www/html’

```
 $ mv owncloud/* /var/www/html
```

下一步，我们需要在 apache 上配置 ‘httpd.conf’文件

```
 $ sudo vim /etc/httpd/conf/httpd.com
```

同时更改下面的选项，

```
 AllowOverride All
```

在 owncloud 文件夹下保存和修改文件权限，

```
 $ sudo chown -R apache:apache /var/www/html/
 $ sudo chmod 777 /var/www/html/config/
```

然后重启 apache 服务器执行修改，

```
 $ sudo systemctl restart httpd
```

现在，我们需要在 MariaDB 上创建一个数据库，保存来自 owncould 的数据。使用下面的命令创建数据库和数据库用户，

```
 $ mysql -u root -p
 MariaDB [(none)] > create database owncloud;
 MariaDB [(none)] > GRANT ALL ON owncloud.* TO ocuser@localhost IDENTIFIED BY 'owncloud';
 MariaDB [(none)] > flush privileges;
 MariaDB [(none)] > exit
```

服务器配置部分完成后，现在我们可以在网页浏览器上访问 owncloud。打开浏览器，输入您的服务器 IP 地址，我这边的服务器是 10.20.30.100，

![安装 owncloud][7]

一旦 URL 加载完毕，我们将呈现上述页面。这里，我们将创建管理员用户同时提供数据库信息。当所有信息提供完毕，点击‘Finish setup’。

我们将被重定向到登陆页面，在这里，我们需要输入先前创建的凭据，

![安装 owncloud][9]

认证成功之后，我们将进入 owncloud 面板，

![安装 owncloud][11]

我们可以使用移动设备应用程序，同样也可以使用网页界面更新我们的数据。现在，我们已经有自己的私有云了，同时，关于如何安装 owncloud 创建私有云的教程也进入尾声。请在评论区留下自己的问题或建议。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/create-personal-cloud-install-owncloud/

作者：[SHUSAIN][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/apache-as-reverse-proxy-centos-rhel/
[2]:http://linuxtechlab.com/linux-server-glances-monitoring-tool/
[3]:http://linuxtechlab.com/easiest-guide-creating-lamp-server/
[4]:http://linuxtechlab.com/install-lamp-stack-on-ubuntu/
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=400%2C647
[7]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2018/01/owncloud1-compressor.jpg?resize=400%2C647
[8]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=876%2C541
[9]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2018/01/owncloud2-compressor1.jpg?resize=876%2C541
[10]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=981%2C474
[11]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2018/01/owncloud3-compressor1.jpg?resize=981%2C474
