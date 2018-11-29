树莓派自建 NAS 云盘之——云盘构建
======

> 用自行托管的树莓派 NAS 云盘来保护数据的安全！

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_tree_clouds.png?itok=b_ftihhP)

在前面两篇文章中，我们讨论了用树莓派搭建一个 NAS 云盘所需要的一些 [软硬件环境及其操作步骤][1]。我们还制定了适当的 [备份策略][2] 来保护 NAS 上的数据。本文中，我们将介绍讨论利用 [Nestcloud][3] 来方便快捷的存储、获取以及分享你的数据。

![](https://opensource.com/sites/default/files/uploads/nas_part3.png)

### 必要的准备工作

想要方便的使用 Nextcloud，需要一些必要的准备工作。首先，你需要一个指向 Nextcloud 的域名。方便起见，本文将使用 **nextcloud.pi-nas.com** 。如果你是在家庭网络里运行，你需要为该域名配置 DNS 服务（动态域名解析服务）并在路由器中开启 80 端口和 443 端口转发功能（如果需要使用 https，则需要开启 443 端口转发，如果只用 http，80 端口足以）。

你可以使用 [ddclient][4] 在树莓派中自动更新 DNS。

### 安装 Nextcloud

为了在树莓派（参考 [第一篇][1] 中步骤设置）中运行 Nextcloud，首先用命令 `apt` 安装 以下的一些依赖软件包。

```
sudo apt install unzip wget php apache2 mysql-server php-zip php-mysql php-dom php-mbstring php-gd php-curl
```

其次，下载 Nextcloud。在树莓派中利用 `wget` 下载其 [最新的版本][5]。在 [第一篇][1] 文章中，我们将两个磁盘驱动器连接到树莓派，一个用于存储当前数据，另一个用于备份。这里在数据存储盘上安装 Nextcloud，以确保每晚自动备份数据。

```
sudo mkdir -p /nas/data/nextcloud
sudo chown pi /nas/data/nextcloud
cd /nas/data/
wget https://download.nextcloud.com/server/releases/nextcloud-14.0.0.zip -O /nas/data/nextcloud.zip
unzip nextcloud.zip
sudo ln -s /nas/data/nextcloud /var/www/nextcloud
sudo chown -R www-data:www-data /nas/data/nextcloud
```

截止到写作本文时，Nextcloud 最新版更新到如上述代码中所示的 14.0.0 版本。Nextcloud 正在快速的迭代更新中，所以你可以在你的树莓派中安装更新一点的版本。

### 配置数据库

如上所述，Nextcloud 安装完毕。之前安装依赖软件包时就已经安装了 MySQL 数据库来存储 Nextcloud 的一些重要数据（例如，那些你创建的可以访问 Nextcloud 的用户的信息）。如果你更愿意使用 Pstgres 数据库，则上面的依赖软件包需要做一些调整。

以 root 权限启动 MySQL：

```
sudo mysql
```

这将会打开 SQL 提示符界面，在那里可以插入如下指令——使用数据库连接密码替换其中的占位符——为 Nextcloud 创建一个数据库。

```
CREATE USER nextcloud IDENTIFIED BY '<这里插入密码>';
CREATE DATABASE nextcloud;
GRANT ALL ON nextcloud.* TO nextcloud;
```

按 `Ctrl+D` 或输入 `quit` 退出 SQL 提示符界面。

### Web 服务器配置

Nextcloud 可以配置以适配于 Nginx 服务器或者其他 Web 服务器运行的环境。但本文中，我决定在我的树莓派 NAS 中运行 Apache 服务器（如果你有其他效果更好的服务器选择方案，不妨也跟我分享一下）。

首先为你的 Nextcloud 域名创建一个虚拟主机，创建配置文件 `/etc/apache2/sites-available/001-netxcloud.conf`，在其中输入下面的参数内容。修改其中 `ServerName` 为你的域名。

```
<VirtualHost *:80>
ServerName nextcloud.pi-nas.com
ServerAdmin admin@pi-nas.com
DocumentRoot /var/www/nextcloud/

<Directory /var/www/nextcloud/>
AllowOverride None
</Directory>
</VirtualHost>
```

使用下面的命令来启动该虚拟主机。

```
a2ensite 001-nextcloud
sudo systemctl reload apache2
```

现在，你应该可以通过浏览器中输入域名访问到 web 服务器了。这里我推荐使用 HTTPS 协议而不是 HTTP 协议来访问 Nextcloud。一个简单而且免费的方法就是利用 [Certbot][7] 下载 [Let's Encrypt][6] 证书，然后设置定时任务自动刷新。这样就避免了自签证书等的麻烦。参考 [如何在树莓派中安装][8] Certbot 。在配置 Certbot 的时候，你甚至可以配置将 HTTP 自动转到 HTTPS ，例如访问 `http://nextcloud.pi-nas.com` 自动跳转到 `https://nextcloud.pi-nas.com`。注意，如果你的树莓派 NAS 运行在家庭路由器的下面，别忘了设置路由器的 443 端口和 80 端口转发。

### 配置 Nextcloud

最后一步，通过浏览器访问 Nextcloud 来配置它。在浏览器中输入域名地址，插入上文中的数据库设置信息。这里，你可以创建 Nextcloud 管理员用户。默认情况下，数据保存目录在在 Nextcloud 目录下，所以你也无需修改我们在 [第二篇][2] 一文中设置的备份策略。

然后，页面会跳转到 Nextcloud 登陆界面，用刚才创建的管理员用户登陆。在设置页面中会有基础操作教程和安全安装教程（这里是访问 `https://nextcloud.pi-nas.com/settings/admin`）。

恭喜你，到此为止，你已经成功在树莓派中安装了你自己的云 Nextcloud。去 Nextcloud 主页 [下载 Nextcloud 客户端][9]，客户端可以同步数据并且离线访问服务器。移动端甚至可以上传图片等资源，然后电脑桌面都可以去访问它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/host-cloud-nas-raspberry-pi

作者：[Manuel Dewald][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[jrg](https://github.com/jrglinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ntlx
[1]: https://linux.cn/article-10104-1.html?utm_source=index&utm_medium=more
[2]: https://linux.cn/article-10112-1.html
[3]: https://nextcloud.com/
[4]: https://sourceforge.net/p/ddclient/wiki/Home/
[5]: https://nextcloud.com/install/#instructions-server
[6]: https://letsencrypt.org/
[7]: https://certbot.eff.org/
[8]: https://certbot.eff.org/lets-encrypt/debianother-apache
[9]: https://nextcloud.com/install/#install-clients

